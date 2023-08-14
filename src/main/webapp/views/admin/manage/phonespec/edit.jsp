<%@ page import="vn.edu.hcmuaf.fit.model.phone.PhoneColor" %>
<%@ page import="vn.edu.hcmuaf.fit.model.phone.Phone" %>
<%@ page import="vn.edu.hcmuaf.fit.model.phone.PhoneSpec" %>
<%@ page import="vn.edu.hcmuaf.fit.model.phone.Spec" %>
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
<%
    PhoneSpec phoneSpec = (PhoneSpec) request.getAttribute("pspec");
    Phone phone = (Phone) request.getAttribute("phone");
    List<Spec> specs = (List<Spec>) request.getAttribute("specs");
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

                    <a href="" class="white-text mx-3">CHỈNH SỬA THÔNG SỐ</a>

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
                                    <th>SpecId</th>
                                    <td>
                                        <select data-value-type="number" class="  mdb-select  md-form"
                                                name="specId"
                                                searchable="Search and add here..." data-stop-refresh="false">
                                            <%
                                                for (Spec s : specs
                                                ) {

                                            %>
                                            <option <%=(phoneSpec.getSpecId() != null && phoneSpec.getSpecId() == s.getId()) ? "selected" : ""%>
                                                    value="<%=s.getId()%>"><%=s.getName()%>
                                            </option>
                                            <%}%>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Value</th>
                                    <td><input id="value" type="text"
                                               value="<%=(phoneSpec.getValue()!=null)?phoneSpec.getValue():""%>"
                                               name="value" class="form-control">
                                        <label for="value"> </label></td>
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

            $('.mdb-select').materialSelect({});

            $('form#form').submit(function (event) {
                event.preventDefault();
                var form = $(this);
                var j = {};
                j = form.serializeJSON();
                j['phoneId'] = <%=phone.getId()%>;
                update(j, "/api/phone-spec");
            });
        })
    </script>
</content>
</body>

</html>
