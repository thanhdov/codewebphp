@extends($theme.'.shop_layout')
@section('banner')
@endsection

@section('content')

 <!-- Main Container -->
  <div class="main-container col2-left-layout">
    <div class="container">
      <div class="row">
        <div class="col-main col-sm-9 col-xs-12 col-sm-push-3">

{{-- <div class="category-description std">
<div class="slider-items-products">
  <div id="category-desc-slider" class="product-flexslider hidden-buttons">
    <div class="slider-items slider-width-col1 owl-carousel owl-Template">
      <!-- Item -->
      <div class="item"> <a href="#x"><img alt="HTML template" src="images/cat-slider-img1.jpg"></a>
        <div class="inner-info">
          <div class="cat-img-title"> <span>Best Product 2017</span>
            <h2 class="cat-heading">Best Selling Brand</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit...</p>
            <a class="info" href="#">Shop Now</a> </div>
        </div>
      </div>
      <!-- End Item -->

      <!-- Item -->
      <div class="item"> <a href="#x"><img alt="HTML template" src="images/cat-slider-img2.jpg"></a> </div>

      <!-- End Item -->

    </div>
  </div>
</div>
</div> --}}
<div class="shop-inner">
    <div class="toolbar">
      <div class="view-mode">
        <br>
        <ul>
          <li class="active"> <h5>{{ $title }}</h5> </li>
        </ul>
      </div>
      <div class="sorter">
        <div class="short-by">
          <label>Sort By:</label>
          <select>
            <option selected="selected">Position</option>
            <option>Name</option>
            <option>Price</option>
            <option>Size</option>
          </select>
        </div>
        <div class="short-by page">
          <label>Show:</label>
          <select>
            <option selected="selected">18</option>
            <option>20</option>
            <option>25</option>
            <option>30</option>
          </select>
        </div>
      </div>
    </div>
    <div class="product-grid-area">
                <ul class="products-grid">
         @if (count($products) ==0)
         <li class="item col-lg-4 col-md-4 col-sm-6 col-xs-6 ">
            Không có sản phẩm nào !!!
        </li>
        @else
                    @foreach ($products as  $key => $product)
                    <li class="item col-lg-4 col-md-4 col-sm-6 col-xs-6 ">
                  <div class="product-item">
                    <div class="item-inner">
                      <div class="product-thumbnail">
                        @if ($product->price != $product->getPrice())
                            <div class="icon-new-label new-left">Sale</div>
                        @endif
                        <div class="pr-img-area product-box-{{ $product->id }}"> <a title="{{ $product->name }}" href="{{ url('san-pham/'.ktc_str_convert($product->name).'_'.$product->id.'.html') }}">
                          <figure> <img class="first-img" src="{{ asset('documents/website/thumb/'.$product->image) }}" alt="{{ $product->name }}"> <img class="hover-img" src="{{ asset('documents/website/thumb/'.$product->image) }}" alt="{{ $product->name }}"></figure>
                          </a> </div>
                        <div class="pr-info-area">
                          <div class="pr-button">
                            <div class="mt-button add_to_wishlist"> <a href="#"  onClick="addToCart({{ $product->id }},'wishlist')"> <i class="fa fa-heart-o"></i> </a> </div>
{{--                             <div class="mt-button add_to_compare"> <a href="compare.html"> <i class="fa fa-link"></i> </a> </div> --}}
                            <div class="mt-button quick-view"> <a   onClick="addToCart({{ $product->id }})"> <i class="fa fa-cart-plus"></i> </a> </div>
                          </div>
                        </div>
                      </div>
                      <div class="item-info">
                        <div class="info-inner">
                          <div class="item-title"> <a title="Product title here" href="{{ url('san-pham/'.ktc_str_convert($product->name).'_'.$product->id.'.html') }}">{{ $product->name }}</a> </div>
                          <div class="item-content">
                            <div class="rating">
                             <b>SKU</b>: {{ $product->sku }}
                            </div>
                            <div class="item-price">
                                <div class="price-box">

                            @if ($product->price != $product->getPrice())

                                    <p class="special-price"> <span class="price-label">Special Price</span> <span class="price"> {{ number_format($product->getPrice()) }} </span> </p>
                                    <p class="old-price"> <span class="price-label">Regular Price:</span> <span class="price"> {{ number_format($product->price) }} </span> </p>
                            @else
                                    <span class="regular-price">
                                        <span class="price">{{ number_format($product->price) }}</span>
                                     </span>
                            @endif
                              </div>

                            </div>
                            <div class="pro-action">
                              <button onClick="addToCart({{ $product->id }})" type="button" class="add-to-cart"><span>Thêm vào giỏ hàng</span> </button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
              </li>
                    @endforeach
    @endif
            </ul>
        </div>

    </div>

<div class="pagination-area">
    <div class="row">

            {{ $products->links() }}

    </div>
</div>
</div>




