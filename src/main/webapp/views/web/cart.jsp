<%@ page import="vn.edu.hcmuaf.fit.model.user.User" %>
<%@ page import="vn.edu.hcmuaf.fit.helper.FormatTime" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.model.phone.PhoneColor" %>
<%@ page import="vn.edu.hcmuaf.fit.model.cart.Carts" %>
<%@ page import="vn.edu.hcmuaf.fit.model.cart.CartItem" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.edu.hcmuaf.fit.constant.Variable" %>
<%@ page import="vn.edu.hcmuaf.fit.model.phone.Color" %>
<%@ page import="vn.edu.hcmuaf.fit.model.phone.Phone" %>
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
        <style>
            .number-input input[type="number"] {
                -webkit-appearance: textfield;
                -moz-appearance: textfield;
                appearance: textfield;
            }

            .number-input input[type=number]::-webkit-inner-spin-button,
            .number-input input[type=number]::-webkit-outer-spin-button {
                -webkit-appearance: none;
            }

            .number-input {
                display: flex;
                justify-content: space-around;
                align-items: center;
            }

            .number-input button {
                -webkit-appearance: none;
                background-color: transparent;
                border: none;
                align-items: center;
                justify-content: center;
                cursor: pointer;
                margin: 0;
                position: relative;
            }

            .number-input button:before,
            .number-input button:after {
                display: inline-block;
                position: absolute;
                content: '';
                height: 2px;
                transform: translate(-50%, -50%);
            }

            .number-input button.plus:after {
                transform: translate(-50%, -50%) rotate(90deg);
            }

            .number-input input[type=number] {
                text-align: center;
            }

            .number-input.number-input {
                border: 1px solid #ced4da;
                width: 10rem;
                border-radius: .25rem;
            }

            .number-input.number-input button {
                width: 2.6rem;
                height: .7rem;
            }

            .number-input.number-input button.minus {
                padding-left: 10px;
            }

            .number-input.number-input button:before,
            .number-input.number-input button:after {
                width: .7rem;
                background-color: #495057;
            }

            .number-input.number-input input[type=number] {
                max-width: 4rem;
                padding: .5rem;
                border: 1px solid #ced4da;
                border-width: 0 1px;
                font-size: 1rem;
                height: 2rem;
                color: #495057;
            }

            @media not all and (min-resolution: .001dpcm) {
                @supports (-webkit-appearance: none) and (stroke-color:transparent) {

                    .number-input.def-number-input.safari_only button:before,
                    .number-input.def-number-input.safari_only button:after {
                        margin-top: -.3rem;
                    }
                }
            }
        </style>
    </content>
</head>

<body>

<button type="button" class="btn btn-danger btn-floating " id="btn-back-to-top" style=" position: fixed;
  bottom: 20px;
  right: 20px;
  display: none;">
    <i class="fas fa-arrow-up"></i>
</button>
<!--Main Navigation-->

<%
    Carts carts = (Carts) session.getAttribute(Variable.Global.CART.toString());
    User user = (User) session.getAttribute(Variable.Global.USER.toString());
%>

