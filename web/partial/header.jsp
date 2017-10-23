<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
        <link rel="icon" type="image/png" href="assets/img/favicon.png">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>Quizless</title>
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
        <!--     Fonts and icons     -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
        <!-- CSS Files -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <link href="assets/css/now-ui-kit.css?v=1.1.0" rel="stylesheet" />
        <!-- CSS Just for demo purpose, don't include it in your project -->
        <link href="assets/css/demo.css" rel="stylesheet" />
        <style>
            body {
                margin-top: 70px
            }
        </style>
    </head>
    <body class="sidebar-collapse">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg bg-primary fixed-top">
            <div class="container">
                <a class="navbar-brand" href="./">Quizless</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="#">Trang chủ <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Danh sách đề thi</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Danh sách chuyên mục</a>
                        </li>
                        <form class="form-inline">
                            <input class="form-control mr-sm-2" type="search" placeholder="Tìm kiếm đề thi" aria-label="Search">
                            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Tìm kiếm</button>
                        </form>
                        
                    </ul>
                    <ul class="navbar-nav my-2 my-lg-0">
                        <li class="nav-item">
                            <a class="nav-link btn btn-primary" href="#">Tạo đề thi</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Chào ${sessionScope.user.username}
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <h6 class="dropdown-header">Tài khoản</h6>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="./Login.jsp">Đăng nhập</a>
                                <a class="dropdown-item" href="./Register.jsp">Đăng kí</a>
                            </div>
                        </li>
                        
                    </ul>
                </div>
            </div>
        </nav>
