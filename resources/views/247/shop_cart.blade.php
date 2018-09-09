@extends($theme.'.shop_layout')
@section('banner')
@endsection

@section('content')

<section class="main-container col1-layout">
    <div class="main container">
      <div class="col-main">
        <div class="cart">

          <div class="page-content page-order">
            <div class="page-title">
            <h2>Shopping Cart</h2>
          </div>
@if (count($cart) ==0)
    <div class="col-md-12 text-danger">
        Không có sản phẩm nào trong giỏ hàng!!
    </div>
@else
    <style>
    .shipping_address td{
        padding: 3px !important;
    }
    .shipping_address textarea,.shipping_address input[type="text"]{
        width: 100%;
        padding: 7px !important;
    }
    .row_cart>td{
        vertical-align: middle !important;
    }
    input[type="number"]{
        text-align: center;
        padding:2px;
    }
</style>
<div class="table-responsive">
<table class="table box table-bordered">
    <thead>
      <tr  style="background: #eaebec">
        <th style="width: 50px;">TT</th>
        <th style="width: 100px;">Mã hàng</th>
        <th>Tên hàng</th>
        <th>Giá bán</th>
        <th >Qty</th>
        <th>Tổng tiền</th>
        <th>Xóa</th>
      </tr>
    </thead>
    <tbody>
    @foreach($cart as $item)
        @php
            $n = (isset($n)?$n:0);
            $n++;
            $product = App\Models\ShopProduct::find($item->id);
        @endphp
    <tr class="row_cart">
        <td >{{ $n }}</td>
        <td>{{ $product->sku }}</td>
        <td>
            {{ $product->name }}<br>
            <a href="{{ url('san-pham/'.ktc_str_convert($product->name).'_'.$product->id.'.html') }}"><img width="100" src="{{asset('documents/website/'.$product->image)}}" alt=""></a>
        </td>
        <td>{!! $product->showPrice() !!}</td>
        <td><input style="width: 70px;" type="number" onChange="updateCart({{$item->id}});" class="item-qty" id="item-{{$item->id}}" name="qty-{{$item->id}}" value="{{$item->qty}}"><span class="text-danger item-qty-{{$item->id}}" style="display: none;"></span></td>
        <td align="right">{{number_format($item->subtotal)}} VNĐ</td>
        <td>
            <a onClick="return confirm('Bạn có muốn xóa sản phẩm này?')" title="Remove Item" alt="Remove Item" class="cart_quantity_delete" href="{{url("removeItem/$item->rowId")}}"><i class="fa fa-times"></i></a>
        </td>
    </tr>
    @endforeach
    </tbody>
    <tfoot>
        <tr  style="background: #eaebec">
            <td colspan="7">
                 <div class="pull-left">
                <button class="btn btn-default" type="button" style="cursor: pointer;padding:10px 30px" onClick="location.href='{{ url('/') }}'"><i class="fa fa-arrow-left"></i> Quay lại mua hàng</button>
                </div>
                 <div class="pull-right">
                <a onClick="return confirm('Bạn có muốn bỏ đơn hàng này?')" href="{{url('clear-cart')}}"><button class="btn" type="button" style="cursor: pointer;padding:10px 30px">Xóa toàn bộ </button></a>
                </div>
            </td>
        </tr>
    </tfoot>
  </table>
  </div>
