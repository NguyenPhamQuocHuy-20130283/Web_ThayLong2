<%@ page import="vn.edu.hcmuaf.fit.model.user.User" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.model.phone.Type" %>
<%@ page import="vn.edu.hcmuaf.fit.model.phone.Brand" %>
<%@ page import="vn.edu.hcmuaf.fit.model.phone.Cap" %>
<%@ page import="vn.edu.hcmuaf.fit.model.phone.Model" %>
<%@ page import="vn.edu.hcmuaf.fit.model.common.State" %>
<%@ page import="vn.edu.hcmuaf.fit.until.SessionUntil" %>
<%@ page import="vn.edu.hcmuaf.fit.constant.Variable" %>
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
<%
    List<User> users = (List<User>) request.getAttribute("users");

    User user = (User) SessionUntil.get(request, Variable.Global.USER.toString());

%>

<!-- Central Modal Medium Success -->
<div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-notify modal-warning" role="document">
        <!--Content-->
        <div class="modal-content">
            <!--Header-->
            <div class="modal-header">
                <p class="heading lead text-uppercase">thêm người dùng</p>

                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true" class="white-text">&times;</span>
                </button>
            </div>
            <form id="form">
                <!--Body-->
                <div class="modal-body">
                    <table class="table table-hover border">
                        <thead>

                        </thead>
                        <tbody>


                        <tr>
                            <th>name</th>
                            <td><input id="input-char-counter1" type="text" name="name" length="10"
                                       class="form-control">
                                <label for="input-char-counter1"></label></td>
                        </tr>
                        <tr>
                            <th>address</th>
                            <td><input id="input-char-counter2" name="address" type="text" length="10"
                                       class="form-control">
                                <label for="input-char-counter2"></label></td>
                        </tr>
                        <tr>
                            <th>gender</th>
                            <td>

                                <div class="form-check form-check-inline">
                                    <input type="radio" class="form-check-input" id="nam"
                                           name="gender" data-value-type="number" value="1" checked>
                                    <label class="form-check-label" for="nam">Nam</label>
                                </div>

                                <!-- Material inline 3 -->
                                <div class="form-check form-check-inline">
                                    <input type="radio" class="form-check-input" id="nu"
                                           name="gender" data-value-type="number" value="0">
                                    <label class="form-check-label" for="nu">Nữ</label>
                                </div>


                            </td>
                        </tr>
                        <tr>
                            <th>email</th>
                            <td><input id="input-char-counter4" name="email" type="text" length="10"
                                       class="form-control">
                                <label for="input-char-counter4"></label></td>
                            </td>
                        </tr>
                        <tr>
                            <th>phone</th>
                            <td><input id="input-char-counter5" name="phone" type="text" length="10"
                                       class="form-control">
                                <label for="input-char-counter5"></label></td>
                            </td>
                        </tr>
                        <tr>
                            <th>password</th>
                            <td><input id="pass" name="password" type="password"
                                       class="form-control">
                                <label for="pass"></label></td>
                            </td>
                        </tr>
                        <tr>
                            <th>active</th>
                            <td>
                                <div class="custom-control custom-switch">
                                    <input type="checkbox" name="active" data-value-type="number" value="1"
                                           data-unchecked-value="0" checked
                                           class="custom-control-input" id="customSwitches">
                                    <label class="custom-control-label" for="customSwitches"></label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>enable</th>
                            <td>
                                <div class="custom-control custom-switch">
                                    <input type="checkbox" name="enable" data-value-type="number" value="1"
                                           data-unchecked-value="0" checked
                                           class="custom-control-input" id="customSwitches2">
                                    <label class="custom-control-label" for="customSwitches2"></label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>permission</th>
                            <td>
                                <div class="form-check form-check-inline">
                                    <input type="radio" class="form-check-input" id="user"
                                           name="permission" value="USER" checked>
                                    <label class="form-check-label" for="user">USER</label>
                                </div>

                                <!-- Material inline 3 -->
                                <div class="form-check form-check-inline">
                                    <input type="radio" class="form-check-input" id="admin"
                                           name="permission" value="ADMIN">
                                    <label class="form-check-label" for="admin">ADMIN</label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>status</th>
                            <td>
                                <select data-value-type="number" class="mdb-select md-form" name="user_stateId">
                                    <%
                                        List<State> us = (List<State>) request.getAttribute("us");
                                        for (int i = 0; i < us.size(); i++) {

                                    %>
                                    <option <%=(i == 0) ? "selected" : ""%>
                                            value="<%=us.get(i).getId()%>"><%=us.get(i).getName()%>
                                    </option>
                                    <%
                                        }
                                    %>
                                </select>

                            </td>
                        </tr>


                        </tbody>
                    </table>
                </div>
            </form>
            <!--Footer-->
            <div class="modal-footer justify-content-center">
                <a type="button" onclick="$('#form').submit()"
                   class="btn btn-warning text-uppercase  ">tạo</a>
                <a type="button" class="btn btn-outline-warning waves-effect text-uppercase  "
                   data-dismiss="modal">Hủy</a>
            </div>
        </div>
        <!--/.Content-->
    </div>
