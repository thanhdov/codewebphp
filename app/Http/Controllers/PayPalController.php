<?php

/**
 * PAYPAL API SERVICE TEST
 */

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Services\PayPalService as PayPalSvc;

class PayPalController extends Controller
{

    private $paypalSvc;

    public function __construct(PayPalSvc $paypalSvc)
    {
        // parent::__construct();

        $this->paypalSvc = $paypalSvc;
    }

    public function index()
    {
        // dd(Cart::content());
        $data = [
            [
                'name'     => 'Vinataba',
                'quantity' => 1,
                'price'    => 1.5,
                'sku'      => 'SDFSDF',
            ],
            [
                'name'     => 'Marlboro',
                'quantity' => 1,
                'price'    => 1.6,
                'sku'      => 'abcaas',
            ],
            [
                'name'     => 'Esse',
                'quantity' => 2,
                'price'    => 1.8,
                'sku'      => 'AVV_01',
            ],
        ];

        $transactionDescription = "Don hang tu website";

        $paypalCheckoutUrl = $this->paypalSvc
        // ->setCurrency('eur')
            ->setReturnUrl(url('paypal/list'))
        // ->setCancelUrl(url('paypal/status'))
            ->setItem($data)
        // ->setItem($data[0])
        // ->setItem($data[1])
            ->createPayment($transactionDescription);

        if ($paypalCheckoutUrl) {
            return redirect($paypalCheckoutUrl);
        } else {
            dd(['Error']);
        }
    }

    public function status()
    {
        $paymentStatus = $this->paypalSvc->getPaymentStatus();
        dd($paymentStatus);
    }

    public function paymentList()
    {
        $limit  = 10;
        $offset = 0;

        $paymentList = $this->paypalSvc->getPaymentList($limit, $offset);

        dd($paymentList);
    }

    public function paymentDetail($paymentId)
    {
        $paymentDetails = $this->paypalSvc->getPaymentDetails($paymentId);

        dd($paymentDetails);
    }
}
