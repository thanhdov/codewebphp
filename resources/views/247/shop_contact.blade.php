@extends($theme.'.shop_layout')
@section('slide')
@endsection

@section('content')
  <!-- Main Container -->
  <div class="main-container col1-layout">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
  <div class="page_content">
<form method="post" action="{{ url('lien-he.html') }}" class="contact-form">
{{ csrf_field() }}
<div id="contactFormWrapper" style="margin: 30px;">
<div class="row">
        <div class="col-md-12 collapsed-block">
            {!! $page->content !!}
        </div>
        <div class="col-md-5 col-xs-12 collapsed-block">
          <div class="footer-links">
            <h3 class="links-title">{{ $configs['site_title'] }}</h3>
            <div class="tabBlock" id="TabBlock-5">
              <div class="footer-description"><b>Địa chỉ:</b> {{ $configs['site_address'] }}</div>
              <div class="footer-description"> <b>SĐT:</b> {{ $configs['site_phone_long'] }}<br>
                <b>Email:</b> {{ $configs['site_email'] }}<br>
                 </div>
            </div>
          </div>
        </div>
        <div class="col-md-7 col-xs-12">
            <div class="row">
                <div class="col-sm-4 form-group {{ $errors->has('name') ? ' has-error' : '' }}">
                    <label>Tên:</label>
                    <input type="text"  class="form-control {{ ($errors->has('name'))?"input-error":"" }}"  name="name" placeholder="Tên của bạn..." value="{{ old('name') }}">
                    @if ($errors->has('name'))
                        <span class="help-block">
                            {{ $errors->first('name') }}
                        </span>
                    @endif
                </div>
                <div class="col-sm-4 form-group {{ $errors->has('email') ? ' has-error' : '' }}">
                    <label>Email:</label>
                    <input  type="email" class="form-control {{ ($errors->has('email'))?"input-error":"" }}"  name="email" placeholder="Địa chỉ email..." value="{{ old('email') }}">
                    @if ($errors->has('email'))
                        <span class="help-block">
                            {{ $errors->first('email') }}
                        </span>
                    @endif
                </div>
                <div class="col-sm-4 form-group {{ $errors->has('phone') ? ' has-error' : '' }}">
                    <label>Số điện thoại:</label>
                    <input  type="telephone" class="form-control {{ ($errors->has('phone'))?"input-error":"" }}"  name="phone" placeholder="Số điện thoại..." value="{{ old('phone') }}">
                    @if ($errors->has('phone'))
                        <span class="help-block">
                            {{ $errors->first('phone') }}
                        </span>
                    @endif
                </div>
            </div>

            <div class="row">
                <div class="col-sm-12 form-group {{ $errors->has('title') ? ' has-error' : '' }}">
                    <label class="control-label">Tiêu đề:</label>
                    <input  type="text" class="form-control {{ ($errors->has('title'))?"input-error":"" }}"  name="title" placeholder="Tiêu đề..." value="{{ old('title') }}">
                    @if ($errors->has('title'))
                        <span class="help-block">
                            {{ $errors->first('title') }}
                        </span>
                    @endif
                </div>
                <div class="col-sm-12 form-group {{ $errors->has('content') ? ' has-error' : '' }}">
                    <label class="control-label">Nội dung liên hệ:</label>
                    <textarea  class="form-control {{ ($errors->has('content'))?"input-error":"" }}" rows="5" cols="75"  name="content" placeholder="Your Message...">{{ old('content') }}</textarea>
                    @if ($errors->has('content'))
                        <span class="help-block">
                            {{ $errors->first('content') }}
                        </span>
                    @endif

                </div>
            </div>

            <div class="btn-toolbar form-group">
                <input type="submit"  value="Gửi ngay" class="btn btn-primary">
                <input type="reset" value="Làm lại" class="btn btn-info">
            </div>
        </div>
</div>


</div><!-- contactFormWrapper -->

</form>

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
                <li class="">{{ $title }}</li>

              </ul>
            </div>
          </div>
        </div>
      </div>
@endsection