<form class="shipping_address" id="form-order" role="form" method="POST" action="{{ url('storecart') }}">
<div class="row">
    <div class="col-md-6">
            {{ csrf_field() }}
            <table class="table  table-bordered table-responsive">
                <tr>
                    <td class="form-group{{ $errors->has('toname') ? ' has-error' : '' }}">
                        <label for="phone" class="control-label"><i class="fa fa-user"></i> Người nhận:</label> <input name="toname" type="text" placeholder="Tên người nhận" value="{{ (Auth::user() && !old('toname'))?Auth::user()->name: old('toname')}}">
                            @if($errors->has('toname'))
                                <span class="help-block">{{ $errors->first('toname') }}</span>
                            @endif
                        </td>
                    <td class="form-group{{ $errors->has('phone') ? ' has-error' : '' }}">
                        <label for="phone" class="control-label"><i class="fa fa-volume-control-phone"></i> Số điện thoại:</label> <input name="phone" type="text" placeholder="Số điện thoại" value="{{ (Auth::user() && !old('phone'))?Auth::user()->phone: old('phone')}}">
                            @if($errors->has('phone'))
                                <span class="help-block">{{ $errors->first('phone') }}</span>
                            @endif
                        </td>
                </tr>
                <tr>
                    <td class="form-group{{ $errors->has('address1') ? ' has-error' : '' }}"><label for="address1" class="control-label"><i class="fa fa-home"></i> Địa chỉ nhà:</label> <input name="address1" type="text" placeholder="Số nhà, tên đường" value="{{ (Auth::user() && !old('address1'))?Auth::user()->address1: old('address1')}}">
                            @if($errors->has('address1'))
                                <span class="help-block">{{ $errors->first('address1') }}</span>
                            @endif</td>
                    <td class="form-group{{ $errors->has('address2') ? ' has-error' : '' }}"><label for="address2" class="control-label"><i class="fa fa-university"></i> Tỉnh thành</label><input name="address2" type="text" placeholder="Quận, Huyện" value="{{ (Auth::user() && !old('address2'))?Auth::user()->address2: old('address2')}}">
                            @if($errors->has('address2'))
                                <span class="help-block">{{ $errors->first('address2') }}</span>
                            @endif</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label  class="control-label"><i class="fa fa-file-image-o"></i> Ghi chú đơn hàng:</label>
                        <textarea rows="5" name="comment" placeholder="Thời gian nhận, địa điểm...."></textarea>
                    </td>

                </tr>
            </table>
    </div>
    <div class="col-md-6">
        <div class="row">
            <div class="col-md-12">
                <table class="table box table-bordered" id="showTotal">
                    @foreach ($dataTotal as $key => $element)
                    @if ($element['value'] !=0)

                     @if ($element['code']=='total')
                         <tr class="showTotal" style="background:#f5f3f3;font-weight: bold;">
                     @else
                        <tr class="showTotal">
                     @endif

                             <th>{!! $element['title'] !!}</th>
                            <td style="text-align: right" id="{{ $element['code'] }}">{{number_format($element['value']) }} VNĐ</td>
                        </tr>
                    @endif

                    @endforeach

                    @if (!empty($configs['promotion_mode']) == 1 && auth()->user())
                        <tr>
                            <td colspan="2">
                                  <div class="form-group">
                                    @php
                                        $style = ($hasCoupon)?"display:inline;":"display: none;";
                                    @endphp

                                    <label class="control-label" for="inputGroupSuccess3"><i class="fa fa-exchange" aria-hidden="true"></i> Mã giảm giá <span style="{{ $style }} cursor: pointer;" class="text-danger" id="removeCoupon">(xóa mã đang dùng <i class="fa fa fa-times"></i>)</span></label>
                                    <div class="input-group">
                                      <input type="text" placeholder="Nhập mã giảm giá" class="form-control" id="coupon-value" aria-describedby="inputGroupSuccess3Status">
                                      <span class="input-group-addon"  id="coupon-button" style="cursor: pointer;" data-loading-text="<i class='fa fa-spinner fa-spin'></i> Đang kiểm tra">Kiểm tra</span>
                                    </div>
                                    <span class="status-coupon" style="display: none;" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
                                    <div class="coupon-msg" style="text-align: left;padding-left: 10px;"></div>
                                  </div>
                            </td>
                        </tr>
                    @endif
                    <tr>
                        <td colspan="2">
                            <i class="fa fa-credit-card-alt"></i> Phương thức thanh toán:<br>
                            <div class="form-group">
                                @if (empty($configs['PAYPAL_STATUS']))
                                    <input type="hidden" name="payment_method" value="cash"><img src="{{ asset('images/cash.png') }}">
                                @else
                                <div class="col-md-6">
                                    <label class="radio-inline">
                                    <input type="radio" name="payment_method" value="cash" checked  style="position: relative;"><img src="{{ asset('images/cash.png') }}">
                                    </label>
                                </div>
                                <div class="col-md-6">
                                    <label class="radio-inline">
                                     <input type="radio" name="payment_method" value="paypal"  style="position: relative;">
                                     <img src="{{ asset('images/paypal.png') }}">
                                    </label>
                                </div>
                                @endif
                            </div>

                        </td>
                    </tr>
                </table>
            </div>
            <div class="col-md-12 text-center">
                    <div class="pull-right">
                        <button class="btn btn-success" id="submit-order" type="button" style="cursor: pointer;padding:10px 30px"><i class="fa fa-check"></i> Hoàn tất đơn hàng</button>
                    </div>
            </div>
        </div>
    </div>
