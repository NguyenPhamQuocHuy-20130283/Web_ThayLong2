<%@ page import="vn.edu.hcmuaf.fit.model.phone.PhoneCap" %>
<%@ page import="vn.edu.hcmuaf.fit.model.phone.Phone" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.model.phone.Cap" %>
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

<%
    PhoneCap phoneCap = (PhoneCap) request.getAttribute("pcap");
    Phone phone = (Phone) request.getAttribute("phone");
    List<Phone> phones = (List<Phone>) request.getAttribute("phones");
    List<Cap> caps = (List<Cap>) request.getAttribute("caps");
%>
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

                    <a href="" class="white-text mx-3">CHỈNH SỬA BỘ NHỚ</a>

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
                            <table class="table border table-hover">
                                <thead>

                                </thead>
                                <tbody>
                                <tr>
                                    <th>CapId</th>
                                    <td>
                                        <select data-value-type="number" class="  mdb-select mdb-select2 md-form"
                                                name="capId"
                                                searchable="Search and add here..." data-stop-refresh="false">
                                            <%
                                                for (Cap c : caps
                                                ) {

                                            %>
                                            <option <%=(phoneCap.getCapId() != null && phoneCap.getCapId() == c.getId()) ? "selected" : ""%>
                                                    value="<%=c.getId()%>"><%=c.getCap() + " " + c.getUnit()%>
                                            </option>
                                            <%}%>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>phone cap id</th>
                                    <td>
                                        <select data-value-type="number" class="  mdb-select mdb-select2 md-form"
                                                name="phone_capId"
                                                searchable="Search and add here..." data-stop-refresh="false">
                                            <%
                                                for (Phone p : phones
                                                ) {
                                            %>
                                            <option <%=(phoneCap.getPhone_capId() != null && phoneCap.getPhone_capId() == p.getId()) ? "selected" : ""%>
                                                    value="<%=p.getId()%>"><%=p.getName() + " " + p._cap().getCap() + " " + p._cap().getUnit()%>
                                            </option>
                                            <%}%>
                                        </select>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </form>
                        <!--Table-->
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

            $('.mdb-select1').materialSelect({});
            $('.mdb-select2').materialSelect({});

            $('form#form').submit(function (event) {
                event.preventDefault();
                var form = $(this);
                var j = {};
                j = form.serializeJSON();
                j['phoneId'] = <%=phone.getId()%>;
                update(j, "/api/phone-cap");
            });
        })
    </script>
</content>
</body>

</html>
