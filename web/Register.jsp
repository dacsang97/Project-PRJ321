<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%@include file="./partial/header.jsp" %>
    <div class="wrapper">
        <div class="main">
            <div class="section section-signup" style="background-image: url('assets/img/bg11.jpg'); background-size: cover; background-position: top center; min-height: 90vh;">
                <div class="container">
                    <div class="row">
                        <div class="card card-signup" data-background-color="orange">
                            <form class="form" method="post" action="RegisterAction">
                                <div class="header text-center">
                                    <h4 class="title title-up">Register</h4>
                                    <div class="social-line">
                                        <a href="#pablo" class="btn btn-neutral btn-facebook btn-icon btn-round">
                                            <i class="fa fa-facebook-square"></i>
                                        </a>
                                        <a href="#pablo" class="btn btn-neutral btn-twitter btn-icon btn-lg btn-round">
                                            <i class="fa fa-twitter"></i>
                                        </a>
                                        <a href="#pablo" class="btn btn-neutral btn-google btn-icon btn-round">
                                            <i class="fa fa-google-plus"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="input-group form-group-no-border">
                                        <span class="input-group-addon">
                                            <i class="now-ui-icons users_circle-08"></i>
                                        </span>
                                        <input type="text" class="form-control" placeholder="Username" name="name">
                                    </div>
                                    <div class="input-group form-group-no-border">
                                        <span class="input-group-addon">
                                            <i class="now-ui-icons objects_key-25"></i>
                                        </span>
                                        <input type="password" placeholder="Password" class="form-control" name="password">
                                    </div>
                                    <div class="input-group form-group-no-border">
                                        <span class="input-group-addon">
                                            <i class="now-ui-icons objects_key-25"></i>
                                        </span>
                                        <input type="password" placeholder="Re password" class="form-control" name="re_password">
                                    </div>
                                    <!-- If you want to add a checkbox to this form, uncomment this code -->
                                    <!-- <div class="checkbox">
	  								<input id="checkboxSignup" type="checkbox">
	  									<label for="checkboxSignup">
	  									Unchecked
	  									</label>
	  						  		</div> -->
                                </div>
                                <div class="footer text-center">
                                    <button type="submit" class="btn btn-neutral btn-round btn-lg">Signup</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col text-center">
                        <a href="./Register.jsp" class="btn btn-simple btn-round btn-white btn-lg" target="_blank">View Signin Page</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="partial/footer.jsp" %>