</div>
</form>
@endif
                </div>
            </div>
        </div>
    </div>
</section>
@endsection

@section('breadcrumb')
    <div class="breadcrumbs">
        <div class="container">
          <div class="row">
            <div class="col-xs-12">
              <ul>
                <li class="home"> <a title="Go to Home Page" href="{{ url('/') }}">Trang chủ</a><span>»</span></li>
                <li class=""> <a title="Giỏ hàng" href="{{ url('gio-hang.html') }}">Giỏ hàng</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
@endsection

@push('scripts')
<script type="text/javascript">
    function updateCart(id){
        var new_qty = $('#item-'+id).val();
            $.ajax({
            url: '{{ action('Shop@updateToCart') }}',
            type: 'POST',
            dataType: 'json',
            async: true,
            cache: false,
            data: {
                id: id,
                new_qty: new_qty,
                _token:'{{ csrf_token() }}'},
            success: function(data){
                flg= parseInt(data.flg);
                if(flg ===1)
                {
                        window.location.replace(location.href);
                }else{
                    $('.item-qty-'+id).css('display','block').html(data.msg);
                }

                }
        });
    }

$('#submit-order').click(function(){
    $('#form-order').submit();
    $(this).prop('disabled',true);
});

$('#coupon-button').click(function() {
 var coupon = $('#coupon-value').val();
    if(coupon==''){
        $('.coupon-msg').html('Bạn chưa nhập mã giảm giá').addClass('text-danger').show();
    }else{
    $('#coupon-button').button('loading');
    setTimeout(function() {
        $.ajax({
            url: '/usePromotion',
            type: 'POST',
            dataType: 'json',
            data: {
                code: coupon,
                _token: "{{ csrf_token() }}",
            },
        })
        .done(function(result) {
                $('#coupon-value').val('');
                $('.coupon-msg').removeClass('text-danger');
                $('.coupon-msg').removeClass('text-success');
                $('.coupon-msg').hide();
            if(result.error ==1){
                $('.coupon-msg').html(result.msg).addClass('text-danger').show();
            }else{
                $('#removeCoupon').show();
                $('.coupon-msg').html(result.msg).addClass('text-success').show();
                $('.showTotal').remove();
                $('#showTotal').prepend(result.html);
            }
        })
        .fail(function() {
            console.log("error");
        })
        // .always(function() {
        //     console.log("complete");
        // });

       $('#coupon-button').button('reset');
   }, 2000);
    }




});
$('#removeCoupon').click(function() {
        $.ajax({
            url: '/usePromotion',
            type: 'POST',
            dataType: 'json',
            data: {
                action: "remove",
                _token: "{{ csrf_token() }}",
            },
        })
        .done(function(result) {
                $('#removeCoupon').hide();
                $('#coupon-value').val('');
                $('.coupon-msg').removeClass('text-danger');
                $('.coupon-msg').removeClass('text-success');
                $('.coupon-msg').hide();
                $('.showTotal').remove();
                $('#showTotal').prepend(result.html);
        })
        .fail(function() {
            console.log("error");
        })
        // .always(function() {
        //     console.log("complete");
        // });
});

</script>
@endpush