<main class="my-5">
    <div class="container">
        <div id="breadcrumb"></div>
        <section class="mb-4">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header text-danger text-uppercase     ">
                            <div class="d-flex justify-content-between   align-items-center  ">
                                <strong>giỏ hàng</strong>
                                <span><%=(user == null) ? "so luong trong cart: " + carts.cartItems() : (user.nearBuy()!=null)?("ngày cuối thêm vào: " + FormatTime.format(user.nearBuy(), false)):""%></span>
                            </div>
                        </div>

                        <div class="card-body">
                            <%
                                List<CartItem> cartItems = new ArrayList<>(carts.getCartItemIntegerMap().keySet());
                                if (carts.cartItems() != 0) {
                            %>

                            <table id="dtMaterialDesignExample" class="table " cellspacing="0"
                                   width="100%">
                                <thead>
                                <tr>
                                    <th scope="col">STT</th>
                                    <th scope="col">Tên sản phẩm</th>
                                    <th scope="col">Hình ảnh</th>
                                    <th scope="col">Màu sắc</th>
                                    <th scope="col">Giá</th>
                                    <th scope="col">Số lượng</th>
                                    <th scope="col">Trạng thái</th>
                                    <th scope="col">Thao tác</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    for (int i = 0; i < cartItems.size(); i++
                                    ) {

                                        if (!cartItems.get(i).getSave()) {
                                %>

                                <tr>

                                    <td scope="row" class="align-middle justify-content-center"><%=i%>
                                    </td>
                                    <td class="align-middle justify-content-center" style="max-width: 15%;">
                                        <%=cartItems.get(i)._phone().getName()  %>
                                    </td>
                                    <td><img style="width: 70px; height: 70px;"
                                             src="<%=cartItems.get(i)._phone().getThumbnail()%>"
                                             alt=""></td>
                                    <td class="align-middle justify-content-center">
                                        <select val="<%=cartItems.get(i).getPhoneId()%>"
                                                val2="<%=cartItems.get(i).getColorId()%>" id="colorIdU" name="colorIdU">
                                            <%
                                                List<Color> colors = carts.colors(cartItems.get(i));
                                                for (Color pc : colors
                                                ) {
                                            %>
                                            <option value="<%=pc.getId()%>" <%=(pc.getId() == cartItems.get(i).getColorId()) ? "selected" : ""%> ><%=pc.getName()%>
                                            </option>
                                            <%
                                                }
                                            %>
                                        </select>
                                    </td>
                                    <td class="align-middle justify-content-center" id="price"
                                        val="<%= cartItems.get(i).getPrice() %>"><%= cartItems.get(i).getPrice() %>
                                        VND
                                    </td>
                                    <td class="align-middle justify-content-center">
                                        <%--                                        <div class="def-number-input number-input safari_only">--%>
                                        <%--                                            <button--%>
                                        <%--                                                    onclick="this.parentNode.querySelector('input[type=number]').stepDown()"--%>
                                        <%--                                                    class="minus btn-sm"></button>--%>
                                        <input val="<%=cartItems.get(i).getPhoneId()%>"
                                               val2="<%=cartItems.get(i).getColorId()%>"
                                               val3="<%=carts.getCartItemIntegerMap().get(cartItems.get(i))%>"
                                               class="quantity form-control-sm" min="0" name="numN"
                                               value="<%=carts.getCartItemIntegerMap().get(cartItems.get(i))%>"
                                               type="number">
                                        <%--                                            <button--%>
                                        <%--                                                    onclick="this.parentNode.querySelector('input[type=number]').stepUp()"--%>
                                        <%--                                                    class="plus btn-sm"></button>--%>
                                        <%--                                        </div>--%>
                                    </td>
                                    <td class="align-middle justify-content-center"><%=cartItems.get(i)._phone()._phoneState().getName()%>
                                    </td>
                                    <td class="justify-content-center align-middle group-selectBTN">
                                        <a id="add-wish" val="<%=cartItems.get(i).getPhoneId()%>"
                                           val2="<%=cartItems.get(i).getColorId()%>"
                                           class="ILB mr-3"
                                           style="display: inline-block; cursor: pointer;">
                                            <i class="fa-regular fa-heart mr-1"></i>
                                            Yêu thích
                                        </a>
                                        <div class="ILB" style="display: inline-block; cursor: pointer;">
                                            <a id="delete-cart" val="<%=cartItems.get(i).getPhoneId()%>"
                                               val2="<%=cartItems.get(i).getColorId()%>"

                                               class="ILB mr-3"
                                               style="display: inline-block; cursor: pointer;">
                                                <i class="fa-regular fa-trash-can mr-1"></i>
                                                Xóa
                                            </a>
                                        </div>
                                        <div class="ILB" style="display: inline-block; cursor: pointer;">
                                            <a href="/phone-detail?num=<%=carts.getCartItemIntegerMap().get(cartItems.get(i))%>&colorId=<%=cartItems.get(i).getColorId()%>&id=<%=cartItems.get(i).getPhoneId()%>&page=1&page2=1"
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

                            } else {

                            %>

                            <div class=" text-center d-flex justify-content-center align-items-center ">
                                <a href="/" class="btn btn-danger btn-lg px-5">shopping</a>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </div>


            </div>

        </section>
        <%
            if
            (
                    carts.cartItems() != 0

            ) {
        %>
        <section class="mb-5">
            <div class="row">
                <div class="col-4 ml-auto">
                    <div class="card ">
                        <div class="card-header red-text  text-center">
                            <h5 class="font-weight-500 my-1 text-uppercase">tổng giỏ hàng</h5>
                        </div>
                        <div class="card-body ">
                            <table class="table table-bordered table-striped mb-0">
                                <tbody>
                                <tr>
                                    <th scope="row">Tổng số lượng</th>
                                    <td><%=carts.cartItems2()%>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">Tạm tính</th>
                                    <td><%=carts
                                            .
                                            total
                                                    (
                                                    )%> <sup>đ</sup></td>
                                </tr>
                                <tr>
                                    <th>Tổng tiền</th>
                                    <td><%= carts
                                            .
                                            total
                                                    (
                                                    ) %>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <hr>
                            <a class="btn btn-danger waves-effect btn-lg btn-block" type="submit"
                               href="/views/web/checkout.jsp">đặt hàng</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%}%>
    </div>
</main>

<content tag="local_script">
    <script src="/lib/mdb4/js/addons/datatables.min.js"></script>
    <script>
        // Material Design example
        $(document).ready(function () {
            $('#dtMaterialDesignExample').DataTable({
                "paging": true,
                "pagingType": "full_numbers"
            });
            $('#colorIdU').on('change', function () {
                data = [{
                    phoneId: parseInt($(this).attr('val')),
                    colorId: parseInt($(this).attr('val2')),
                    quantity: parseInt($('input[name="numN"]').val()),
                    price: parseInt($('#price').attr('val')),
                    isSave: false

                },
                    {
                        phoneId: parseInt($(this).attr('val')),
                        colorId: parseInt($(this).find(":checked").val()),
                        quantity: parseInt($('input[name="numN"]').val()),
                        price: parseInt($('#price').attr('val')),
                        isSave: false

                    },]
                console.log(data)
                update(data, "/api/cart");
            });
            $('input[name=numN]').on('input', function () {
                data = [{
                    phoneId: parseInt($(this).attr('val')),
                    colorId: parseInt($(this).attr('val2')),
                    quantity: parseInt($(this).attr('val3')),
                    price: parseInt($('#price').attr('val')),
                    isSave: false

                },
                    {
                        phoneId: parseInt($(this).attr('val')),
                        colorId: parseInt($(this).attr('val2')),
                        quantity: parseInt($('input[name="numN"]').val()),
                        price: parseInt($('#price').attr('val')),
                        isSave: false

                    },]
                console.log(data)
                update(data, "/api/cart");
            });

            $('a#add-wish').click(function (e) {
                e.preventDefault();
                // Your code here
                data = {
                    phoneId: $(this).attr('val'),
                    colorId: $(this).attr('val2'),
                    quantity: parseInt($('input[name="numN"]').val()),
                    price: parseInt($('#price').attr('val')),
                    isSave: true,

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
                    quantity: parseInt($('input[name="numN"]').val()),
                    price: parseInt($('#price').attr('val')),
                    isSave: false,

                }
                console.log(data)
                dele(data, "/api/cart");
            })


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
        });


    </script>
</content>
</body>

</html>
