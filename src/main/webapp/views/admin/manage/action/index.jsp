<%@ page import="vn.edu.hcmuaf.fit.model.user.User" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.model.phone.Type" %>
<%@ page import="vn.edu.hcmuaf.fit.model.phone.Brand" %>
<%@ page import="vn.edu.hcmuaf.fit.model.phone.Cap" %>
<%@ page import="vn.edu.hcmuaf.fit.model.phone.Model" %>
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
<%
    List<Action> actions = (List<Action>) request.getAttribute("actions");


%>

<!-- Central Modal Medium Success -->
<div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-notify modal-warning" role="document">
        <!--Content-->
        <div class="modal-content">
            <!--Header-->
            <div class="modal-header">
                <p class="heading lead text-uppercase">thêm quyen</p>

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
                            <th>code</th>
                            <td><input id="code" type="text" name="code"
                                       class="form-control">
                                <label for="code"></label></td>
                        </tr>
                        <tr>
                            <th>group</th>
                            <td><input id="group" name="group" type="text"
                                       class="form-control">
                                <label for="group"></label></td>
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
                        <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2">
                            <i class="fa-solid fa-rotate-left"></i>
                        </button>
                        <button data-toggle="modal" data-target="#add" type="button"
                                class="btn btn-outline-white btn-rounded btn-sm px-2">
                            <i class="fa-solid fa-plus"></i>
                        </button>
                        <button type="button"

                                id="exportjson"
                                class="btn btn-outline-white btn-rounded btn-sm px-2">
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
                                        <th>code</th>
                                        <td class="font-weight-normal align-left-10 detail-code"></td>
                                    </tr>
                                    <tr>
                                        <th>group</th>
                                        <td class="font-weight-normal align-left-10 detail-group"></td>
                                    </tr>
                                    <tr>
                                        <th>Created_at</th>
                                        <td class="font-weight-normal align-left-10 detail-created"></td>
                                    </tr>
                                    <tr>
                                        <th>Updated_at</th>
                                        <td class="font-weight-normal align-left-10 detail-updated"></td>
                                    </tr>

                                    </tbody>
                                </table>

                            </div>
                            <!--Footer-->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline-default text-uppercase"
                                        val="" id="delete">xóa
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
                                    code
                                </th>
                                <th class="th-lg">
                                    group
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
                                for (int i = 0; i < actions.size(); i++
                                ) {

                            %>
                            <tr>
                                <th scope="row">
                                    <input class="form-check-input" name="check" type="checkbox" id="check-<%=i%>">
                                    <label class="form-check-label" for="check-<%=i%>" class="label-table"></label>
                                </th>
                                <td><%=i%>
                                </td>
                                <td><%=actions.get(i).getId()%>
                                </td>
                                <td><%=actions.get(i).getCode()%>
                                </td>
                                <td><%=actions.get(i).getGroup()%>
                                </td>
                                <td><%=actions.get(i).getUpdated_at()%>
                                </td>

                                <td>
                                    <a><i val="<%=actions.get(i).getId()%>"
                                          class="fa-regular fa-eye"></i></a>
                                    <a href="/admin/manage/action/edit?id=<%=actions.get(i).getId()%>"><i
                                            class="far fa-edit"></i></a>
                                    <a href=""><i val="<%=actions.get(i).getId()%>"
                                                  class="far fa-trash-alt"></i></a>
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
    <script src="/js/admin/form.js"></script>

    <script>
        $(document).ready(function () {
            $('.mdb-select').materialSelect();
            $('form#form').submit(function (event) {
                event.preventDefault();
                var form = $(this);
                var j = {};
                j = form.serializeJSON();
                add(j, "/api/action");
            });

            $(' tbody').on('click', 'i.fa-trash-alt', function () {
                data = {

                    id: $(this).attr('val')
                }
                dele(data, "/api/action");
            });

            $('#delete').on('click', function () {
                data = {

                    id: $(this).attr('val')
                }
                dele(data, "/api/action");
            })


            $(' tbody').on('click', 'i.fa-eye', function () {
                view($(this).attr('val'));
            });


            function view(id) {
                $.ajax({
                    type: 'GET', url: "/api/action" + "?id=" + id
                }).done(function (responseText) {
                    $('#viewDetail').modal();
                    $('#viewDetail .detail-id').text(responseText?.id);
                    $('#viewDetail .detail-code').text(responseText?.code);
                    $('#viewDetail .detail-group').text(responseText?.group);
                    $('#viewDetail .detail-created').text(responseText?.created_at);
                    $('#viewDetail .detail-updated').text(responseText?.updated_at);
                    $('#viewDetail #edit').attr('href', '/admin/manage/action/edit?id=' + responseText?.id);
                    $('#viewDetail #delete').attr('val', responseText?.id);
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
