<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\ResetsPasswords;

class ResetPasswordController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Password Reset Controller
    |--------------------------------------------------------------------------
    |
    | This controller is responsible for handling password reset requests
    | and uses a simple trait to include this behavior. You're free to
    | explore this trait and override any methods you wish to tweak.
    |
     */

    use ResetsPasswords;

    /**
     * Where to redirect users after resetting their password.
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
}
