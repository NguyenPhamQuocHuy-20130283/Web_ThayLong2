<%@ page import="vn.edu.hcmuaf.fit.model.phone.PhoneColor" %>
<%@ page import="vn.edu.hcmuaf.fit.model.phone.Phone" %>
<%@ page import="vn.edu.hcmuaf.fit.model.phone.PhonePromot" %>
<%@ page import="vn.edu.hcmuaf.fit.model.phone.Promot" %>
<%@ page import="java.util.List" %>
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
<body class="fixed-sn mdb-skin">

<!--/.Double navigation-->
<%
    PhonePromot phonePromot = (PhonePromot) request.getAttribute("ppromot");
    Phone phone = (Phone) request.getAttribute("phone");
    List<Promot> promots = (List<Promot>) request.getAttribute("promots");
%>
<!--Main Layout-->
<main class="mt-1">
    <div class="container-fluid panel-scroll">

        <div id="container">
            <!-- Table with panel -->
            <div class="card card-cascade narrower">

                <!--Card image-->
                <div
                        class="view view-cascade gradient-card-header blue-gradient narrower py-2 mx-4 mb-3 d-flex justify-content-between align-items-center">

                    <div>
                        <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2">
                            <i class="fa-solid fa-arrow-left-long"></i>
                        </button>
                        <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2">
                            <i class="fa-solid fa-xmark"></i>
                        </button>
                    </div>

                    <a href="" class="white-text mx-3">CHỈNH SỬA KHUYẾN MÃI</a>

                    <div>
                        <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2">
                            <i class="fa-solid fa-rotate-left"></i>
                        </button>
                        <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2">
                            <i class="fa-solid fa-repeat"></i>
                        </button>
                        <button type="button" onclick="$('form#form').submit()"
                                class="btn btn-outline-white btn-rounded btn-sm px-2">
                            <i class="fa-regular fa-floppy-disk"></i>
                        </button>
                    </div>

                </div>
                <!--/Card image-->

                <div class="px-4">

                    <div class="table-wrapper">
                        <!--Table-->
                        <form id="form">
                            <table class="table table-hover border">
                                <thead>

                                </thead>
                                <tbody>
                                <tr>
                                    <th>PromotId</th>
                                    <td>
                                        <select data-value-type="number" class="  mdb-select mdb-select2 md-form" name="promotId"
                                                searchable="Search and add here..." data-stop-refresh="false">
                                            <%
                                                for (Promot p : promots
                                                ) {

                                            %>
                                            <option <%=(phonePromot.getPromotId() != null && phonePromot.getPromotId() == p.getId()) ? "selected" : ""%>
                                                    value="<%=p.getId()%>"><%=p.getName()%>
                                            </option>
                                            <%}%>
                                        </select>
                                    </td>
                                </tr>

                                <tr>
                                    <th>Start_at</th>
                                    <td>
                                        <input
                                                id="start"
                                                type="datetime-local"
                                                name="start_at"
                                                value="<%=(phonePromot.getStart_at()!=null)?phonePromot.getStart_at():""%>"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>End_at</th>
                                    <td>
                                        <input
                                                id="end"
                                                type="datetime-local"
                                                name="end_at"
                                                value="<%=(phonePromot.getEnd_at()!=null)?phonePromot.getEnd_at():""%>"/>

                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <!--Table-->
                        </form>
                    </div>

                </div>

            </div>
            <!-- Table with panel -->
        </div>

    </div>
</main>
<content tag="local_script">
    <script>
        $(document).ready(function () {

            $('.mdb-select2').materialSelect({});

            $('form#form').submit(function (event) {
                event.preventDefault();
                var form = $(this);
                var j = {};
                j = form.serializeJSON();
                j['phoneId'] = <%=phone.getId()%>;
                update(j, "/api/phone-promot");
            });
        })
    </script>
</content>
</body>

</html>
