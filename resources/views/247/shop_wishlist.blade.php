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
            <h2>{{ $title }}</h2>
          </div>
@if (count($wishlist) ==0)
    <div class="col-md-12 text-danger">
        Không có sản phẩm nào trong wishlist!!
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
        <th>Xóa</th>
      </tr>
    </thead>
    <tbody>
    @foreach($wishlist as $item)
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
        <td>
            <a onClick="return confirm('Bạn có muốn xóa sản phẩm này?')" title="Remove Item" alt="Remove Item" class="cart_quantity_delete" href="{{url("removeItemFromWl/$item->rowId")}}"><i class="fa fa-times"></i></a>
        </td>
    </tr>
    @endforeach
    </tbody>
  </table>
  </div>
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
                <li class=""> <a title="Giỏ hàng" href="{{ url('wishlist.html') }}">{{ $title }}</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
@endsection

@push('scripts')
</script>
@endpush
