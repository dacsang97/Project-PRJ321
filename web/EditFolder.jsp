<%@page import="java.util.ArrayList"%>
<%@page import="com.model.Folder"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="com.model.Lesson"%>
<%@page import="com.model.User"%>
<%@page import="com.bean.LessonBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <% request.setAttribute("title", "Chỉnh sửa bài học");
    %>
    <%
        int fid = Integer.parseInt(request.getParameter("fid"));
        Folder f = Folder.getFolder(fid);
        session.setAttribute("folder", f);
    %>
    <%@include file="./partial/header.jsp" %>
    <%@include file="./partial/navigation.jsp" %>
    <div class="wrapper">
        <div class="container" id="create-folder">
            <form action="CreateFolderAction">
                <div class="row">
                    <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
                        <div class="card-box tilebox-one box-info">
                            <fieldset :class="{'form-group': true, 'has-danger': error.title}">
                                <label class="form-control-label" for="title">Tiêu đề</label>
                                <input type="email" :class="{'form-control': true, 'form-control-danger': error.title}" id="title" name="title" placeholder="Điền vào tiêu đề" v-model="title">
                                       <small class="text-muted" v-if="error.title">Vui lòng điền tiêu đề
                                </small>
                            </fieldset>
                            <fieldset class="form-group">
                                <label class="form-control-label" for="share">Trạng thái</label>
                                <select class="form-control" id="share" name="share" v-model="type">
                                    <option v-for="(type, index) in shareType" :value="index+1">{{ type }}</option>
                                </select>
                            </fieldset>
                            <button type="submit" class="btn btn-block btn-warning" @click.prevent="onSubmit">Cập nhật</button>
                        </div>
                    </div>
                    <div class="col-xs-12 col-md-6 col-lg-6 col-xl-9">
                        <div class="row">
                            <div class="col-xs-6">
                                <div class="card-box">
                                    <div class="pull-xs-right">
                                        <button type="button" class="btn btn-success btn-rounded waves-effect waves-light disabled">{{ currentList.length }}</button>
                                    </div>
                                    
                                    <h2 class="m-b-2">Danh sách đã chọn </h2>
                                    <draggable v-model="currentList" class="dragArea" :options="dragOptions">
                                        <transition-group name="flip-list" tag="div" :class="{'inner-drag': true, 'no-lesson': currentList.length == 0, 'lesson-error': submited && currentList.length == 0}">
                                            <div class="card-box list-complete-item" v-for="lesson in currentList" :key="lesson.key">
                                                {{lesson.title}}
                                            </div>
                                        </transition-group>
                                    </draggable>
                                    
                                </div>

                            </div>
                            <div class="col-xs-6">
                                <div class="card-box">
                                    <div class="pull-xs-right">
                                        <button type="button" class="btn btn-danger btn-rounded waves-effect waves-light disabled">{{ remainList.length }}</button>
                                    </div>
                                    <h2 class="m-b-2">Danh sách còn lại </h2>
                                    <draggable v-model="remainList" class="dragArea" :options="dragOptions">
                                        <transition-group name="flip-list" tag="div" class="inner-drag">
                                            <div class="card-box list-complete-item" v-for="lesson in remainList" :key="lesson.key">
                                                {{lesson.title}}
                                            </div>
                                        </transition-group>

                                    </draggable>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <%@include file="partial/footerText.jsp" %>
    <%@include file="partial/footer.jsp" %>
    <script>
        new Vue({
            el: "#menu-extras",
            components: {
                'avatar': Avatar.Avatar
            }
        })
    </script>
    <%
        LessonBean bean = new LessonBean();
        User u = (User) session.getAttribute("user");
        bean.setUser(u);
        List<Lesson> tempArr = Lesson.getListLesson(-1, null, f.getUid(), -1);;
        List<Lesson> lessArr = new ArrayList<Lesson>();
        List<Lesson> currArr = Lesson.getListLesson(f.getFid(), null, -1, -1);
        for (Lesson l : tempArr) {
            boolean check = true;
            for(Lesson l1: currArr) {
                if (l.getLid() == l1.getLid()) {
                    check = false;
                }
            }
            if (check) lessArr.add(l);
        }
        String lessStr = new Gson().toJson(lessArr);
        String currStr = new Gson().toJson(currArr);
        request.setAttribute("lessons", lessStr);
        request.setAttribute("currentLessons", currStr);
    %>
    <script>
        const lessons = ${lessons};
        const currentArr = ${currentLessons};
        const title = "${folder.name}";
        const type = ${folder.sharefolder};
        const fid = ${param.fid};
    </script>
    <script src="https://cdn.jsdelivr.net/sortable/1.4.2/Sortable.min.js"></script>
    <script src="https://cdn.rawgit.com/David-Desmaisons/Vue.Draggable/master/dist/vuedraggable.min.js"></script>
    <script src="./assets/js/page/edit-folder.js"></script>