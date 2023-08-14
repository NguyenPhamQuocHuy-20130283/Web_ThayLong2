<%@ page import="vn.edu.hcmuaf.fit.model.user.User" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.model.cart.CartItem" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.edu.hcmuaf.fit.constant.Variable" %>
<%@ page import="vn.edu.hcmuaf.fit.model.cart.Carts" %>
<%@ page import="vn.edu.hcmuaf.fit.until.SessionUntil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>


<main>

    <%
        User user = (User) session.getAttribute(Variable.Global.USER.toString());

    %>

    <div class="container mx-auto">
        <div id="breadcrumb"></div>
        <section class="my-5 dark-grey-text">


            <!--Grid row-->
            <div class="row">

                <!--Grid column-->
                <div class="col-lg-8">
                    <div class="card">
                        <div class="card-header red-text  text-center">
                            <h5 class="font-weight-500 my-1 text-uppercase">Thông tin khách hàng</h5>
                        </div>
                        <div class="card-body">
                            <form id="checkout-form" method="post">
                                <div class="mb-2">

                                    <div class="my-2">
                                        <div class="form-check form-check-inline ">
                                            <input type="radio" class="form-check-input"
                                                   id="nam" value="nam"
                                                   name="gender"  <%=(user!=null)?(!user.isGender()?"checked":""):"checked"%>>
                                            <label class="form-check-label"
                                                   for="nam">nam</label>
                                            <!-- Material inline 2 -->
                                        </div>
                                        <div class="form-check form-check-inline ">
                                            <input type="radio" class="form-check-input"
                                                   id="nu" value="nu"
                                                   name="gender"<%=(user!=null)?(user.isGender()?"checked":""):""%>>
                                            <label class="form-check-label"
                                                   for="nu">nữ</label>
                                        </div>
                                    </div>
                                </div>
                                <!--Grid row-->
                                <div class="row my-4">
                                    <div class="col-6 m-0">
                                        <!-- Material input -->
                                        <div class="md-form m-0">
                                            <i class="fas fa-user prefix text-danger"></i>

                                            <input type="text" id="name" class="form-control validate" name="cus-name"
                                                   value="<%=(user!=null)?user.getName():""%>">
                                            <label for="name">Tên khách hàng</label>
                                        </div>
                                    </div>
                                    <div class="col-6 m-0">
                                        <!-- Material input -->
                                        <div class="md-form  m-0">
                                            <i class="fa-solid fa-phone prefix text-danger"></i>
                                            <input type="text" id="phone" class="form-control validate" name="cus-phone"
                                                   value="<%=(user!=null)?user.getPhone():""%>">
                                            <label for="phone">Số điện thoại</label>
                                        </div>
                                    </div>
                                </div>
                                <!--Grid row-->

                                <!--Username-->
                                <div class="md-form">
                                    <i class="fa-solid fa-address-card prefix text-danger"></i>
                                    <input type="text" id="address"
                                           class="form-control validate" name="cus-address" value="<%=(user!=null)?user.getAddress():""%>">
                                    <label for="address">Địa chỉ</label>
                                </div>
                                <div class="md-form">
                                    <i class="fa-solid fa-envelope prefix text-danger"></i>
                                    <input type="text" id="email"
                                           class="form-control validate" name="cus-email" value="<%=(user!=null)?user.getEmail():""%>">
                                    <label for="email">Email</label>
                                </div>


                                <div class="my-2">
                                    <input type="checkbox" class="form-check-input "
                                           id="chekboxRules">

                                    <label class="form-check-label" for="chekboxRules">Tôi đã đồng ý với các điều khoản
                                        và điều kiện</label>
                                </div>
                                <div class="my-2">
                                    <input type="checkbox" class="form-check-input "
                                           id="safeTheInfo">
                                    <label class="form-check-label" for="safeTheInfo">Lưu thông tin đơn hàng</label>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
                <!--Grid column-->

                <!--Grid column-->
                <div class="col-lg-4 mb-4">

                    <div class="input-group input-group-md mb-4 input-group-lg">
                        <input type="text" class="form-control " placeholder="Nhập mã giảm giá" aria-label="code"
                               aria-describedby="button-addon2">
                        <div class="input-group-append">
                            <button
                                    class="btn btn-md btn-outline-default m-0 px-3 py-2 z-depth-0 waves-effect"
                                    type="button" id="button-addon2">Áp dụng
                            </button>
                        </div>
                    </div>

                    <!--Card-->
                    <div class="card ">
                        <div class="card-header red-text r text-center">
                            <h5 class="font-weight-500 my-1 text-uppercase">Tóm tắt đơn hàng</h5>
                        </div>
                        <!--Card content-->
                        <div class="card-body">

                            <%
                                Carts carts = (Carts) SessionUntil.get(request, Variable.Global.CART.toString());
                                List<CartItem> cartItems = new ArrayList<>(carts.getCartItemIntegerMap().keySet());

                                for (CartItem c : cartItems
                                ) {
                                    if(!c.getSave()){

                            %>
                            <dl class="row">
                                <dd class="col-sm-5">
                                    <%=c._phone().getName()%>
                                </dd>
                                <dd class="col-sm-4">
                                    <%=c._phone().getPrice()%>
                                </dd>
                                <dd class="col-sm-3">
                                    <%=carts.getCartItemIntegerMap().get(c)%> cai
                                </dd>
                            </dl>

                            <%}
                            }%>

                            <hr>


                            <dl class="row">
                                <dt class="col-sm-8">
                                    Tổng
                                </dt>
                                <dt class="col-sm-4">
                                    <%=carts.total()%>
                                </dt>
                            </dl>
                               <button class="btn btn-danger waves-effect btn-lg btn-block" id="btn-pay">
                                   Thanh toán
                               </button>




                        </div>

                    </div>
                    <!--/.Card-->


                </div>
                <!--Grid column-->

            </div>
            <!--Grid row-->


        </section>
    </div>

</main>

<content tag="local_script">
    <script>
        $(document).ready(function () {
            // $('.mdb-select').material_select();
            $("#btn-pay").on("click", function (e) {
                e.preventDefault();
                $('#checkout-form').attr('action', '/checkout').submit();
            });
        })
    </script>

</content>
</body>

</html>
