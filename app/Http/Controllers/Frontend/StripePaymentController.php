<?php


namespace App\Http\Controllers\Frontend;

use Stripe;
use Session;
use App\Models\Admin;
use Illuminate\Http\Request;
use Modules\Article\Entities\Page;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class StripePaymentController extends Controller
{
    public $user;
    public function __construct()
    {
        $this->middleware(function ($request, $next) {
            $this->user = Auth::user();
            return $next($request);
        });
    }

    /**

     * success response method.

     *

     * @return \Illuminate\Http\Response

     */

    public function stripe($page_id)
    {
        if (is_null($this->user) || !$this->user->can('stripe.view')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }

        $page = Page::find($page_id);
        return view('stripe.index', [
            'page' => $page
        ]);
    }

    /**

     * success response method.

     *

     * @return \Illuminate\Http\Response

     */

    public function stripePost(Request $request, $page_id)
    {
        if (is_null($this->user) || !$this->user->can('stripe.create')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }

        // Authorization -> if this user has created that page or not.
        Stripe\Stripe::setApiKey(env('STRIPE_SECRET'));
        // 1) Authentication
        $authentication = Admin::where('id', Auth::id())->first();
        if ($authentication) {
            // 2) Page exists kina
            $page = Page::where('user_id', Auth::id())->where('id', $page_id)->first();
            if ($page) {
                // 3) Package & amount Page exists kina
                $amount = $page->package->amount;
                $description = "Hello Dear Valuable Customer.'$authentication->first_name'. Thank you for your advertisement our website";
                if ($amount) {
                    Stripe\Charge::create([
                        "amount" => $amount * 100,
                        "currency" => "usd",
                        "source" => $request->stripeToken,
                        "description" => $description
                    ]);

                    $page->update([
                        'is_paid' => 1,
                        'is_approved' => 1,
                        'is_pinned' => 1,
                    ]);

                    // Session::flash('success', 'Payment successful!');
                    session()->flash('success', 'Advertisement payment & publish successfully done!!');
                    $type = $page->group_name === 'advertisement' ? '?type=advertisement' : '?type=magazine';
                    return redirect()->route('admin.pages.index') . $type;
                } else {
                    session()->flash('error', 'Package or Amount not found !!');
                    return redirect()->route('admin.pages.create');
                }
            }
        } else {
            session()->flash('error', 'UnAuthenticate!!');
            return redirect()->route('admin.pages.create');
        }
    }
}
