@extends($theme.'.shop_layout')

@section('content')


  <section class="blog_post">
    <div class="container">

      <!-- row -->
      <div class="row">

        <!-- Center colunm-->
        <div class="col-xs-12 col-sm-9 col-sm-push-3" id="center_column">
          <div class="center_column">
            <div class="page-title">
              <h2>Blog AloChip</h2>
            </div>
            <ul class="blog-posts">
@foreach ($news as $blog)
              <li class="post-item">
                <article class="entry">
                  <div class="row">
                    <div class="col-sm-5">
                      <div class="entry-thumb image-hover2"> <a href="{{ url('blog/'.ktc_str_convert($blog->title).'_'.$blog->id.'.html') }}">
                        <figure><img src="{{ asset('documents/website/thumb/'.$blog->image) }}" alt="{{ $blog->title }}" alt="Blog"></figure>
                        </a> </div>
                    </div>
                    <div class="col-sm-7">
                      <h3 class="entry-title"><a href="{{ url('blog/'.ktc_str_convert($blog->title).'_'.$blog->id.'.html') }}">{{ $blog->title }}</a></h3>
                      <div class="entry-meta-data"> <span class="author">  <span class="date"><i class="pe-7s-date"></i>&nbsp; {{ date('d/m/Y',strtotime($blog->created_at)) }}</span> </div>
                      <div class="entry-excerpt">{{ $blog->description }}</div>
                      <a href="{{ url('blog/'.ktc_str_convert($blog->title).'_'.$blog->id.'.html') }}" class="button read-more">xem đầy đủ&nbsp; <i class="fa fa-angle-double-right"></i></a> </div>
                  </div>
                </article>
              </li>
@endforeach
            </ul>
            <div class="sortPagiBar">
              <div class="pagination-area " >
                    {{ $news->links() }}
              </div>
            </div>
          </div>
        </div>
        <!-- ./ Center colunm -->



        <!-- Left colunm -->
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
                    <a href="{{ $leftBanner->url }}#"><img src="{{ asset('documents/website/thumb/'.$leftBanner->image) }}"></a>
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
        <!-- ./left colunm -->
      </div>
      <!-- ./row-->
    </div>
  </section>



    <div class="span12">
        <div class="pagination text-center ">
        {{ $news->links() }}
        </div>
    </div>
@endsection
