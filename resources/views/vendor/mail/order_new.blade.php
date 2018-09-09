<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
    <style>
        @media only screen and (max-width: 600px) {
            .inner-body {
                width: 100% !important;
            }

            .footer {
                width: 100% !important;
            }
        }

        @media only screen and (max-width: 500px) {
            .button {
                width: 100% !important;
            }
        }
    </style>

    <table class="wrapper" width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td align="center">
                <table class="content" width="100%" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="header">
                             Chào bạn !Website {{ config('app.name') }} mới có đơn hàng mới
{{--                             <a href="{{ $url }}">
                                {{ $slot }}
                            </a> --}}
                        </td>
                    </tr>

                    <!-- Email Body -->
                    <tr>
                        <td class="body" width="100%" cellpadding="0" cellspacing="0">
                            <table class="inner-body" align="center" width="570" cellpadding="0" cellspacing="0">
                                <!-- Body content -->
                                <tr>
                                    <td>
                                        <b>Mã đơn hàng</b>: {{ $id }}<br>
                                        <b>Tên người nhận</b>: {{ $toname }}<br>
                                        <b>Địa chỉ</b>: {{ $address1.' '.$address2 }}<br>
                                        <b>Số điện thoại</b>: {{ $phone }}<br>
                                        <b>Ghi chú</b>: {{ $comment }}
                                    </td>
                                </tr>
                            </table>
                            <hr>
                            <p style="text-align: center;">Chi tiết đơn hàng:<br>
                            ===================================<br></p>
                            <table class="inner-body" align="center" width="570" cellpadding="0" cellspacing="0" border="1">
                                <tr>
                                    <td>Thứ tự</td>
                                    <td>Mã hàng</td>
                                    <td>Tên hàng</td>
                                    <td>Giá</td>
                                    <td>Số lượng</td>
                                    <td>Tổng giá</td>
                                </tr>
                                @foreach ($details as $key => $detail)
                                <tr>
                                    <td>{{ $key }}</td>
                                    <td>{{ $detail['sku'] }}</td>
                                    <td>{{ $detail['name'] }}</td>
                                    <td>{{ number_format($detail['price']) }}</td>
                                    <td>{{ number_format($detail['qty']) }}</td>
                                    <td align="right">{{ number_format($detail['total_price']) }}</td>
                                </tr>
                                @endforeach
                                <tr>
                                    <td colspan="2"></td>
                                    <td colspan="2" style="font-weight: bold;">Tổng tiền hàng</td>
                                    <td colspan="2" align="right">{{ number_format($subtotal) }}</td>
                                </tr>
                                <tr>
                                    <td colspan="2"></td>
                                    <td colspan="2" style="font-weight: bold;">Tiền vận chuyển</td>
                                    <td colspan="2" align="right">{{ number_format($shipping) }}</td>
                                </tr>
                                <tr>
                                    <td colspan="2"></td>
                                    <td colspan="2" style="font-weight: bold;">Giảm giá</td>
                                    <td colspan="2" align="right">{{ number_format($discount) }}</td>
                                </tr>
                                <tr>
                                    <td colspan="2"></td>
                                    <td colspan="2" style="font-weight: bold;">Tổng tiền thanh toán</td>
                                    <td colspan="2" align="right">{{ number_format($total) }}</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table class="footer" align="center" width="570" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="content-cell" align="center">
                                        <p>&nbsp;</p>
                                         &copy; {{ date('Y') }} <a href="{{ url('/') }}">{{ config('app.name') }}</a>. All rights reserved.
                                        {{-- {{ Illuminate\Mail\Markdown::parse($slot) }} --}}
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                </table>
            </td>
        </tr>
    </table>
</body>
</html>
