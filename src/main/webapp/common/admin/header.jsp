<%@ page import="vn.edu.hcmuaf.fit.model.user.User" %>
<%@ page import="vn.edu.hcmuaf.fit.until.SessionUntil" %>
<%@ page import="vn.edu.hcmuaf.fit.constant.Variable" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%User user = (User) SessionUntil.get(request, Variable.Global.USER.toString()); %>
<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">

    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form action="/change-pass" method="post" id="form2">
                <input hidden name="action" value="update-pass">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold text-uppercase ">đổi mật khẩu tài khoản</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="md-form mb-5">
                        <i class="fas fa-envelope prefix grey-text text-danger"></i>
                        <input type="password" id="pass-old" name="pass-old" class="form-control validate">
                        <label data-error="wrong" data-success="right" for="pass-old">mat khau cu</label>
                    </div>
                    <div class="md-form mb-5">
                        <i class="fas fa-lock prefix grey-text text-danger"></i>
                        <input type="password" id="pass-new" name="pass-new" class="form-control validate">
                        <label data-error="wrong" data-success="right" for="pass-new">Mật khẩu moi</label>
                    </div>

                    <div class="md-form mb-4">
                        <i class="fas fa-repeat prefix grey-text text-danger"></i>
                        <input type="password" id="repass-new" name="repass-new" class="form-control validate">
                        <label data-error="wrong" data-success="right" for="repass-new">Nhập lại mật khẩu</label>

                    </div>
                    <div class="d-flex justify-content-between">
                        <!-- Material checked -->
                        <!-- Material checked -->
                        <div class="form-check p-0">
                            <input type="checkbox" class="form-check-input" name="log" id="log" checked>
                            <label class="form-check-label" for="log">duy tri dang nhap</label>
                        </div>
                        <a href="/reset-pass" class="text-danger">Quên mật khẩu</a>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-between">
                    <span> Đăng nhập tài khoản khác? <a href="/logout" class="text-danger">Thoát</a></span>
                    <button type="submit" onclick="document.getElementById('form2').submit()"
                            class="btn btn-danger waves-effect ">Thay đổi
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">

    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form action="/reset-pass" method="post">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold text-uppercase ">đổi mật khẩu tài khoản</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <!-- Material input -->
                    <div class="md-form">
                        <i class="fas fa-envelope prefix text-danger"></i>
                        <input type="email" name="email" id="email" class="form-control validate" required
                               value="${requestScope.email}">
                        <label for="email" data-error="wrong" data-success="right">Email</label>
                    </div>

                    <div class="md-form mb-4">
                        <i class="fas fa-lock prefix text-danger"></i>
                        <input type="password" name="pass" id="pass" class="form-control validate" required>
                        <label data-error="wrong" data-success="right" for="pass">Mật khẩu mới</label>
                    </div>

                    <div class="md-form mb-4">
                        <i class="fa-solid fa-repeat prefix text-danger"></i>
                        <input type="password" name="repass" id="repass" class="form-control validate "
                               required>
                        <label data-error="wrong" data-success="right" for="repass">Nhập lại mật
                            khẩu</label>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-between">
                    <div class=" d-flex justify-content-between align-items-center">
											<span>Đăng nhập bằng tài khoản khác? <a href="/logout"
                                                                                    class="text-danger">Đăng nhập</a></span>
                        <button type="submit" id="btn-reset" class="btn btn-danger waves-effect">cập nhật
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<header>
    <!-- Sidebar navigation -->
    <div id="slide-out" role="navigation" class="side-nav fixed wide sn-bg-1">
        <ul class="custom-scrollbar">
            <!-- Logo -->
            <li>
                <div class="logo-wrapper sn-ad-avatar-wrapper">
                    <a href="#"><img src="<%=user.getAvatar()%>"
                                     class="rounded-circle"><span><%=user.getName()%></span></a>
                </div>
            </li>
            <!--/. Logo -->
            <!-- Side navigation links -->
            <li>
                <ul class="collapsible collapsible-accordion">
                    <li>
                        <a class="collapsible-header waves-effect arrow-r active" style="font-size: 16px;"><i
                                class="sv-slim-icon fas fa-chevron-rightfa-chevron-right fa-angle-double-left"></i>Quản
                            lí<i class="fas fa-angle-down rotate-icon"></i>
                        </a>
                        <div class="collapsible-body">

                            <ul class="collapsible collapsible-accordion">
                                <%if (user.get(Variable.Global.USER.toString()) != null) {%>
                                <li>
                                    <a class="collapsible-header  text-white waves-effect arrow-r "
                                       style="font-size: 16px;"><i
                                            class=" fas fa-solid fa-users "></i>Người dùng<i
                                            class="fas fa-angle-down rotate-icon"></i></a>
                                    <div class="collapsible-body">
                                        <ul class="">
                                            <li>
                                                <a href="/admin/manage/user"
                                                   class="waves-effect ">

                                                                <span class="sv-normal" style="font-size: 16px;"><i
                                                                        class="fas fa-circle blue-text"></i>danh sách người dùng
                                                                </span></a>
                                            </li>
                                            <li>
                                                <a href="/admin/manage/action"
                                                   class="waves-effect ">

                                                                <span class="sv-normal" style="font-size: 16px;"><i
                                                                        class="fas fa-circle blue-text"></i>danh sách quyen
                                                                </span></a>
                                            </li>


                                        </ul>
                                    </div>
                                </li>
                                <%}%>

                                <%if (user.get(Variable.Global.PHONE.toString()) != null) {%>
                                <li>
                                    <a class="collapsible-header  text-white waves-effect arrow-r "
                                       style="font-size: 16px;"><i
                                            class=" fas fa-solid fa-mobile-screen-button "></i>Điện thoại<i
                                            class="fas fa-angle-down rotate-icon"></i></a>
                                    <div class="collapsible-body">
                                        <ul class=" ">
                                            <li>
                                                <a href="/admin/manage/phone"
                                                   class="waves-effect ">
                                                    <span class="sv-slim"> SL </span>
                                                    <span class="sv-normal" style="font-size: 16px;"><i
                                                            class="fas fa-circle blue-text"></i>
                                                                    Danh sách điện thoại</span></a>
                                            </li>


                                        </ul>
                                    </div>
                                </li>
                                <%}%>
                                <li>
                                    <a class="collapsible-header active text-white waves-effect arrow-r "
                                       style="font-size: 16px;"><i
                                            class="sv-slim-icon fas fa-brands fa-opencart"></i>review<i
                                            class="fas fa-angle-down rotate-icon"></i></a>
                                    <div class="collapsible-body">
                                        <ul class=" ">
                                            <li>
                                                <a href="/admin/manage/review" class="waves-effect">
                                                    <span class="sv-slim"> RF </span>
                                                    <span class="sv-normal" style="font-size: 16px;"><i
                                                            class="fas fa-circle blue-text"></i>review</span></a>

                                            </li>
                                            <li>
                                                <a href="/admin/manage/question" class="waves-effect">
                                                    <span class="sv-slim"> RF </span>
                                                    <span class="sv-normal" style="font-size: 16px;"><i
                                                            class="fas fa-circle blue-text"></i>question</span></a>

                                            </li>

                                        </ul>

                                    </div>
                                </li>
                                <%if (user.get(Variable.Global.DIFFERENCE.toString()) != null) {%>
                                <li>
                                    <a class="collapsible-header active text-white waves-effect arrow-r "
                                       style="font-size: 16px;"><i
                                            class="sv-slim-icon fas fa-brands fa-opencart"></i>difference<i
                                            class="fas fa-angle-down rotate-icon"></i></a>
                                    <div class="collapsible-body">
                                        <ul class=" ">
                                            <li>
                                                <a href="/admin/manage/color" class="waves-effect">
                                                    <span class="sv-slim"> RF </span>
                                                    <span class="sv-normal" style="font-size: 16px;"><i
                                                            class="fas fa-circle blue-text"></i>color</span></a>
                                            </li>
                                            <li>
                                                <a href="/admin/manage/spec" class="waves-effect">
                                                    <span class="sv-slim"> RF </span>
                                                    <span class="sv-normal" style="font-size: 16px;"><i
                                                            class="fas fa-circle blue-text"></i>spec</span></a>
                                            </li>
                                            <li>
                                                <a href="/admin/manage/cap" class="waves-effect">
                                                    <span class="sv-slim"> RF </span>
                                                    <span class="sv-normal" style="font-size: 16px;"><i
                                                            class="fas fa-circle blue-text"></i>cap</span></a>
                                            </li>
                                            <li>
                                                <a href="/admin/manage/sale" class="waves-effect">
                                                    <span class="sv-slim"> RF </span>
                                                    <span class="sv-normal" style="font-size: 16px;"><i
                                                            class="fas fa-circle blue-text"></i>sale</span></a>
                                            </li>
                                            <li>
                                                <a href="/admin/manage/model" class="waves-effect">
                                                    <span class="sv-slim"> RF </span>
                                                    <span class="sv-normal" style="font-size: 16px;"><i
                                                            class="fas fa-circle blue-text"></i>model</span></a>
                                            </li>
                                            <li>
                                                <a href="/admin/manage/brand" class="waves-effect">
                                                    <span class="sv-slim"> RF </span>
                                                    <span class="sv-normal" style="font-size: 16px;"><i
                                                            class="fas fa-circle blue-text"></i>brand</span></a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                                <%}%>
                                <%if (user.get(Variable.Global.ORDER.toString()) != null) {%>
                                <li>
                                    <a class="collapsible-header  text-white waves-effect arrow-r "
                                       style="font-size: 16px;"><i
                                            class=" fas fa-regular fa-pen-to-square"></i>Đơn hàng<i
                                            class="fas fa-angle-down rotate-icon"></i></a>
                                    <div class="collapsible-body">
                                        <ul class="">
                                            <li>
                                                <a href="/admin/manage/order"
                                                   class="waves-effect ">
                                                    <span class="sv-slim"> SL </span>
                                                    <span class="sv-normal"
                                                          style="font-size: 16px;"><i
                                                            class="fas fa-circle blue-text"></i>Danh sách đơn hàng
                                                                            </span></a>
                                            </li>


                                        </ul>
                                    </div>
                                </li>
                                <%}%>
                            </ul>

                        </div>
                    </li>
                    <li>
                        <a class="collapsible-header waves-effect arrow-r " style="font-size: 16px;"><i
                                class="sv-slim-icon fas fa-chevron-rightfa-chevron-right fa-angle-double-left"></i>bieu
                            do<i class="fas fa-angle-down rotate-icon"></i>
                        </a>
                        <div class="collapsible-body">

                            <ul class="collapsible collapsible-accordion">
                                <li>
                                    <a class="collapsible-header  text-white waves-effect arrow-r "
                                       style="font-size: 16px;"><i
                                            class=" fas fa-solid fa-users "></i>Người dùng<i
                                            class="fas fa-angle-down rotate-icon"></i></a>
                                    <div class="collapsible-body">
                                        <ul class="">
                                            <li>
                                                <a href="/admin/manage/user"
                                                   class="waves-effect ">

                                                                <span class="sv-normal" style="font-size: 16px;"><i
                                                                        class="fas fa-circle blue-text"></i>danh sách người dùng
                                                                </span></a>
                                            </li>


                                        </ul>
                                    </div>
                                </li>


                            </ul>

                        </div>
                    </li>
                </ul>
            </li>


            <li>
                <a id="toggle" class="waves-effect">
                    <i class="sv-slim-icon fas fa-angle-double-left" style="font-size: 18px;"></i>
                    <span style="font-size: 17px;">Thu nhỏ menu</span>
                </a>
            </li>


        </ul>
    </div>
    <div class="sidenav-bg rgba-blue-strong"></div>
    </div>
    <!--/. Sidebar navigation -->
    <!-- Navbar -->
    <nav class="navbar fixed-top navbar-toggleable-md navbar-expand-lg scrolling-navbar double-nav">
        <!-- SideNav slide-out button -->
        <div class="float-left">
            <a href="#" data-activates="slide-out" class="button-collapse"><i class="fas fa-bars"></i></a>
        </div>
        <!-- Breadcrumb-->
        <div class="breadcrumb-dn mr-auto">
            <a href="/">FPT shop.com.vn</a>
        </div>
        <ul class="nav navbar-nav nav-flex-icons ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="/admin/store"><i
                        class="far fa-trash-alt"></i><span
                        class="clearfix d-none d-sm-inline-block">thung rac</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/admin/home"><i class="fa-solid fa-house-user mr-1 fa-lg"></i><span
                        class="clearfix d-none d-sm-inline-block">Trang chủ</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-target="#modal" data-toggle="modal"><i class="fa-solid fa-key"></i> <span
                        class="clearfix d-none d-sm-inline-block">Đổi mật khẩu</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-target="#modal1" data-toggle="modal"><i class="fa-solid fa-key"></i> <span
                        class="clearfix d-none d-sm-inline-block">quen mật khẩu</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/admin/info"><i class="fas fa-user"></i> <span
                        class="clearfix d-none d-sm-inline-block">Thông tin cá nhân</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/logout"><i class="fa-solid fa-right-from-bracket"></i> <span
                        class="clearfix d-none d-sm-inline-block">Thoát</span></a>
            </li>

        </ul>
    </nav>
    <!-- /.Navbar -->
</header>