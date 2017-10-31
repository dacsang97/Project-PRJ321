<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <% request.setAttribute("title", "Trang chủ");
    %>
    <%@include file="./partial/header.jsp" %>   
    <div class="account-pages"></div>
    <div class="clearfix"></div>
    <div class="wrapper-page">

        <div class="ex-page-content text-xs-center">
            <div class="text-error shadow">${sessionScope.Error.number}</div>
            <h3 class="text-uppercase text-white font-600">${sessionScope.Error.message}</h3>
            <br>
            <a class="btn btn-pink waves-effect waves-light" href="./">Quay lại Trang chủ</a>

        </div>


    </div>
    <!-- end wrapper page -->


    <%@include file="./partial/footer.jsp" %>