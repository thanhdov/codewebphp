@extends($theme.'.shop_layout')
@section('banner')
@endsection

@section('content')

  <!-- Main Container -->
  <div class="main-container col1-layout">
    <div class="container">
      <div class="row">
        <div class="col-main">
          <div class="product-view-area">
            <div class="product-big-image col-xs-12 col-sm-5 col-lg-5 col-md-5">
              <div class="icon-sale-label sale-left">Sale</div>
              <div class="large-image"> <a href="{{ asset('documents/website/'.$product->image) }}" class="cloud-zoom" id="zoom1" rel="useWrapper: false, adjustY:0, adjustX:20"> <img class="zoom-img" src="{{ asset('documents/website/'.$product->image) }}" alt="products"> </a> </div>

          @if (count($product->images)>0)
            <div class="flexslider flexslider-thumb">
              <ul class="previews-list slides">
                <li><a href='{{ asset('documents/website/thumb/'.$product->image) }}' class='cloud-zoom-gallery' rel="useZoom: 'zoom1', smallImage: '{{ asset('documents/website/'.$product->image) }}' "><img src="{{ asset('documents/website/thumb/'.$product->image) }}" alt = "Thumbnail 2"/></a></li>

                  @foreach ($product->images as $key=>$image)
                    <li><a href='{{ asset('documents/website/thumb/'.$image->image) }}' class='cloud-zoom-gallery' rel="useZoom: 'zoom1', smallImage: '{{ asset('documents/website/'.$image->image) }}' "><img src="{{ asset('documents/website/thumb/'.$image->image) }}" alt = "Thumbnail 1"/></a></li>
                  @endforeach
              </ul>
            </div>
          @endif

              <!-- end: more-images -->

            </div>
            <div class="col-xs-12 col-sm-7 col-lg-7 col-md-7 product-details-area">
              <div class="product-name">
                <h1>{{ $product->name }}</h1>
              </div>
              <div class="price-box">
              @if ($product->price != $product->getPrice())
                      <p class="special-price"> <span class="price-label">Special Price</span> <span class="price"> {{ number_format($product->getPrice()) }} </span> </p>
                      <p class="old-price"> <span class="price-label">Regular Price:</span> <span class="price"> {{ number_format($product->price) }} </span> </p>
              @else
                      <p class="special-price"> <span class="price-label">Special Price</span> <span class="price"> {{ number_format($product->price) }} </span> </p>
              @endif

              </div>
              <div class="ratings">
{{--                 <div class="rating"> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> </div>
                <p class="rating-links"> <a href="#">1 Review(s)</a> <span class="separator">|</span> <a href="#">Add Your Review</a> </p> --}}
              <label>Mã sản phẩm: </label>
              <span class="editable" itemprop="sku">{{ $product->sku }}</span>
                <p class="availability in-stock pull-right">Tình trạng: <span style="color:green">Còn hàng</span>
{{--                   {!! ($product->stock)?'<span style="color:green">Còn hàng</span>':'<span style="color:#f91010">Hết hàng</span>' !!} --}}
                </p>
              </div>
              <div class="short-description">
                <h2>Quick Overview</h2>
                <p>{{ $product->description }}</p>
              </div>
            @if ($configs['show_date_avalid'] && $product->date_available >= date('Y-m-d H:i:s'))
              <p id="availability_date" style="display: block;">
                <label>Ngày cho phép mua: </label>
                <span id="availability_date_value" style="color:#b51b1b">{{ $product->date_available }}</span>
              </p>
              @endif
{{--               <div class="product-color-size-area">
                <div class="color-area">
                  <h2 class="saider-bar-title">Color</h2>
                  <div class="color">
                    <ul>
                      <li><a href="#"></a></li>
                      <li><a href="#"></a></li>
                      <li><a href="#"></a></li>
                      <li><a href="#"></a></li>
                      <li><a href="#"></a></li>
                      <li><a href="#"></a></li>
                    </ul>
                  </div>
                </div>
                <div class="size-area">
                  <h2 class="saider-bar-title">Size</h2>
                  <div class="size">
                    <ul>
                      <li><a href="#">S</a></li>
                      <li><a href="#">L</a></li>
                      <li><a href="#">M</a></li>
                      <li><a href="#">XL</a></li>
                      <li><a href="#">XXL</a></li>
                    </ul>
                  </div>
                </div>
              </div> --}}
              <div class="product-variation">


              <form id="buy_block" action="{{ action('Shop@cart') }}" method="post">
                {{ csrf_field() }}
                <input type="hidden" name="product_id" value="{{ $product->id }}" />
                  <div class="cart-plus-minus">
                    <label for="qty">Quantity:</label>
                    <div class="numbers-row">
                      <div onClick="var result = document.getElementById('qty'); var qty = result.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 0 ) result.value--;return false;" class="dec qtybutton"><i class="fa fa-minus">&nbsp;</i></div>
                      <input type="text" class="qty" title="Qty" value="1" maxlength="12" id="qty" name="qty">
                      <div onClick="var result = document.getElementById('qty'); var qty = result.value; if( !isNaN( qty )) result.value++;return false;" class="inc qtybutton"><i class="fa fa-plus">&nbsp;</i></div>
                    </div>
                  </div>
                  <button class="button pro-add-to-cart" title="Add to Cart" type="submit"><span><i class="fa fa-shopping-basket"></i>Thêm vào giỏ hàng</span></button>
                </form>
              </div>
              <div class="product-cart-option">
                <ul>
                  <li  onClick="addToCart({{ $product->id }},'wishlist')"><a href="#"><i class="fa fa-heart-o"></i><span>Add to Wishlist</span></a></li>
                  <li><a href="#"><i class="fa fa-link"></i><span>Add to Compare</span></a></li>
                  <li><a href="#"><i class="fa fa-envelope"></i><span>Email to a Friend</span></a></li>
                </ul>
              </div>
              <div class="pro-tags">
                <div class="pro-tags-title">Tags:</div>
                {{ $product->keyword }}
              </div>
              <div class="share-box">
                <div class="fb-like" data-href="{{ url('san-pham/'.ktc_str_convert($product->name).'_'.$product->id.'.html') }}" data-layout="button_count" data-action="like" data-size="large" data-show-faces="true" data-share="true"></div>
              </div>
            </div>
          </div>
        </div>
        <div class="product-overview-tab">
          <div class="container">
            <div class="row">
              <div class="col-xs-12">
                <div class="product-tab-inner">
                  <ul id="product-detail-tab" class="nav nav-tabs product-tabs">
                    <li class="active"> <a href="#description" data-toggle="tab"> Mô tả </a> </li>
                    <li> <a href="#reviews" data-toggle="tab">Comment</a> </li>
                  </ul>
                  <div id="productTabContent" class="tab-content">
                    <div class="tab-pane fade in active" id="description">
                      <div class="std">
                      {!! $product->content !!}
                      </div>
                    </div>
                    <div id="reviews" class="tab-pane fade">
                         <div class="fb-comments embed-responsive-item" data-href="{{ url('san-pham/'.ktc_str_convert($product->name).'_'.$product->id.'.html') }}" data-numposts="5"></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Main Container End -->

  <!-- Related Product Slider -->

  <div class="container">
    <div class="row">
      <div class="col-xs-12">
        <div class="related-product-area">
          <div class="page-header">
            <h2>Sản phẩm tương tự</h2>
          </div>
          <div class="related-products-pro">
            <div class="slider-items-products">
              <div id="related-product-slider" class="product-flexslider hidden-buttons">
                <div class="slider-items slider-width-col4 fadeInUp">

              <!-- Related Product Slider End -->
              @if (count($productsToCategory)>0)
                    @foreach ($productsToCategory as $product_real)
                  <div class="product-item">
                    <div class="item-inner">
                      <div class="product-thumbnail">
                        @if ($product_real->price != $product_real->getPrice())
                            <div class="icon-new-label new-left">Sale</div>
                        @endif
                        <div class="pr-img-area product-box-{{ $product_real->id }}"> <a title="{{ $product_real->name }}" href="{{ url('san-pham/'.ktc_str_convert($product_real->name).'_'.$product_real->id.'.html') }}">
                          <figure> <img class="first-img" src="{{ asset('documents/website/thumb/'.$product_real->image) }}" alt="{{ $product_real->name }}"> <img class="hover-img" src="{{ asset('documents/website/'.$product_real->image) }}" alt="{{ $product_real->name }}"></figure>
                          </a> </div>
                        <div class="pr-info-area">
                          <div class="pr-button">
                            <div   onClick="addToCart({{ $product_real->id }},'wishlist')" class="mt-button add_to_wishlist"> <a href="#"> <i class="fa fa-heart-o"></i> </a> </div>
    {{--                         <div class="mt-button add_to_compare"> <a href="compare.html"> <i class="fa fa-link"></i> </a> </div> --}}
                            <div class="mt-button quick-view"> <a  onClick="addToCart({{ $product_real->id }})"> <i class="fa fa-cart-plus"></i> </a> </div>
                          </div>
                        </div>
                      </div>
                      <div class="item-info">
                        <div class="info-inner">
                          <div class="item-title"> <a title="Product title here" href="{{ url('san-pham/'.ktc_str_convert($product_real->name).'_'.$product_real->id.'.html') }}">{{ $product_real->name }}</a> </div>
                          <div class="item-content">
                            <div class="rating">
                             <b>SKU</b>: {{ $product_real->sku }}
                            </div>
                            <div class="item-price">
                                <div class="price-box">
                                    @if (empty($product_real->getListPrice()[1]))
                                        <span class="regular-price">
                                            <span class="price">{{ $product_real->getListPrice()[0] }}</span>
                                         </span>
                                    @else
                                        <p class="special-price"> <span class="price-label">Special Price</span> <span class="price"> {{ $product_real->getListPrice()[0] }} </span> </p>
                                        <p class="old-price"> <span class="price-label">Regular Price:</span> <span class="price"> {{ $product_real->getListPrice()[1] }} </span> </p>
                                    @endif
                              </div>

                            </div>
                            <div class="pro-action">
                              <button onClick="addToCart({{ $product_real->id }})" type="button" class="add-to-cart"><span>Thêm vào giỏ hàng</span> 
                              </button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                    @endforeach
              @endif
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

@endsection

@section('breadcrumb')
    <div class="breadcrumbs">
        <div class="container">
          <div class="row">
            <div class="col-xs-12">
              <ul>
                <li class="home"> <a title="Go to Home Page" href="{{ url('/') }}">Trang chủ</a><span>»</span></li>
                <li class=""> <a title="{{ $product->category->name }}" href="{{ url('shop/'.ktc_str_convert($product->category->name).'_'.$product->category->id.'.html') }}">{{ $product->category->name }}</a><span>»</span></li>
                <li class=""> <a title="{{ $product->category->name }}" href="{{ url('san-pham/'.ktc_str_convert($product->name).'_'.$product->id.'.html') }}">{{ $product->name }}</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>

@endsection

@push('styles')

@endpush
@push('scripts')
<!--cloud-zoom js product-->
<script type="text/javascript" src="{{ asset($theme_asset.'/js/cloud-zoom.js')}}"></script>
<!-- flexslider js product-->
<script type="text/javascript" src="{{ asset($theme_asset.'/js/jquery.flexslider.js')}}"></script>

@endpush
