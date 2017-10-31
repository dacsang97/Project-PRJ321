<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Navigation Bar-->
<header id="topnav">
    <div class="topbar-main">
        <div class="container">

            <!-- LOGO -->
            <div class="topbar-left">
                <a href="./" class="logo">
                    <i class="ti-ruler-alt-2"></i>
                    <span>Quizless</span>
                </a>
            </div>
            <!-- End Logo container-->


            <div class="menu-extras">

                <ul class="nav navbar-nav pull-right">

                    <li class="nav-item">
                        <!-- Mobile menu toggle-->
                        <a class="navbar-toggle">
                            <div class="lines">
                                <span></span>
                                <span></span>
                                <span></span>
                            </div>
                        </a>
                        <!-- End mobile menu toggle-->
                    </li>

                    <li class="nav-item hidden-sm-down">
                        <form role="search" class="navbar-left app-search pull-left hidden-xs">
                            <input type="text" placeholder="Search..." class="form-control">
                            <a href=""><i class="fa fa-search"></i></a>
                        </form>
                    </li>
                    <li class="nav-item dropdown notification-list">
                        <a class="nav-link waves-effect waves-light right-bar-toggle" href="javascript:void(0);">
                            <i class="zmdi zmdi-format-subject noti-icon"></i>
                        </a>
                    </li>
                    <% if (session.getAttribute("user") == null) { %>
                    <li class="nav-item dropdown notification-list">
                        <a class="nav-link dropdown-toggle arrow-none waves-effect waves-light nav-user" data-toggle="dropdown" href="#" role="button"
                           aria-haspopup="false" aria-expanded="false">
                            <img src="assets/images/users/avatar-1.jpg" alt="user" class="img-circle">
                        </a>
                        <div class="dropdown-menu dropdown-menu-right dropdown-arrow profile-dropdown " aria-labelledby="Preview">
                            <!-- item-->
                            <div class="dropdown-item noti-title">
                                <h5 class="text-overflow"><small>Chào bạn !</small> </h5>
                            </div>

                            <!-- item-->
                            <a href="./Register.jsp" class="dropdown-item notify-item">
                                <i class="zmdi zmdi-account-circle"></i> <span>Đăng kí</span>
                            </a>

                            <!-- item-->
                            <a href="./Login.jsp" class="dropdown-item notify-item">
                                <i class="zmdi zmdi-settings"></i> <span>Đăng nhập</span>
                            </a>
                        </div>
                    </li>
                    <% } else { %>
                    <li class="nav-item dropdown notification-list">
                        <a class="nav-link dropdown-toggle arrow-none waves-effect waves-light nav-user" data-toggle="dropdown" href="#" role="button"
                           aria-haspopup="false" aria-expanded="false">
                            <img src="assets/images/users/avatar-1.jpg" alt="${sessionScope.user.username}" class="img-circle">
                        </a>
                        <div class="dropdown-menu dropdown-menu-right dropdown-arrow profile-dropdown " aria-labelledby="Preview">
                            <!-- item-->
                            <div class="dropdown-item noti-title">
                                <h5 class="text-overflow"><small>Chào ${sessionScope.user.username}</small> </h5>
                            </div>

                            <!-- item-->
                            <a href="./Profile.jsp" class="dropdown-item notify-item">
                                <i class="zmdi zmdi-account-circle"></i> <span>Thông tin tài khoản</span>
                            </a>

                            <!-- item-->
                            <a href="./LogoutAction" class="dropdown-item notify-item">
                                <i class="zmdi zmdi-power"></i> <span>Đăng xuất</span>
                            </a>

                        </div>
                    </li>

                    <% }%>
                </ul>

            </div> <!-- end menu-extras -->
            <div class="clearfix"></div>

        </div> <!-- end container -->
    </div>
    <!-- end topbar-main -->


    <div class="navbar-custom">
        <div class="container">
            <div id="navigation">
                <!-- Navigation Menu-->
                <ul class="navigation-menu">
                    <li>
                        <a href="./"><i class="zmdi zmdi-home"></i> <span> Trang chủ </span> </a>
                    </li>
                    <li class="has-submenu">
                        <a href="./ListLesson.jsp"><i class="zmdi zmdi-shape"></i> <span> Bài học </span> </a>
                        <ul class="submenu">
                            <li><a href="./ListLesson.jsp">Danh sách bài học</a></li>
                            <li><a href="./CreateLesson.jsp">Tạo bài học mới</a></li>
                            <div class="dropdown-divider"></div>
                            <li><a href="./MyLesson.jsp">Bài học của tôi</a></li>
                        </ul>
                    </li>
                    <li class="has-submenu">
                        <a href="./ListFolder.jsp"><i class="zmdi zmdi-storage"></i> <span> Chuyên mục </span> </a>
                        <ul class="submenu">
                            <li><a href="./ListFolder.jsp">Danh sách chuyên mục</a></li>
                            <li><a href="./CreateFolder.jsp">Tạo chuyên mục mới</a></li>
                            <div class="dropdown-divider"></div>
                            <li><a href="./MyFolder.jsp">Chuyên mục của tôi</a></li>
                        </ul>
                    </li>

                </ul>
                <!-- End navigation menu  -->
            </div>
        </div>
    </div>
</header>
<!-- End Navigation Bar-->
