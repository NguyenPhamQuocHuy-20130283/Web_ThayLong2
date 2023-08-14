<%@ page import="vn.edu.hcmuaf.fit.model.phone.*" %>
<%@ page import="java.util.*" %>
<%@ page import="vn.edu.hcmuaf.fit.model.review.Review" %>
<%@ page import="vn.edu.hcmuaf.fit.model.review.PhoneReview" %>
<%@ page import="vn.edu.hcmuaf.fit.helper.FormatTime" %>
<%@ page import="vn.edu.hcmuaf.fit.model.user.User" %>
<%@ page import="vn.edu.hcmuaf.fit.until.SessionUntil" %>
<%@ page import="vn.edu.hcmuaf.fit.constant.Variable" %>
<%@ page import="vn.edu.hcmuaf.fit.model.review.QuestionType" %>
<%@ page import="vn.edu.hcmuaf.fit.model.review.Vote" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>Document</title>
    <content tag="local_style">
        <style>

            .my-custom-scrollbar {
                position: relative;
                height: 200px;
                overflow: auto;
            }

            .table-wrapper-scroll-y {
                display: block;
            }

            .style-product .form-check:has(.form-check-input[type="radio"]:checked) {
                border: 1px solid #d70018 !important;

            }

            .style-product .form-check:has(.form-check-input[type="radio"]:not(:checked)) {
                border: 1px solid #d7d7d7 !important;

            }

            .style-product .form-check-input[type="radio"]:not(:checked) + label::before {

                border-radius: 0;
                background-color: transparent !important;
                border-color: transparent;

            }

            .style-product .form-check-input[type="radio"]:checked + label::after {
                background-color: transparent !important;
                border-color: transparent;
                content: "✓";
                position: absolute;
                top: -8px;
                color: red;
                right: 0;
                left: 85%;
                border-radius: 0;
            }

            .my-custom-scrollbar tbody tr th,
            .my-custom-scrollbar tbody tr td {
                max-width: 150px;
            }


            .my-custom-scrollbar {
                position: relative;
                height: 500px;

                overflow: auto;
            }

            .table-wrapper-scroll-y {
                display: block;
            }

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

            .carousel .carousel-indicators li {
                width: 0;
                height: 0;
            }

            .carousel .carousel-indicators li.active img {
                border: 1px solid red !important;
            }

            #modalSpecifications .modal-body .table tbody > tr:nth-child(even) td > div:last-child {
                border-bottom: unset !important;
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


<body class="">

<%
    List<QuestionType> qs = (List<QuestionType>) request.getAttribute("qs");
    User user = (User) SessionUntil.get(request, Variable.Global.USER.toString());
    Phone phoneP = (Phone) request.getAttribute("phoneP");
    String num = (String) request.getAttribute("num");
    String colorId = (String) request.getAttribute("colorId");
    Phone p = (Phone) request.getAttribute("phone");
    double total = (double) request.getAttribute("total");
    double total2 = (double) request.getAttribute("total2");
    int paginationnum = (int) request.getAttribute("paginationnum");
    int paginationnum2 = (int) request.getAttribute("paginationnum2");
    int capId = (int) request.getAttribute("capId");
    List<Review> questions = (List<Review>) request.getAttribute("question");
    List<Review> reviews = (List<Review>) request.getAttribute("review");
    String key = (String) request.getAttribute("key");
