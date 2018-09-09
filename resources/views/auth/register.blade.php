@extends('layouts.app')
{{-- @extends('shop.shop_layout') --}}

@section('main')
        <div class="row">
          <div>
                    <ol class="breadcrumb">
                        <li><a href="{{ url('/') }}">Trang chủ</a></li>
                        <li class="active"><a href="{{ url('register') }}">Đăng ký tài khoản</a></li>
                    </ol>
            </div>
            <div class="col-md-12">
            <div class="modal-content">
                      <div class="modal-header">
                          <h4 class="modal-title" id="myModalLabel"> Đăng ký tài khoản mới</h4>
                      </div>
                      <div class="modal-body">
                          <div class="row">
                              <div class="col-xs-6">
                                  <div class="well">
                                      <form id="loginForm" method="POST" action="{{ route('register') }}" novalidate="novalidate">
                                        {{ csrf_field() }}
                                            <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                                              <label for="email" class="control-label">Địa chỉ email</label>
                                              <input type="text" class="form-control" id="email" name="email" value="{{ old('email') }}" required title="Nhập email của bạn" placeholder="example@gmail.com">
                                            @if ($errors->has('email'))
                                                <span class="help-block">
                                                    <strong>{{ $errors->first('email') }}</strong>
                                                </span>
                                            @endif
                                          </div>
                                           <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                                              <label for="password" class="control-label">Mật khẩu</label>
                                              <input type="password" class="form-control" id="password" name="password" value="" required title="Please enter your password">
                                            @if ($errors->has('password'))
                                                <span class="help-block">
                                                    <strong>{{ $errors->first('password') }}</strong>
                                                </span>
                                            @endif
                                          </div>

                                          <div class="form-group">
                                              <label for="password-confirm" class="control-label">Nhập lại mật khẩu</label>
                                              <input type="password" class="form-control" id="password-confirm" name="password_confirmation" value="" required title="Please enter your password">
                                              <span class="help-block"></span>
                                          </div>
                                    <div class="form-group{{ $errors->has('name') ? ' has-error' : '' }}">
                                              <label class="control-label">Tên của bạn</label>
                                              <input type="text" class="form-control" id="name" name="name" value="{{ old('name') }}" required  title="Tên của bạn" placeholder="">
                                                @if ($errors->has('name'))
                                                    <span class="help-block">
                                                        <strong>{{ $errors->first('name') }}</strong>
                                                    </span>
                                                @endif
                                          </div>
                                  </div>
                              </div>

                              <div class="col-xs-6">
                                  <div class="well">


                                          <div class="form-group{{ $errors->has('phone') ? ' has-error' : '' }}">
                                              <label class="control-label">Số điện thoại</label>
                                              <input type="text" class="form-control" id="phone" name="phone" value="{{ old('phone') }}" required  title="Tên của bạn" placeholder="">
                                                @if ($errors->has('phone'))
                                                    <span class="help-block">
                                                        <strong>{{ $errors->first('phone') }}</strong>
                                                    </span>
                                                @endif
                                          </div>
                                          <div class="form-group{{ $errors->has('address1') ? ' has-error' : '' }}">
                                              <label class="control-label">Địa chỉ của bạn</label>
                                              <input type="text" class="form-control" id="address1" name="address1" value="{{ old('address1') }}" required  title="Tên của bạn" placeholder="">
                                                @if ($errors->has('address1'))
                                                    <span class="help-block">
                                                        <strong>{{ $errors->first('address1') }}</strong>
                                                    </span>
                                                @endif
                                          </div>

                                          <div class="form-group{{ $errors->has('address2') ? ' has-error' : '' }}">
                                              <label class="control-label">Tỉnh/Thành Phố</label>
                                              <input type="text" class="form-control" id="address2" name="address2" value="{{ old('address2') }}" required  title="Tên của bạn" placeholder="">
                                                @if ($errors->has('address2'))
                                                    <span class="help-block">
                                                        <strong>{{ $errors->first('address2') }}</strong>
                                                    </span>
                                                @endif
                                          </div>
                                          <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-retweet"></span> Đăng ký</button>
                                          <p>Hoặc <a href="{{ url('login') }}">ĐĂNG NHẬP</a> nếu bạn đã có tài khoản</p>
                                      </form>
                                  </div>
                              </div>

                          </div>
                      </div>
                  </div>
            </div>
            <!-- /.col -->
        </div>
@endsection


@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Register</div>

                <div class="panel-body">
                    <form class="form-horizontal" method="POST" action="{{ route('register') }}">
                        {{ csrf_field() }}

                        <div class="form-group{{ $errors->has('name') ? ' has-error' : '' }}">
                            <label for="name" class="col-md-4 control-label">Name</label>

                            <div class="col-md-6">
                                <input id="name" type="text" class="form-control" name="name" value="{{ old('name') }}" required autofocus>

                                @if ($errors->has('name'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('name') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                            <label for="email" class="col-md-4 control-label">E-Mail Addresss</label>

                            <div class="col-md-6">
                                <input id="email" type="email" class="form-control" name="email" value="{{ old('email') }}" required>

                                @if ($errors->has('email'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                            <label for="password" class="col-md-4 control-label">Password</label>

                            <div class="col-md-6">
                                <input id="password" type="password" class="form-control" name="password" required>

                                @if ($errors->has('password'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="password-confirm" class="col-md-4 control-label">Confirm Password</label>

                            <div class="col-md-6">
                                <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-4">
                                <button type="submit" class="btn btn-primary">
                                    Register
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