<aside class="sidebar col-sm-3 col-xs-12 col-sm-pull-9">
          @php
            $leftBanner = App\Models\Banner::where('type',2)->where('status',1)->first();
          @endphp
          @if ($leftBanner)
          <div class="block shop-by-side">
            <div class="block-content">
              <div class="manufacturer-area">
                {{-- <h2 class="saider-bar-title">&nbsp;</h2> --}}
                <div class="saide-bar-menu">
                    <a href="{{ $leftBanner->url }}#"><img src="{{ asset('documents/website/'.$leftBanner->image) }}"></a>
                </div>
              </div>
            </div>
          </div>
          @endif

    @php
      $cart      = Cart::content();
    @endphp
          <div class="block sidebar-cart">
            <div class="sidebar-bar-title">
              <h3>Giỏ hàng</h3>
            </div>
    @if (count($cart) > 0)
            <div class="block-content">
              <p class="amount">Có <a href="shopping_cart.html">{{ Cart::count() }}</a> trong giỏ hàng.</p>
              <ul>
            @foreach($cart as $item)
            @php
              $product = App\Models\ShopProduct::find($item->id);
            @endphp
                <li class="item" style="width:100%"> <a href="{{ url('san-pham/'.ktc_str_convert($item->name).'_'.$item->id.'.html') }}" title="Sample Product" class="product-image"><img src="{{ asset('documents/website/thumb/'.$product->image) }}" alt="Sample Product "></a>
                  <div class="product-details">
                    <div class="access"> <a href="{{url("removeItem/$item->rowId")}}" title="Remove This Item" class="remove-cart"><i class="icon-close"></i></a></div>
                    <p class="product-name"> <a href="{{ url('san-pham/'.ktc_str_convert($item->name).'_'.$item->id.'.html') }}">{{ $item->name }}</a> </p>
                    <strong>{{ $item->qty }}</strong> x <span class="price">{{ number_format($item->price) }}</span> </div>
                </li>
            @endforeach
              </ul>
              <div class="summary">
                <p class="subtotal"> <span class="label">Cart Subtotal:</span> <span class="price">{{ number_format(Cart::subtotal()) }}</span> </p>
              </div>
              <div class="cart-checkout">
                <button onClick="location.href='{{ url('gio-hang.html') }}'" class="button button-checkout" title="Submit" type="submit"><span>Checkout</span></button>
              </div>
            </div>
      @endif
          </div>


          <div class="block compare">
            <div class="sidebar-bar-title">
              <h3>So sánh ({{ Cart::instance('compare')->count() }})</h3>
            </div>
@if (Cart::instance('compare')->count() >0)
            <div class="block-content">
              <ol id="compare-items">
                <li class="item"> <a href="compare.html" title="Remove This Item" class="remove-cart"><i class="icon-close"></i></a> <a href="#" class="product-name"><i class="fa fa-angle-right"></i>&nbsp; Vestibulum porta tristique porttitor.</a> </li>
                <li class="item"> <a href="compare.html" title="Remove This Item" class="remove-cart"><i class="icon-close"></i></a> <a href="#" class="product-name"><i class="fa fa-angle-right"></i>&nbsp; Lorem ipsum dolor sit amet</a> </li>
              </ol>
              <div class="ajax-checkout">
                <button type="submit" title="Submit" class="button button-compare"> <span>Compare</span></button>
                <button type="submit" title="Submit" class="button button-clear"> <span>Clear All</span></button>
              </div>
            </div>
@endif
          </div>

          <div class="block special-product">
            <div class="sidebar-bar-title">
              <h3>Sản phẩm nổi bật</h3>
            </div>

@if (count($products_hot)>0)
            <div class="block-content">
              <ul>
@foreach ($products_hot as $product_hot)
                <li class="item">
                  <div class="products-block-left"> <a href="{{ url('san-pham/'.ktc_str_convert($product_hot->name).'_'.$product_hot->id.'.html') }}" title="{{ $product_hot->name }}" class="product-image"><img src="{{ asset('documents/website/thumb/'.$product_hot->image) }}" alt="{{ $product_hot->name }} "></a></div>
                  <div class="products-block-right">
                    <p class="product-name"> <a href="{{ url('san-pham/'.ktc_str_convert($product_hot->name).'_'.$product_hot->id.'.html') }}">{{ $product_hot->name }}</a> </p>


                  @if ($product_hot->price != $product_hot->getPrice())

                          <p class="special-price"> <span class="price-label">Special Price</span> <span class="price"> {{ number_format($product_hot->getPrice()) }} </span> </p>
                          <p class="old-price"> <span class="price-label">Regular Price:</span> <span class="price"> {{ number_format($product_hot->price) }} </span> </p>
                  @else
                          <span class="regular-price">
                              <span class="price">{{ number_format($product_hot->price) }}</span>
                           </span>
                  @endif
                    <div class="rating"> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star-o"></i> </div>
                  </div>
                </li>
@endforeach
              </ul>
              <a class="link-all" href=" {{ url('san-pham.html') }} ">Tất cả sản phẩm</a>
            </div>
@endif


          </div>
        </aside>
      </div>
    </div>
  </div>
  <!-- Main Container End -->



@endsection


@section('breadcrumb')

    <div class="breadcrumbs">
        <div class="container">
          <div class="row">
            <div class="col-xs-12">
              <ul>
                <li class="home"> <a title="Go to Home Page" href="{{ url('/') }}">Trang chủ</a><span>»</span></li>
                @if (isset($categorySelf))
                    @if ($categorySelf->getParent())
                     <li><a href="{{ url('shop/'.ktc_str_convert($categorySelf->getParent()->name).'_'.$categorySelf->getParent()->id.'.html') }}">{{ $categorySelf->getParent()->name }}</a><span>»</span></li>
                    @endif
                    <li><a>{{ $categorySelf->name }}</a></li>
                @endif
                @if (Request::get('keyword'))
                    <li><a>Tìm kiếm</a><span>»</span></li>
                    <li><a>Từ khóa: {{ $keyword }}</a></li>
                @endif

              </ul>
            </div>
          </div>
        </div>
      </div>
@endsection


@push('styles')
@endpush
@push('scripts')
@endpush
