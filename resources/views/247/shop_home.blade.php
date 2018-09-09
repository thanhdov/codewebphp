@extends($theme.'.shop_layout')

@section('content')
  <!-- service section -->
@if (count($products_hot)  >0)
    <div class="container">
      <div class="row">
        <!-- Best Sale -->
        <div class="col-sm-12 col-md-12 jtv-best-sale special-pro">
          <div class="jtv-best-sale-list">
            <div class="wpb_wrapper">
              <div class="best-title text-left">
                <h2>Sản phẩm nổi bật</h2>
              </div>
            </div>
            <div class="slider-items-products">
              <div id="jtv-best-sale-slider" class="product-flexslider">
                <div class="slider-items">
                @foreach ($products_hot as  $key => $product_hot)
                  <div class="product-item">
                    <div class="item-inner">
                      <div class="product-thumbnail">
                        @if ($product_hot->price != $product_hot->getPrice())
                            <div class="icon-new-label new-left">Sale</div>
                        @endif
                        <div class="pr-img-area product-box-{{ $product_hot->id }}"> <a title="{{ $product_hot->name }}" href="{{ url('san-pham/'.ktc_str_convert($product_hot->name).'_'.$product_hot->id.'.html') }}">
                          <figure> <img class="first-img" src="{{ asset('documents/website/thumb/'.$product_hot->image) }}" alt="{{ $product_hot->name }}"> <img class="hover-img" src="{{ asset('documents/website/thumb/'.$product_hot->image) }}" alt="{{ $product_hot->name }}"></figure>
                          </a> </div>
                        <div class="pr-info-area">
                          <div class="pr-button">
                            <div class="mt-button add_to_wishlist"  onClick="addToCart({{ $product_hot->id }},'wishlist')">
                             <a href="#"><i class="fa fa-heart-o"></i></a>
                              </div>
{{--                             <div class="mt-button add_to_compare"> <a href="compare.html"> <i class="fa fa-link"></i> </a> </div> --}}
                            <div class="mt-button quick-view"> <a  onClick="addToCart({{ $product_hot->id }})"> <i class="fa fa-cart-plus"></i> </a> </div>
                          </div>
                        </div>
                      </div>
                      <div class="item-info">
                        <div class="info-inner">
                          <div class="item-title"> <a title="Product title here" href="{{ url('san-pham/'.ktc_str_convert($product_hot->name).'_'.$product_hot->id.'.html') }}">{{ $product_hot->name }}</a> </div>
                          <div class="item-content">
                            <div class="rating"> <b>SKU</b>: {{ $product_hot->sku }} </div>
                            <div class="item-price">
                                <div class="price-box">
                                    @if ($product_hot->price == $product_hot->getPrice())
                                        <span class="regular-price">
                                            <span class="price">{{ number_format($product_hot->price) }}</span>
                                         </span>
                                    @else
                                        <p class="special-price"> <span class="price-label">Special Price</span> <span class="price"> {{ number_format($product_hot->getPrice()) }} </span> </p>
                                        <p class="old-price"> <span class="price-label">Regular Price:</span> <span class="price"> {{ number_format($product_hot->price) }} </span> </p>
                                    @endif
                              </div>

                            </div>
                            <div class="pro-action">
                              <button onClick="addToCart({{ $product_hot->id }})" type="button" class="add-to-cart"><span>Thêm vào giỏ hàng</span> </button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                @endforeach
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
@endif


@if (count($products_new)  >0)
  <!-- All products-->
  <div class="container">
    <div class="home-tab">
      <div class="tab-title text-left">
        <h2>Sản phẩm mới nhất </h2>
      </div>
          <div class="featured-pro">

    <div class="product-grid-area">
                <ul class="products-grid">
         @if (count($products_new) ==0)
         <li class="item col-lg-3 col-md-3 col-sm-6 col-xs-6 ">
            Không có sản phẩm nào !!!
        </li>
        @else
              @foreach ($products_new as  $key => $product)
                <li class="item col-lg-3 col-md-3 col-sm-6 col-xs-6 ">
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
                            <div class="mt-button add_to_compare"> <a href="compare.html"> <i class="fa fa-link"></i> </a> </div>
                            <div class="mt-button quick-view"> <a href="quick_view.html"> <i class="fa fa-cart-plus"></i> </a> </div>
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
                              <button onClick="addToCart({{ $product->id }})" type="button" class="add-to-cart"><span>Thêm vào giỏ hàng</span> 
                              </button>
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
    </div>
          <div class="block special-product" style=" margin: 20px auto;text-align: center;">
              <a class="link-all" href=" {{ url('san-pham.html') }} ">Tất cả sản phẩm</a>
          </div>

  </div>

@else
    Chưa có sản phẩm nào !!!
@endif

