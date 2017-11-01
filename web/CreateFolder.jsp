<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="com.model.Lesson"%>
<%@page import="com.model.User"%>
<%@page import="com.bean.LessonBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <% request.setAttribute("title", "Tạo bài học mới");
    %>
    <%@include file="./partial/header.jsp" %>
    <%@include file="./partial/navigation.jsp" %>
    <div class="wrapper">
        <div class="container" id="create-folder">
            <form action="CreateFolderAction">
                <div class="row">
                    <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
                        <div class="card-box tilebox-one box-info">
                            <fieldset :class="{'form-group': true, 'has-danger': error}">
                                <label class="form-control-label" for="title">Tiêu đề</label>
                                <input type="email" :class="{'form-control': true, 'form-control-danger': error}" id="title" name="title" placeholder="Điền vào tiêu đề" v-model="title">
                                       <small class="text-muted" v-if="error">Vui lòng điền tiêu đề
                                </small>
                            </fieldset>
                            <fieldset class="form-group">
                                <label class="form-control-label" for="share">Trạng thái</label>
                                <select class="form-control" id="share" name="share" v-model="type">
                                    <option v-for="(type, index) in shareType" :value="index+1">{{ type }}</option>
                                </select>
                            </fieldset>
                            <button type="submit" class="btn btn-block btn-primary" @click.prevent="onSubmit">Tạo</button>
                        </div>
                    </div>
                    <div class="col-xs-12 col-md-6 col-lg-6 col-xl-9">
                        <div class="row">
                            <div class="col-xs-6">
                                <div class="card-box">
                                    <h2>Danh sách đã chọn</h2>
                                    <draggable v-model="currentList" class="dragArea" :options="dragOptions">
                                        <transition-group name="flip-list" tag="div" class="inner-drag">
                                            <div class="card-box list-complete-item" v-for="lesson in currentList" :key="lesson.key">
                                                {{lesson.title}} {{ lesson.key }}
                                            </div>
                                        </transition-group>

                                    </draggable>
                                </div>

                            </div>
                            <div class="col-xs-6">
                                <div class="card-box">
                                    <h2>Danh sách còn lại</h2>
                                    <draggable v-model="remainList" class="dragArea" :options="dragOptions">
                                        <transition-group name="flip-list" tag="div" class="inner-drag">
                                            <div class="card-box list-complete-item" v-for="lesson in remainList" :key="lesson.key">
                                                {{lesson.title}} {{ lesson.key }}
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
        List<Lesson> lessArr = bean.getMyLesson();
        String lessStr = new Gson().toJson(lessArr);
        request.setAttribute("lessons", lessStr);
    %>
    <script>
        const lessons = ${lessons}
    </script>
    <script src="https://cdn.jsdelivr.net/sortable/1.4.2/Sortable.min.js"></script>
    <script src="https://cdn.rawgit.com/David-Desmaisons/Vue.Draggable/master/dist/vuedraggable.min.js"></script>
    <script src="./assets/js/page/create-folder.js"></script>
