<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/lib/mdb4/css/bootstrap.min.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/lib/mdb4/css/mdb.min.css'/>">
    <link rel="stylesheet" type="text/css"
          href="<c:url value='/lib/fa6/fontawesome-free-6.2.0-web/css/fontawesome.min.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/lib/fa6/fontawesome-free-6.2.0-web/css/all.css'/>">


</head>

<body>


<main>
    <div class="container">
        <section class="my-5">
            <div class="row">
                <div class=" col-xl-6 mx-auto ">
                    <div class=" text-center dark-grey-text  text-center  ">
                        <img src="https://fptshop.com.vn/Content/v4/error/images/bn.png" alt="Error 404"
                             class="img-fluid mb-4">

                        <h3 class="font-weight-bold text-danger">RẤT TIẾC, TRANG BẠN TÌM KIẾM KHÔNG TỒN TẠI.

                        </h3>
                        <div class="input-group lg-form form-sm form-2 pl-0">
                            <form action="/phone-filter" id="search" style="width: 80%">
                                <input hidden name="sort" value="sap xep theo A - Z">
                                <input hidden name="page" value="1">
                                <input type="text" class="form-control "
                                       placeholder="Tìm kiếm sản phẩm"
                                       aria-label="Recipient's username" aria-describedby="basic-addon2" name="search">
                            </form>
                            <div class="input-group-append">
    <span class="input-group-text red lighten-3" id="basic-text1">
        <a
                onclick="document.getElementById('search').submit()"> <i class="fas fa-search text-grey"
                                                                         aria-hidden="true"></i></a>
       </span>
                            </div>

                        </div>
                        <div>
                            <br/>
                            <span>

                        Gọi ngay 1800 6601 (miễn phí cuộc gọi) để được trợ giúp!
                          <br/>
                               <br/>
                            HOẶC

                        </span>

                        </div>
                        <br/>
                        <a href="/" class="btn btn-lg px-5 btn-outline-danger ">quay ve tran chu</a>
                    </div>

                </div>

            </div>

        </section>


    </div>

</main>

<script type="text/javascript" src="<c:url value='/lib/mdb4/js/jquery.min.js'/>"></script>
<script src="<c:url value='/lib/mdb4/js/popper.min.js'/>"></script>
<script src="<c:url value='/lib/mdb4/js/mdb.min.js'/>"></script>
<script src="<c:url value='/lib/mdb4/js/bootstrap.min.js'/>"></script>
</body>

</html>