{{-- @if (count($blogs) >0)
  <!-- Blog -->
  <section class="blog-post-wrapper">
    <div class="container">
      <div class="best-title text-left">
        <h2>Blog Alo Chip</h2>
      </div>
      <div class="slider-items-products ">
        <div id="latest-news-slider" class="product-flexslider hidden-buttons">
          <div class="slider-items slider-width-col6">
@foreach ($blogs as $blog)
            <div class="item">
              <div class="blog-box"> <a href="{{ url('blog/'.ktc_str_convert($blog->title).'_'.$blog->id.'.html') }}"> <img class="primary-img" src="{{ asset('documents/website/thumb/'.$blog->image) }}" alt="{{ $blog->title }}"></a>
                <div class="blog-btm-desc">
                  <div class="blog-top-desc">
                    <div class="blog-date"> {{ date('Y M D',strtotime($blog->created_at)) }} </div>
                    <h4><a href="{{ url('blog/'.ktc_str_convert($blog->title).'_'.$blog->id.'.html') }}">{{ $blog->title }}</a></h4>
                  </div>
                  <p>{{ $blog->description }}</p>
                  <a class="read-more" href="{{ url('blog/'.ktc_str_convert($blog->title).'_'.$blog->id.'.html') }}"> Xem đầy đủ</a> </div>
              </div>
            </div>
@endforeach
          </div>
        </div>
      </div>
    </div>
  </section>

@endif --}}



@endsection

@section('banner')

 <!-- Slideshow  -->
  <div class="main-slider" id="home">
    <div class="container">
      <div class="row">
        <div class="col-md-3 col-sm-3 col-xs-12 banner-left hidden-xs">
          @if ($banners_left->image)
             <img src="{{ asset('documents/website') }}/{{ $banners_left->image }}" alt="banner">
          @endif

        </div>
        @if (count($banners_top))
        <div class="col-sm-9 col-md-9 col-lg-9 col-xs-12 jtv-slideshow">
          <div id="jtv-slideshow">
            <div id='rev_slider_4_wrapper' class='rev_slider_wrapper fullwidthbanner-container' >
              <div id='rev_slider_4' class='rev_slider fullwidthabanner'>
                <ul>
                    @foreach ($banners_top as $key => $banner_top)
                      <li data-transition='fade' data-slotamount='7' data-masterspeed='1000' data-thumb=''><a target=_new href="{{ $banner_top->url }}"><img src='{{ asset('documents/website') }}/{{ $banner_top->image }}' data-bgposition='left top' data-bgfit='cover' data-bgrepeat='no-repeat' alt="banner"/></a>
                        <div class="caption-inner">
                            {!! $banner_top->html !!}
                        </div>
                      </li>
                    @endforeach
                </ul>
                <div class="tp-bannertimer"></div>
              </div>
            </div>
          </div>
        </div>
        @endif

      </div>
    </div>
  </div>
@endsection


@push('styles')
@endpush

@push('scripts')
<!-- Slider Js home-->
<script type="text/javascript" src="{{ asset($theme_asset.'/js/revolution-slider.js')}}"></script>
<script type='text/javascript'>
        jQuery(document).ready(function(){
            jQuery('#rev_slider_4').show().revolution({
                dottedOverlay: 'none',
                delay: 5000,
                startwidth: 865,
                startheight: 450,

                hideThumbs: 200,
                thumbWidth: 200,
                thumbHeight: 50,
                thumbAmount: 2,

                navigationType: 'thumb',
                navigationArrows: 'solo',
                navigationStyle: 'round',

                touchenabled: 'on',
                onHoverStop: 'on',

                swipe_velocity: 0.7,
                swipe_min_touches: 1,
                swipe_max_touches: 1,
                drag_block_vertical: false,

                spinner: 'spinner0',
                keyboardNavigation: 'off',

                navigationHAlign: 'center',
                navigationVAlign: 'bottom',
                navigationHOffset: 0,
                navigationVOffset: 20,

                soloArrowLeftHalign: 'left',
                soloArrowLeftValign: 'center',
                soloArrowLeftHOffset: 20,
                soloArrowLeftVOffset: 0,

                soloArrowRightHalign: 'right',
                soloArrowRightValign: 'center',
                soloArrowRightHOffset: 20,
                soloArrowRightVOffset: 0,

                shadow: 0,
                fullWidth: 'on',
                fullScreen: 'off',

                stopLoop: 'off',
                stopAfterLoops: -1,
                stopAtSlide: -1,

                shuffle: 'off',

                autoHeight: 'off',
                forceFullWidth: 'on',
                fullScreenAlignForce: 'off',
                minFullScreenHeight: 0,
                hideNavDelayOnMobile: 1500,

                hideThumbsOnMobile: 'off',
                hideBulletsOnMobile: 'off',
                hideArrowsOnMobile: 'off',
                hideThumbsUnderResolution: 0,


                hideSliderAtLimit: 0,
                hideCaptionAtLimit: 0,
                hideAllCaptionAtLilmit: 0,
                startWithSlide: 0,
                fullScreenOffsetContainer: ''
            });
        });
        </script>
@endpush
