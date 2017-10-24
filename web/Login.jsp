<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <% request.setAttribute("title", "Đăng nhập");
    %>
    <%@include file="./partial/header.jsp" %>
    <div class="account-pages"></div>
    <div class="clearfix"></div>
    <div class="wrapper-page">

        <div class="account-bg">
            <div class="card-box m-b-0">
                <div class="text-xs-center m-t-20">
                    <a href="index.html" class="logo">
                        <i class="ti-ruler-alt-2"></i>
                        <span>${initParam.sitename}</span>
                    </a>
                </div>
                <div class="m-t-10 p-20">
                    <div class="row">
                        <div class="col-xs-12 text-xs-center">
                            <h6 class="text-muted text-uppercase m-b-0 m-t-0">Đăng nhập</h6>
                        </div>
                    </div>
                    <form class="m-t-20" action="LoginAction" method="POST">

                        <div class="form-group row">
                            <div class="col-xs-12">
                                <input class="form-control" type="text" required="" name="name" placeholder="Tài khoản">
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-xs-12">
                                <input class="form-control" type="password" required="" name="password" placeholder="Mật khẩu">
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-xs-12">
                                <div class="checkbox checkbox-custom">
                                    <input id="checkbox-signup" type="checkbox">
                                    <label for="checkbox-signup">
                                        Ghi nhớ
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group text-center row m-t-10">
                            <div class="col-xs-12">
                                <button class="btn btn-success btn-block waves-effect waves-light" type="submit">Đăng nhập</button>
                            </div>
                        </div>

                        <div class="form-group row m-t-30 m-b-0">
                            <div class="col-sm-12">
                                <a href="pages-recoverpw.html" class="text-muted"><i class="fa fa-lock m-r-5"></i> Quên mật khẩu?</a>
                            </div>
                        </div>
                    </form>

                </div>

                <div class="clearfix"></div>
            </div>
        </div>
        <!-- end card-box-->

        <div class="m-t-20">
            <div class="text-xs-center">
                <p class="text-white">Bạn chưa có tài khoản? <a href="./Register.jsp" class="text-white m-l-5"><b>Đăng kí</b></a></p>
            </div>
        </div>

    </div>
    <!-- end wrapper page -->

    <%@include file="partial/footer.jsp" %>
