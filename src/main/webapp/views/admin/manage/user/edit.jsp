<%@ page import="vn.edu.hcmuaf.fit.model.user.User" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.constant.Variable" %>
<%@ page import="vn.edu.hcmuaf.fit.model.common.State" %>
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
    User user = (User) request.getAttribute("u");
    List<State> us = (List<State>) request.getAttribute("us");
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
                <form id="form">
                    <div class="px-4">

                        <div class="table-wrapper">
                            <!--Table-->
                            <table class="table table-hover border">
                                <thead>

                                </thead>
                                <tbody>


                                <tr>
                                    <th>name</th>
                                    <td><input id="input-char-counter1" type="text" name="name"
                                               value="<%=(user.getName()!=null)?user.getName():""%>"
                                               class="form-control">
                                        <label for="input-char-counter1"></label></td>
                                </tr>
                                <tr>
                                    <th>address</th>
                                    <td><input id="input-char-counter2" name="address" type="text"
                                               value="<%=(user.getAddress()!=null)?user.getAddress():""%>"
                                               class="form-control">
                                        <label for="input-char-counter2"></label></td>
                                </tr>
                                <tr>
                                    <th>gender</th>
                                    <td>

                                        <div class="form-check form-check-inline">
                                            <input type="radio" class="form-check-input" id="nam"
                                                   name="gender" data-value-type="number"
                                                   value="1" <%=(user.isGender()) ? "checked" : ""%> >
                                            <label class="form-check-label" for="nam">Nam</label>
                                        </div>

                                        <!-- Material inline 3 -->
                                        <div class="form-check form-check-inline">
                                            <input type="radio" class="form-check-input" id="nu"
                                                   name="gender" data-value-type="number"
                                                   value="0" <%=(!user.isGender()) ? "checked" : ""%>>
                                            <label class="form-check-label" for="nu">Nữ</label>
                                        </div>


                                    </td>
                                </tr>
                                <tr>
                                    <th>email</th>
                                    <td><input id="input-char-counter4" name="email"
                                               type="text" value="<%=(user.getEmail()!=null) ? user.getEmail() : ""%>"
                                               class="form-control">
                                        <label for="input-char-counter4"></label></td>
                                    </td>
                                </tr>
                                <tr>
                                    <th>phone</th>
                                    <td><input id="input-char-counter5" name="phone" type="text"
                                               value="<%=(user.getPhone()!=null) ? user.getPhone() : ""%>"
                                               class="form-control">
                                        <label for="input-char-counter5"></label></td>
                                    </td>
                                </tr>
                                <tr>
                                    <th>active</th>
                                    <td>
                                        <div class="custom-control custom-switch">
                                            <input type="checkbox" name="active" data-value-type="number" value="1"
                                                   data-unchecked-value="0"  <%=(user.isActive()) ? "checked" : ""%>
                                                   class="custom-control-input" id="customSwitches">
                                            <label class="custom-control-label" for="customSwitches"></label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>permission</th>
                                    <td>
                                        <div class="form-check form-check-inline">
                                            <input type="radio" class="form-check-input" id="user"
                                                   name="permission"
                                                   value="USER" <%=(user.getPermission().equals(Variable.Global.USER.toString())) ? "checked" : ""%> >
                                            <label class="form-check-label" for="user">USER</label>
                                        </div>

                                        <!-- Material inline 3 -->
                                        <div class="form-check form-check-inline">
                                            <input type="radio" class="form-check-input" id="admin"
                                                   name="permission"
                                                   value="ADMIN" <%=(user.getPermission().equals(Variable.Global.ADMIN.toString())) ? "checked" : ""%>>
                                            <label class="form-check-label" for="admin">ADMIN</label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>status</th>
                                    <td>
                                        <select data-value-type="number" class="mdb-select md-form" name="user_stateId">
                                            <%

                                                for (State pc : us
                                                ) {
                                            %>
                                            <option <%=(user.getUser_stateId() != null && user.getUser_stateId() == pc.getId()) ? "selected" : ""%>
                                                    value="<%=pc.getId()%>"><%=pc.getName()%>
                                            </option>
                                            <%
                                                }
                                            %>
                                        </select>

                                    </td>
                                </tr>


                                </tbody>
                            </table>
                            <!--Table-->
                        </div>

                    </div>
                </form>

            </div>
            <!-- Table with panel -->
        </div>

    </div>
</main>
<content tag="local_script">
    <script>
        $(document).ready(function () {
            $('.mdb-select').materialSelect();


            $('form#form').submit(function (event) {
                event.preventDefault();
                var form = $(this);
                var j = {};
                j = form.serializeJSON();
                j['id'] = <%=user.getId()%>;
                update(j, "/api/user");
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
