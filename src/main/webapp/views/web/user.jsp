<%@ page import="vn.edu.hcmuaf.fit.model.user.User" %>
<%@ page import="vn.edu.hcmuaf.fit.model.order.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.model.order.OrderDetail" %>
<%@ page import="vn.edu.hcmuaf.fit.helper.FormatTime" %>
<%@ page import="vn.edu.hcmuaf.fit.model.cart.Carts" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.edu.hcmuaf.fit.model.cart.CartItem" %>
<%@ page import="vn.edu.hcmuaf.fit.constant.Variable" %>
<%@ page import="vn.edu.hcmuaf.fit.until.SessionUntil" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.impl.UserDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <content tag="local_style">
        <link rel="stylesheet" href="/lib/mdb4/css/addons/datatables.min.css">
    </content>

</head>

<body>

<main>
    <%
        User user = (User) session.getAttribute(Variable.Global.USER.toString());
        Carts carts = (Carts) session.getAttribute(Variable.Global.CART.toString());
    %>
    <div class="modal fade" id="modalChangePass" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
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


    <div class="container">
        <div id="breadcrumb"></div>
        <section class="my-5">

            <div class="d-flex justify-content-between align-items-center">
                <ul class="nav nav-tabs" id="myTabProductList" role="tablist">
                    <%
                        if (user != null) {
                    %>
                    <li class="nav-item mr-2">
                        <a class="nav-link text-dark bg-light active" style="font-size: 15px;" id="" data-toggle="tab"
                           href="#panel21"
                           role="tab" aria-controls="panel21-tab" aria-selected="false">Thông tin người
                            dùng</a>
                    </li>
                    <li class="nav-item mr-2">

                        <a class="nav-link text-dark bg-light "
                           style="font-size: 15px;" id="history" data-toggle="tab"
                           href="#panel22"
                           role="tab" aria-controls="panel22-tab" aria-selected="false">Lịch sử mua hàng</a>
                    </li>

                    <%}%>

                    <li class="nav-item mr-2">
                        <a class="nav-link text-dark bg-light <%=(user==null)?"active":""%> "
                           style="font-size: 15px;" id="wishlist" data-toggle="tab"
                           href="#panel23"
                           role="tab" aria-controls="panel23-tab" aria-selected="false">Danh sách yêu thích</a>
                    </li>
                </ul>
                <%
                    if (user != null) {%>
                <div class="">
                    <a href="/logout" class="float-right"> | Thoát</a>
                    <a href="#" data-toggle="modal" data-target="#modalChangePass" class="float-right">Đổi mật khẩu
                        |</a>
                </div>
                <%}%>
            </div>


            <div class="tab-content p-0" id="pills-tabContent">
                <%
                    if (user != null) {
                %>
                <div class="tab-pane fade show active" id="panel21" aria-labelledby="panel21-tab">
                    <div class="card">
                        <div class="card-header   ">
                            <h5 class="my-2 h5  text-danger d-inline-block"><%=user.getName() + " - " + user.getPhone()%>
                            </h5>
                        </div>
                        <form action="/user-profile" method="post">
                            <div class="card-body">
                                <div class="my-4 row w-100 mx-auto">
                                    <div class="col-12">
                                        <div class="form-check form-check-inline">
                                            <input type="radio" class="form-check-input" id="nam"
                                                   name="gender" value="1"
                                                   data-value-type="number" <%=(user.isGender())?"checked":""%>>
                                            <label class="form-check-label" for="nam">Nam </label>
                                        </div>

                                        <!-- Material inline 2 -->
                                        <div class="form-check form-check-inline">
                                            <input type="radio" class="form-check-input" id="nu"
                                                   data-value-type="number"
                                                   name="gender" value="1" <%=(!user.isGender())?"checked":""%>>
                                            <label class="form-check-label" for="nu">Nữ</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row my-4 w-100 mx-auto">
                                    <div class="col-6">
                                        <!-- Material input -->
                                        <div class="md-form m-0">
                                            <i class="fas fa-user prefix text-danger"></i>
                                            <input type="text" name="name" id="name" class="form-control"
                                                   value="<%=(user.getName()!=null)?user.getName():""%>">
                                            <label for="name">Tên đầy đủ</label>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <!-- Material input -->
                                        <div class="md-form m-0">
                                            <i class="fa-solid fa-phone prefix text-danger"></i>
                                            <input type="text" id="phone" class="form-control"
                                                   value="<%=(user.getPhone()!=null)?user.getPhone():""%>" name="phone">
                                            <label for="phone">Số điện thoại</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row my-4 w-100 mx-auto">
                                    <div class="col-6">
                                        <div class="md-form">
                                            <i class="fa-solid fa-envelope prefix text-danger"></i>
                                            <input type="email" name="email" id="email" class="form-control"
                                                   value="<%=(user.getEmail()!=null)?user.getEmail():""%>">
                                            <label for="email">Email</label>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="md-form">
                                            <i class="fa-solid fa-address-card prefix text-danger"></i>
                                            <input type="text" id="address" class="form-control"
                                                   value="<%=(user.getAddress()!=null)?user.getAddress():""%>"
                                                   name="address">
                                            <label for="address">Địa chỉ</label>
                                        </div>
                                    </div>

                                </div>

                                <div class="text-center mt-4">
                                    <input type="submit" class="btn btn-danger ">
                                </div>
                            </div>
                        </form>
                    </div>

                </div>
                <div class="tab-pane fade  " id="panel22" role="panel22"
                     aria-labelledby="panel22-tab">

                    <div class="card">
                        <div class="card-header">

                            <h5 class="my-2 text-danger  h5 d-inline-block">
                                <%=(user.nearBuy() != null) ? "Ngày mua cuối cùng: " + FormatTime.format(user.nearBuy(), false) : "ban chua mua sp nao" %>
                            </h5>
                        </div>

                        <div class="card-body">
                            <%
                                if (user != null) {
                            %>
                            <table id="dtMaterialDesignExample" class="table " cellspacing="0" width="100%">
                                <thead>
                                <tr>
                                    <th scope="col">Mã đơn hàng</th>
                                    <th scope="col"> Sản phẩm</th>
                                    <th scope="col">Giá</th>
                                    <th scope="col">Ngày đặt mua</th>
                                    <th scope="col"> Trạng thái</th>
                                </tr>
                                </thead>
                                <tbody>

                                <%

                                    List<Order> orders = user._orders();
                                    for (Order o : orders
                                    ) {
                                        for (OrderDetail od : o._orderDetails()
                                        ) {


                                %>
                                <tr>
                                    <th scope="row" class="align-middle text-primary"><%=o.getId()%>
                                    </th>
                                    <td style="width: 45%;">
                                        <a href="" style="width: 50px;" class="float-left">
                                            <img class="object-fit d-block w-100"
                                                 src="<%=od._phone().getThumbnail()%>"
                                                 alt="">
                                        </a>
                                        <div style="margin-left: 60px;">
                                            <a href=""
                                               class="text-truncate w-50 text-truncate text-wrap text-break text-ellipsis overflow-hidden"><%=od._phone().getName()%>
                                            </a>
                                            <div class="d-block mb-1 ">
                                                <a href="${pageContext.request.contextPath}/phone-detail?id=<%=od._phone().getId()%>&page=1&page1=1"
                                                   class="mt-1 pr-2 d-inline-block text-primary">Xem chi
                                                    tiết</a>
                                            </div>

                                        </div>
                                    </td>
                                    <td class="text-danger"><%=od._phone().getPrice()%>₫</td>
                                    <td><%=FormatTime.format(od.getCreated_at(), false)%>
                                    </td>
                                    <td class="text-danger">
                                        <%=o._orderState().getName()%>
                                    </td>
                                </tr>
                                <%
                                        }
                                    }
                                %>
                                </tbody>
                            </table>
                            <%} else {%>

                            <div class=" text-center d-flex justify-content-center align-items-center ">
                                <a href="" class="btn btn-danger btn-lg px-5"> dang nhap</a>
                            </div>

                            <%}%>
                        </div>

                    </div>

                </div>
                <%}%>

                <div class="tab-pane fade  <%=(user==null)?"show active":""%>" id="panel23" role="panel23"
                     aria-labelledby="panel23-tab">
                    <div>

                    </div>
                    <div class="card">

                        <%
                            //                            if (user != null) {
