<?php

namespace Modules\Article\Entities;

use App\Models\Admin;
use Modules\Package\Entities\Package;
use Illuminate\Database\Eloquent\Model;
use Modules\Article\Entities\Advertisement;

class Page extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'title',
        'slug',
        'description',
        'meta_description',
        'image',
        'banner_image',
        'category_id',
        'article_type_id',
        'user_id',
        'group_name',
        'phone_visible',
        'is_approved',
        'is_pinned',
        'poster_image',
        'status',
        'position',
        'is_position',
        'priority',
        'package_id',
        'is_paid',
        'deleted_at',
        'created_by',
        'updated_by',
        'deleted_by',
    ];

    /**
     * Write code on Method
     *
     * @return response()
     */
    protected $casts = [
        'type' => ProductStatusEnum::class,
    ];

    /**
     * category
     *
     * @return object returns the category model as obejct
     */
    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function admin()
    {
        return $this->belongsTo(Admin::class, 'user_id');
    }

    public function package()
    {
        return $this->belongsTo(Package::class, 'package_id');
    }

    public function advertisement()
    {
        return $this->hasOne(Advertisement::class);
    }

    public static function articleByCategory($category_id)
    {
        return Page::where('category_id', $category_id)->select('id', 'category_id', 'slug', 'title')->orderBy('id', 'desc')->get();
    }

    public static function articleByType($type_id)
    {
        return Page::where('article_type_id', $type_id)->select('id', 'category_id', 'slug', 'title')->orderBy('id', 'desc')->get();
    }

    public static function articleByTypeAndCategory($type_id, $category_id)
    {
        return Page::where('article_type_id', $type_id)
            ->where('category_id', $category_id)
            ->select('id', 'category_id', 'slug', 'title')
            ->orderBy('id', 'desc')->get();
    }

    public static function getPageData($args = [])
    {
        $defaults = [
            'lang' => 'en',
            'orderBy' => 'desc',
            // 'orderByCol' => 'created_at',
            'limit' => 10,
            'type' => null, // 1=article, 2=page, 3=blog
            'article_type_id' => null,
            'paginate' => false,
            'paginateNo' => 20,
            'slug' => null,
            'single' => false,
            'single_column' => 'pd', // pt=page_title, pd=page_description, pmd=page_meta_description
            'group_name' => 'advertisement',
            'is_pinned' => 0,
            'is_approved' => 1,
            'is_paid' => 1,
            'sorting' => '',
            'category_id' => '',
            'position' => '',
            'min_price' => '',
            'max_price' => '',
            'condition' => '',
        ];

        $args = array_merge($defaults, $args);

        // $args['article_type_id'] = ($args['type'] === 'article') ? 1 : (($args['type'] === 'blog') ? 3 : 2);

        $query = Page::select('pages.*')->where('pages.deleted_at', null);
        // ->where('article_type_id', $args['article_type_id']);

        if (!empty($args['group_name'])) {
            $query->where('pages.group_name', $args['group_name']);

            if ($args['group_name'] === 'advertisement') {
                $query->join('advertisements', 'pages.id', '=', 'advertisements.page_id');

                if (isset($args['min_price']) && isset($args['max_price']) && $args['max_price'] > 0) {
                    $args['min_price'] = floatval($args['min_price']);
                    $args['max_price'] = floatval($args['max_price']);
                    $query->whereBetween('advertisements.price', [floatval($args['min_price']), floatval($args['max_price'])]);
                }

                if (!empty($args['is_paid'])) {
                    $query->where('pages.is_paid', $args['is_paid']);
                }

                if (!empty($args['condition']) && ($args['condition'] === 'old' || $args['condition'] === 'new')) {
                    $query->where('advertisements.condition', $args['condition']);
                }

                $query->with([
                    'advertisement' => function ($q) {
                        $q->select('id', 'page_id', 'price', 'offer_price', 'address', 'condition', 'additional_info_title', 'additional_info_description', 'is_phone_visible', 'start_date', 'end_date');
                    },
                ]);
            }
        }

        if (!empty($args['is_pinned'])) {
            $query->where('pages.is_pinned', intval($args['is_pinned']));
        }

        if (!empty($args['is_approved'])) {
            $query->where('pages.is_approved', $args['is_approved']);
        }

        if (!empty($args['category_id'])) {
            $query->where('pages.category_id', $args['category_id']);
        }

        if (!empty($args['limit'])) {
            $query->limit($args['limit']);
        }

        if (!empty($args['sorting'])) {
            switch ($args['sorting']) {
                case 'latest':
                    $args['orderByCol'] = 'pages.id';
                    $args['orderBy'] = 'desc';
                    break;
                case 'oldest':
                    $args['orderByCol'] = 'pages.id';
                    $args['orderBy'] = 'asc';
                    break;

                default:
                    # code...
                    break;
            }
        }

        if (!empty($args['slug'])) {
            $query->where('slug', $args['slug']);
        }

        if (!empty($args['orderByCol'])) {
            $query->orderBy($args['orderByCol'], $args['orderBy']);
        }

        if ($args['paginate'] && $args['paginateNo']) {
            return $query->paginate($args['paginateNo']);
        }

        if ($args['single']) {
            return count($query->get()) > 0 ? $query->get()[0] : null;
        }

        return $query->get();
    }
}
