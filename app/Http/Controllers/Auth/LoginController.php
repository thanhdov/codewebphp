<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Auth;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
     */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    // protected $redirectTo = '/home';
    // protected $redirectTo = '/';
    protected function redirectTo()
    {
        // try {
        //     $uID              = empty(Auth::user()->id) ? 0 : Auth::user()->id;
        //     $productsLastView = empty(\Cookie::get('productsLastView')) ? array() : json_decode(\Cookie::get('productsLastView'), true);
        //     if (count($productsLastView)) {
        //         foreach ($productsLastView as $key => $value) {
        //             $checkLastView = DB::table('shop_product_recent_view')->where('user_id', $uID)->where('product_id', $key)->count();
        //             if ($checkLastView) {
        //                 DB::table('shop_product_recent_view')->where('user_id', $uID)->where('product_id', $key)->update(['created_at' => date('Y-m-d H:i:s', $value)]);
        //             } else {
        //                 DB::table('shop_product_recent_view')->insert(['user_id' => $uID, 'product_id' => $key, 'created_at' => date('Y-m-d H:i:s', $value)]);
        //             }
        //         }
        //     }
        // } catch (Exception $e) {
        //     echo $e->getMessage();
        // }

        return '/';
    }
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    protected function validateLogin(Request $request)
    {
        $this->validate($request, [
            'email'    => 'required|string|email',
            'password' => 'required|string',
        ],
            [
                'required'    => 'Bạn chưa nhập thông tin',
                'email.email' => 'Định dạng email chưa đúng',
            ]);
    }

}
