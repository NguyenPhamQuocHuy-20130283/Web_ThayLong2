<%@ page import="vn.edu.hcmuaf.fit.model.phone.Sale" %>
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
    Sale sale = (Sale) request.getAttribute("sale");
%>
<!--Double navigation-->
<!--/.Double navigation-->

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
                    <a href="" class="white-text mx-3 text-uppercase ">sửa thông tin khuyến mãi</a>
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
                        <table class="table table-hover border">
                            <thead>

                            </thead>
                            <tbody>
                            <form id="form">
                                <tr>
                                    <th>Name</th>
                                    <td><!-- Material outline counter input -->
                                        <input id="name" type="text" name="name" class="form-control"
                                               value="<%=(sale.getName()!=null)?sale.getName():""%>">
                                        <label for="name"></label>
                                </tr>
                                <tr>
                                    <th>Desc</th>
                                    <td><input id="desc" type="text" name="desc" class="form-control"
                                               value="<%=(sale.getDesc()!=null)?sale.getDesc():""%>">
                                        <label for="desc"></label></td>
                                </tr>
                                <tr>
                                    <th>start</th>
                                    <td><input
                                            id="start"
                                            type="datetime-local"
                                            name="start_at"
                                            value="<%=(sale.getEnd_at()!=null)?sale.getEnd_at():""%>"/></td>
                                </tr>
                                <tr>
                                    <th>end</th>
                                    <td><input
                                            id="end"
                                            type="datetime-local"
                                            name="end_at"
                                            value="<%=(sale.getEnd_at()!=null)?sale.getEnd_at():""%>"/></td>
                                </tr>
                                <tr>
                                    <th>img</th>
                                    <td>

                                        <input type="file" name="img"
                                               value="<%=(sale.getImg()!=null)?sale.getImg():""%>">
                                    </td>
                                </tr>

                                <tr>
                                    <th>Value</th>
                                    <td><input id="value" data-value-type="number" name="value" class="form-control"
                                               value="<%=(sale.getValue()!=null)?sale.getValue():""%>">
                                        <label for="value"></label></td>
                                </tr>
                                <th>Unit</th>
                                <td><input id="unit" type="text" name="unit" class="form-control"
                                           value="<%=(sale.getUnit()!=null)?sale.getUnit():""%>">
                                    <label for="unit"></label></td>
                                </tr>


                            </form>
                            </tbody>
                        </table>
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


            $('form#form').submit(function (event) {
                event.preventDefault();
                var form = $(this);
                var j = {};
                j = form.serializeJSON();
                j['id'] = <%=sale.getId()%>;
                update(j, "/api/sale");
            })

            // SideNav Initialization
            $(".button-collapse").sideNav({
                slim: true
            });
            new WOW().init();

            $('#dtBasicExample').DataTable();
            $('.dataTables_length').addClass('bs-select');


        })
    </script>
</content>
</body>

</html>