%>
<div class="homeContent  mb-5">
    <div class="container">
        <div class="row w-100 mx-auto mb-2">
            <div class="col-12">
                <div id="breadcrumb"></div>
            </div>
        </div>
        <!-- Modal: modalAbandonedCart-->
        <div class="modal fade right" id="modalAbandonedCart" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true" data-backdrop="
             false">
            <div class="modal-dialog modal-side modal-bottom-right modal-notify modal-info" role="document">
                <!--Content-->
                <div class="modal-content">
                    <!--Header-->
                    <div class="modal-header">
                        <p class="heading">đã thêm vào giỏ hàng
                        </p>

                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true" class="white-text">&times;</span>
                        </button>
                    </div>

                    <!--Body-->
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-3">
                                <p></p>
                                <p class="text-center"><i class="fas fa-shopping-cart fa-4x"></i></p>
                            </div>

                            <div class="col-9">
                                <p>Do you need more time to make a purchase decision?</p>
                                <p>No pressure, your product will be waiting for you in the cart.</p>
                            </div>
                        </div>
                    </div>

                    <!--Footer-->
                    <div class="modal-footer justify-content-center">
                        <a type="button" class="btn btn-info">đến</a>
                        <a type="button" class="btn btn-outline-info waves-effect" data-dismiss="modal">thanh toán</a>
                    </div>
                </div>
                <!--/.Content-->
            </div>
        </div>
        <section class="">
            <div class="row w-100 mx-auto">
                <div class="col-12">
                    <div class="row w-100 mx-auto name-product  bg-white ">
                        <h3 class="mb-0 col-12 col-sm-8 pl-0">
                            <a href="#" title=""
                               class="text-dark name-products mb-0"><%=p.getName() + p._cap().getCap() + p._cap().getUnit()%>
                                <span class="note border-left-0"><%=p.getId()%></span>

                            </a>
                        </h3>

                        <div class="media align-items-center col-12 col-sm-4 pl-0">
                            <ul class="nav mr-2">
                                <%
                                    for (int i = 1; i <= p.avg(); i++) {
                                %>
                                <li class="nav-item">
                                    <i class="fa-solid fa-star font-text" aria-hidden="true"></i>
                                </li>
                                <%
                                    }
                                    if (p.avg() % 2 != 0 || p.avg() % 2 != 1) {
                                %>
                                <li class="nav-item">
                                    <i class="fa-solid fa-star-half-stroke font-text"
                                       style="color: #ff7500;"></i>
                                </li>
                                <%}%>

                            </ul>
                            <div class="media-body">
										<span>
											<a href="#review" title=""
                                               class="text-dark font-text"><%=p._reviews().size()%> khách hàng đánh giá|</a>
											<a href="#question" title=""
                                               class="text-dark font-text"><%=p.questionHasReply()%> câu hỏi được trả
												lời
                                            </a>
										</span>
                            </div>
                        </div>

                    </div>
                    <hr/>

                    <div class="products-iphone bg-white  ">
                        <div class="row w-100 mx-auto">
                            <!--end col-xl-4-->
                            <div class="col-xl-4 pl-0">
                                <div id="carouselSlideImg" class="carousel slide pointer-event mb-4"
                                     data-ride="carousel">
                                    <div class="carousel-inner">

                                        <%
                                            List<Image> images = p._images();
                                            for (int i = 0; i < images.size(); i++) {

                                        %>
                                        <div class="carousel-item text-center <%=(i==0)?"active":""%> ">
                                            <img src="<%=images.get(i).getLink()%>" alt="" class="img-fluid"
                                                 style="width: 300px;height:300px;">
                                        </div>
                                        <%}%>
                                    </div>
                                    <a class="carousel-control-prev" href="#carouselSlideImg" role="button"
                                       data-slide="prev">
                                        <i class="fa-solid fa-circle-chevron-left fa-lg text-black-50"></i>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                    <a class="carousel-control-next" href="#carouselSlideImg" role="button"
                                       data-slide="next">
                                        <i class="fa-solid fa-circle-chevron-right fa-lg text-black-50"></i>
                                        <span class="sr-only">Next</span>
                                    </a>
                                    <ol class="carousel-indicators m-0   " style="bottom: -100px !important;">

                                        <%for (int i = 0; i < images.size(); i++) {%>
                                        <li data-target="#carouselSlideImg" data-slide-to="<%=i%>"
                                            class="w-100 h-100 text-center <%=(i==0)?"active":""%> "
                                            style="background-color: transparent;">
                                            <div class="d-sm-block ">
                                                <br>
                                                <img class="object-fit border border-dark rounded"
                                                     style="width: 55px;height: auto;"
                                                     src="<%=images.get(i).getLink()%>">
                                            </div>
                                        </li>
                                        <%}%>
                                    </ol>
                                </div>
                                <div style="height: 70px;"></div>
                                <div class="card border-0 ">
                                    <div class="card-header">
                                        <i class="fa fa-clock-o text-danger" aria-hidden="true"></i>
                                        <span class="size">SẢN PHẨM NHẬN GIAO HÀNG TRONG 1 GIỜ</span>
                                    </div>
                                    <div class="mt-2" style="border: 1px dashed #d7d7d7;">
                                        <h5 class="card-title text-white bg-danger nav-link size"
                                            style="border: 1px dashed #d7d7d7;">trong hộp</h5>
                                        <ul class="list-unstyled">
                                            <li class="media nav-link active">
                                                <i class="fa fa-podcast mr-2 text-danger"
                                                   aria-hidden="true"></i>
                                                <div class="media-body">
                                                    <h5 class="mt-0 mb-1 text-dark font-text">Hàng chính hãng
                                                    </h5>

                                                </div>
                                            </li>
                                            <li class="media nav-link active ">
                                                <i class="fa fa-shopping-bag mr-2 text-danger"
                                                   aria-hidden="true"></i>
                                                <div class="media-body">
                                                    <h5 class="mt-0 mb-1 text-dark font-text">Bảo hành 12 Tháng
                                                        chính hãng
                                                    </h5>

                                                </div>
                                            </li>
                                            <li class="media nav-link active">
                                                <i class="fa fa-shopping-basket mr-2 text-danger"
                                                   aria-hidden="true"></i>
                                                <div class="media-body">
                                                    <h5 class="mt-0 mb-1 text-dark font-text">Giao hàng miễn phí
                                                        toàn quốc
                                                        trong 60 phút</h5>

                                                </div>
                                            </li>
                                            <li class="media nav-link active">
                                                <i class="fa fa-shopping-basket mr-2 text-danger"
                                                   aria-hidden="true"></i>
                                                <div class="media-body">
                                                    <h5 class="mt-0 mb-1 text-dark font-text">Bảo hành nhanh tại
                                                        FPT Shop
                                                        trên toàn quốc</h5>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>

                                </div>

                            </div>
                            <div class="col-xl-4 pl-0 bg-white ">
                                <%
                                    List<PhonePromot> pps = p._promots();

                                    for (PhonePromot pp : pps
                                    ) {
                                        if ("TG0".equalsIgnoreCase(pp._promot().getKey())) {
                                %>
                                <div class="mb-2">
                                    <span href="" class="badge badge-danger"><%=pp._promot().getName()%></span>
                                </div>
                                <%
                                        }
                                    }
                                %>
                                <div class="d-flex align-items-center mb-2">
                                    <strong val="213213" id="price"
                                            class="prices text-danger">34324324 <sup>đ</sup></strong>
                                    <strong class="pl-2" style="text-decoration: line-through;">34.500.000đ</strong>
                                </div>

                                <form action="/phone-detail">
                                    <input hidden name="id" value="<%=phoneP.getId()%>">
                                    <input hidden name="page" value="<%=paginationnum%>">
                                    <input hidden name="page2" value="<%=paginationnum2%>">
                                    <div class="style-product mb-3 w-100 mx-auto row  ">
                                        <%
                                            List<PhoneCap> pcs = phoneP._caps();
                                            for (int i = 0; i < pcs.size(); i++) {
                                        %>
                                        <div class="p-1  col-4 ">
                                            <div class="form-check p-0   rounded">
                                                <input type="radio" class="form-check-input"
                                                       id="cap-<%=pcs.get(i).getCapId()%>"
                                                       value="<%=pcs.get(i).getPhone_capId()%>"
                                                       name="capId" <%=(phoneP.getId()!=p.getId())?(pcs.get(i).getCapId()==p._cap().getId()?"checked":""):((i==0)?"checked":"")%>
                                                       onclick="this.form.submit()">
                                                <label class="form-check-label  px-3 "
                                                       for="cap-<%=pcs.get(i).getCapId()%>"
                                                       style="width: 96.5%; height: 100%; ">
                                                    <div class="text-center">
                                                        <div class=" text-center">
                                                            <strong class="font-weight-bold  "
                                                                    style="font-size: 12px;"><%=pcs.get(i)._cap().getCap()%>
                                                            </strong>
                                                        </div>
                                                        <span class="font-weight-light"
                                                              style="font-size: 12px;">432432đ</span>
                                                    </div>
                                                </label>
                                            </div>
                                        </div>
                                        <%}%>
                                    </div>
                                </form>
                                <strong class="font-weight-bold">Chọn màu để xem giá và chi nhánh có hàng</strong>
                                <div class="style-product mb-3 w-100 mx-auto row  ">
                                    <%
                                        List<PhoneColor> colors = p._colors();
                                        for (int i = 0; i < colors.size(); i++) {
                                    %>
                                    <div class="p-1  col-4 ">
                                        <div class="form-check p-0 rounded">
                                            <input type="radio" class="form-check-input"
                                                   id="color-<%=colors.get(i).getColorId()%>"
                                                   value="<%=colors.get(i).getColorId()%>"
                                                   name="colorId" <%=((colorId!=null)?((Integer.parseInt(colorId)==colors.get(i).getColorId())?"checked":""):(i==0?"checked":""))%>  >
                                            <label class="form-check-label  px-1 " style=" height: 100%; "
                                                   for="color-<%=colors.get(i).getColorId()%>">
                                                <div class="d-flex justify-content-center align-items-center  ">
                                                    <img src="<%=colors.get(i).getImg()%>"
                                                         alt="" class="img-fluid">
                                                    <div class="">
                                                        <div class="d-block text-start">
                                                            <strong class="font-weight-bold  "
                                                                    style="font-size: 12px;"><%=colors.get(i)._color().getName()%>
                                                            </strong>
                                                        </div>
                                                        <span class="font-weight-light"
                                                              style="font-size: 12px;">43324đ</span>
                                                    </div>
                                                </div>

                                            </label>
                                        </div>
                                    </div>
                                    <%}%>
                                </div>
                                <div class="mb-4  ">
                                    <strong class=" font-weight-bold  ">Số lượng đặt hàng </strong>
                                    <div class="def-number-input number-input safari_only">
                                        <button onclick="this.parentNode.querySelector('input[type=number]').stepDown()"
                                                class="minus"></button>
                                        <input class="quantity" min="0" name="num" value="<%=(num!=null)?num:1%>"
                                               type="number">
                                        <button onclick="this.parentNode.querySelector('input[type=number]').stepUp()"
                                                class="plus"></button>
                                    </div>
                                </div>

                                <div class="card mb-4 border  " style="box-shadow: unset;">
                                    <div class="card-header bg-danger text-start text-white text-uppercase ">
                                        Thông tin sản phẩm
                                    </div>
                                    <div class="card-body">
                                        <%=p.getDesc()%>
                                    </div>
                                </div>
                                <ul class="nav text-center mt-2 ">
                                    <li class="nav-item w-100 bg-danger mb-2 hvr-round-corners">
                                        <a class="nav-link text-white " href="#">
                                            <h6>MUA NGAY</h6>
                                            <span class="font-text">Giao hàng trong 1 giờ hoặc nhận tại
														shop</span>
                                        </a>
                                    </li>

                                    <li class="nav-item bg-primary   card-shop hvr-round-corners d-inline-block mr-auto"
                                        style="width: 49%">
                                        <a class="nav-link text-white p-2 " href="#" id="add-wish"
                                        >
                                            <h6>yeu thich</h6>
                                            <span class="font-text">Visa , Master card, JCB</span>
                                        </a>
                                    </li>
                                    <li class="nav-item bg-primary ml-auto  d-inline-block card-shop hvr-round-corners"
                                        style="width: 49%">
                                        <a class="nav-link text-white p-2  " id="add-cart"
                                        >
                                            <h6>THÊM VÀO GIỎ HÀNG</h6>
                                            <span class="font-text">thanh toán sau</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>

                            <!--end col-xl-5-->
                            <div class="col-xl-4 pl-0 bg-white ">
                                <div class="card border-0 my-4">
                                    <div class="card-header">
                                        <i class="fa fa-clock-o text-danger" aria-hidden="true"></i>
                                        <span class="size">SẢN PHẨM NHẬN GIAO HÀNG TRONG 1 GIỜ</span>
                                    </div>
                                    <div class="mt-2" style="border: 1px dashed #d7d7d7;">
                                        <h5 class="card-title text-white bg-success nav-link size"
                                            style="border: 1px dashed #d7d7d7;">Khuyến mại đặc biệt </h5>
                                        <ul class="nav flex-column">

                                            <%
                                                for (PhonePromot pp : p._promots()
                                                ) {

                                            %>

                                            <li class="nav-item">
                                                <a class="nav-link active text-dark" href="#">
                                                    <i class="fa fa-circle text-success" aria-hidden="true"></i>
                                                    <span class="font-text"><%=pp._promot().getName()%></span>
                                                </a>


                                            </li>
                                            <%}%>

                                        </ul>
                                    </div>

                                </div>
                                <div class="card border-0">
                                    <div class="card-header">
                                        <i class="fa fa-clock-o text-danger" aria-hidden="true"></i>
                                        <span class="size">SẢN PHẨM NHẬN GIAO HÀNG TRONG 1 GIỜ</span>
                                    </div>
                                    <div class="mt-2" style="border: 1px dashed #d7d7d7;">
                                        <h5 class="card-title text-white bg-success nav-link size"
                                            style="border: 1px dashed #d7d7d7;">Khuyến mại thêm</h5>
                                        <ul class="nav flex-column">
                                            <li class="nav-item">
                                                <a class="nav-link active text-dark" href="#">
                                                    <i class="fa fa-circle text-success" aria-hidden="true"></i>
                                                    <span class="font-text">Trả góp 0%</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link active text-dark" href="#">
                                                    <i class="fa fa-circle text-success" aria-hidden="true"></i>
                                                    <span class="font-text">Giảm ngay 1,500,000đ (Quà tặng
																Galaxy)</span>
                                                </a>
                                            </li>
                                            <li class="nav-item ">
                                                <a class="nav-link active text-dark" href="#">
                                                    <i class="fa fa-circle text-success" aria-hidden="true"></i>
                                                    <span class="font-text">Giảm 50% Sim Viettel khi mua kèm
																máy</span>
                                                </a>
                                            </li>
                                            <li class="nav-item mb-2">
                                                <a class="nav-link active text-dark" href="#">
                                                    <i class="fa fa-circle text-success" aria-hidden="true"></i>
                                                    <span class="font-text">Bảo hành 3 năm</span>
                                                </a>
                                            </li>

                                        </ul>
                                    </div>

                                </div>


                            </div>
                            <!--end col-xl-3-->
                        </div>
                        <!--end row-->
                    </div>
                </div>
            </div>
        </section>
        <!--products-->

        <!--end introduce--products-->
        <section class="details-product ">
            <nav id="navbar-example3" class="navbar navbar-light bg-light bg-dark">

                <div class="menu-run float-right">
                    <div class="media">
                        <i class="fa fa-phone align-self-center mr-3 text-white" aria-hidden="true"></i>
                        <div class="media-body">
                            <p class="mb-0 text-white">Tư vấn miễn phí</p>
                            <h5 class="text-warning mb-0">18001696</h5>
                        </div>
                        <a href="#" title="" class="text-white align-self-center ml-3 nav-link bg-danger">Mua
                            ngay</a>
                    </div>
                </div>

            </nav>
            <hr/>
            <div data-spy="scroll" data-target="#navbar-example3" data-offset="0">
                <div class="row w-100 mx-auto">
                    <div class="col-xl-8 pl-0">
                        <div class="card mb-4">
                            <div class="card-header red-text r text-center">
                                <h5 class="font-weight-500 my-1">Đánh giá chi
                                    tiết <%=p.getName() + p._cap().getCap() + p._cap().getUnit()%>
                                </h5>
                            </div>
                            <div class="card-body">
                                <div class="bg-white">
                                    <h4 id="fat" class="bg-white"></h4>
                                    <div class="bg-white">

                                        <div class="evaluate-product">

                                            <h3 class="text-center"></h3>
                                            <div class="">
                                                <h3 class="size-text p-0" style="padding: 25px;"><a href="#"
                                                                                                    title=""
                                                                                                    class="text-info size-text">iPhone
                                                    Xs Max
                                                    64GB</a>
                                                    là chiếc iPhone có màn hình lớn nhất từ trước đến nay, mang
                                                    đến
                                                    những trải nghiệm tuyệt vời về màn hình và thời lượng pin.
                                                </h3>
                                            </div>
                                            <div class="info-show mb-4">
                                                <div class="information-seeMore">
                                                    <a href="#" title=""><img src="/images/b0.jpg"
                                                                              class="img-fluid"></a>
                                                    <div class="title-details">
                                                        <b>Màn hình lớn 6,5 inch chuẩn Super Retina siêu sắc
                                                            nét</b>
                                                    </div>
                                                    <div class="content-details">
                                                        <b>iPhone Xs Max 64GB</b>
                                                        <span>có màn hình vượt trội so với mọi thế hệ iPhone
																	trước
																	đây khi lớn tới 6,5 inch, được làm từ tấm nền OLED,
																	hỗ
																	trợ hiển thị HDR. HDR mang đến màu sắc chính xác,
																	màu
																	đen có chiều sâu, độ sáng và độ tương phản tuyệt
																	vời.
																	Bạn sẽ được tận hưởng một màn hình cực lớn, độ phân
																	giải
																	siêu cao 2688 x 1242 pixels cho trải nghiệm xem đáng
																	kinh ngạc.</span>
                                                        <a href="#" title=""><img src="/images/b1.jpg"
                                                                                  class="img-fluid"></a>

                                                        <div class="content-next">
																	<span>Nếu như bạn lo lắng màn hình lớn sẽ khiến cho
																	</span>
                                                            <b>iPhone Xs Max 64GB</b>
                                                            <span>khó cầm nắm trên tay thì hãy quên ngay nỗi lo
																		đó,
																		vì viền màn hình tràn 4 cạnh giúp cho iPhone Xs
																		Max
																		thậm chí còn nhỏ gọn hơn iPhone 8 Plus. Chúng ta
																		có
																		một chiếc máy màn hình lớn hơn rất nhiều, nhưng
																		vẫn
																		đủ gọn gàng để dễ dàng cầm nắm và thao
																		tác.</span>
                                                        </div>

                                                    </div>
                                                    <div class="title-details">
                                                        <b>Màn hình lớn 6,5 inch chuẩn Super Retina siêu sắc
                                                            nét</b>
                                                    </div>
                                                    <div class="content-details">
                                                        <b>iPhone Xs Max 64GB</b>
                                                        <span>có màn hình vượt trội so với mọi thế hệ iPhone
																	trước
																	đây khi lớn tới 6,5 inch, được làm từ tấm nền OLED,
																	hỗ
																	trợ hiển thị HDR. HDR mang đến màu sắc chính xác,
																	màu
																	đen có chiều sâu, độ sáng và độ tương phản tuyệt
																	vời.
																	Bạn sẽ được tận hưởng một màn hình cực lớn, độ phân
																	giải
																	siêu cao 2688 x 1242 pixels cho trải nghiệm xem đáng
																	kinh ngạc.</span>
                                                        <a href="#" title=""><img src="/images/b2.jpg"
                                                                                  class="img-fluid"></a>

                                                        <div class="content-next">
																	<span>Nếu như bạn lo lắng màn hình lớn sẽ khiến cho
																	</span>
                                                            <b>iPhone Xs Max 64GB</b>
                                                            <span>khó cầm nắm trên tay thì hãy quên ngay nỗi lo
																		đó,
																		vì viền màn hình tràn 4 cạnh giúp cho iPhone Xs
																		Max
																		thậm chí còn nhỏ gọn hơn iPhone 8 Plus. Chúng ta
																		có
																		một chiếc máy màn hình lớn hơn rất nhiều, nhưng
																		vẫn
																		đủ gọn gàng để dễ dàng cầm nắm và thao
																		tác.</span>
                                                        </div>

                                                    </div>
                                                    <div class="title-details">
                                                        <b>Màn hình lớn 6,5 inch chuẩn Super Retina siêu sắc
                                                            nét</b>
                                                    </div>
                                                    <div class="content-details">
                                                        <b>iPhone Xs Max 64GB</b>
                                                        <span>có màn hình vượt trội so với mọi thế hệ iPhone
																	trước
																	đây khi lớn tới 6,5 inch, được làm từ tấm nền OLED,
																	hỗ
																	trợ hiển thị HDR. HDR mang đến màu sắc chính xác,
																	màu
																	đen có chiều sâu, độ sáng và độ tương phản tuyệt
																	vời.
																	Bạn sẽ được tận hưởng một màn hình cực lớn, độ phân
																	giải
																	siêu cao 2688 x 1242 pixels cho trải nghiệm xem đáng
																	kinh ngạc.</span>
                                                        <a href="#" title=""><img src="/images/b3.jpg"
                                                                                  class="img-fluid"></a>

                                                        <div class="content-next">
																	<span>Nếu như bạn lo lắng màn hình lớn sẽ khiến cho
																	</span>
                                                            <b>iPhone Xs Max 64GB</b>
                                                            <span>khó cầm nắm trên tay thì hãy quên ngay nỗi lo
																		đó,
																		vì viền màn hình tràn 4 cạnh giúp cho iPhone Xs
																		Max
																		thậm chí còn nhỏ gọn hơn iPhone 8 Plus. Chúng ta
																		có
																		một chiếc máy màn hình lớn hơn rất nhiều, nhưng
																		vẫn
																		đủ gọn gàng để dễ dàng cầm nắm và thao
																		tác.</span>
                                                        </div>

                                                    </div>
                                                    <div class="title-details">
                                                        <b>Màn hình lớn 6,5 inch chuẩn Super Retina siêu sắc
                                                            nét</b>
                                                    </div>
                                                    <div class="content-details">
                                                        <b>iPhone Xs Max 64GB</b>
                                                        <span>có màn hình vượt trội so với mọi thế hệ iPhone
																	trước
																	đây khi lớn tới 6,5 inch, được làm từ tấm nền OLED,
																	hỗ
																	trợ hiển thị HDR. HDR mang đến màu sắc chính xác,
																	màu
																	đen có chiều sâu, độ sáng và độ tương phản tuyệt
																	vời.
																	Bạn sẽ được tận hưởng một màn hình cực lớn, độ phân
																	giải
																	siêu cao 2688 x 1242 pixels cho trải nghiệm xem đáng
																	kinh ngạc.</span>
                                                        <a href="#" title=""><img src="/images/b4.jpg"
                                                                                  class="img-fluid"></a>

                                                        <div class="content-next">
																	<span>Nếu như bạn lo lắng màn hình lớn sẽ khiến cho
																	</span>
                                                            <b>iPhone Xs Max 64GB</b>
                                                            <span>khó cầm nắm trên tay thì hãy quên ngay nỗi lo
																		đó,
																		vì viền màn hình tràn 4 cạnh giúp cho iPhone Xs
																		Max
																		thậm chí còn nhỏ gọn hơn iPhone 8 Plus. Chúng ta
																		có
																		một chiếc máy màn hình lớn hơn rất nhiều, nhưng
																		vẫn
																		đủ gọn gàng để dễ dàng cầm nắm và thao
																		tác.</span>
                                                        </div>

                                                    </div>
                                                    <div class="title-details">
                                                        <b>Màn hình lớn 6,5 inch chuẩn Super Retina siêu sắc
                                                            nét</b>
                                                    </div>
                                                    <div class="content-details">
                                                        <b>iPhone Xs Max 64GB</b>
                                                        <span>có màn hình vượt trội so với mọi thế hệ iPhone
																	trước
																	đây khi lớn tới 6,5 inch, được làm từ tấm nền OLED,
																	hỗ
																	trợ hiển thị HDR. HDR mang đến màu sắc chính xác,
																	màu
																	đen có chiều sâu, độ sáng và độ tương phản tuyệt
																	vời.
																	Bạn sẽ được tận hưởng một màn hình cực lớn, độ phân
																	giải
																	siêu cao 2688 x 1242 pixels cho trải nghiệm xem đáng
																	kinh ngạc.</span>
                                                        <a href="#" title=""><img src="/images/b5.jpg"
                                                                                  class="img-fluid"></a>

                                                        <div class="content-next">
																	<span>Nếu như bạn lo lắng màn hình lớn sẽ khiến cho
																	</span>
                                                            <b>iPhone Xs Max 64GB</b>
                                                            <span>khó cầm nắm trên tay thì hãy quên ngay nỗi lo
																		đó,
																		vì viền màn hình tràn 4 cạnh giúp cho iPhone Xs
																		Max
																		thậm chí còn nhỏ gọn hơn iPhone 8 Plus. Chúng ta
																		có
																		một chiếc máy màn hình lớn hơn rất nhiều, nhưng
																		vẫn
																		đủ gọn gàng để dễ dàng cầm nắm và thao
																		tác.</span>
                                                        </div>

                                                    </div>
                                                    <div class="title-details">
                                                        <b>Màn hình lớn 6,5 inch chuẩn Super Retina siêu sắc
                                                            nét</b>
                                                    </div>
                                                    <div class="content-details">
                                                        <b>iPhone Xs Max 64GB</b>
                                                        <span>có màn hình vượt trội so với mọi thế hệ iPhone
																	trước
																	đây khi lớn tới 6,5 inch, được làm từ tấm nền OLED,
																	hỗ
																	trợ hiển thị HDR. HDR mang đến màu sắc chính xác,
																	màu
																	đen có chiều sâu, độ sáng và độ tương phản tuyệt
																	vời.
																	Bạn sẽ được tận hưởng một màn hình cực lớn, độ phân
																	giải
																	siêu cao 2688 x 1242 pixels cho trải nghiệm xem đáng
																	kinh ngạc.</span>
                                                        <a href="#" title=""><img src="/images/b6.jpg"
                                                                                  class="img-fluid"></a>

                                                        <div class="content-next">
																	<span>Nếu như bạn lo lắng màn hình lớn sẽ khiến cho
																	</span>
                                                            <b>iPhone Xs Max 64GB</b>
                                                            <span>khó cầm nắm trên tay thì hãy quên ngay nỗi lo
																		đó,
																		vì viền màn hình tràn 4 cạnh giúp cho iPhone Xs
																		Max
																		thậm chí còn nhỏ gọn hơn iPhone 8 Plus. Chúng ta
																		có
																		một chiếc máy màn hình lớn hơn rất nhiều, nhưng
																		vẫn
																		đủ gọn gàng để dễ dàng cầm nắm và thao
																		tác.</span>
                                                        </div>

                                                    </div>
                                                    <div class="title-details">
                                                        <b>Màn hình lớn 6,5 inch chuẩn Super Retina siêu sắc
                                                            nét</b>
                                                    </div>
                                                    <div class="content-details">
                                                        <b>iPhone Xs Max 64GB</b>
                                                        <span>có màn hình vượt trội so với mọi thế hệ iPhone
																	trước
																	đây khi lớn tới 6,5 inch, được làm từ tấm nền OLED,
																	hỗ
																	trợ hiển thị HDR. HDR mang đến màu sắc chính xác,
																	màu
																	đen có chiều sâu, độ sáng và độ tương phản tuyệt
																	vời.
																	Bạn sẽ được tận hưởng một màn hình cực lớn, độ phân
																	giải
																	siêu cao 2688 x 1242 pixels cho trải nghiệm xem đáng
																	kinh ngạc.</span>
                                                        <a href="#" title=""><img src="/images/b7.jpg"
                                                                                  class="img-fluid"></a>

                                                        <div class="content-next">
																	<span>Nếu như bạn lo lắng màn hình lớn sẽ khiến cho
																	</span>
                                                            <b>iPhone Xs Max 64GB</b>
                                                            <span>khó cầm nắm trên tay thì hãy quên ngay nỗi lo
																		đó,
																		vì viền màn hình tràn 4 cạnh giúp cho iPhone Xs
																		Max
																		thậm chí còn nhỏ gọn hơn iPhone 8 Plus. Chúng ta
																		có
																		một chiếc máy màn hình lớn hơn rất nhiều, nhưng
																		vẫn
																		đủ gọn gàng để dễ dàng cầm nắm và thao
																		tác.</span>
                                                        </div>

                                                    </div>
                                                    <div class="title-details">
                                                        <b>Màn hình lớn 6,5 inch chuẩn Super Retina siêu sắc
                                                            nét</b>
                                                    </div>
                                                    <div class="content-details">
                                                        <b>iPhone Xs Max 64GB</b>
                                                        <span>có màn hình vượt trội so với mọi thế hệ iPhone
																	trước
																	đây khi lớn tới 6,5 inch, được làm từ tấm nền OLED,
																	hỗ
																	trợ hiển thị HDR. HDR mang đến màu sắc chính xác,
																	màu
																	đen có chiều sâu, độ sáng và độ tương phản tuyệt
																	vời.
																	Bạn sẽ được tận hưởng một màn hình cực lớn, độ phân
																	giải
																	siêu cao 2688 x 1242 pixels cho trải nghiệm xem đáng
																	kinh ngạc.</span>
                                                        <a href="#" title=""><img src="/images/b8.jpg"
                                                                                  class="img-fluid"></a>

                                                        <div class="content-next">
																	<span>Nếu như bạn lo lắng màn hình lớn sẽ khiến cho
																	</span>
                                                            <b>iPhone Xs Max 64GB</b>
                                                            <span>khó cầm nắm trên tay thì hãy quên ngay nỗi lo
																		đó,
																		vì viền màn hình tràn 4 cạnh giúp cho iPhone Xs
																		Max
																		thậm chí còn nhỏ gọn hơn iPhone 8 Plus. Chúng ta
																		có
																		một chiếc máy màn hình lớn hơn rất nhiều, nhưng
																		vẫn
																		đủ gọn gàng để dễ dàng cầm nắm và thao
																		tác.</span>
                                                        </div>

                                                    </div>
                                                    <div class="title-details">
                                                        <b>Màn hình lớn 6,5 inch chuẩn Super Retina siêu sắc
                                                            nét</b>
                                                    </div>
                                                    <div class="content-details">
                                                        <b>iPhone Xs Max 64GB</b>
                                                        <span>có màn hình vượt trội so với mọi thế hệ iPhone
																	trước
																	đây khi lớn tới 6,5 inch, được làm từ tấm nền OLED,
																	hỗ
																	trợ hiển thị HDR. HDR mang đến màu sắc chính xác,
																	màu
																	đen có chiều sâu, độ sáng và độ tương phản tuyệt
																	vời.
																	Bạn sẽ được tận hưởng một màn hình cực lớn, độ phân
																	giải
																	siêu cao 2688 x 1242 pixels cho trải nghiệm xem đáng
																	kinh ngạc.</span>
                                                        <a href="#" title=""><img src="/images/b9.jpg"
                                                                                  class="img-fluid"></a>

                                                        <div class="content-next">
																	<span>Nếu như bạn lo lắng màn hình lớn sẽ khiến cho
																	</span>
                                                            <b>iPhone Xs Max 64GB</b>
                                                            <span>khó cầm nắm trên tay thì hãy quên ngay nỗi lo
																		đó,
																		vì viền màn hình tràn 4 cạnh giúp cho iPhone Xs
																		Max
																		thậm chí còn nhỏ gọn hơn iPhone 8 Plus. Chúng ta
																		có
																		một chiếc máy màn hình lớn hơn rất nhiều, nhưng
																		vẫn
																		đủ gọn gàng để dễ dàng cầm nắm và thao
																		tác.</span>
                                                        </div>

                                                    </div>
                                                    <div class="title-details">
                                                        <b>Màn hình lớn 6,5 inch chuẩn Super Retina siêu sắc
                                                            nét</b>
                                                    </div>
                                                    <div class="content-details">
                                                        <b>iPhone Xs Max 64GB</b>
                                                        <span>có màn hình vượt trội so với mọi thế hệ iPhone
																	trước
																	đây khi lớn tới 6,5 inch, được làm từ tấm nền OLED,
																	hỗ
																	trợ hiển thị HDR. HDR mang đến màu sắc chính xác,
																	màu
																	đen có chiều sâu, độ sáng và độ tương phản tuyệt
																	vời.
																	Bạn sẽ được tận hưởng một màn hình cực lớn, độ phân
																	giải
																	siêu cao 2688 x 1242 pixels cho trải nghiệm xem đáng
																	kinh ngạc.</span>
                                                        <a href="#" title=""><img src="/images/b10.jpg"
                                                                                  class="img-fluid"></a>

                                                        <div class="content-next">
																	<span>Nếu như bạn lo lắng màn hình lớn sẽ khiến cho
																	</span>
                                                            <b>iPhone Xs Max 64GB</b>
                                                            <span>khó cầm nắm trên tay thì hãy quên ngay nỗi lo
																		đó,
																		vì viền màn hình tràn 4 cạnh giúp cho iPhone Xs
																		Max
																		thậm chí còn nhỏ gọn hơn iPhone 8 Plus. Chúng ta
																		có
																		một chiếc máy màn hình lớn hơn rất nhiều, nhưng
																		vẫn
																		đủ gọn gàng để dễ dàng cầm nắm và thao
																		tác.</span>
                                                        </div>

                                                    </div>
                                                    <div class="title-details">
                                                        <b>Màn hình lớn 6,5 inch chuẩn Super Retina siêu sắc
                                                            nét</b>
                                                    </div>
                                                    <div class="content-details">
                                                        <b>iPhone Xs Max 64GB</b>
                                                        <span>có màn hình vượt trội so với mọi thế hệ iPhone
																	trước
																	đây khi lớn tới 6,5 inch, được làm từ tấm nền OLED,
																	hỗ
																	trợ hiển thị HDR. HDR mang đến màu sắc chính xác,
																	màu
																	đen có chiều sâu, độ sáng và độ tương phản tuyệt
																	vời.
																	Bạn sẽ được tận hưởng một màn hình cực lớn, độ phân
																	giải
																	siêu cao 2688 x 1242 pixels cho trải nghiệm xem đáng
																	kinh ngạc.</span>
                                                        <a href="#" title=""><img src="/images/b11.jpg"
                                                                                  class="img-fluid"></a>

                                                        <div class="content-next">
																	<span>Nếu như bạn lo lắng màn hình lớn sẽ khiến cho
																	</span>
                                                            <b>iPhone Xs Max 64GB</b>
                                                            <span>khó cầm nắm trên tay thì hãy quên ngay nỗi lo
																		đó,
																		vì viền màn hình tràn 4 cạnh giúp cho iPhone Xs
																		Max
																		thậm chí còn nhỏ gọn hơn iPhone 8 Plus. Chúng ta
																		có
																		một chiếc máy màn hình lớn hơn rất nhiều, nhưng
																		vẫn
																		đủ gọn gàng để dễ dàng cầm nắm và thao
																		tác.</span>
                                                        </div>

                                                    </div>
                                                    <div class="title-details">
                                                        <b>Màn hình lớn 6,5 inch chuẩn Super Retina siêu sắc
                                                            nét</b>
                                                    </div>
                                                    <div class="content-details">
                                                        <b>iPhone Xs Max 64GB</b>
                                                        <span>có màn hình vượt trội so với mọi thế hệ iPhone
																	trước
																	đây khi lớn tới 6,5 inch, được làm từ tấm nền OLED,
																	hỗ
																	trợ hiển thị HDR. HDR mang đến màu sắc chính xác,
																	màu
																	đen có chiều sâu, độ sáng và độ tương phản tuyệt
																	vời.
																	Bạn sẽ được tận hưởng một màn hình cực lớn, độ phân
																	giải
																	siêu cao 2688 x 1242 pixels cho trải nghiệm xem đáng
																	kinh ngạc.</span>
                                                        <a href="#" title=""><img src="/images/b12.jpg"
                                                                                  class="img-fluid"></a>

                                                    </div>
                                                </div>
                                                <div class="text-center mt-4 btn-hide knot">
                                                    <button type="button" class="bg-white size">Rút gọn <i
                                                            class="fa fa-caret-down"
                                                            aria-hidden="true"></i></button>
                                                </div>
                                            </div>
                                            <div class="info-hide mb-4">
                                                <div class="background-seeMore"></div>
                                                <div class="btn-show text-center mt-4 knot">
                                                    <button type="button" class="bg-white size">Xem thêm <i
                                                            class="fa fa-caret-up"
                                                            aria-hidden="true"></i></button>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="card mb-4" id="review">
                            <div class="card-header text-danger text-center">
                                <h5 class="font-weight-500 my-1">Đánh giá & Nhận
                                    xét <%=p.getName() + p._cap().getCap() + p._cap().getUnit()%>
                                </h5>
                            </div>
                            <div class="card-body">
                                <div class="bg-white">

                                    <div class="evaluate-people bg-white">
                                        <div class="row w-100 mx-auto">
                                            <div class="col-xl-3">
                                                <div class="card text-center border-0 rounded-0">
                                                    <div class="card-body mt-4">
                                                        <p class="card-text mb-0 size-text"><%=p.avg()%>
                                                        </p>
                                                        <ul class="nav justify-content-center">

                                                            <%

                                                                for (int i = 1; i <= p.avg(); i++) {

                                                            %>

                                                            <li class="nav-item">
                                                                <i class="fa-solid fa-star" aria-hidden="true"></i>
                                                            </li>
                                                            <%
                                                                }
                                                                if (p.avg() % 2 != 0 || p.avg() % 2 != 1) {
                                                            %>
                                                            <li class="nav-item">
                                                                <i class="fa-solid fa-star-half-stroke"
                                                                   style="color: #ff7500;"></i>
                                                            </li>
                                                            <%}%>

                                                        </ul>
                                                        <p class="card-text"><small
                                                                class="text-muted"><%=p.count()%>
                                                            đánh
                                                            giá
                                                            và nhận xét</small></p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-5">
                                                <div class="card border-0 rounded-0">
                                                    <div class="card-body">
                                                        <ul class="nav flex-column">

                                                            <%
                                                                for (int i = 5; i >= 1; i--) {
                                                            %>
                                                            <li class="nav-item mt-4 position-relative">
                                                                <span class="stars font-text"><%=i%> sao</span>
                                                                <div class="progress">
                                                                    <div class="progress-bar <%=(i==1)?"bg-danger":""%><%=(i==2)?"bg-warning":""%> <%=(i==3)?"bg-info":""%> <%=(i==4)?"bg-primary":""%> <%=(i==5)?"bg-success":""%> "
                                                                         style="width: <%=(int)(p.avg(i)*100)%>%"
                                                                         aria-valuenow="<%= (int)(p.avg(i)*100)%>"
                                                                         aria-valuemin="0" aria-valuemax="100">
                                                                    </div>
                                                                </div>
                                                                <span class="number-evaluate font-text"><%=p.count(i)%></span>
                                                            </li>

                                                            <%}%>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-4">
                                                <div class="card text-center border-0 rounded-0 mt-4">
                                                    <div class="card-body">
                                                        <p>Bạn đã dùng sản phẩm này?</p>
                                                        <a href="" class="badge badge-danger p-2"
                                                           data-toggle="modal"
                                                           data-target="#modalStarRating">Gửi
                                                            đánh giá của
                                                            bạn</a>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%
                                            String star = (String) request.getAttribute("star");
                                        %>
                                        <form action="/phone-detail">
                                            <input hidden name="id" value="<%=phoneP.getId()%>">
                                            <input hidden name="capId" value="<%=capId%>">
                                            <input hidden name="page2" value="<%=paginationnum2%>">
                                            <input hidden name="page" value="<%=1%>">
                                            <input hidden name="key" value="<%=(key!=null)?key:""%>">
                                            <div class=" my-3 border  p-2">
                                                <span>lọc xem theo: </span>
                                                <!-- Material inline 1 -->
                                                <div class="form-check form-check-inline">
                                                    <input type="checkbox" class="form-check-input" name="bought"
                                                           id="buy" onclick="this.form.submit()" value="true">
                                                    <label class="form-check-label" for="buy">
                                                        da mua hang</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input name="star" type="radio" class="form-check-input" value="0"
                                                           onclick="this.form.submit()"
                                                           id="star-all" <%=(star==null||Integer.parseInt(star)==0)?"checked":""%>  >
                                                    <label class="form-check-label" for="star-all">all
                                                        sao</label>
                                                </div>
                                                <%
                                                    for (int i = 1; i <= 5; i++) {
                                                %>
                                                <div class="form-check form-check-inline">
                                                    <input name="star" type="radio" class="form-check-input"
                                                           value="<%=i%>" onclick="this.form.submit()"
                                                           id="star-<%=i%>" <%=(star!=null)?((Integer.parseInt(star)==i)?"checked":""):""%>  >
                                                    <label class="form-check-label" for="star-<%=i%>"><%=i %>
                                                        sao</label>
                                                </div>
                                                <%}%>


                                            </div>
                                        </form>


                                        <div class="cmt ">

                                            <%

                                                for (Review r : reviews
                                                ) {

                                            %>

                                            <div class="d-flex  flex-row p-2 ">
                                                <div class="d-flex justify-content-center align-items-center rounded-circle mr-3"
                                                     style="background-color: #cbd1d6; color: #fff; width: 6%; height: 7%; align-items: center; justify-content: center; display: inline-block;">
															<span
                                                                    style="font-weight: 500; font-size: 20px; line-height: 47px; margin: 0 auto;">

                                                                <%=((r.getUserId() != null) ? r._user().avatar() : r.getUserId())%>


                                                            </span>
                                                </div>
                                                <div>
                                                    <h6 class="font-weight-bold"><%=((r.getUserId() != null) ? ((user != null) ? (r.getUserId() == user.getId()) ? "ban" : r._user().getName() : r._user().getName()) : r.getReviewerId())%>
                                                    </h6>
                                                    <p class=" text-warning " style="font-size: 12px;">
                                                        <%
                                                            for (int i = 1; i <= 5; i++) {
                                                                if (i <= r.getStar()) {
                                                        %>
                                                        <i class=" fa-solid fa-star "></i>
                                                        <%} else {%>
                                                        <i class="fa-regular fa-star "></i>
                                                        <%
                                                                }
                                                            }
                                                        %>
                                                    </p>
                                                    <p><%=r.getContent()%>
                                                    </p>
                                                    <style>
                                                        .like::before,
                                                        .rep::before {
                                                            content: '●';
                                                            margin-right: 2px;
                                                            left: 0;
                                                            top: 0;
                                                            color: #333;
                                                            font-size: 10px;
                                                        }
                                                    </style>
                                                    <a class="text-light text-weight-500 "
                                                       href="#"><%=FormatTime.format(r.getCreated_at(), true)%>
                                                    </a>
                                                    <a

                                                            class=" <%=(user!=null&&user.like(r))?"text-primary":""%> like like5 pr-2 pl-2"
                                                            val="<%=r.getId()%>"

                                                    >thích
                                                        <span>(<%=r._like().size()%>)</span>
                                                    </a>


                                                    </a>
                                                    <a class="rep pr-2 pl-2">trả lời</a>
                                                    <%if (user != null && r.getUserId() != null && r.getUserId() == user.getId()) {%>
                                                    <a class="rep pr-2 pl-2" href="">chinh sua
                                                        <%--                                                                 <div class="modal fade show" id="modalUpdate"--%>
                                                        <%--                                                                      tabindex="-1" role="dialog"--%>
                                                        <%--                                                                      aria-labelledby="myModalLabel" aria-modal="true"--%>
                                                        <%--                                                                      style="padding-right: 17px; display: none;">--%>
                                                        <%--                            <div class="modal-dialog" role="document">--%>
                                                        <%--                                <div class="modal-content">--%>
                                                        <%--                                    <form action="/phone-detail" method="post">--%>
                                                        <%--                                        <div class="modal-header text-center pt-1 pb-1">--%>
                                                        <%--                                            <h4 class="modal-title w-100 font-weight-bold text-uppercase">chinh sua--%>
                                                        <%--                                                sản phẩm</h4>--%>
                                                        <%--                                            <button type="button" class="close" data-dismiss="modal"--%>
                                                        <%--                                                    aria-label="Close">--%>
                                                        <%--                                                <span aria-hidden="true">×</span>--%>
                                                        <%--                                            </button>--%>
                                                        <%--                                        </div>--%>
                                                        <%--                                        <input hidden name="action" value="update">--%>
                                                        <%--                                        <input hidden name="phoneId" value="<%=p.getId()%>">--%>
                                                        <%--                        <div class="modal-body mx-3">--%>
                                                        <%--                            <div class="md-form  pink-textarea active-pink-textarea mb-0">--%>
                                                        <%--													<textarea name="content" --%>
                                                        <%--                                                              class="md-textarea form-control validate mb-0 pb-0"--%>
                                                        <%--                                                              style="padding-top: 30px;" rows="3">--%>
                                                        <%--                                                        --%>
                                                        <%--                                                        --%>
                                                        <%--                                                    </textarea>--%>
                                                        <%--                                                <label for="form18">chinh sua</label>--%>
                                                        <%--                                            </div>--%>
                                                        <%--                        </div>--%>
                                                        <%--                                        <div class="modal-footer d-flex justify-content-center pt-1 pb-1">--%>
                                                        <%--                                            <button type="submit" class="btn btn-danger ">Gửi</button>--%>
                                                        <%--                                        </div>--%>
                                                        <%--                                    </form>--%>
                                                        <%--                                </div>--%>
                                                        <%--                            </div>--%>
                                                        <%--                        </div>--%>

                                                    </a>

                                                    <a
                                                            class="rep delete5 pr-2 pl-2" val="<%=r.getId()%>"
                                                    >
                                                        xoa
                                                    </a>

                                                    <%}%>

                                                </div>

                                            </div>

                                            <%}%>

                                        </div>


                                        <div class="d-flex justify-content-center align-items-center mt-4">
                                            <nav>
                                                <form action="/phone-detail">
                                                    <input hidden name="id" value="<%=phoneP.getId()%>">
                                                    <input hidden name="capId" value="<%=capId%>">
                                                    <input hidden name="key" value="<%=(key!=null)?key:""%>">
                                                    <input hidden name="page2" value="<%=paginationnum2%>">
                                                    <input hidden name="star" value="<%=(star!=null)?star:0%>">
                                                    <ul class="pagination pg-red m-0">
                                                        <%if (total != 0 && paginationnum != 1) {%>
                                                        <li class="page-item ">
                                                            <a class="page-link" aria-label="Previous"
                                                               onclick="document.getElementById('pagination<%=paginationnum-1%>').click()">
                                                                <span aria-hidden="true">&laquo;</span>
                                                                <span class="sr-only">Previous</span>
                                                            </a>
                                                        </li>
                                                        <%}%>
                                                        <%
                                                            for (int i = 1; i < total + 1; i++) {
                                                        %>
                                                        <li class="page-item <%=(paginationnum==i)?"active":""%>">
                                                            <a class="page-link"
                                                               onclick="document.getElementById('pagination<%=i%>').click()">
                                                                <%=i%>
                                                                <input type="radio" class="form-check-input"
                                                                       id="pagination<%=i%>"
                                                                       value="<%=i%>" id="pagination<%=i%>" name="page"
                                                                       onclick="this.form.submit()" <%=(paginationnum==i)?"checked":""%> >
                                                            </a></li>

                                                        <%}%>
                                                        <%if (total != 0 && paginationnum != total) {%>
                                                        <li class="page-item">
                                                            <a class="page-link" aria-label="Next"
                                                               onclick="document.getElementById('pagination<%=paginationnum+1%>').click()">
                                                                <span aria-hidden="true">&raquo;</span>
                                                                <span class="sr-only">Next</span>
                                                            </a>
                                                        </li>
                                                        <%}%>
                                                    </ul>
                                                </form>
                                            </nav>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        </form>
                        <%if (p.question() != null && !p.question().isEmpty()) {%>
                        <div class="homecate d-none d-sm-block mb-4">
                            <div class="card">
                                <div class="card-header text-danger    text-center">
                                    <h5 class="font-weight-500 my-1 text-uppercase align-middle">các câu hỏi
                                        thường gặp</h5>
                                </div>
                                <div class="catebody ">
                                    <div class="accordion md-accordion" id="accordionEx" role="tablist"
                                         aria-multiselectable="true">

                                        <%
                                            for (Review re : p.question()
                                            ) {

                                        %>
                                        <!-- Accordion card -->
                                        <div class="card">

                                            <!-- Card header -->
                                            <div class="card-header" role="tab" id="headingOne1">
                                                <a data-toggle="collapse" data-parent="#accordionEx"
                                                   href="#question-<%=re.getId()%>" aria-expanded="true"
                                                   aria-controls="collapseOne1">
                                                    <h6 class="mb-0">
                                                        #<%=re.getContent()%><i
                                                            class="fas fa-angle-down rotate-icon"></i>
                                                    </h6>
                                                </a>
                                            </div>

                                            <!-- Card body -->
                                            <div id="question-<%=re.getId()%>" class="collapse " role="tabpanel"
                                                 aria-labelledby="headingOne1" data-parent="#accordionEx">
                                                <div class="card-body">
                                                    <%=re._reply().get(0)._reply().getContent()%>
                                                </div>
                                            </div>

                                        </div>
                                        <%}%>
                                        <!-- Accordion card -->

                                    </div>
                                </div>
                            </div>

                        </div>
                        <%}%>
                        <div class="card mb-4" id="question">
                            <div class="card-header red-text  text-center">
                                <h5 class="font-weight-500 my-1">Hỏi Đáp
                                    về <%=p.getName() + p._cap().getCap() + p._cap().getUnit()%>
                                </h5>
                            </div>
                            <div class="card-body">
                                <div class="bg-white">
                                    <div class="d-flex justify-content-between  align-items-center mt-4  ">
                                        <input type="text" name=""
                                               placeholder="Viết bình luận của bạn (Vui lòng viết tiếng việt có dấu)"
                                               class="w-75 text-comment">
                                        <input type="text" name="key" id="search-question"
                                               placeholder="search" value="<%=(key!=null)?key:""%>"
                                               class="w-100 text-comment">
                                    </div>

                                    <div class="d-flex justify-content-between  align-items-center mt-4  ">
                                        <span class="bg-light px-2"><%=questions.size()%> hỏi đáp về “<%=p.getName() + p._cap().getCap() + p._cap().getUnit()%>”</span>


                                        <a href="" data-toggle="modal"
                                           data-target="#modalQuestion" class="badge badge-danger p-2">Gửi câu hỏi
                                            của bạn</a>
                                    </div>
                                    <div class="cmt mt-4">

                                        <%

                                            for (Review r : questions
                                            ) {

                                        %>

                                        <div class="d-flex  flex-row p-2 ">
                                            <div class=" d-flex justify-content-center align-items-center  rounded-circle mr-3"
                                                 style="background-color: #cbd1d6; color: #fff; width: 48px; height: 48px; align-items: center; justify-content: center; display: inline-block;">
														<span
                                                                style="font-weight: 500; font-size: 20px; line-height: 47px;"><%=(r.getUserId() != null) ? r._user().avatar() : r.getReviewerId()%></span>
                                            </div>
                                            <div>
                                                <h6 class="font-weight-bold"><%=(r.getUserId() != null) ? r._user().getName() : r.getReviewerId()%>
                                                </h6>
                                                <p><%=r.getContent() %>
                                                </p>
                                                <style>
                                                    .like::before,
                                                    .rep::before {
                                                        content: '●';
                                                        margin-right: 2px;
                                                        left: 0;
                                                        top: 0;
                                                        color: #333;
                                                        font-size: 10px;
                                                    }

                                                </style>
                                                <span class="text-light text-weight-500 "><%=FormatTime.format(r.getCreated_at(), false)%>
                                                      </span>
                                                <a val="<%=r.getId()%>"
                                                   class="like <%=(user!=null&&user.like(r))?"text-primary":""%> like5 pr-2 pl-2"

                                                >thích
                                                    <span>(<%=r._like().size()%>)</span>
                                                </a>

                                                </a>
                                                <a class="rep" href="">trả lời</a>
                                                <%if (user != null && r.getUserId() != null && r.getUserId() == user.getId()) {%>
                                                <a class="rep pr-2 pl-2" href="">chinh sua
                                                </a>
                                                <a val="<%=r.getId()%>" class="rep delete5 pr-2 pl-2"
                                                >
                                                    xoa
                                                </a>
                                                <%}%>

                                            </div>
                                        </div>
                                        <%
                                            List<PhoneReview> reps = r._reply();
                                            for (PhoneReview reply : reps) {


                                        %>
                                        <div class="d-flex  flex-row  ml-5">
                                            <div class="d-flex justify-content-center align-items-center  rounded-circle mr-3"
                                                 style="background-color: #cbd1d6; color: #fff; width:7%; height: 7%; align-items: center; justify-content: center; display: inline-block;">
														<span style="font-weight: 500; font-size: 20px; line-height: 47px; margin-left: 3px;">
                                                            <%=reply._reply()._user().avatar()%>
                                                        </span>
                                            </div>

                                            <div class="  rounded p-3 w-100 border border-danger">
                                                <h6 class="font-weight-bold"><%=reply._reply()._user().getName()%>
                                                </h6>

                                                <p>Chào <b><%=reply._comment()._user().getName()%>
                                                </b>
                                                </p>
                                                <p>
                                                    <%=reply._reply().getContent()%>
                                                    <br/>
                                                    Thân mến!
                                                </p>

                                                <style>
                                                    .like::before,
                                                    .rep::before {
                                                        content: '●';
                                                        margin-right: 2px;
                                                        left: 0;
                                                        top: 0;
                                                        color: #333;
                                                        font-size: 10px;
                                                    }

                                                </style>
                                                <span class="text-danger text-weight-500 "><%=FormatTime.format(reply.getCreated_at(), false)%>
                                                    <button
                                                            class="like pr-2 pl-2"
                                                            onclick="document.getElementById('like3-<%=reply.getReplyId()%>').submit()">thích
                                                    <form action="/phone-detail" method="post"
                                                          id="like3-<%=reply.getReplyId()%>">
                                                    <input hidden name="reviewId" value="<%=reply.getReplyId()%>">
                                                    <input hidden name="action" value="dislike">
                                                    <input hidden name="phoneId" value="<%=p.getId()%>">

                                                            </form>
                                                    <span>(<%=reply._reply()._like().size()%>)</span>
															</button>
                                                    <button
                                                            class="like pr-2 pl-2"
                                                            onclick="document.getElementById('dislike3-<%=reply.getReplyId()%>').submit()">khong thich
                                                        <form action="/phone-detail" method="post"
                                                              id="dislike3-<%=reply.getReplyId()%>">
                                                    <input hidden name="reviewId" value="<%=reply.getReplyId()%>">
                                                    <input hidden name="action" value="dislike">
                                                    <input hidden name="phoneId" value="<%=p.getId()%>">

                                                            </form>
                                                        <span>(<%=reply._reply()._dislike().size()%>)</span>
															</button>
                                                    <button class="rep"
                                                            href="">trả lời</button> <%if (user != null && r.getUserId() != null && r.getUserId() == user.getId()) {%>
                                                               <a class="rep pr-2 pl-2" href="">chinh sua
                                                               </a>

                                                              <button
                                                                      class="rep pr-2 pl-2"
                                                                      onclick="document.getElementById('delete-<%=r.getId()%>').submit()">
 <form action="/phone-detail" method="post" id="delete-<%=r.getId()%>">
                                                    <input hidden name="reviewId" value="<%=reply.getReplyId()%>">
                                                    <input hidden name="action" value="delete">
                                                    <input hidden name="phoneId" value="<%=p.getId()%>">

                        </form>
                                                                   xoa
                        </button>
                                                    <%}%></span>
                                            </div>
                                        </div>
                                        <%
                                                }
                                            }
                                        %>
                                        <div class="d-flex justify-content-center align-items-center mt-4">
                                            <nav>
                                                <form action="/phone-detail">
                                                    <input hidden name="id" value="<%=phoneP.getId()%>">
                                                    <input hidden name="capId" value="<%=capId%>">
                                                    <input hidden name="key" value="<%=(key!=null)?key:""%>">
                                                    <input hidden name="page" value="<%=paginationnum%>">
                                                    <input hidden name="star" value="<%=star%>">
                                                    <ul class="pagination pg-red m-0">
                                                        <%if (total2 != 0 && paginationnum2 != 1) {%>
                                                        <li class="page-item ">
                                                            <a class="page-link" aria-label="Previous"
                                                               onclick="document.getElementById('pagination2<%=paginationnum2-1%>').click()">
                                                                <span aria-hidden="true">&laquo;</span>
                                                                <span class="sr-only">Previous</span>
                                                            </a>
                                                        </li>
                                                        <%}%>
                                                        <%
                                                            for (int i = 1; i < total2 + 1; i++) {
                                                        %>
                                                        <li class="page-item <%=(i==paginationnum2)?"active":""%>">
                                                            <a class="page-link"
                                                               onclick="document.getElementById('pagination2<%=i%>').click()">
                                                                <%=i%>
                                                                <input type="radio" class="form-check-input"
                                                                       value="<%=i%>" id="pagination2<%=i%>"
                                                                       name="page2"
                                                                       onclick="this.form.submit()"  <%=(paginationnum2==i)?"checked":""%>>
                                                            </a>
                                                        </li>
                                                        <%}%>
                                                        <%if (total2 != 0 && paginationnum2 != total2) {%>
                                                        <li class="page-item">
                                                            <a class="page-link" aria-label="Next"
                                                               onclick="document.getElementById('pagination2<%=paginationnum2+1%>').click()">
                                                                <span aria-hidden="true">&raquo;</span>
                                                                <span class="sr-only">Next</span>
                                                            </a>
                                                        </li>
                                                        <%}%>
                                                    </ul>
                                                </form>
                                            </nav>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="col-xl-4 pl-0 ">
                        <div class="mb-4">

                            <div class="card ">
                                <div class="card-header red-text  text-center">
                                    <h5 class="font-weight-500 my-1">Thông số kỹ thuật</h5>
                                </div>
                                <div class="card-body">
                                    <div class="bg-white">
                                        <div class="table-wrapper-scroll-y my-custom-scrollbar">

                                            <table class="table table-bordered table-striped mb-0">

                                                <tbody>
                                                <%
                                                    for (PhoneSpec ps : p._specs()
                                                    ) {

                                                %>
                                                <tr>
                                                    <th scope="row"><%=ps._spec().getName()%>
                                                    </th>
                                                    <td><%=ps.getValue()%>
                                                    </td>
                                                </tr>
                                                <%}%>
                                                </tbody>
                                            </table>

                                        </div>

                                    </div>
                                </div>
                                <div class="card-header red-text  text-center">
                                    <a href="" class="hvr-underline-from-center" data-toggle="modal"
                                       data-target="#modalSpecifications">
                                        Xem cấu hình chi tiết</a>
                                </div>
                            </div>
                        </div>


                        <div class="modal fade show" id="modalSpecifications" tabindex="-1" role="dialog"
                             aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content" style="width: 620px;">
                                    <div class="modal-header bg-danger text-white text-center pt-1 pb-1">
                                        <h4 class="modal-title w-100 font-weight-bold text-uppercase">Thông số
                                            kỹ
                                            thuật</h4>
                                        <button type="button" class="close" data-dismiss="modal"
                                                aria-label="Close">
                                            <span aria-hidden="true" class="text-white">×</span>
                                        </button>
                                    </div>
                                    <div class="modal-body p-0">

                                        <div class="card">

                                            <div class="card-body">
                                                <div class="table-wrapper-scroll-y my-custom-scrollbar">
                                                    <table class="table table-bordered mb-0">

                                                        <tbody>
                                                        <%
                                                            for (SpecType st : p._specTypes()
                                                            ) {
                                                        %>
                                                        <tr>
                                                            <th class="p-2 bg-light"><%=st.getName() %>
                                                            </th>
                                                        </tr>
                                                        <% for (PhoneSpec sp : p._specs()
                                                        ) {
                                                            if (sp._spec()._specType().getId() == st.getId()) {
                                                        %>
                                                        <tr>
                                                            <td class="p-1">
                                                                <div class="row ml-2 mr-2 pt-2 pb-2"
                                                                     style="border-bottom: 1px solid #edeeef;">
                                                                    <div class="col-sm-5 pl-1">
                                                                        <%=sp._spec().getName()%>
                                                                    </div>
                                                                    <div class="col-sm-7"><span
                                                                            style="color: #495057; font-weight:400"> <%=sp.getValue() %></span>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <%}%>
                                                        <%}%>
                                                        <%}%>
                                                        </tbody>
                                                    </table>

                                                </div>
                                            </div>
                                        </div>

                                    </div>


                                </div>
                            </div>
                        </div>

                        <!-- Button trigger modal -->


                        <!-- Modal -->
                        <%

                            Set<Phone> phoneSet = (Set<Phone>) SessionUntil.get(request, Variable.Global.HISTORY_PHONE.toString());
                            if (phoneSet != null) {
                                List<Phone> phones = new ArrayList<>(phoneSet);

                        %>
                        <!--end thông số kĩ thuật-->
                        <div class="mb-4">

                            <div class="bg-white ">
                                <div class="card">

                                    <div class="card-header red-text  text-center">
                                        <h5 class="font-weight-500 my-1">Sản phẩm đã xem gần đây</h5>
                                    </div>
                                    <div class="card-body">
                                        <!-- <h4 class=" titles mb-0 mt-4" id="three"></h4> -->
                                        <ul class="list-unstyled bg-white">
                                            <%
                                                for (Phone ps : phones
                                                ) {

                                            %>
                                            <li class="media mt-2">
                                                <a href="#" title=""><img style="width:80px;"
                                                                          src="<%=ps.getThumbnail()%>" class="mr-3"
                                                                          alt="..."></a>
                                                <div class="media-body">
                                                    <a href="/phone-detail?page=1&page2=1&id=<%=ps.getId()%>" title="">
                                                        <h3 class="nameApple"><%=ps.getName()%>
                                                        </h3>
                                                        <b class="size text-dark"
                                                           style="text-decoration: line-through;">
                                                            ₫</b>
                                                        <b class="text-danger size">232132 ₫</b>
                                                    </a>
                                                </div>
                                            </li>
                                            <%}%>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%}%>

                        <%
                            Set<Brand> phoneBrandSet = (Set<Brand>) SessionUntil.get(request, Variable.Global.HISTORY_BRAND.toString());
                            Set<Model> phoneModelSet = (Set<Model>) SessionUntil.get(request, Variable.Global.HISTORY_MODEL.toString());
                            if (phoneBrandSet != null) {
                                List<Brand> phoneBrands = new ArrayList<>(phoneBrandSet);

                        %>
                        <div class="mb-4">

                            <div class="card ">

                                <div class="card-header red-text  text-center">
                                    <h5 class="font-weight-500 my-1">Các hãng phổ biến</h5>
                                </div>
                                <div class="card-body ">
                                    <div class="mt-4">
                                        <%
                                            for (Brand pe : phoneBrands
                                            ) {

                                        %>
                                        <a href="/phone-filter?page=1&sort=sap+xep+theo+A+-+Z&brandCheck=<%=pe.getId()%>">
                                            <div class="chip bg-danger  text-white">
                                                <%=pe.getName()%>

                                            </div>
                                        </a>
                                        <%}%>
                                        <% if (phoneModelSet != null) {
                                            List<Model> phoneModels = new ArrayList<>(phoneModelSet);
                                            for (Model m : phoneModels
                                            ) {
                                        %>
                                        <a href="/phone-filter?page=1&sort=sap+xep+theo+A+-+Z&modelCheck=<%=m.getId()%>&brandCheck=<%=m._brand().getId()%>">
                                            <div class="chip bg-danger  text-white">
                                                <%=m.getName()%>
                                            </div>
                                        </a>
                                        <%
                                                }
                                            }
                                        %>


                                    </div>

                                </div>
                            </div>
                        </div>
                        <!--end phụ kiện-->
                        <%}%>

                        <div class="modal fade show" id="modalStarRating" tabindex="-1" role="dialog"
                             aria-labelledby="myModalLabel" aria-modal="true"
                             style="padding-right: 17px; display: none;">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <form action="/phone-detail" method="post">

                                        <div class="modal-header text-center pt-1 pb-1">
                                            <h4 class="modal-title w-100 font-weight-bold text-uppercase">Đánh giá
                                                sản phẩm</h4>
                                            <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                <span aria-hidden="true">×</span>
                                            </button>
                                        </div>
                                        <input hidden name="action" value="review">
                                        <input hidden name="phoneId" value="<%=p.getId()%>">
                                        <div class="modal-body mx-3 ">
                                            <div class="text-center">
                                                <img class="form_img-prod"
                                                     src="<%=p.getThumbnail()%>"
                                                     alt="alt">
                                                <div class="mt-2">
                                                    <span class="font-weight-bold"><%=p.getName() + p._cap().getCap() + p._cap().getUnit()%></span>
                                                </div>
                                                <div class="group-star">

                                                    <%
                                                        for (int i = 1; i <= 5; i++) {
                                                    %>

                                                    <div class="form-check form-check-inline">
                                                        <input type="radio" class="form-check-input"
                                                               id="ratting-<%=i%>" value="<%=i%>"
                                                               name="star" <%=(i==5)?"checked":""%> >
                                                        <label class="form-check-label"
                                                               for="ratting-<%=i%>"><%=i%>
                                                        </label>
                                                    </div>
                                                    <%}%>
                                                </div>
                                                <hr>
                                            </div>
                                            <div class="md-form  pink-textarea active-pink-textarea mb-0">
													<textarea id="form18" name="content"
                                                              class="md-textarea form-control validate mb-0 pb-0"
                                                              style="padding-top: 30px;" rows="3"></textarea>
                                                <label for="form18">Cãm nhận của bạn về sản phẩm</label>
                                            </div>
                                            <%


                                                if (user == null) {%>
                                            <div class="pr-0">
                                                <div class="md-form col-12 pl-0 pr-0">
                                                    <input id="name-horizontal" type="text" name="name"
                                                           class="validate form-control m-0" required="">
                                                    <label id="name-label" class="" for="name-horizontal">Nhập họ
                                                        tên</label>
                                                </div>
                                            </div>
                                            <div class=" pr-0">
                                                <div class="md-form col-12 pl-0 pr-0">
                                                    <input id="phone-horizontal" type="text" name="phone"
                                                           class="validate form-control m-0" required="">
                                                    <label id="phone-label" class="" for="phone-horizontal">Nhập số
                                                        điện thoại</label>
                                                </div>
                                            </div>
                                            <div class="md-form mb-2 mt-2">
                                                <input type="email" id="email-horizontal" name="email"
                                                       class="form-control validate m-0">
                                                <label data-error="Vui lòng kiểm tra lại thông tin"
                                                       data-success="right" for="email-horizontal">Nhập email</label>
                                            </div>
                                            <%}%>
                                        </div>
                                        <div class="g-recaptcha"
                                             data-sitekey="6LeQZmskAAAAAIuJZWnku_qrQug47ka2h80Kbunl"></div>
                                        <div class="modal-footer d-flex justify-content-center pt-1 pb-1">
                                            <button type="submit" class="btn btn-danger ">Gửi</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <div class="modal fade show" id="modalQuestion" tabindex="-1" role="dialog"
                             aria-labelledby="myModalLabel" aria-modal="true"
                             style="padding-right: 17px; display: none;">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <form action="/phone-detail" method="post">

                                        <div class="modal-header text-center pt-1 pb-1">
                                            <h4 class="modal-title w-100 font-weight-bold text-uppercase">dat cau hoi
                                                sản phẩm</h4>
                                            <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                <span aria-hidden="true">×</span>
                                            </button>
                                        </div>
                                        <input hidden name="action" value="question">
                                        <input hidden name="phoneId" value="<%=p.getId()%>">
                                        <div class="modal-body mx-3 ">
                                            <div class="text-center">
                                                <img class="form_img-prod"
                                                     src="<%=p.getThumbnail()%>"
                                                     alt="alt">
                                                <div class="mt-2">
                                                    <span class="font-weight-bold"><%=p.getName() + p._cap().getCap() + p._cap().getUnit()%></span>
                                                </div>
                                                <div class="group-star">
                                                    <select class="mdb-select md-form" name="questionType">
                                                        <%
                                                            for (int i = 0; i < qs.size(); i++
                                                            ) {
                                                        %>
                                                        <option value="<%=qs.get(i).getId()%>" <%=(i == 0) ? "selected" : ""%> ><%=qs.get(i).getName()%>
                                                        </option>
                                                        <%}%>
                                                    </select>
                                                </div>
                                                <hr>
                                            </div>
                                            <div class="md-form  pink-textarea active-pink-textarea mb-0">
													<textarea name="content"
                                                              class="md-textarea form-control validate mb-0 pb-0"
                                                              style="padding-top: 30px;" rows="3"></textarea>
                                                <label for="form18">dat cau hoi</label>
                                            </div>
                                            <%


                                                if (user == null) {%>
                                            <div class="pr-0">
                                                <div class="md-form col-12 pl-0 pr-0">
                                                    <input id="name" type="text" name="name"
                                                           class="validate form-control m-0" required="">
                                                    <label class="" for="name">Nhập họ
                                                        tên</label>
                                                </div>
                                            </div>
                                            <div class=" pr-0">
                                                <div class="md-form col-12 pl-0 pr-0">
                                                    <input id="phone" type="text" name="phone"
                                                           class="validate form-control m-0" required="">
                                                    <label class="" for="phone">Nhập số
                                                        điện thoại</label>
                                                </div>
                                            </div>
                                            <div class="md-form mb-2 mt-2">
                                                <input type="email" id="email" name="email"
                                                       class="form-control validate m-0">
                                                <label data-error="Vui lòng kiểm tra lại thông tin"
                                                       data-success="right" for="email">Nhập email</label>
                                            </div>
                                            <%}%>
                                        </div>
                                        <div class="g-recaptcha"
                                             data-sitekey="6LeQZmskAAAAAIuJZWnku_qrQug47ka2h80Kbunl"></div>
                                        <div class="modal-footer d-flex justify-content-center pt-1 pb-1">
                                            <button type="submit" class="btn btn-danger ">Gửi</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <!--end news-->
                    </div>

                    <!--end col-xl-9-->

                    <!--end col-xl-3-->
                </div>
            </div>
        </section>

        <!--end details-product-->
        <section class="introduce-products  mb-4 ">


            <div class="row w-100 mx-auto">
                <div class="col-12 p-0">


                    <div class="card">

                        <div class="card-header ">
                            <ul class="nav nav-tabs" id="myTabProduct" style="border:0;" role="tablist">

                                <li class="nav-item ">
                                    <a class="nav-link active " style="font-size: 15px;"
                                       id="brand-tab"
                                       data-toggle="tab" href="#phone-brand" role="tab"
                                       aria-controls="home"
                                       aria-selected="true">san pham cung hang
                                    </a>
                                </li>
                                <%
                                    if (p.getModelId() != 0 && p.getModelId() != 0) {
                                %>
                                <li class="nav-item ">
                                    <a class="nav-link  " style="font-size: 15px;"
                                       id="model-tab"
                                       data-toggle="tab" href="#phone-model" role="tab"
                                       aria-controls="home"
                                       aria-selected="true">san pham cung dong
                                    </a>
                                </li>
                                <%}%>

                            </ul>
                        </div>

                        <div class="card-body bg-light bg-gradient ">
                            <div class="tab-content p-0" style="padding: 0 !important;" id="pills-tabContent">


                                <div class="tab-pane fade show active"
                                     id="phone-brand" style="" role="tabpanel"
                                     aria-labelledby="pills-home-tab">
                                    <div class="owl-carousel owl-theme ">

                                        <%
                                            for (Phone phone : p._brand()._phones()
                                            ) {

                                        %>


                                        <div class="item">

                                            <div class="card   ">
                                                <div class="card-body rounded-0" style="padding: 0.75rem; ">
                                                    <div class=" d-block overflow-hidden   ">
                                                        <style>
                                                            p {
                                                                margin: 0;

                                                            }

                                                            .quote::before {
                                                                content: '●';
                                                                margin-right: 2px;
                                                                left: 0;
                                                                top: 0;
                                                                color: #333;
                                                                font-size: 10px;
                                                            }

                                                        </style>
                                                        <div class="d-flex flex-column h-100 w-100  ">

                                                            <div class=" align-items-start" style="height: 18px;">
                                                                <% for (PhonePromot promot : phone._promots()
                                                                ) {
                                                                    if ("TG0".equalsIgnoreCase(promot._promot().getKey())) {
                                                                %>
                                                                <span class="badge badge-danger mr-1"><%=promot._promot().getName()%></span>
                                                                <%
                                                                        }
                                                                    }
                                                                %>
                                                            </div>

                                                            <a href="/phone-detail?id=<%=phone.getId()%>"
                                                               class="text-dark">
                                                                <div
                                                                        class="align-items-start cart-content  h-100">
                                                                    <div
                                                                            class="my-2 d-block overflow-hidden item hvr-float ">
                                                                        <img class="object-cover mw-100 "
                                                                             src="<%=phone.getThumbnail()%>"
                                                                             alt="">
                                                                    </div>
                                                                    <h3 class="text-ellipsis product-title overflow-hidden  mb-1 fw-normal  text-break "
                                                                        style="display: -webkit-box;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 2;font-size: 14px;">
                                                                        <%=phone.getName()%>
                                                                    </h3>

                                                                    <div class="mb-1">
                                                                        <%
                                                                            for (PhoneSpec spec : phone._specs()
                                                                            ) {
                                                                                if ("LR".equalsIgnoreCase(spec._spec().getKey()) || "TDR".equalsIgnoreCase(spec._spec().getKey())) {
                                                                        %>
                                                                        <span class="mr-2 badge badge-light mb-1">
																				<%=spec.getValue()%>
																			</span>
                                                                        <%
                                                                                }
                                                                            }
                                                                        %>
                                                                    </div>
                                                                    <div class="mb-1">
                                                                        <i class=" d-inline-block text-decoration-line-through price-old"
                                                                           style="text-decoration: line-through">
                                                                            243242đ</i>
                                                                        <span
                                                                                class="badge badge-default peach-gradient">-25%</span>
                                                                        <b class="d-inline-block price-new "></b>
                                                                    </div>
                                                                    <strong
                                                                            class="fw-bold d-block mb-1 text-danger">123213
                                                                        đ</strong>

                                                                    <div class=" mb-1 d-flex flex-end">
                                                                        <p class=" text-warning "
                                                                           style="font-size: 12px;">
                                                                            <%
                                                                                double avg = phone.avg();
                                                                                for (int i = 1; i <= 5; i++) {
                                                                                    if (i <= avg) {
                                                                            %>
                                                                            <i class=" fa-solid fa-star "></i>
                                                                            <%
                                                                            } else if (Math.ceil(avg) != Math.floor(avg)) {
                                                                                avg = Math.ceil(avg);
                                                                            %>
                                                                            <i class="fa-solid fa-star-half-stroke "></i>
                                                                            <%
                                                                            } else {
                                                                            %>
                                                                            <i class=" fa-regular fa-star"></i>
                                                                            <%
                                                                                    }
                                                                                }
                                                                            %>
                                                                        </p>
                                                                        <p class="ms-1 fw-light d-inline-block align-middle "
                                                                           style="font-size: 12px;"><%=phone.count()%>
                                                                        </p>
                                                                    </div>

                                                                </div>
                                                            </a>
                                                            <div
                                                                    class="mt-2  d-flex justify-content-between align-items-end">
                                                                <a href="" class=" d-block  align-middle"
                                                                   style="font-size:14px ;">
                                                                    <i
                                                                            class="fa-regular fa-square-plus fa-sm"></i>
                                                                    so sánh
                                                                </a>

                                                                <a href="" class="d-block  align-middle"
                                                                   style="font-size:14px ;">
                                                                    <i class="fa-regular fa-heart fa-sm"></i>
                                                                    yêu
                                                                    thích
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%}%>
                                    </div>
                                </div>
                                <%
                                    if (p.getModelId() != 0 && p.getModelId() != 0) {
                                %>
                                <div class="tab-pane fade "
                                     id="phone-model" style="" role="tabpanel"
                                     aria-labelledby="pills-home-tab">
                                    <div class="owl-carousel owl-theme ">

                                        <%
                                            for (Phone phone : p._model()._phones()
                                            ) {

                                        %>


                                        <div class="item">

                                            <div class="card   ">
                                                <div class="card-body rounded-0" style="padding: 0.75rem; ">
                                                    <div class=" d-block overflow-hidden   ">
                                                        <style>
                                                            p {
                                                                margin: 0;

                                                            }

                                                            .quote::before {
                                                                content: '●';
                                                                margin-right: 2px;
                                                                left: 0;
                                                                top: 0;
                                                                color: #333;
                                                                font-size: 10px;
                                                            }

                                                        </style>
                                                        <div class="d-flex flex-column h-100 w-100  ">

                                                            <div class=" align-items-start" style="height: 18px;">
                                                                <% for (PhonePromot promot : phone._promots()
                                                                ) {
                                                                    if ("TG0".equalsIgnoreCase(promot._promot().getKey())) {
                                                                %>
                                                                <span class="badge badge-danger mr-1"><%=promot._promot().getName()%></span>
                                                                <%
                                                                        }
                                                                    }
                                                                %>
                                                            </div>

                                                            <a href="/phone-detail?id=<%=phone.getId()%>"
                                                               class="text-dark">
                                                                <div
                                                                        class="align-items-start cart-content  h-100">
                                                                    <div
                                                                            class="my-2 d-block overflow-hidden item hvr-float ">
                                                                        <img class="object-cover mw-100 "
                                                                             src="<%=phone.getThumbnail()%>"
                                                                             alt="">
                                                                    </div>
                                                                    <h3 class="text-ellipsis product-title overflow-hidden  mb-1 fw-normal  text-break "
                                                                        style="display: -webkit-box;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 2;font-size: 14px;">
                                                                        <%=phone.getName()%>
                                                                    </h3>

                                                                    <div class="mb-1">
                                                                        <%
                                                                            for (PhoneSpec spec : phone._specs()
                                                                            ) {
                                                                                if ("LR".equalsIgnoreCase(spec._spec().getKey()) || "TDR".equalsIgnoreCase(spec._spec().getKey())) {
                                                                        %>
                                                                        <span class="mr-2 badge badge-light mb-1">
																				<%=spec.getValue()%>
																			</span>
                                                                        <%
                                                                                }
                                                                            }
                                                                        %>
                                                                    </div>
                                                                    <strong
                                                                            class="fw-bold d-block mb-1 text-danger">344324
                                                                        đ</strong>

                                                                    <div class=" mb-1 d-flex flex-end">
                                                                        <p class=" text-warning "
                                                                           style="font-size: 12px;">
                                                                            <%
                                                                                for (int i = 1; i <= p.avg(); i++) {
                                                                            %>
                                                                            <i class=" fa-solid fa-star "></i>
                                                                            <%
                                                                                }
                                                                                if (p.avg() % 2 != 0 || p.avg() % 2 != 1) {
                                                                            %>

                                                                            <i class="fa-solid fa-star-half-stroke "></i>
                                                                            <%
                                                                                }
                                                                                if (Math.ceil(p.avg()) < 5) {
                                                                            %>
                                                                            <i class=" fa-regular fa-star "></i>
                                                                            <%}%>
                                                                        </p>
                                                                        <p class="ms-1 fw-light d-inline-block align-middle "
                                                                           style="font-size: 12px;"><%=phone.count()%>
                                                                        </p>
                                                                    </div>

                                                                </div>
                                                            </a>
                                                            <div
                                                                    class="mt-2  d-flex justify-content-between align-items-end">
                                                                <a href="" class=" d-block  align-middle"
                                                                   style="font-size:14px ;">
                                                                    <i
                                                                            class="fa-regular fa-square-plus fa-sm"></i>
                                                                    so sánh
                                                                </a>

                                                                <a href="" class="d-block  align-middle"
                                                                   style="font-size:14px ;">
                                                                    <i class="fa-regular fa-heart fa-sm"></i>
                                                                    yêu
                                                                    thích
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%}%>
                                    </div>
                                </div>
                                <%
                                    }
                                %>

                                <div class="text-center my-2 ">
                                    <button class="btn btn-danger px-5 text-white hvr-grow btn-md">Xem tất
                                        cả
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </section>


    </div>
