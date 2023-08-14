<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.model.phone.Phone" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.*" %>
<%@ page import="vn.edu.hcmuaf.fit.model.phone.*" %>
<%@ page import="java.util.stream.Stream" %>
<%@ page import="java.util.function.Predicate" %>
<%@ page import="vn.edu.hcmuaf.fit.until.SessionUntil" %>
<%@ page import="vn.edu.hcmuaf.fit.constant.Variable" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>Document</title>

    <content tag="local_style">
        <style>
            @media (min-width: 576px) {
                .col-sm-2 {
                    -ms-flex: 0 0 16.666667%;
                    flex: 1 0 15.666667%;
                    max-width: 16.666667%;
                }

                .list-popular .owl-item {
                    width: 258px !important
                }

                .col-sm-3 {
                    -ms-flex: 0 0 25%;
                    flex: 0 0 25%;
                    max-width: 25%;
                }
            }

            @media (max-width: 576px) {
                .col-6 {
                    -ms-flex: 0 0 50%;
                    flex: 0 0 50%;
                    max-width: 48%;
                }

                .list-popular .owl-item {
                    width: 155px !important;
                }

                .fS {
                    font-size: 25px !important;
                }

                .mdb-select.md-form .select-dropdown {
                    margin-right: 150px;
                }
            }

            .sort .mdb-select input.select-dropdown.form-control {
                margin-bottom: 0;
            }

        </style>
    </content>

</head>

