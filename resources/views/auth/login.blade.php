@extends('layouts.app')
{{-- @extends('shop.shop_layout') --}}

@section('main')
        <div class="row">
          <div>
                    <ol class="breadcrumb">
                        <li><a href="{{ url('/') }}">Trang chủ</a></li>
                        <li class="active"><a href="{{ url('login') }}">Đăng nhập</a></li>
                    </ol>
          </div>
          <div class="col-md-3">
          </div>
            <div class="col-md-5">
              <div class="modal-content">
                      <div class="modal-header">
                          <h4 class="modal-title" id="myModalLabel"><span class="glyphicon glyphicon-user"></span> Đăng nhập tài khoản</h4>
                      </div>
                      <div class="modal-body">
                          <div class="row">
                                  <div class="well">
                                      <form id="loginForm" method="POST" action="{{ route('login') }}" novalidate="novalidate">
                                        {{ csrf_field() }}

                                          <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                                              <label for="email" class="control-label">Email của bạn</label>
                                              <input type="text" class="form-control" id="email" name="email" value="{{ old('email') }}" required title="Please enter you email" placeholder="example@gmail.com">
                                            @if ($errors->has('email'))
                                                <span class="help-block">
                                                    <strong>{{ $errors->first('email') }}</strong>
                                                </span>
                                            @endif
                                          </div>

                                          <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                                                <label for="password" class="control-label">Password</label>
                                              <input type="password" class="form-control" id="password" name="password" value="" required title="Please enter your password">
                                                @if ($errors->has('password'))
                                                    <span class="help-block">
                                                        <strong>{{ $errors->first('password') }}</strong>
                                                    </span>
                                                @endif
                                          </div>
                                          <div class="checkbox">
                                              <label>
                                                  <input type="checkbox" name="remember" {{ old('remember') ? 'checked' : '' }}>  Ghi nhớ tài khoản
                                              </label>
                                          </div>
                                          <button type="submit" class="btn btn-success btn-block"><span class=" glyphicon glyphicon-off"></span>  Đăng nhập</button>
                                          <a href="{{ route('password.request') }}" class="btn btn-default btn-block">Quên mật khẩu</a>
                                            <p>Nếu bạn chưa có tài khoản,  <a href="{{ url('register') }}">CLICK VÀO ĐÂY</a> để đăng ký</p>
                                      </form>
                                  </div>
                          </div>
                      </div>
            </div>
          </div>
        </div>
@endsection

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Login</div>

                <div class="panel-body">
                    <form class="form-horizontal" method="POST" action="{{ route('login') }}">
                        {{ csrf_field() }}

                        <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                            <label for="email" class="col-md-4 control-label">E-Mail Address</label>

                            <div class="col-md-6">
                                <input id="email" type="email" class="form-control" name="email" value="{{ old('email') }}" required autofocus>

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
                            <div class="col-md-6 col-md-offset-4">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="remember" {{ old('remember') ? 'checked' : '' }}> Remember Me
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-8 col-md-offset-4">
                                <button type="submit" class="btn btn-primary">
                                    Login
                                </button>

                                <a class="btn btn-link" href="{{ route('password.request') }}">
                                    Forgot Your Password?
                                </a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