</div>
<!-- Central Modal Medium Success -->
<!-- Central Modal Medium Success-->
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

                    <a href="" class="white-text mx-3 text-uppercase ">danh sách người dùng</a>

                    <div>
                        <button type="button" onclick="location.reload()"
                                class="btn btn-outline-white btn-rounded btn-sm px-2">
                            <i class="fa-solid fa-rotate-left"></i>
                        </button>
                        <button data-toggle="modal" data-target="#add" type="button"
                                class="btn btn-outline-white btn-rounded btn-sm px-2">
                            <i class="fa-solid fa-plus"></i>
                        </button>
                        <button type="button" id="exportjson" class="btn btn-outline-white btn-rounded btn-sm px-2">
                            <i class="fa-solid fa-file-arrow-down"></i>
                        </button>
                        <button type="button" id="exportcsv" class="btn btn-outline-white btn-rounded btn-sm px-2">
                            <i class="fa-solid fa-file-csv"></i>
                        </button>
                        <button type="button" id="exportpdf" class="btn btn-outline-white btn-rounded btn-sm px-2">
                            <i class="fa-solid fa-file-pdf"></i>
                        </button>
                    </div>

                </div>
                <!--/Card image-->

                <!-- Modal: modalCart -->
                <div class="modal fade" id="viewDetail" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog-scrollable modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <!--Header-->
                            <div class="modal-header">
                                <h4 class="modal-title" id="myModalLabel">thông tin chi tiết</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <!--Body-->
                            <div class="modal-body">

                                <table class="table table-hover border">
                                    <thead>

                                    </thead>
                                    <tbody>

                                    <tr>
                                        <th>id</th>
                                        <td class="font-weight-normal align-left-10 detail-id"></td>
                                    </tr>
                                    <tr>
                                        <th>Name</th>
                                        <td class="font-weight-normal align-left-10 detail-name"></td>
                                    </tr>
                                    <tr>
                                        <th>Phone</th>
                                        <td class="font-weight-normal align-left-10 detail-phone"></td>
                                    </tr>
                                    <tr>
                                        <th>Address</th>
                                        <td class="font-weight-normal align-left-10 detail-addess"></td>
                                    </tr>
                                    <tr>
                                        <th>Gender</th>
                                        <td class="font-weight-normal align-left-10 detail-gender"></td>
                                    </tr>
                                    <tr>
                                        <th>email</th>
                                        <td class="font-weight-normal align-left-10 detail-email"></td>
                                    </tr>
                                    <tr>
                                        <th>Avatar</th>
                                        <td class="font-weight-normal align-left-10 detail-avatar"></td>
                                    </tr>
                                    <tr>
                                        <th>Created_at</th>
                                        <td class="font-weight-normal align-left-10 detail-created"></td>
                                    </tr>
                                    <tr>
                                        <th>Updated_at</th>
                                        <td class="font-weight-normal align-left-10 detail-updated"></td>
                                    </tr>
                                    <tr>
                                        <th>Active</th>
                                        <td class="font-weight-normal align-left-10 detail-active"></td>
                                    </tr>
                                    <tr>
                                        <th>enable</th>
                                        <td class="font-weight-normal align-left-10 detail-enable"></td>
                                    </tr>
                                    <th>Permission</th>
                                    <td class="font-weight-normal align-left-10 detail-permission"></td>
                                    </tr>
                                    <tr>
                                        <th>Status</th>
                                        <td class="font-weight-normal align-left-10 detail-status"></td>
                                    </tr>

                                    </tbody>
                                </table>

                            </div>
                            <!--Footer-->
                            <div class="modal-footer">
                                <button type="button" val="" class="btn btn-outline-default text-uppercase"
                                        id="delete">xóa
                                </button>
                                <a href="" id="edit" class="btn btn-default text-uppercase">chỉnh
                                    sửa</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal: modalCart -->
                <!--Modal: modalConfirmDelete-->
                <!--Modal: modalConfirmDelete-->
                <div class="px-4">

                    <div class="table-wrapper">
                        <!--Table-->
                        <table id="detail" class="table border table-hover mb-0">

                            <!--Table head-->
                            <thead>
                            <tr>
                                <th>
                                    <input class="form-check-input" type="checkbox" id="checkbox">
                                    <label class="form-check-label" for="checkbox" class="mr-2 label-table"></label>
                                </th>
                                <th class="th-sm">
                                    #
                                </th>
                                <th class="th-sm">
                                    id
                                </th>
                                <th class="th-lg">
                                    name
                                </th>
                                <th class="th-lg">
                                    phone
                                </th>
                                <th class="th-lg">
                                    permission
                                </th>
                                <th class="th-lg">

                                    updated_at
                                </th>
                                <th class="th-lg">

                                    action
                                </th>
                            </tr>
                            </thead>
                            <!--Table head-->

                            <!--Table body-->
                            <tbody>
                            <%
                                for (int i = 0; i < users.size(); i++
                                ) {

                            %>
                            <tr>
                                <th scope="row">
                                    <input class="form-check-input" name="check" type="checkbox" id="check-<%=i%>">
                                    <label class="form-check-label" for="check-<%=i%>" class="label-table"></label>
                                </th>
                                <td><%=i%>
                                </td>
                                <td><%=users.get(i).getId()%>
                                </td>
                                <td><%=users.get(i).getName()%>
                                </td>
                                <td><%=users.get(i).getPhone()%>
                                </td>
                                <td><%=users.get(i).getPermission()%>
                                </td>
                                <td><%=users.get(i).getUpdated_at()%>
                                </td>

                                <td>
                                    <a><i val="<%=users.get(i).getId()%>"
                                          class="fa-regular fa-eye"></i></a>
                                    <a href="/admin/manage/user/edit?id=<%=users.get(i).getId()%>"><i
                                            class="far fa-edit"></i></a>
                                    <a><i val="<%=users.get(i).getId()%>"
                                          class="far fa-trash-alt"></i></a>
                                    <a href="/admin/manage/user?id=<%=users.get(i).getId()%>"> <i
                                            class="fa-solid fa-up-right-from-square mr-1"></i></a>
                                </td>

                            </tr>
                            <%}%>
                            </tbody>
                            <!--Table body-->
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
    <script src="/src/js/admin/form.js"></script>
    <script>
        $(document).ready(function () {


            $('form#form-add').submit(function (event) {
                event.preventDefault(); // Prevent the form from submitting via the browser
                var form = $(this);
                var j = {};
                j = form.serializeJSON();
                add(j, "/api/user");
            });

            $(' tbody').on('click', 'i.fa-trash-alt ', function () {
                data = {
                    id: $(this).attr('val'),
                    deleted_by:<%=user.getId()%>
                }
                dele(data, "/api/user");
            });
            $('#delete').on('click', function () {
                data = {
                    id: $(this).attr('val'),
                    deleted_by:<%=user.getId()%>
                }
                dele(data, "/api/user");
            })


            $(' tbody').on('click', 'i.fa-eye', function () {
                view($(this).attr('val'));
            });


            function view(id) {
                $.ajax({
                    type: 'GET', url: "/api/user" + "?id=" + id


                }).done(function (responseText) {
                    $('#viewDetail').modal();
                    $('#viewDetail .detail-id').text(responseText.id);
                    $('#viewDetail .detail-name').text(responseText.name);
                    $('#viewDetail .detail-phone').text(responseText.phone);
                    $('#viewDetail .detail-address').text(responseText.address);
                    $('#viewDetail .detail-gender').text(responseText.gender);
                    $('#viewDetail .detail-email').text(responseText.email);
                    $('#viewDetail .detail-created').text(responseText.created_at);
                    $('#viewDetail .detail-updated').text(responseText.updated_at);
                    $('#viewDetail .detail-active').text(responseText.active);
                    $('#viewDetail .detail-enable').text(responseText.enable);
                    $('#viewDetail .detail-permission').text(responseText.permission);
                    $('#viewDetail .detail-status').text(responseText.user_stateId);
                    $('#viewDetail #edit').attr('href', '/admin/manage/user/edit?id=' + responseText.id);
                    $('#viewDetail #delete').attr('val', responseText.id);
                }).fail(function (jqXHR, status, error) {
                    if (jqXHR.status !== 500) {
                        warningAlert('Lỗi liệu lỗi');
                    } else warningAlert("Xảy ra lỗi. <br/>Vui lòng liên hệ Admin.");
                })
            }

            $('table#detail').DataTable({
                "scrollY": "100vh",
                "scrollCollapse": true,
                "paging": true,
                "pagingType": "full_numbers"
            });
            $('.dataTables_length').addClass('bs-select');
            // SideNav Initialization


        })
    </script>
</content>
</body>

</html>
