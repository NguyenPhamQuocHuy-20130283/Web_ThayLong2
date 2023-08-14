<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.model.phone.*" %>
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
    PhoneColor phoneColor = (PhoneColor) request.getAttribute("pcolor");
    Phone phone = (Phone) request.getAttribute("phone");
    List<Color> colors = (List<Color>) request.getAttribute("colors");
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

                    <a href="" class="white-text mx-3">CHỈNH SỬA MÀU</a>

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
                                    <th>ColorId</th>
                                    <td>
                                        <select data-value-type="number" class="  mdb-select mdb-select2 md-form" name="colorId"
                                                searchable="Search and add here..." data-stop-refresh="false">
                                            <%
                                                for (Color c : colors
                                                ) {
                                            %>
                                            <option <%=(phoneColor.getColorId() != null && phoneColor.getColorId() == c.getId()) ? "selected" : ""%>
                                                    value="<%=c.getId()%>"><%=c.getName()%>
                                            </option>
                                            <%}%>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Total</th>
                                    <td><input id="total" type="text" data-value-type="number"
                                               value="<%=(phoneColor.getTotal()!=null)?phoneColor.getTotal():""%>"
                                               name="total" class="form-control">
                                        <label for="total">Input text</label></td>
                                </tr>
                                <tr>
                                    <th>Img</th>
                                    <td>
                                        <input type="file" name="img">
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
                update(j, "/api/phone-color");
            });

        })
    </script>
</content>
</body>

</html>
