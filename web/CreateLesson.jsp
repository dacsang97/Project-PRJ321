<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page import="java.util.Map"%>
<%@page import="com.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <% request.setAttribute("title", "Tạo bài học mới");
    %>
    <%@include file="./partial/header.jsp" %>
    <%@include file="./partial/navigation.jsp" %>
    <div class="wrapper">
        <div class="container" id="create-lesson">
            <form action="CreateLessonAction" method="post" ref="form">
                <div class="row">
                    <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3" ref="colLeft">
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
                            <input type="hidden" name="quizzesTemp" v-model="quizStr"/>
                            <button type="submit" class="btn btn-block btn-primary" @click.prevent="onSubmit">Tạo</button>
                        </div>
                    </div>
                    <div class="col-xs-12 col-md-6 col-lg-6 col-xl-9">
                        <transition-group
                            name="add-question"
                            enter-active-class="animated fadeIn"
                            leave-active-class="animated bounceOutRight"
                            mode="out-in"
                            tag="div"
                            >
                            <div class="card-box tilebox-one" v-for="(quiz, index) in quizzes" :key="index">

                                <div class="row">
                                    <div class="col-md-1">
                                        <div class="counter-box">
                                            <span class="counter-text">{{ index + 1 }}</span>
                                            <button type="button" class="btn btn-link btn-rounded waves-effect counter-btn" @click="onRemoveQuestion(index)"> <i class="zmdi zmdi-delete"></i> </button>
                                        </div>
                                    </div>
                                    <div class="col-md-11">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <fieldset class="form-group">
                                                    <label class="form-control-label label-quizless" for="question">Câu hỏi</label>
                                                    <textarea class="form-control-quizless" id="question" v-model="quizzes[index].question"></textarea>
                                                </fieldset>
                                            </div>
                                            <div class="col-md-6">
                                                <fieldset class="form-group">
                                                    <label class="form-control-label label-quizless" for="answer">Đáp án</label>
                                                    <textarea class="form-control-quizless" id="answer" v-model="quizzes[index].answer"></textarea>
                                                </fieldset>
                                            </div>
                                        </div>
                                    </div>


                                </div>

                            </div>
                        </transition-group>
                        <div class="card-box tilebox-one text-center">
                            <button type="button" class="btn btn-success-outline waves-effect waves-light" @click="onAddQuestion">Thêm câu hỏi</button>
                        </div>
                    </div>

                </div>
            </form>
        </div>
    </div>


    <%@include file="partial/footerText.jsp" %>
    <%@include file="partial/footer.jsp" %>
    <script src="./assets/js/page/create-lesson.js"></script>