<body>
<div class="content my-5">
    <div class="container">
        <div id="breadcrumb"></div>
        <!--end homeSlider-->
        <section class="homeMenuMobile1 d-block d-sm-none nav-scroller">
            <ul class="nav">
                <li class="nav-item bg-white rounded-pill mr-1">
                    <a class="nav-link text-dark " href="#">Dưới 1tr</a>
                </li>
                <li class="nav-item bg-white rounded-pill mr-1">
                    <a class="nav-link text-dark" href="#">Từ 1tr-3tr</a>
                </li>
                <li class="nav-item bg-white rounded-pill mr-1">
                    <a class="nav-link text-dark" href="#">Từ 3tr-6tr</a>
                </li>
                <li class="nav-item bg-white rounded-pill mr-1">
                    <a class="nav-link text-dark" href="#">Từ 6tr-10tr</a>
                </li>
                <li class="nav-item bg-white rounded-pill mr-1">
                    <a class="nav-link text-dark" href="#">Từ 10tr-15tr</a>
                </li>
                <li class="nav-item bg-white rounded-pill mr-1">
                    <a class="nav-link text-dark" href="#">Trên 15tr</a>
                </li>
            </ul>
        </section>
        <!--end homeMenuMobile1-->
        <section class="homeMenuMobile2 d-block d-sm-none nav-scroller mt-2">
            <ul class="nav">
                <li class="nav-item rounded-pill bg-white mr-1">
                    <a class="nav-link" href="#" style="width: 100px;"><img src="/images/apple.jpg"
                                                                            class="img-fluid"></a>
                </li>
                <li class="nav-item rounded-pill bg-white mr-1">
                    <a class="nav-link" href="#" style="width: 100px;"><img src="/images/vivo.png"
                                                                            class="img-fluid"></a>
                </li>
                <li class="nav-item rounded-pill bg-white mr-1">
                    <a class="nav-link" href="#" style="width: 100px;"><img src="/images/vivo.png"
                                                                            class="img-fluid"></a>
                </li>
                <li class="nav-item rounded-pill bg-white mr-1">
                    <a class="nav-link" href="#" style="width: 100px;"><img src="/images/apple.jpg"
                                                                            class="img-fluid"></a>
                </li>
                <li class="nav-item rounded-pill bg-white mr-1 ">
                    <a class="nav-link" href="#" style="width: 100px;"><img src="/images/samsung.png"
                                                                            class="img-fluid"></a>
                </li>
                <li class="nav-item rounded-pill bg-white mr-1 ">
                    <a class="nav-link" href="#" style="width: 100px;"> <img src="/images/vivo.png"
                                                                             class="img-fluid"></a>
                </li>
                <li class="nav-item rounded-pill bg-white mr-1">
                    <a class="nav-link" href="#" style="width: 100px;"><img src="/images/vivo.png"
                                                                            class="img-fluid"></a>
                </li>
            </ul>
        </section>
        <!--end homeMenuMobile2-->
        <%
            List<Brand> brandList = (List<Brand>) request.getAttribute("brandList");
            List<Brand> brandCheckList = (List<Brand>) request.getAttribute("brandCheckList");

            List<Model> modelList = (List<Model>) request.getAttribute("modelList");
            List<Model> modelCheckList = (List<Model>) request.getAttribute("modelCheckList");

            List<Cap> capList = (List<Cap>) request.getAttribute("capList");
            List<Cap> capCheckList = (List<Cap>) request.getAttribute("capCheckList");


            List<Promot> promotList = (List<Promot>) request.getAttribute("promotList");
            List<Promot> promotCheckList = (List<Promot>) request.getAttribute("promotCheckList");

            boolean[] brandCheck = (boolean[]) request.getAttribute("brandCheck");
            boolean[] modelCheck = (boolean[]) request.getAttribute("modelCheck");
            boolean[] capCheck = (boolean[]) request.getAttribute("capCheck");
            boolean[] typeCheck = (boolean[]) request.getAttribute("typeCheck");
            boolean[] promotCheck = (boolean[]) request.getAttribute("promotCheck");

            Map<String, String> priceList = (Map<String, String>) request.getAttribute("priceList");
            Map<String, String> sortList = (Map<String, String>) request.getAttribute("sortList");
            Map<String, String> differentList = (Map<String, String>) request.getAttribute("differentList");
            List<String> keySort = new ArrayList<>(sortList.keySet());
            List<String> key3 = new ArrayList<>(differentList.keySet());
            String sort = (String) request.getAttribute("sort");
            boolean[] priceCheck = (boolean[]) request.getAttribute("priceCheck");
            boolean[] differentCheck = (boolean[]) request.getAttribute("differentCheck");
            boolean priceCheck0 = (boolean) request.getAttribute("priceCheck0");
            List<Phone> phones = (List<Phone>) request.getAttribute("phones");
            String search = (String) request.getAttribute("search");
            List<Phone> all = (List<Phone>) request.getAttribute("phoneAll");
            double total = (double) request.getAttribute("total");
            int paginationnum = (int) request.getAttribute("paginationnum");
        %>
        <form action="/phone-filter" id="form1">
            <section class="homeProducts">
                <div class="row row-sm">
                    <div class="col-xl-3 bg-white pl-2 pr-2">
                        <div class="cdt-filter__block mb-3">
                            <div class="cdt-filter__title fw-bold fs-4 mb-2 h6">Lọc Theo</div>
                            <div class="d-none d-sm-block">


                                <%
                                    if (brandCheckList != null) {
                                        for (Brand b : brandCheckList
                                        ) {

                                %>

                                <div class="chip pink lighten-4">
                                    <%=b.getName()%>
                                    <i class="close fas fa-times"
                                       onclick="document.getElementById('brandId-<%=b.getId()%>').click()"></i>
                                </div>

                                <% }
                                }%>
                                <%
                                    if (capCheckList != null) {
                                        for (Cap c : capCheckList
                                        ) {

                                %>

                                <div class="chip pink lighten-4">
                                    <%=c.getCap() + c.getUnit()%>
                                    <i class="close fas fa-times"
                                       onclick="document.getElementById('capId-<%=c.getId()%>').click()"></i>
                                </div>

                                <% }
                                }%>

                                <%
                                    if (promotCheckList != null) {
                                        for (Promot c : promotCheckList
                                        ) {
                                %>
                                <div class="chip pink lighten-4">
                                    <%=c.getName()%>
                                    <i class="close fas fa-times"
                                       onclick="document.getElementById('promotId-<%=c.getId()%>').click()"></i>
                                </div>

                                <% }
                                }%>
                                <%
                                    if (modelCheckList != null) {
                                        for (Model m : modelCheckList
                                        ) {

                                %>

                                <div class="chip pink lighten-4">
                                    <%=m.getName()%>
                                    <i class="close fas fa-times"
                                       onclick="document.getElementById('modelId-<%=m.getId()%>').click()"></i>
                                </div>

                                <% }
                                }%>
                                <%
                                    if (!priceCheck0) {
                                        List<String> s = new ArrayList<>(priceList.keySet());
                                        for (int i = 0; i < priceCheck.length; i++
                                        ) {
                                            if (priceCheck[i]) {
                                %>

                                <div class="chip pink lighten-4">
                                    <%=priceList.get(s.get(i))%>
                                    <i class="close fas fa-times"
                                       onclick="document.getElementById('priceName-<%=s.get(i)%>').click()"></i>
                                </div>

                                <% }
                                }
                                }%>

                            </div>
                        </div>


                        <div class="cdt-filter__block mb-3">
                            <div class="cdt-filter__title fw-bold fs-4 mb-2 h6">Sản phẩm</div>
                            <div class="filter row ml-0">
                                <div class="form-check form-check-block mb-2 col-6 pr-0 ">
                                    <input type="checkbox" class="form-check-input" name=""
                                           id="brandId-all"
                                           value=""
                                        <%=(brandCheckList == null ) ? "checked" : ""%>>
                                    <label class="form-check-label w-100"
                                           for="brandId-all">all
                                    </label>
                                </div>
                                <%
                                    if (brandList != null) {
                                        for (int i = 0; i < brandList.size(); i++) {
                                %>
                                <div class="form-check form-check-block mb-2 col-6 pr-0 ">
                                    <input type="checkbox" class="form-check-input" name="brandCheck"
                                           id="brandId-<%=brandList.get(i).getId()%>"
                                           value="<%=brandList.get(i).getId()%>"
                                        <%=(brandCheck[i])?"checked":""%> >
                                    <label class="form-check-label w-100"
                                           for="brandId-<%=brandList.get(i).getId()%>"><%=brandList.get(i).getName()%>
                                    </label>
                                </div>
                                <%
                                        }
                                    }
                                %>
                            </div>
                        </div>

                        <%
                            if (!modelList.isEmpty()) {%>

                        <div class="cdt-filter__block mb-3">
                            <div class="cdt-filter__title fw-bold fs-4 mb-2 h6">model</div>
                            <div class="filter row ml-0">


                                <div class="form-check form-check-block mb-2 col-6 pr-0 ">
                                    <input type="checkbox" class="form-check-input" name=""
                                           id="modelId-all"
                                           value=""
                                        <%=(modelCheckList == null ) ? "checked" : ""%>>
                                    <label class="form-check-label w-100"
                                           for="modelId-all">all
                                    </label>
                                </div>
                                <%

                                    for (int i = 0; i < modelList.size(); i++) {
                                %>
                                <div class="form-check form-check-block mb-2 col-6 pr-0 ">
                                    <input type="checkbox" class="form-check-input" name="modelCheck"
                                           id="modelId-<%=modelList.get(i).getId()%>"
                                           value="<%=modelList.get(i).getId()%>"

                                        <%=(modelCheck[i])?"checked":""%> >
                                    <label class="form-check-label w-100"
                                           for="modelId-<%=modelList.get(i).getId()%>"><%=modelList.get(i).getName()%>
                                    </label>
                                </div>
                                <%
                                    }

                                %>
                            </div>
                        </div>
                        <%}%>

                        <div class="cdt-filter__block mb-3">
                            <div class="cdt-filter__title fw-bold fs-4 mb-2 h6">Mức Giá</div>
                            <div class="filter">
                                <div class="form-check form-check-block mb-2 col-6 pr-0 ">
                                    <input type="checkbox" class="form-check-input" name=""
                                           id="priceId-all"
                                           value=""
                                        <%=(priceCheck0) ? "checked" : ""%>>
                                    <label class="form-check-label w-100"
                                           for="priceId-all">all
                                    </label>
                                </div>
                                <%
                                    if (priceList != null) {
                                        List<String> keys = new ArrayList<>(priceList.keySet());
                                        for (int i = 0; i < keys.size(); i++) {
                                %>
                                <div class="form-check form-check-block mb-2 pr-0 ">
                                    <a class="text-dark" href="#">
                                        <input type="checkbox" name="priceCheck" class="form-check-input"
                                               value="<%=priceList.get(keys.get(i))%>" onclick="this.form.submit()"
                                               id="priceName-<%=keys.get(i)%>" <%=(priceCheck[i])?"checked":""%>>
                                        <label class="form-check-label w-100"
                                               for="priceName-<%=keys.get(i)%>"><%=priceList.get(keys.get(i))%>
                                        </label>
                                    </a>
                                </div>
                                <%
                                        }
                                    }
                                %>
                            </div>
                        </div>
                        <div class="cdt-filter__block mb-3">
                            <div class="cdt-filter__title fw-bold fs-4 mb-2 h6">bo nho</div>
                            <div class="filter row ml-0">
                                <div class="form-check form-check-block mb-2 col-6 pr-0 ">
                                    <input type="checkbox" class="form-check-input" name=""
                                           id="capId-all"
                                           value=""
                                        <%=(capCheckList == null ) ? "checked" : ""%>>
                                    <label class="form-check-label w-100"
                                           for="capId-all">all
                                    </label>
                                </div>
                                <%
                                    if (capList != null) {
                                        for (int i = 0; i < capList.size(); i++) {
                                %>
                                <div class="form-check form-check-block mb-2 col-6 pr-0 ">
                                    <input type="checkbox" class="form-check-input" name="capCheck"
                                           id="capId-<%=capList.get(i).getId()%>" onclick="this.form.submit()"
                                           value="<%=capList.get(i).getId()%>"
                                        <%=(capCheck[i])?"checked":""%> >
                                    <label class="form-check-label w-100"
                                           for="capId-<%=capList.get(i).getId()%>"><%=capList.get(i).getCap() + capList.get(i).getUnit()%>
                                    </label>
                                </div>
                                <%
                                        }
                                    }
                                %>
                            </div>
                        </div>
                        <div class="cdt-filter__block mb-3">
                            <div class="cdt-filter__title fw-bold fs-4 mb-2 h6">chuong trinh</div>
                            <div class="filter row ml-0">
                                <div class="form-check form-check-block mb-2 col-6 pr-0 ">
                                    <input type="checkbox" class="form-check-input" name=""
                                           id="promotId-all"
                                           value=""
                                        <%=(promotCheckList == null ) ? "checked" : ""%>>
                                    <label class="form-check-label w-100"
                                           for="promotId-all">all
                                    </label>
                                </div>
                                <%
                                    if (promotList != null) {
                                        for (int i = 0; i < promotList.size(); i++) {
                                %>
                                <div class="form-check form-check-block mb-2 col-6 pr-0 ">
                                    <input type="checkbox" class="form-check-input" name="promotCheck"
                                           id="promotId-<%=promotList.get(i).getId()%>" onclick="this.form.submit()"
                                           value="<%=promotList.get(i).getId()%>"
                                        <%=(promotCheck[i])?"checked":""%> >
                                    <label class="form-check-label w-100"
                                           for="promotId-<%=promotList.get(i).getId()%>"><%=promotList.get(i).getName() %>
                                    </label>
                                </div>
                                <%
                                        }
                                    }
                                %>
                            </div>
                        </div>

                    </div>
                    <div class="col-xl-9 bg-white p-0 ">
                        <div class="card border  mb-4" style="box-shadow: unset;">
                            <div class="card-header">
                                <div class="d-flex bd-highlight">
                                    <div class=" w-100 bd-highlight d-none d-sm-block">
                                        <h3 class="m-0">
                                            <a href="" title="" class="text-dark h4  " style="font-size: 22px">

                                                <%if (search != null && !search.equals("")) {%>
                                                <%=search%>

                                                <%} else {%>
                                                dien thoai
                                                <%

                                                    if (brandCheckList != null) {
                                                        for (Brand b : brandCheckList
                                                        ) {
                                                %>
                                                <%=b.getName()%>
                                                <%
                                                        }
                                                    }
                                                %>
                                                <%
                                                    if (modelCheckList != null) {
                                                        for (Model m : modelCheckList
                                                        ) {

                                                %>
                                                <%=m.getName()%>
                                                <%
                                                            }
                                                        }
                                                    }
                                                %>
                                                <span style="font-size: 14px ; opacity: 0.7">(<%=all.size()%> sản phẩm)</span>
                                            </a>
                                        </h3>
                                    </div>
                                </div>
                            </div>
                            <%

                                if (brandCheckList == null) {


                            %>
                            <div class="cart-body p-4">
                                <div class="owl-carousel owl-theme my-owl-carousel">

                                    <%
                                        for (Brand brand : brandList
                                        ) {

                                    %>
                                    <a class="w-100 hvr-grow mx-2 brandform "
                                       onclick="document.getElementById('brand-<%=brand.getId()%>').click()">

                                        <input hidden type="checkbox" value="<%=brand.getId()%>" name="brandCheck"
                                               id="brand-<%=brand.getId()%>"
                                               onclick="this.form.submit()">
                                        <img class="owl-lazy "
                                             style="max-width: 108px !important; max-height: 40px !important;"
                                             data-src="<%=brand.getLogo()%>" alt="">
                                    </a>

                                    <%}%>

                                </div>
                            </div>
                            <%}%>
                        </div>


                        <%
                            if (!modelList.isEmpty() && modelCheckList == null) { %>

                        <div class="card  border  mb-4" style="box-shadow: unset;">
                            <div class="card-header">
                                <h5 class=" font-weight-bold   m-0 text-uppercase ">
                                    dòng sản phẩm
                                </h5>
                            </div>
                            <div class="card-body  ">
                                <div class="model-owl">
                                    <div class="owl-carousel owl-theme ">
                                        <%
                                            for (int i = 0; i < modelList.size(); i++) {

                                        %>
                                        <div class="item  ">
                                            <div class="cdt-product text-center w-100 p-2">
                                                <a id="submit"
                                                   onclick="
                                                           document.getElementById('modelId-<%= modelList.get(i).getId()%>').click();
                                                           "
                                                   title="iPhone 12 Series">
                                                    <input hidden name="modelCheck"
                                                           value="<%=modelList.get(i).getId()%>"
                                                           type="checkbox"
                                                           id="modelId-<%=modelList.get(i).getId()%>"
                                                           onclick="this.form.submit()">
                                                    <div class="cdt-product__img hvr-shrink mb-2">
                                                        <img src="<%=modelList.get(i).getImg()%>"
                                                             alt="iPhone 12 Series" title="iPhone 12 Series"></div>
                                                    <div class="cdt-product__info text-center ">
                                                        <div class="cdt-product__name  mb-1"><%=modelList.get(i).getName()%>
                                                        </div>
                                                        <div class="cdt-product__show-promo">
                                                            <div class="strike-price"><%=modelList.get(i)._minPrice()%>
                                                                đ
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                        <%
                                            }%>

                                    </div>
                                </div>

                            </div>
                        </div>
                        <%}%>
                        <div class="d-flex  justify-content-between align-items-center"
                             style="border-bottom: 1px solid gray;">

                            <div class="  ">
                                <%
                                    for
                                    (
                                            int
                                            i
                                            =
                                            0
                                            ;
                                            i
                                                    <
                                                    key3
                                                            .
                                                            size
                                                                    (
                                                                    )
                                            ;
                                            i
                                                    ++
                                    ) {
                                %>
                                <div class="form-check form-check-inline">
                                    <input type="checkbox" class="form-check-input"
                                           value="<%=differentList.get(key3.get(i))%>"
                                           name="differentCheck"
                                           id="<%=differentList.get(key3.get(i))%>"
                                           onclick="this.form.submit()" <%=(differentCheck[i])?"checked":""%> >
                                    <label class="form-check-label"
                                           for="<%=differentList.get(key3.get(i))%>"><%=differentList
                                            .
                                            get
                                                    (
                                                            key3
                                                                    .
                                                                    get
                                                                            (
                                                                                    i
                                                                            )
                                                    )%>
                                    </label>
                                </div>
                                <%}%>

                            </div>
                            <div class="sort float-right ml-auto ">
                                <select class="mdb-select md-form m-0 " style="color:red !important;" name="sort"
                                        id="sort"
                                        onchange="this.form.submit()">

                                    <%
                                        for
                                        (
                                                int
                                                i
                                                =
                                                0
                                                ;
                                                i
                                                        <
                                                        keySort
                                                                .
                                                                size
                                                                        (
                                                                        )
                                                ;
                                                i
                                                        ++
                                        ) {
                                    %>
                                    <option value="<%=sortList.get(keySort.get(i)) %>"
                                            class="text-danger"  <%=(
                                            sort
                                                    .
                                                    equals
                                                            (
                                                                    sortList
                                                                            .
                                                                            get
                                                                                    (
                                                                                            keySort
                                                                                                    .
                                                                                                    get
                                                                                                            (
                                                                                                                    i
                                                                                                            )
                                                                                    )
                                                            )
                                    )
                                            ?
                                            "selected"
                                            :
                                            ""%> ><%=sortList
                                            .
                                            get
                                                    (
                                                            keySort
                                                                    .
                                                                    get
                                                                            (
                                                                                    i
                                                                            )
                                                    ) %>
                                    </option>

                                    <% }%>
                                </select>


                            </div>
                        </div>


                        <div class="products-mobile mt-3 w-100 mb-4">
                            <div class="row w-100 mx-auto row-cols-4  ">

                                <%
                                    List
                                            <
                                                    Phone
                                                    >
                                            phones1
                                            =
                                            (
                                                    List
                                                            <
                                                                    Phone
                                                                    >
                                                    )
                                                    request
                                                            .
                                                            getAttribute
                                                                    (
                                                                            "phones"
                                                                    );
                                    for
                                    (
                                            Phone
                                                    phone
                                            :
                                            phones1
                                    ) {
                                %>
                                <div class="col-6 col-sm-3 p-0">
                                    <div class="card border rounded-0" style="box-shadow: unset;">
                                        <div class="card-body " style="padding: 0.75rem;">

                                            <%--
                                              Created by IntelliJ IDEA.
                                              User: dell
                                              Date: 12/10/2022
                                              Time: 6:26 PM
                                              To change this template use File | Settings | File Templates.
                                            --%>

                                            <div class=" d-block  overflow-hidden ">
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
                                                <div class="d-flex flex-column align-items-strech w-100  ">
                                                    <div class=" align-self-start" style="height:18px;">
                                                        <% for
                                                        (
                                                                PhonePromot
                                                                        promot
                                                                :
                                                                phone
                                                                        .
                                                                        _promots
                                                                                (
                                                                                )
                                                        ) {
                                                            if
                                                            (
                                                                    Variable.Global.TG0.toString()
                                                                                    .
                                                                            equalsIgnoreCase
                                                                                    (
                                                                                            promot
                                                                                                    .
                                                                                                    _promot
                                                                                                            (
                                                                                                            )
                                                                                                            .
                                                                                                    getKey
                                                                                                            (
                                                                                                            )
                                                                                    )
                                                            ) {
                                                        %>


                                                        <span class="badge badge-danger mr-1"><%=promot
                                                                .
                                                                _promot
                                                                        (
                                                                        )
                                                                        .
                                                                getName
                                                                        (
                                                                        )%></span>
                                                        <%
                                                                }
                                                            }
                                                        %>
                                                    </div>
                                                    <a href="${pageContext.request.contextPath}phone-detail?id=<%=phone.getId()%>&page=1&page2=1 "
                                                       class="text-dark align-self-stretch"
                                                       style="height: 525px;">
                                                        <div class=" cart-content  h-100">
                                                            <div
                                                                    class="my-2 d-block overflow-hidden item hvr-float ">
                                                                <img class="object-cover mw-100 "
                                                                     src="<%=phone.getThumbnail()%>"
                                                                     alt="">
                                                            </div>
                                                            <h3 class=" product-title overflow-hidden   mb-1 "
                                                                style="display: -webkit-box;
-webkit-box-orient: vertical;
-webkit-line-clamp: 2;font-size: 14px;">
                                                                <%=phone
                                                                        .
                                                                        getName
                                                                                (
                                                                                )%>
                                                            </h3>

                                                            <div class="mb-1">
                                                                <%
                                                                    for
                                                                    (
                                                                            PhoneSpec
                                                                                    spec
                                                                            :
                                                                            phone
                                                                                    .
                                                                                    _specs
                                                                                            (
                                                                                            )
                                                                    ) {
                                                                        if
                                                                        (
                                                                                "LR"
                                                                                        .
                                                                                        equalsIgnoreCase
                                                                                                (
                                                                                                        spec
                                                                                                                .
                                                                                                                _spec
                                                                                                                        (
                                                                                                                        )
                                                                                                                        .
                                                                                                                getKey
                                                                                                                        (
                                                                                                                        )
                                                                                                )
                                                                                        ||
                                                                                        "TDR"
                                                                                                .
                                                                                                equalsIgnoreCase
                                                                                                        (
                                                                                                                spec
                                                                                                                        .
                                                                                                                        _spec
                                                                                                                                (
                                                                                                                                )
                                                                                                                                .
                                                                                                                        getKey
                                                                                                                                (
                                                                                                                                )
                                                                                                        )
                                                                        ) {

                                                                %>

                                                                <span class="mr-2 badge badge-light mb-1">
																				<%=spec
                                                                                        .
                                                                                        _spec
                                                                                                (
                                                                                                )
                                                                                                .
                                                                                        getName
                                                                                                (
                                                                                                )%>
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
                                                                    class="fw-bold d-block mb-1 text-danger">
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
                                                            <div class="mt-2 text-ellipsis overflow-hidden text-break  d-none d-sm-block"
                                                                 style="font-size:12px ;">
                                                                <%
                                                                    for
                                                                    (
                                                                            PhoneSpec
                                                                                    ps
                                                                            :
                                                                            phone
                                                                                    .
                                                                                    _specs
                                                                                            (
                                                                                            )
                                                                    ) {


                                                                %>
                                                                <p
                                                                        class="d-flex quote  text-ellipsis overflow-hidden text-break">
                                                                    <%=ps
                                                                            .
                                                                            _spec
                                                                                    (
                                                                                    )
                                                                                    .
                                                                            getName
                                                                                    (
                                                                                    ) %>
                                                                    : <%=ps
                                                                        .
                                                                        getValue
                                                                                (
                                                                                ) %>

                                                                </p>
                                                                <%}%>
                                                            </div>

                                                        </div>
                                                    </a>
                                                    <div class="mt-2  d-flex justify-content-between ">
                                                        <a href="${pageContext.request.contextPath}/add-carts?name=home&action=wishes&phoneId=<%=phone.getId()%>"
                                                           class=" d-block  align-middle"
                                                           style="font-size:14px ;">
                                                            <i class="fa-regular fa-square-plus fa-sm"></i>
                                                            cart
                                                        </a>

                                                        <a href="${pageContext.request.contextPath}/add-carts?action=wishes&phoneId=<%=phone.getId()%>"
                                                           class="d-block  align-middle"
                                                           style="font-size:14px ;">
                                                            <i class="fa-regular fa-heart fa-sm"></i> yêu
                                                            thích
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <% }%>
                            </div>
                        </div>
                        <div class="d-flex justify-content-center align-items-center mt-3">
                            <nav>
                                <ul class="pagination pg-red">

                                    <%if (total != 0 && paginationnum != 1) {%>
                                    <li class="page-item ">
                                        <a class="page-link" aria-label="Previous"
                                           onclick="document.getElementById('pagination<%=paginationnum-1%>').click()">
                                            <span aria-hidden="true">&laquo;</span>
                                            <input type="radio" class="form-check-input" value="<%=paginationnum-1%>"
                                                   id="pagination<%=paginationnum-1%>" name="page"
                                                   onclick="this.form.submit()">
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </li>
                                    <%}%>
                                    <%
                                        for (int i = 1; i < total + 1; i++) {
                                    %>
                                    <li class="page-item <%=(i==paginationnum)?"active":""%>">
                                        <a class="page-link"
                                           onclick="document.getElementById('pagination<%=i%>').click()">
                                            <%=i%>
                                            <input type="radio" class="form-check-input" value="<%=i%>"
                                                   id="pagination<%=i%>" name="page"
                                                   onclick="this.form.submit()"  <%=(paginationnum==i)?"checked":""%>>
                                        </a>
                                    </li>
                                    <%}%>
                                    <%if (total != 0 && paginationnum != total) {%>
                                    <li class="page-item">
                                        <a class="page-link" aria-label="Next"
                                           onclick="document.getElementById('pagination<%=paginationnum+1%>').click()">
                                            <span aria-hidden="true">&raquo;</span>
                                            <input type="radio" class="form-check-input" value="<%=paginationnum-1%>"
                                                   id="pagination<%=paginationnum+1%>" name="page"
                                                   onclick="this.form.submit()">
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </li>
                                    <%}%>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </section>
        </form>
        <section class="py-5">
            <div class="card">
                <div
                        class="card-header mb-0 bg-danger d-flex justify-content-between text-white align-items-center ">
                    <h5 class="mt-2 text-uppercase ">Sản phẩm phổ biến</h5>
                    <button class="btn btn-white border-danger px-5 red-text btn-md m-0"
                            style="box-shadow: unset;"><strong>Xem tất cả</strong></button>
                </div>
                <div class="card-body bg-light">
                    <div class="introduce-products">
                        <div class="owl-carousel owl-theme ">
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

                                                <div class=" align-items-start">
															<span class="badge badge-danger mr-1">Trả góp
																0%</span>
                                                </div>

                                                <a href="/views/product.html" class="text-dark">
                                                    <div class="align-items-start cart-content  h-100">
                                                        <div
                                                                class="my-2 d-block overflow-hidden item hvr-float ">
                                                            <img class="object-cover mw-100 "
                                                                 src="https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg"
                                                                 alt="">
                                                        </div>
                                                        <h3 class="text-ellipsis product-title overflow-hidden  mb-1 fw-normal  text-break "
                                                            style="display: -webkit-box;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 2;font-size: 14px;">
                                                            iPhone 14 Pro Max 256GB Lorem ipsum
                                                            dolor
                                                            sit amet
                                                            consectetur
                                                            adipisicing elit. Iste, maiores.
                                                        </h3>
                                                        <div class="mb-1">
																	<span class="mr-2 badge badge-light">6.7
																		incheslor
																	</span>

                                                            <span class="mr-2 badge badge-light">128
																		GB</span>
                                                        </div>

                                                        <div class="mb-1">
                                                            <i class=" d-inline-block text-decoration-line-through price-old"
                                                               style="text-decoration: line-through">
                                                                40.000.000đ</i>
                                                            <b class="d-inline-block price-new ">-25%</b>
                                                        </div>
                                                        <strong
                                                                class="fw-bold d-block mb-1 text-danger">38.990.000đ</strong>

                                                        <div class=" mb-1 d-flex flex-end">
                                                            <p class=" text-warning " style="font-size: 12px;">
                                                                <i class=" fa-solid fa-star "></i>
                                                                <i class=" fa-solid fa-star "></i>
                                                                <i class=" fa-solid fa-star "></i>
                                                                <i class="fa-solid fa-star-half-stroke "></i>
                                                                <i class="fa-regular fa-star "></i>
                                                            </p>
                                                            <p class="ms-1 fw-light d-inline-block align-middle "
                                                               style="font-size: 12px;">54</p>
                                                        </div>

                                                    </div>
                                                </a>
                                                <div
                                                        class="mt-2  d-flex justify-content-between align-items-end">
                                                    <a href="" class=" d-block  align-middle"
                                                       style="font-size:14px ;">
                                                        <i class="fa-regular fa-square-plus fa-sm"></i>
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

                                                <div class=" align-items-start">
															<span class="badge badge-danger mr-1">Trả góp
																0%</span>
                                                </div>

                                                <a href="/views/product.html" class="text-dark">
                                                    <div class="align-items-start cart-content  h-100">
                                                        <div
                                                                class="my-2 d-block overflow-hidden item hvr-float ">
                                                            <img class="object-cover mw-100 "
                                                                 src="https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg"
                                                                 alt="">
                                                        </div>
                                                        <h3 class="text-ellipsis product-title overflow-hidden  mb-1 fw-normal  text-break "
                                                            style="display: -webkit-box;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 2;font-size: 14px;">
                                                            iPhone 14 Pro Max 256GB Lorem ipsum
                                                            dolor
                                                            sit amet
                                                            consectetur
                                                            adipisicing elit. Iste, maiores.
                                                        </h3>
                                                        <div class="mb-1">
																	<span class="mr-2 badge badge-light">6.7
																		incheslor
																	</span>

                                                            <span class="mr-2 badge badge-light">128
																		GB</span>
                                                        </div>

                                                        <div class="mb-1">
                                                            <i class=" d-inline-block text-decoration-line-through price-old"
                                                               style="text-decoration: line-through">
                                                                40.000.000đ</i>
                                                            <b class="d-inline-block price-new ">-25%</b>
                                                        </div>
                                                        <strong
                                                                class="fw-bold d-block mb-1 text-danger">38.990.000đ</strong>

                                                        <div class=" mb-1 d-flex flex-end">
                                                            <p class=" text-warning " style="font-size: 12px;">
                                                                <i class=" fa-solid fa-star "></i>
                                                                <i class=" fa-solid fa-star "></i>
                                                                <i class=" fa-solid fa-star "></i>
                                                                <i class="fa-solid fa-star-half-stroke "></i>
                                                                <i class="fa-regular fa-star "></i>
                                                            </p>
                                                            <p class="ms-1 fw-light d-inline-block align-middle "
                                                               style="font-size: 12px;">54</p>
                                                        </div>

                                                    </div>
                                                </a>
                                                <div
                                                        class="mt-2  d-flex justify-content-between align-items-end">
                                                    <a href="" class=" d-block  align-middle"
                                                       style="font-size:14px ;">
                                                        <i class="fa-regular fa-square-plus fa-sm"></i>
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

                                                <div class=" align-items-start">
															<span class="badge badge-danger mr-1">Trả góp
																0%</span>
                                                </div>

                                                <a href="/views/product.html" class="text-dark">
                                                    <div class="align-items-start cart-content  h-100">
                                                        <div
                                                                class="my-2 d-block overflow-hidden item hvr-float ">
                                                            <img class="object-cover mw-100 "
                                                                 src="https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg"
                                                                 alt="">
                                                        </div>
                                                        <h3 class="text-ellipsis product-title overflow-hidden  mb-1 fw-normal  text-break "
                                                            style="display: -webkit-box;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 2;font-size: 14px;">
                                                            iPhone 14 Pro Max 256GB Lorem ipsum
                                                            dolor
                                                            sit amet
                                                            consectetur
                                                            adipisicing elit. Iste, maiores.
                                                        </h3>
                                                        <div class="mb-1">
																	<span class="mr-2 badge badge-light">6.7
																		incheslor
																	</span>

                                                            <span class="mr-2 badge badge-light">128
																		GB</span>
                                                        </div>

                                                        <div class="mb-1">
                                                            <i class=" d-inline-block text-decoration-line-through price-old"
                                                               style="text-decoration: line-through">
                                                                40.000.000đ</i>
                                                            <b class="d-inline-block price-new ">-25%</b>
                                                        </div>
                                                        <strong
                                                                class="fw-bold d-block mb-1 text-danger">38.990.000đ</strong>

                                                        <div class=" mb-1 d-flex flex-end">
                                                            <p class=" text-warning " style="font-size: 12px;">
                                                                <i class=" fa-solid fa-star "></i>
                                                                <i class=" fa-solid fa-star "></i>
                                                                <i class=" fa-solid fa-star "></i>
                                                                <i class="fa-solid fa-star-half-stroke "></i>
                                                                <i class="fa-regular fa-star "></i>
                                                            </p>
                                                            <p class="ms-1 fw-light d-inline-block align-middle "
                                                               style="font-size: 12px;">54</p>
                                                        </div>

                                                    </div>
                                                </a>
                                                <div
                                                        class="mt-2  d-flex justify-content-between align-items-end">
                                                    <a href="" class=" d-block  align-middle"
                                                       style="font-size:14px ;">
                                                        <i class="fa-regular fa-square-plus fa-sm"></i>
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

                                                <div class=" align-items-start">
															<span class="badge badge-danger mr-1">Trả góp
																0%</span>
                                                </div>

                                                <a href="/views/product.html" class="text-dark">
                                                    <div class="align-items-start cart-content  h-100">
                                                        <div
                                                                class="my-2 d-block overflow-hidden item hvr-float ">
                                                            <img class="object-cover mw-100 "
                                                                 src="https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg"
                                                                 alt="">
                                                        </div>
                                                        <h3 class="text-ellipsis product-title overflow-hidden  mb-1 fw-normal  text-break "
                                                            style="display: -webkit-box;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 2;font-size: 14px;">
                                                            iPhone 14 Pro Max 256GB Lorem ipsum
                                                            dolor
                                                            sit amet
                                                            consectetur
                                                            adipisicing elit. Iste, maiores.
                                                        </h3>
                                                        <div class="mb-1">
																	<span class="mr-2 badge badge-light">6.7
																		incheslor
																	</span>

                                                            <span class="mr-2 badge badge-light">128
																		GB</span>
                                                        </div>

                                                        <div class="mb-1">
                                                            <i class=" d-inline-block text-decoration-line-through price-old"
                                                               style="text-decoration: line-through">
                                                                40.000.000đ</i>
                                                            <b class="d-inline-block price-new ">-25%</b>
                                                        </div>
                                                        <strong
                                                                class="fw-bold d-block mb-1 text-danger">38.990.000đ</strong>

                                                        <div class=" mb-1 d-flex flex-end">
                                                            <p class=" text-warning " style="font-size: 12px;">
                                                                <i class=" fa-solid fa-star "></i>
                                                                <i class=" fa-solid fa-star "></i>
                                                                <i class=" fa-solid fa-star "></i>
                                                                <i class="fa-solid fa-star-half-stroke "></i>
                                                                <i class="fa-regular fa-star "></i>
                                                            </p>
                                                            <p class="ms-1 fw-light d-inline-block align-middle "
                                                               style="font-size: 12px;">54</p>
                                                        </div>

                                                    </div>
                                                </a>
                                                <div
                                                        class="mt-2  d-flex justify-content-between align-items-end">
                                                    <a href="" class=" d-block  align-middle"
                                                       style="font-size:14px ;">
                                                        <i class="fa-regular fa-square-plus fa-sm"></i>
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

                                                <div class=" align-items-start">
															<span class="badge badge-danger mr-1">Trả góp
																0%</span>
                                                </div>

                                                <a href="/views/product.html" class="text-dark">
                                                    <div class="align-items-start cart-content  h-100">
                                                        <div
                                                                class="my-2 d-block overflow-hidden item hvr-float ">
                                                            <img class="object-cover mw-100 "
                                                                 src="https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg"
                                                                 alt="">
                                                        </div>
                                                        <h3 class="text-ellipsis product-title overflow-hidden  mb-1 fw-normal  text-break "
                                                            style="display: -webkit-box;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 2;font-size: 14px;">
                                                            iPhone 14 Pro Max 256GB Lorem ipsum
                                                            dolor
                                                            sit amet
                                                            consectetur
                                                            adipisicing elit. Iste, maiores.
                                                        </h3>
                                                        <div class="mb-1">
																	<span class="mr-2 badge badge-light">6.7
																		incheslor
																	</span>

                                                            <span class="mr-2 badge badge-light">128
																		GB</span>
                                                        </div>

                                                        <div class="mb-1">
                                                            <i class=" d-inline-block text-decoration-line-through price-old"
                                                               style="text-decoration: line-through">
                                                                40.000.000đ</i>
                                                            <b class="d-inline-block price-new ">-25%</b>
                                                        </div>
                                                        <strong
                                                                class="fw-bold d-block mb-1 text-danger">38.990.000đ</strong>

                                                        <div class=" mb-1 d-flex flex-end">
                                                            <p class=" text-warning " style="font-size: 12px;">
                                                                <i class=" fa-solid fa-star "></i>
                                                                <i class=" fa-solid fa-star "></i>
                                                                <i class=" fa-solid fa-star "></i>
                                                                <i class="fa-solid fa-star-half-stroke "></i>
                                                                <i class="fa-regular fa-star "></i>
                                                            </p>
                                                            <p class="ms-1 fw-light d-inline-block align-middle "
                                                               style="font-size: 12px;">54</p>
                                                        </div>

                                                    </div>
                                                </a>
                                                <div
                                                        class="mt-2  d-flex justify-content-between align-items-end">
                                                    <a href="" class=" d-block  align-middle"
                                                       style="font-size:14px ;">
                                                        <i class="fa-regular fa-square-plus fa-sm"></i>
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

                                                <div class=" align-items-start">
															<span class="badge badge-danger mr-1">Trả góp
																0%</span>
                                                </div>

                                                <a href="/views/product.html" class="text-dark">
                                                    <div class="align-items-start cart-content  h-100">
                                                        <div
                                                                class="my-2 d-block overflow-hidden item hvr-float ">
                                                            <img class="object-cover mw-100 "
                                                                 src="https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg"
                                                                 alt="">
                                                        </div>
                                                        <h3 class="text-ellipsis product-title overflow-hidden  mb-1 fw-normal  text-break "
                                                            style="display: -webkit-box;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 2;font-size: 14px;">
                                                            iPhone 14 Pro Max 256GB Lorem ipsum
                                                            dolor
                                                            sit amet
                                                            consectetur
                                                            adipisicing elit. Iste, maiores.
                                                        </h3>
                                                        <div class="mb-1">
																	<span class="mr-2 badge badge-light">6.7
																		incheslor
																	</span>

                                                            <span class="mr-2 badge badge-light">128
																		GB</span>
                                                        </div>

                                                        <div class="mb-1">
                                                            <i class=" d-inline-block text-decoration-line-through price-old"
                                                               style="text-decoration: line-through">
                                                                40.000.000đ</i>
                                                            <b class="d-inline-block price-new ">-25%</b>
                                                        </div>
                                                        <strong
                                                                class="fw-bold d-block mb-1 text-danger">38.990.000đ</strong>

                                                        <div class=" mb-1 d-flex flex-end">
                                                            <p class=" text-warning " style="font-size: 12px;">
                                                                <i class=" fa-solid fa-star "></i>
                                                                <i class=" fa-solid fa-star "></i>
                                                                <i class=" fa-solid fa-star "></i>
                                                                <i class="fa-solid fa-star-half-stroke "></i>
                                                                <i class="fa-regular fa-star "></i>
                                                            </p>
                                                            <p class="ms-1 fw-light d-inline-block align-middle "
                                                               style="font-size: 12px;">54</p>
                                                        </div>

                                                    </div>
                                                </a>
                                                <div
                                                        class="mt-2  d-flex justify-content-between align-items-end">
                                                    <a href="" class=" d-block  align-middle"
                                                       style="font-size:14px ;">
                                                        <i class="fa-regular fa-square-plus fa-sm"></i>
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
                            <div class="item">

                                <div class="card  ">
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

                                                <div class=" align-items-start">
															<span class="badge badge-danger mr-1">Trả góp
																0%</span>
                                                </div>

                                                <a href="/views/product.html" class="text-dark">
                                                    <div class="align-items-start cart-content  h-100">
                                                        <div
                                                                class="my-2 d-block overflow-hidden item hvr-float ">
                                                            <img class="object-cover mw-100 "
                                                                 src="https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg"
                                                                 alt="">
                                                        </div>
                                                        <h3 class="text-ellipsis product-title overflow-hidden  mb-1 fw-normal  text-break "
                                                            style="display: -webkit-box;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 2;font-size: 14px;">
                                                            iPhone 14 Pro Max 256GB Lorem ipsum
                                                            dolor
                                                            sit amet
                                                            consectetur
                                                            adipisicing elit. Iste, maiores.
                                                        </h3>
                                                        <div class="mb-1">
																	<span class="mr-2 badge badge-light">6.7
																		incheslor
																	</span>

                                                            <span class="mr-2 badge badge-light">128
																		GB</span>
                                                        </div>

                                                        <div class="mb-1">
                                                            <i class=" d-inline-block text-decoration-line-through price-old"
                                                               style="text-decoration: line-through">
                                                                40.000.000đ</i>
                                                            <b class="d-inline-block price-new ">-25%</b>
                                                        </div>
                                                        <strong
                                                                class="fw-bold d-block mb-1 text-danger">38.990.000đ</strong>

                                                        <div class=" mb-1 d-flex flex-end">
                                                            <p class=" text-warning " style="font-size: 12px;">
                                                                <i class=" fa-solid fa-star "></i>
                                                                <i class=" fa-solid fa-star "></i>
                                                                <i class=" fa-solid fa-star "></i>
                                                                <i class="fa-solid fa-star-half-stroke "></i>
                                                                <i class="fa-regular fa-star "></i>
                                                            </p>
                                                            <p class="ms-1 fw-light d-inline-block align-middle "
                                                               style="font-size: 12px;">54</p>
                                                        </div>

                                                    </div>
                                                </a>
                                                <div
                                                        class="mt-2  d-flex justify-content-between align-items-end">
                                                    <a href="" class=" d-block  align-middle"
                                                       style="font-size:14px ;">
                                                        <i class="fa-regular fa-square-plus fa-sm"></i>
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
                        </div>
                    </div>
                </div>

            </div>


        </section>
        <% Set<Phone> phoneSet = (Set<Phone>) SessionUntil.get(request, Variable.Global.HISTORY_PHONE.toString());

            if (phoneSet != null) {
                List<Phone> phs = new ArrayList<>(phoneSet);
        %>
        <section class="py-5">
            <div class="card">
                <div class="card-header bg-danger white-text">
                    <h5 class="mt-2 text-uppercase ">Sản phẩm đã xem gần đây</h5>
                </div>
                <div class="row w-100 mx-auto">
                    <%


                        for (Phone pp : phs
                        ) {


                    %>
                    <div class="col-6 col-sm-2 p-0">
                        <div class="card border rounded-0" style="box-shadow: unset;">
                            <div class="card-body" style="padding: 0.75rem;">
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

                                        <div class=" align-self-start" style="height:18px;">
                                            <% for
                                            (
                                                    PhonePromot
                                                            promot
                                                    :
                                                    pp
                                                            .
                                                            _promots
                                                                    (
                                                                    )
                                            ) {
                                                if
                                                (
                                                        Variable.Global.TG0.toString()
                                                                        .
                                                                equalsIgnoreCase
                                                                        (
                                                                                promot
                                                                                        .
                                                                                        _promot
                                                                                                (
                                                                                                )
                                                                                                .
                                                                                        getKey
                                                                                                (
                                                                                                )
                                                                        )
                                                ) {
                                            %>


                                            <span class="badge badge-danger mr-1"><%=promot
                                                    .
                                                    _promot
                                                            (
                                                            )
                                                            .
                                                    getName
                                                            (
                                                            )%></span>
                                            <%
                                                    }
                                                }
                                            %>
                                        </div>
                                        <a href="${pageContext.request.contextPath}phone-detail?id=<%=pp.getId()%>&page=1&page2=1 "
                                           class="text-dark">
                                            <div class="align-items-start cart-content  h-100">
                                                <div class="my-2 d-block overflow-hidden item hvr-float "><img
                                                        class="object-cover mw-100 "
                                                        src="<%=pp.getThumbnail()%>"
                                                        alt=""/></div>
                                                <h3 class="text-ellipsis product-title overflow-hidden  mb-1 fw-normal  text-break "
                                                    style="display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 2;font-size: 14px;">
                                                    <%=pp.getName()%>
                                                </h3>
                                                <div class="mb-1">
                                                    <%
                                                        for
                                                        (
                                                                PhoneSpec
                                                                        spec
                                                                :
                                                                pp
                                                                        .
                                                                        _specs
                                                                                (
                                                                                )
                                                        ) {
                                                            if
                                                            (
                                                                    "LR"
                                                                            .
                                                                            equalsIgnoreCase
                                                                                    (
                                                                                            spec
                                                                                                    .
                                                                                                    _spec
                                                                                                            (
                                                                                                            )
                                                                                                            .
                                                                                                    getKey
                                                                                                            (
                                                                                                            )

                                                                                    )
                                                            ) {

                                                    %>

                                                    <span class="mr-2 badge badge-light mb-1">
																				<%=spec
                                                                                        .
                                                                                        _spec
                                                                                                (
                                                                                                )
                                                                                                .
                                                                                        getName
                                                                                                (
                                                                                                )%>
																			</span>


                                                    <%
                                                            }
                                                        }
                                                    %>

                                                    <span class="mr-2 badge badge-light"><%=pp._cap().getCap() + " " + pp._cap().getUnit()%></span>

                                                </div>

                                                <div class="mb-1">
                                                    <i class=" d-inline-block text-decoration-line-through price-old"
                                                       style="text-decoration: line-through">
                                                        40.000.000đ</i>
                                                    <b class="d-inline-block price-new ">-25%</b>
                                                </div>
                                                <strong
                                                        class="fw-bold d-block mb-1 text-danger">
                                                    đ</strong>

                                                <div class=" mb-1 d-flex flex-end">
                                                    <p class=" text-warning "
                                                       style="font-size: 12px;">
                                                        <%
                                                            double avg = pp.avg();
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
                                                       style="font-size: 12px;"><%=pp.count()%>
                                                    </p>
                                                </div>

                                            </div>
                                        </a>
                                        <div class="mt-2  d-flex justify-content-between align-items-end">
                                            <a href="${pageContext.request.contextPath}/add-carts?name=home&action=wishes&phoneId=<%=pp.getId()%>"
                                               class=" d-block  align-middle"
                                               style="font-size:14px ;">
                                                <i class="fa-regular fa-square-plus fa-sm"></i>
                                                cart
                                            </a>

                                            <a href="${pageContext.request.contextPath}/add-carts?action=wishes&phoneId=<%=pp.getId()%>"
                                               class="d-block  align-middle"
                                               style="font-size:14px ;">
                                                <i class="fa-regular fa-heart fa-sm"></i> yêu
                                                thích
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>
                    <%
                        }%>
                </div>

            </div>


        </section>
        <%}%>
    </div>
    <!--end container-->
</div>
<!--end content-->
<content tag="local_script">
    <script>// Material Select Initialization


    $(document).ready(function () {
        const inputs = document.querySelectorAll('input[name="brandCheck"]');
        const inputs3 = document.querySelectorAll('input[name="modelCheck"]');
        const inputs4 = document.querySelectorAll('input[name="priceCheck"]');
        const inputs7 = document.querySelectorAll('input[name="promotCheck"]');
        const inputs6 = document.querySelectorAll('input[name="typeCheck"]');
        const inputs5 = document.querySelectorAll('input[name="capCheck"]');
        const inputs2 = document.querySelectorAll('input[name="modelCheck"]');
        $("#brandId-all").click(function (e) {
            e.preventDefault();
            for (let i = 0; i < inputs.length; i++) {
                inputs[i].checked = false;
            }
            $('#brandId-all').checked = true;
            document.getElementById("form1").submit();
        });
        $("#modelId-all").click(function (e) {
            e.preventDefault();
            for (let i = 0; i < inputs3.length; i++) {
                inputs3[i].checked = false;
            }
            $('#modelId-all').checked = true;
            document.getElementById("form1").submit();
        });
        $("#priceId-all").click(function (e) {
            e.preventDefault();
            for (let i = 0; i < inputs4.length; i++) {
                inputs4[i].checked = false;
            }
            $('#priceId-all').checked = true;
            document.getElementById("form1").submit();
        });
        $("#capId-all").click(function (e) {
            e.preventDefault();
            for (let i = 0; i < inputs5.length; i++) {
                inputs5[i].checked = false;
            }
            $('#capId-all').checked = true;
            document.getElementById("form1").submit();
        });
        $("#typeId-all").click(function (e) {
            e.preventDefault();
            for (let i = 0; i < inputs6.length; i++) {
                inputs6[i].checked = false;
            }
            $('#typeId-all').checked = true;
            document.getElementById("form1").submit();
        });
        $("#promotId-all").click(function (e) {
            e.preventDefault();
            for (let i = 0; i < inputs7.length; i++) {
                inputs7[i].checked = false;
            }
            $('#promotId-all').checked = true;
            document.getElementById("form1").submit();
        });
        for (let i = 0; i < inputs.length; i++) {
            inputs[i].addEventListener('click', function (e) {
                e.preventDefault();
                for (let j = 0; j < inputs2.length; j++) {
                    inputs2[j].checked = false;
                }
                document.getElementById("form1").submit();
            })
        }
        for (let i = 0; i < inputs2.length; i++) {
            inputs2[i].addEventListener('click', function (e) {
                e.preventDefault();
                document.getElementById("form1").submit();
            })
        }

        $('.mdb-select').materialSelect();


        $('.model-owl .owl-carousel').owlCarousel({
            lazyLoad: true,
            margin: 10,
            autoplayHoverPause: true,
            nav: true,
            dots: true,
            navText: ["<i class='fa-solid fa-circle-chevron-left fa-lg' style='font-size:40px'></i>", "<i class='fa-solid fa-circle-chevron-right fa-lg' style='font-size:40px'></i>"],
        });
        $('.my-owl-carousel').owlCarousel({
            items: 7,
            lazyLoad: true,
            loop: true,
            margin: 10, loop: true,
            autoplay: true,
            autoplayTimeout: 3000,
            autoplayHoverPause: true,
            nav: true,
            dots: true,
            navText: ["<i class='fa-solid fa-circle-chevron-left fa-lg' style='font-size:40px'></i>", "<i class='fa-solid fa-circle-chevron-right fa-lg' style='font-size:40px'></i>"],
        });
    });</script>
</content>
</body>

</html>
