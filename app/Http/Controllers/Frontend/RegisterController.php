<?php

namespace App\Http\Controllers\Frontend;

use Carbon\Carbon;
use App\Models\Admin;
use Illuminate\Http\Request;
use App\Helpers\StringHelper;
use App\Helpers\UploadHelper;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;

class RegisterController extends Controller
{
    public function userRegister(Request $request)
    {
        $request->validate([
            'first_name'  => 'required|max:100',
            'username'  => 'nullable|max:100|unique:admins,username',
            'email'  => 'required|max:100|unique:admins,email',
            'phone_no'  => 'required|max:15|unique:admins,phone_no',
            'password'  => 'required|confirmed|max:100',
        ]);

        try {
            $admin = new Admin();
            $admin->first_name = $request->first_name;
            $admin->last_name = $request->last_name;
            if ($request->username) {
                $admin->username = $request->username;
            } else {
                $admin->username = StringHelper::createSlug($request->first_name . $request->last_name, 'Admin', 'username', '');
            }

            if (!is_null($request->avatar)) {
                $admin->avatar = UploadHelper::upload('avatar', $request->avatar, $request->first_name . '-' . time(), 'public/assets/images/admins');
            }
            $admin->phone_no = $request->phone_no;
            $admin->email = $request->email;
            $admin->password = Hash::make($request->password);
            $admin->created_at = Carbon::now();
            $admin->updated_at = Carbon::now();

            if ($admin->save()) {
                $admin->assignRole('Advertisement');
            }

            session()->flash('success', 'Your account created successfully. Please login...');
            return redirect()->route('login');
        } catch (\Exception $e) {
            session()->flash('sticky_error', $e->getMessage());
            DB::rollBack();
            return back();
        }
    }
}
