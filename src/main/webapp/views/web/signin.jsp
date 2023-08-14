<%@ page import="vn.edu.hcmuaf.fit.model.user.User" %>
<%@ page import="vn.edu.hcmuaf.fit.until.SessionUntil" %>
<%@ page import="vn.edu.hcmuaf.fit.constant.Variable" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<div class="container ">
    <%
        String error1 = (String) request.getAttribute("error1");
        String error2 = (String) request.getAttribute("error2");
        User user = (User) request.getAttribute("user");

        String address = (String) request.getAttribute("address");
        String phone = (String) request.getAttribute("phone");
    %>
    <section class="my-5 ">

        <div class="row justify-content-center">

            <div class="col-xl-6 p-4 ">

                <div class="card" id="form-register">
                    <form action="/signup-google" method="post" id="form" class="needs-validation" novalidate>
                        <input hidden name="email" value="<%=user.getEmail()%>"/>
                        <div class="card-header text-white text-center bg-danger text-uppercase font-weight-bold ">
                            <h4 class="mt-2"> xin chao <%=user.getName()%>
                            </h4>
                        </div>

                        <div class="card-body">

                            <div class="md-form mb-5">
                                <i class="fa-solid fa-phone prefix text-danger"></i>
                                <input type="text" id="phone" name="phone"
                                       class="form-control validate" required>
                                <label data-success="right" for="phone">Số điện thoại</label>
                                <%if (error1 != null) {%>
                                <div class="invalid-feedback">
                                    <%=error1%>
                                </div>
                                <%}%>
                            </div>
                            <div class="md-form mb-5">
                                <i class="fa-solid fa-address-card prefix text-danger"></i>
                                <input type="text" id="address" name="address"
                                       class="form-control validate" required>
                                <label data-success="right" for="address">Địa chỉ</label>

                            </div>


                        </div>
                        <div class="card-footer">
                            <div class=" d-flex justify-content-between align-items-center">
											<span>Bạn đã có tài khoản? <a href="/login"
                                                                          target="_parent"
                                                                          class="text-danger">Đăng nhập</a></span>
                                <button type="submit" class="btn btn-danger waves-effect" id="btn-register">
                                    tiep tuc
                                </button>
                                <c:if test="${requestScope.messActive!=null}">
                                    <script>
                                        alert("${requestScope.messActive}")
                                    </script>
                                </c:if>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>


    </section>

</div>

</main>

<content tag="local_script">
    <script>
        // (function () {
        //     'use strict';
        //     window.addEventListener('load', function () {
        //         // Fetch all the forms we want to apply custom Bootstrap validation styles to
        //         var forms = document.getElementsByClassName('needs-validation');
        //         // Loop over them and prevent submission
        //         var ids = jQuery.unique($('[partner]').map(function () {
        //             return $(this).attr('partner');
        //         }).get());
        //         var validation = Array.prototype.filter.call(forms, function (form) {
        //             form.addEventListener('submit', function (event) {
        //                 var i;
        //                 var c = false;
        //
        //                 // Handle the initial form
        //                 for (i = 0; i < ids.length; ++i) {
        //                     var p = $('[partner=' + ids[i] + ']');
        //                     if ((p[0].value !== '' && p[1].value === '') ||
        //                         (p[0].value === '' && p[1].value !== '') ||
        //                         (p[0].value === '' && p[1].value === '') ||
        //                         (p[0].value !== p[1].value)) {
        //                         p[1].classList.remove('match');
        //                         p[1].classList.add('no-match');
        //                         c = false;
        //                     } else {
        //                         p[1].classList.remove('no-match');
        //                         p[1].classList.add('match');
        //                         c = true;
        //                     }
        //                 }
        //
        //                 // Handle changes in the form
        //                 $('[partner]').on('keyup', function () {
        //                     for (i = 0; i < ids.length; ++i) {
        //                         var p = $('[partner=' + ids[i] + ']');
        //                         c = false;
        //                         if ((p[0].value !== '' && p[1].value === '') ||
        //                             (p[0].value === '' && p[1].value !== '') ||
        //                             (p[0].value === '' && p[1].value === '') ||
        //                             (p[0].value !== p[1].value)) {
        //                             c = false;
        //                             p[1].classList.remove('match');
        //                             p[1].classList.add('no-match');
        //                         } else {
        //                             c = true;
        //                             p[1].classList.remove('no-match');
        //                             p[1].classList.add('match');
        //                         }
        //                     }
        //                 });
        //                 if (form.checkValidity() === false || c === false) {
        //                     event.preventDefault();
        //                     event.stopPropagation();
        //                 }
        //
        //                 form.classList.add('was-compared');
        //                 form.classList.add('was-validated');
        //             }, false);
        //         });
        //     }, false);
        // })();
        $(document).ready(function () {
            // $('#btn-register').click(function () {
            //     if ($('#pass').val() !== $('#repass').val()) {
            //         $('#repass').addClass('invalid');
            //         $('#form-register form').attr('onsubmit', 'return false');
            //     } else
            //         $('#form-register form').attr('onsubmit', 'return true');
            // });

        });
    </script>

</content>
</body>

</html>
