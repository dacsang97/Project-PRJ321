<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Top Bar Start -->
<div class="topbar">

    <!-- LOGO -->
    <div class="topbar-left">
        <a href="../" class="logo">
            <i class="ti-ruler-alt-2"></i>
            <span>Quizless</span></a>
    </div>


    <nav class="navbar navbar-custom" id="menu-extras">
        <ul class="nav navbar-nav">
            <li class="nav-item">
                <button class="button-menu-mobile open-left waves-light waves-effect">
                    <i class="zmdi zmdi-menu"></i>
                </button>
            </li>
        </ul>

        <ul class="nav navbar-nav pull-right">
            <li class="nav-item dropdown notification-list">
                <a class="nav-link dropdown-toggle arrow-none waves-effect waves-light nav-user" data-toggle="dropdown" href="#" role="button"
                   aria-haspopup="false" aria-expanded="false">
                    <avatar username="${sessionScope.user.username}" :size="36"></avatar>
                </a>
                <div class="dropdown-menu dropdown-menu-right dropdown-arrow profile-dropdown " aria-labelledby="Preview">
                    <!-- item-->
                    <div class="dropdown-item noti-title">
                        <h5 class="text-overflow"><small>Xin chào <b>${sessionScope.user.username}</b></small> </h5>
                    </div>

                    <!-- item-->
                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                        <i class="zmdi zmdi-account-circle"></i> <span>Trang cá nhân</span>
                    </a>

                    <!-- item-->
                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                        <i class="zmdi zmdi-settings"></i> <span>Cài đặt</span>
                    </a>

                    <!-- item-->
                    <a href="../LogoutAction" class="dropdown-item notify-item">
                        <i class="zmdi zmdi-power"></i> <span>Đăng xuất</span>
                    </a>

                </div>
            </li>

        </ul>

    </nav>

</div>
<!-- Top Bar End -->


<!-- ========== Left Sidebar Start ========== -->
<div class="left side-menu">
    <div class="sidebar-inner slimscrollleft">

        <!--- Sidemenu -->
        <div id="sidebar-menu">
            <ul>
                <li class="text-muted menu-title">Navigation</li>

                <li class="has_sub">
                    <a href="./" class="waves-effect"><i class="zmdi zmdi-view-dashboard"></i><span> Bảng điều khiển </span> </a>
                </li>
                <li class="has_sub">
                    <a href="javascript:void(0);" class="waves-effect"><i class="zmdi zmdi-format-underlined"></i> <span> Thành viên </span> <span class="menu-arrow"></span></a>
                    <ul class="list-unstyled">
                        <li><a href="./AdminListUser.jsp">Danh sách thành viên</a></li>
                        <li><a href="./AdminCreateUser.jsp">Tạo thành viên mới</a></li>
                    </ul>
                </li>
                <li class="has_sub">
                    <a href="javascript:void(0);" class="waves-effect"><i class="zmdi zmdi-storage"></i> <span> Chuyên mục </span> <span class="menu-arrow"></span></a>
                    <ul class="list-unstyled">
                        <li><a href="./AdminListFolder.jsp">Danh sách chuyên mục</a></li>
                        <li><a href="../CreateFolder.jsp">Tạo chuyên mục mới</a></li>
                    </ul>
                </li>
                <li class="has_sub">
                    <a href="javascript:void(0);" class="waves-effect"><i class="zmdi zmdi-shape"></i> <span> Bài học </span> <span class="menu-arrow"></span></a>
                    <ul class="list-unstyled">
                        <li><a href="./AdminListLesson.jsp">Danh sách bài học</a></li>
                        <li><a href="../CreateLesson.jsp">Tạo bài học mới</a></li>
                    </ul>
                </li>
                
            </ul>
            <div class="clearfix"></div>
        </div>
        <!-- Sidebar -->
        <div class="clearfix"></div>

    </div>

</div>
<!-- Left Sidebar End -->