</div>
<!--homeContent-->
<content tag="local_script">
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <script>
        // Material Select Initialization
        $(document).ready(function () {
            $('.mdb-select').materialSelect();


            $('#search-question').on('input', function (e) {
                event.preventDefault();

                // Lấy từ khóa tìm kiếm từ form
                var query = $(this).val();

                $.getJSON("search", {query: query}, function (data) {
                    // Xử lý kết quả trả về
                    var results = $("#searchResults");
                    results.empty();
                    if (data.length > 0) {
                        $.each(data, function (index, item) {
                            results.append("<div>" + item + "</div>");
                        });
                    } else {
                        results.append("<div>No results found.</div>");
                    }
                });
            })

            $('a.like5').click(function (e) {
                e.preventDefault();
                // Your code here
                <%if(user==null){%>

                $('#modalLoginForm').modal();
                <%}else{%>
                data = {

                    userId: <%= user.getId()%>,
                    commentId: $(this).attr('val'),

                }

                $.ajax({
                    type: 'POST', url: "/api/vote",
                    dataType: 'json',
                    contentType: 'application/json',
                    data: JSON.stringify(data)
                }).done(function (responseText) {
                    alert('thanh cong')
                    console.log(responseText)
                    $(this).textContent =responseText;

                }).fail(function (jqXHR, status, error) {
                    if (jqXHR.status !== 500) {
                        warningAlert('Lỗi liệu lỗi');
                    } else warningAlert("Xảy ra lỗi. <br/>Vui lòng liên hệ Admin.");
                })

                <%}%>
            })


            $('a#add-cart').click(function (e) {
                e.preventDefault();
                // Your code here
                data = {

                    phoneId:<%=p.getId()%>,
                    colorId: parseInt($('input[name="colorId"]:checked').val()),
                    quantity: parseInt($('input[name=num]').val()),
                    price: parseInt($('#price').attr('val')),
                    isSave: false,

                }
                console.log(data)
                add(data, "/api/cart");
            })
            $('a#add-wish').click(function (e) {
                e.preventDefault();
                // Your code here
                data = {
                    phoneId:<%=p.getId()%>,
                    colorId: parseInt($('input[name="colorId"]:checked').val()),
                    quantity: parseInt($('input[name=num]').val()),
                    price: parseInt($('#price').attr('val')),
                    isSave: true,

                }
                console.log(data)
                add(data, "/api/cart");
            })
            $("a.delete5").click(function (e) {
                // Your code here

                data = {
                    id: $(this).attr('val')
                }
                dele(data, "/api/review");
            })

        });


    </script>

</content>

<!--homeContent-->

</body>

</html>
