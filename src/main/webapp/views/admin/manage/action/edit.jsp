<%@ page import="vn.edu.hcmuaf.fit.model.user.Action" %>
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

<!--Double navigation-->
<!--/.Double navigation-->
<%
    Action action = (Action) request.getAttribute("action");
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
                        <button type="button" onclick="history.back()"
                                class="btn btn-outline-white btn-rounded btn-sm px-2">
                            <i class="fa-solid fa-arrow-left-long"></i>
                        </button>
                        <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2">
                            <i class="fa-solid fa-xmark"></i>
                        </button>
                    </div>
                    <a href="" class="white-text mx-3 text-uppercase ">sửa thông tin người dùng</a>
                    <div>
                        <button type="button" onclick="location.reload()"
                                class="btn btn-outline-white btn-rounded btn-sm px-2">
                            <i class="fa-solid fa-rotate-left"></i>
                        </button>
                        <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2">
                            <i class="fa-solid fa-repeat"></i>
                        </button>
                        <button type="button" onclick="$('#form').submit()"
                                class="btn btn-outline-white btn-rounded btn-sm px-2">
                            <i class="fa-regular fa-floppy-disk"></i>
                        </button>
                    </div>

                </div>
                <!--/Card image-->

                <div class="px-4">
                    <form id="form">

                        <div class="table-wrapper">
                            <!--Table-->
                            <table class="table table-hover border">
                                <thead>

                                </thead>
                                <tbody>

                                <tr>
                                    <th>code</th>
                                    <td><!-- Material outline counter input -->
                                        <input id="code" type="text" name="code" value="<%=(action.getCode()!=null)?action.getCode():""%>" class="form-control">
                                        <label for="code"></label>
                                </tr>
                                <tr>
                                    <th>group</th>
                                    <td><input id="group" type="text" value="<%=(action.getGroup()!=null)?action.getGroup():""%>" name="group" class="form-control">
                                        <label for="group"></label></td>
                                </tr>

                                </tbody>
                            </table>
                            <!--Table-->
                        </div>
                    </form>
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
                j['id'] = <%=action.getId()%>;
                update(j, "/api/action");
            });

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