//                                carts = new Carts(carts.merge(user.listToCarts()));
//                            }
                            List<CartItem> keys = new ArrayList<>(carts.getCartItemIntegerMap().keySet());

                        %>

                        <div class="card-header d-flex justify-content-between align-items-center ">
                            <%if (user != null && user.nearWish() != null) {%>
                            <h5 class="my-2 h5 text-danger d-inline-block">Ngày yêu thích cuối
                                cùng:<%=FormatTime.format(user.nearWish(), false)%>
                            </h5>
                            <%}%>
                            <h5 class="my-2 h5 text-danger d-inline-block">so luong yeu thich: <%=carts.wishItems()%>
                            </h5>
                        </div>
                        <div class="card-body">
                            <%if (carts.wishItems() != 0) {%>

                            <table id="dtMaterialDesignExample2" class="table " cellspacing="0" width="100%">
                                <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Tên</th>
                                    <th scope="col">Hình ảnh</th>
                                    <th scope="col">Màu sắc</th>
                                    <th scope="col">Giá</th>
                                    <th scope="col">so luong</th>
                                    <th scope="col">Trạng thái</th>
                                    <th scope="col">Thao tác</th>

                                </tr>
                                </thead>
                                <tbody>
                                <%

                                    for (int i = 0; i < keys.size(); i++
                                    ) {
                                        if (keys.get(i).getSave()) {

                                %>

                                <tr>
                                    <td scope="row"><%=i%>
                                    </td>
                                    <td class="align-middle justify-content-center"><%=keys.get(i)._phone().getName()%>
                                    </td>
                                    <td><img style="width: 70px; height: 70px;"
                                             src="<%=keys.get(i)._phone().getThumbnail()%>"
                                             alt=""></td>
                                    <td class="align-middle justify-content-center"><%=keys.get(i)._color().getName()%>
                                    </td>
                                    <td class="justify-content-center align-middle"><%=keys.get(i)._phone().getPrice()%>
                                        VND
                                    </td>
                                    <td class="justify-content-center align-middle"><%=carts.getCartItemIntegerMap().get(keys.get(i))%>

                                    </td>
                                    <td class="justify-content-center align-middle"><%=keys.get(i)._phone()._phoneState().getName()%>
                                    </td>
                                    <td class="justify-content-center align-middle group-selectBTN">
                                        <div class="ILB mr-3" style="display: inline-block; cursor: pointer;">
                                            <a id="add-cart" val="<%=keys.get(i).getPhoneId()%>"
                                               val2="<%=keys.get(i).getColorId()%>"
                                               val3="<%=keys.get(i).getQuantity()%>"
                                               val4="<%=keys.get(i).getPrice()%>"
                                               class="ILB mr-3"
                                               style="display: inline-block; cursor: pointer;">

                                                <i class="fa-solid fa-cart-plus mr-1"></i>
                                                Thêm
                                            </a>
                                        </div>
                                        <div class="ILB" style="display: inline-block; cursor: pointer;">
                                            <a id="delete-wish" val="<%=keys.get(i).getPhoneId()%>"
                                               val2="<%=keys.get(i).getColorId()%>"
                                               val3="<%=keys.get(i).getQuantity()%>"
                                               val4="<%=keys.get(i).getPrice()%>"
                                               class="ILB mr-3"
                                               style="display: inline-block; cursor: pointer;">

                                                <i class="fa-regular fa-trash-can mr-1"></i>
                                                Xóa
                                            </a>
                                        </div>
                                        <div class="ILB" style="display: inline-block; cursor: pointer;">
                                            <a href="/phone-detail?id=<%=keys.get(i).getPhoneId()%>&page=1&page2=1&colorId=<%=keys.get(i).getColorId()%>&num=<%=carts.getCartItemIntegerMap().get(keys.get(i))%>"
                                               class="ILB mr-3"
                                               style="display: inline-block; cursor: pointer;">
                                                <i class="fa-solid fa-up-right-from-square mr-1"></i>
                                                toi
                                            </a>
                                        </div>
                                    </td>

                                </tr>
                                <%
                                        }
                                    }
                                %>

                                </tbody>

                            </table>

                            <%
                            } else {%>
                            <div class=" text-center d-flex justify-content-center align-items-center ">
                                <a href="/phone-filter?sort=sap+xep+theo+A+-+Z&page=1"
                                   class="btn btn-danger btn-lg px-5 ">mua sam</a>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>


            <!-- Tab panels -->

            <!-- Panel 3 -->


        </section>

    </div>

</main>

<content tag="local_script">
    <script src="/lib/mdb4/js/addons/datatables.min.js"></script>
    <script>
        // Material Design example
        $(document).ready(function () {

            let url = location.href.replace(/\/$/, "");
            if (location.hash) {
                const hash = url.split("#");
                $('#myTabProductList a[href="#' + hash[1] + '"]').tab("show");
                url = location.href.replace(/\/#/, "#");
                history.replaceState(null, null, url);
                setTimeout(() => {
                    $(window).scrollTop(0);
                }, 400);
            }

            $('a[data-toggle="tab"]').on("click", function () {
                let newUrl;
                const hash = $(this).attr("href");
                newUrl = url.split("#")[0] + hash;
                history.replaceState(null, null, newUrl);
            });

            $('a#add-cart').click(function (e) {
                e.preventDefault();
                // Your code here
                data = {
                    phoneId: $(this).attr('val'),
                    colorId: $(this).attr('val2'),
                    quantity: $(this).attr('val3'),
                    price: $(this).attr('val4'),
                    isSave: false,

                }
                console.log(data)
                add(data, "/api/cart");
            })
            $('a#delete-wish').click(function (e) {
                e.preventDefault();
                // Your code here
                data = {
                    phoneId: $(this).attr('val'),
                    colorId: $(this).attr('val2'),
                    quantity: $(this).attr('val3'),
                    price: $(this).attr('val4'),
                    isSave: true,
                }
                console.log(data)
                dele(data, "/api/cart");
            })

            $('#dtMaterialDesignExample').DataTable();
            $('#dtMaterialDesignExample2').DataTable();
            $('#dtMaterialDesignExample_wrapper').find('label').each(function () {
                $(this).parent().append($(this).children());
            });
            $('#dtMaterialDesignExample_wrapper .dataTables_filter').find('input').each(function () {
                const $this = $(this);
                $this.attr("placeholder", "Search");
                $this.removeClass('form-control-sm');
            });
            $('#dtMaterialDesignExample_wrapper .dataTables_length').addClass('d-flex flex-row');
            $('#dtMaterialDesignExample_wrapper .dataTables_filter').addClass('md-form');
            $('#dtMaterialDesignExample_wrapper select').removeClass(
                'custom-select custom-select-sm form-control form-control-sm');
            $('#dtMaterialDesignExample_wrapper select').addClass('mdb-select');
            $('#dtMaterialDesignExample_wrapper .mdb-select').materialSelect();
            $('#dtMaterialDesignExample_wrapper .dataTables_filter').find('label').remove();
            $('#dtMaterialDesignExample_paginate .pagination').addClass('pg-red');


            $('#dtMaterialDesignExample2_wrapper').find('label').each(function () {
                $(this).parent().append($(this).children());
            });
            $('#dtMaterialDesignExample2_wrapper .dataTables_filter').find('input').each(function () {
                const $this = $(this);
                $this.attr("placeholder", "Search");
                $this.removeClass('form-control-sm');
            });
            $('#dtMaterialDesignExample2_wrapper .dataTables_length').addClass('d-flex flex-row');
            $('#dtMaterialDesignExample2_wrapper .dataTables_filter').addClass('md-form');
            $('#dtMaterialDesignExample2_wrapper select').removeClass(
                'custom-select custom-select-sm form-control form-control-sm');
            $('#dtMaterialDesignExample2_wrapper select').addClass('mdb-select');
            $('#dtMaterialDesignExample2_wrapper .mdb-select').materialSelect();
            $('#dtMaterialDesignExample2_wrapper .dataTables_filter').find('label').remove();
            $('#dtMaterialDesignExample2_paginate .pagination').addClass('pg-red');
        });

    </script>
</content>


</body>

</html>
