<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\Validator;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
     */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    // protected $redirectTo = '/home';
    protected $redirectTo = '/';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
        $configs = \App\Models\Config::pluck('value', 'key')->all();
        config(['app.name' => $configs['site_title']]);
        config(['mail.driver' => ($configs['smtp_mode']) ? 'smtp' : 'sendmail']);
        config(['mail.host' => empty($configs['smtp_host']) ? env('MAIL_HOST', '') : $configs['smtp_host']]);
        config(['mail.port' => empty($configs['smtp_port']) ? env('MAIL_PORT', '') : $configs['smtp_port']]);
        config(['mail.encryption' => empty($configs['smtp_security']) ? env('MAIL_ENCRYPTION', '') : $configs['smtp_security']]);
        config(['mail.username' => empty($configs['smtp_user']) ? env('MAIL_USERNAME', '') : $configs['smtp_user']]);
        config(['mail.password' => empty($configs['smtp_password']) ? env('MAIL_PASSWORD', '') : $configs['smtp_password']]);
        config(['mail.from' =>
            ['address' => $configs['site_email'], 'name' => $configs['site_title']]]
        );
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'reg_name'     => 'required|string|max:255',
            'reg_email'    => 'required|string|email|max:255|unique:users,email',
            'reg_password' => 'required|string|min:6|confirmed',
            'reg_phone'    => 'required|regex:/^0[^0][0-9\-]{7,13}$/',
            'reg_address1' => 'required|string|max:255',
            'reg_address2' => 'required|string|max:255',
        ],
            [
                'required'               => 'Bạn chưa nhập thông tin',
                'max'                    => 'Chiều dài tối đa :max kí tự',
                'min'                    => 'Chiều dài tối thiểu :min kí tự',
                'reg_email.unique'       => 'Email đã tồn tại',
                'reg_email.email'        => 'Định dạng email không đúng',
                'reg_password.confirmed' => 'Nhập lại mật khẩu bên dưới chưa đúng',
                'reg_phone.regex'        => 'Số điện thoại chưa đúng',
            ]
        );
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\User
     */
    protected function create(array $data)
    {

        return User::create([
            'name'     => $data['reg_name'],
            'email'    => $data['reg_email'],
            'password' => bcrypt($data['reg_password']),
            'phone'    => $data['reg_phone'],
            'address1' => $data['reg_address1'],
            'address2' => $data['reg_address2'],
        ]);
    }

}
