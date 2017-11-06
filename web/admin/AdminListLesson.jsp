<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% request.setAttribute("title", "Danh sách chuyên mục");
%>
<%@include file="./partial/header.jsp" %>

<div class="wrapper">
    <%@include file="./partial/navigation.jsp" %>
    <div class="content-page">
        <jsp:useBean id="lesson" class="com.bean.LessonBean" scope="request"/>
        <jsp:setProperty name="lesson" property="user" value="${sessionScope.user}"/>
        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="page-title-box">
                            <h4 class="page-title">Danh sách bài học</h4>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-md-6 col-lg-6 col-xl-12">
                        <div class="card-box table-responsive">
                            <table id="datatable" class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th>Tên</th>
                                        <th>Trạng thái</th>
                                        <th>Tác giả</th>
                                        <th>Chỉnh sửa</th>
                                        <th>Xóa</th>
                                    </tr> 
                                </thead>
                                <tbody>
                                <c:forEach var="l" items="${lesson.allLessons}">
                                    <tr>
                                        <td><a href="../Lesson.jsp?lid=${l.lid}">${l.title}</a></td>
                                        <td>${l.typeShare}</td>
                                        <td>${l.userName}</td>
                                        <td><a href="../EditLesson.jsp?lid=${l.lid}">Chỉnh sửa</a></td>
                                        <td><a href="AdminDeleteLessonAction?lid=${l.lid}">Xóa</a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <%@include file="./partial/footer.jsp" %>
    <%@include file="partial/datatable.jsp" %>
</div>


</body>
</html>