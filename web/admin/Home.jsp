<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% request.setAttribute("title", "Trang chủ");
%>
<%@include file="./partial/header.jsp" %>

<div class="wrapper">
    <%@include file="./partial/navigation.jsp" %>

    <jsp:useBean id="dashboard" class="com.bean.Dashboard" scope="request" />
    <!-- ============================================================== -->
    <!-- Start right Content here -->
    <!-- ============================================================== -->
    <div class="content-page">
        <!-- Start content -->
        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="page-title-box">
                            <h4 class="page-title">Bảng điều khiển</h4>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <!-- end row -->


                <div class="row">
                    <div class="col-xs-12 col-md-6 col-lg-6 col-xl-6">
                        <div class="card-box tilebox-one">
                            <i class="zmdi zmdi-storage pull-xs-right text-muted"></i>
                            <h1 class="m-b-20" data-plugin="counterup">${dashboard.folderCount}</h1>
                            <h6 class="text-muted text-uppercase m-b-20">Chuyên mục</h6>
                        </div>
                    </div>

                    <div class="col-xs-12 col-md-6 col-lg-6 col-xl-6">
                        <div class="card-box tilebox-one">
                            <i class="zmdi zmdi-shape pull-xs-right text-muted"></i>
                            <h1 class="m-b-20"><span data-plugin="counterup">${dashboard.lessonCount}</span></h1>
                            <h6 class="text-muted text-uppercase m-b-20">Bài học</h6>
                        </div>
                    </div>
                    
                    <div class="col-xs-12 col-md-6 col-lg-6 col-xl-6">
                        <div class="card-box tilebox-one">
                            <i class="zmdi zmdi-badge-check pull-xs-right text-muted"></i>
                            <h1 class="m-b-20"><span data-plugin="counterup">${dashboard.quizCount}</span></h1>
                            <h6 class="text-muted text-uppercase m-b-20">Câu hỏi</h6>
                        </div>
                    </div>

                    <div class="col-xs-12 col-md-6 col-lg-6 col-xl-6">
                        <div class="card-box tilebox-one">
                            <i class="zmdi zmdi-format-underlined pull-xs-right text-muted"></i>
                            <h1 class="m-b-20"><span data-plugin="counterup">${dashboard.userCount}</span></h1>
                            <h6 class="text-muted text-uppercase m-b-20">Thành viên</h6>
                        </div>
                    </div>
                    
                    
                </div>
                <!-- end row -->

            </div>
        </div>
    </div>

    <%@include file="./partial/footer.jsp" %>
</div>