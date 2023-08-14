<%@ page import="vn.edu.hcmuaf.fit.model.user.PermissionAction" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.model.user.User" %>
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
<!-- Central Modal Medium Success -->
<%
    List<PermissionAction> permissionActionList = (List<PermissionAction>) request.getAttribute("actions");
    User user = (User) request.getAttribute("user");
    List<Action> actions = (List<Action>) request.getAttribute("actions1");
%>
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

            <form id="form-add">
                <div class="modal-body">
                    <table class="table table-hover border">
                        <thead>
                        </thead>
                        <tbody>


                        <select type="text" class="mdb-select md-form" name="actionId">
                            <%

                                for (Action pc : actions
                                ) {
                            %>
                            <option value="<%=pc.getId()%>"><%=pc.getGroup()%>
                            </option>
                            <%
                                }
                            %>
                        </select>
                        <tr>
                            <th>active</th>
                            <td>
                                <div class="custom-control custom-switch">
                                    <input type="checkbox" name="licensed" class="custom-control-input"
                                           data-value-type="number" value="1" id="licensed" data-unchecked-value="0">
                                    <label class="custom-control-label" for="licensed"></label>
                                </div>
                            </td>
                        </tr>


                        </tbody>
                    </table>
                </div>
            </form>
            <!--Footer-->
            <div class="modal-footer justify-content-center">
                <a type="button" onclick="$('form#form-add').trigger('submit')"
                   class="btn btn-warning text-uppercase  ">tạo</a>
                <a type="button" class="btn btn-outline-warning waves-effect text-uppercase  "
                   data-dismiss="modal">Hủy</a>
            </div>
        </div>
        <!--/.Content-->
    </div>
</div>
<!-- Central Modal Medium Success -->
<div class="modal fade" id="centralModalSuccess" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-notify modal-success" role="document">
        <!--Content-->
        <div class="modal-content">
            <!--Header-->
            <div class="modal-header">
                <p class="heading lead">Modal Success</p>

                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true" class="white-text">&times;</span>
                </button>
            </div>

            <!--Body-->
            <div class="modal-body">
                <div class="text-center">
                    <i class="fas fa-check fa-4x mb-3 animated rotateIn"></i>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit iusto nulla aperiam blanditiis
                        ad consequatur in dolores culpa, dignissimos, eius non possimus fugiat. Esse ratione fuga, enim,
                        ab officiis totam.</p>
                </div>
            </div>

            <!--Footer-->
            <div class="modal-footer justify-content-center">
                <a type="button" class="btn btn-success">Get it now <i class="far fa-gem ml-1 text-white"></i></a>
                <a type="button" class="btn btn-outline-success waves-effect" data-dismiss="modal">No, thanks</a>
            </div>
        </div>
        <!--/.Content-->
    </div>
</div>
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
                        <button type="button" onclick="history.back()"
                                class="btn btn-outline-white btn-rounded btn-sm px-2">
                            <i class="fa-solid fa-arrow-left-long"></i>
                        </button>
                        <a href="/admin/manage/user" class="btn btn-outline-white btn-rounded btn-sm px-2">
                            <i class="fa-solid fa-xmark"></i>
                        </a>
                    </div>

                    <a href="" class="white-text mx-3 text-uppercase ">danh sách quyen <%=user.getName()%>
                    </a>

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
                                        <th>licensed</th>
                                        <td class="font-weight-normal align-left-10 detail-licensed"></td>
                                    </tr>
                                    <tr>
                                        <th>userId</th>
                                        <td class="font-weight-normal align-left-10 detail-userId"></td>
                                    </tr>
                                    <tr>
                                        <th>actionId</th>
                                        <td class="font-weight-normal align-left-10 detail-actionId"></td>
                                    </tr>
                                    <tr>
                                        <th>created_at</th>
                                        <td class="font-weight-normal align-left-10 detail-created_at"></td>
                                    </tr>
                                    <tr>
                                        <th>updated_at</th>
                                        <td class="font-weight-normal align-left-10 detail-updated_at"></td>
                                    </tr>

                                    </tbody>
                                </table>

                            </div>
                            <!--Footer-->
                            <div class="modal-footer">
                                <button type="button" val="" val2="" class="btn btn-outline-default text-uppercase"
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
                <div class="modal fade" id="modalConfirmDelete" tabindex="-1" role="dialog"
                     aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog modal-sm modal-notify modal-danger" role="document">
                        <!--Content-->
                        <div class="modal-content text-center">
                            <!--Header-->
                            <div class="modal-header d-flex justify-content-center">
                                <p class="heading">Are you sure?</p>
                            </div>

                            <!--Body-->
                            <div class="modal-body">

                                <i class="fas fa-times fa-4x animated rotateIn"></i>

                            </div>

                            <!--Footer-->
                            <div class="modal-footer flex-center">
                                <a href="" class="btn  btn-outline-danger">Yes</a>
                                <a type="button" class="btn  btn-danger waves-effect" data-dismiss="modal">No</a>
                            </div>
                        </div>
                        <!--/.Content-->
                    </div>
                </div>
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
                                    active
                                </th>
                                <th class="th-lg">
                                    key
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
                                for (int i = 0; i < permissionActionList.size(); i++) {


                            %>
                            <tr>
                                <th scope="row">
                                    <input class="form-check-input" name="check" type="checkbox" id="check-<%=i%>">
                                    <label class="form-check-label" for="check-<%=i%>" class="label-table"></label>
                                </th>
                                <td><%=i%>
                                </td>
                                <td>
                                    <div class="custom-control custom-switch">
                                        <input type="checkbox" name="licensed" class="custom-control-input"
                                               value="<%=permissionActionList.get(i).getActionId()%>"
                                               id="licensed-<%=i%>" <%=(permissionActionList.get(i).isLicensed())?"checked":""%>
                                               readonly>
                                        <label class="custom-control-label" for="licensed-<%=i%>"></label>
                                    </div>

                                </td>
                                <td><%=permissionActionList.get(i)._action().getCode()%>
                                </td>
                                <td><%=permissionActionList.get(i)._action().getGroup()%>
                                </td>
                                <td><%=permissionActionList.get(i).getUpdated_at()%>
                                </td>
                                <td>
                                    <a><i val="<%=permissionActionList.get(i).getUserId()%>"
                                          val2="<%=permissionActionList.get(i).getActionId()%>"
                                          class="fa-regular fa-eye"></i></a>
                                    <a href="/admin/manage/user/edit?userId=<%=user.getId()%>&actionId=<%=permissionActionList.get(i).getActionId()%>"><i
                                            class="far fa-edit"></i></a>
                                    <a><i val="<%=user.getId()%>"
                                          val2="<%=permissionActionList.get(i).getActionId()%>"
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
            $('form#form-add').submit(function (event) {
                event.preventDefault(); // Prevent the form from submitting via the browser
                var form = $(this);
                var j = {};
                j = form.serializeJSON();
                j['userId'] = <%=user.getId()%>;
                add(j, "/api/permission-action");
            });
            $(' tbody').on('click', 'i.fa-trash-alt', function () {
                data = {
                    userId: $(this).attr('val'),
                    actionId: $(this).attr('val2')
                }
                dele(data, "/api/permission-action");
            });
            $('#delete').on('click', function () {
                data = {
                    userId: $(this).attr('val'),
                    actionId: $(this).attr('val2')
                }
                dele(data, "/api/permission-action");
            })


            $(' tbody').on('click', 'i.fa-eye', function () {
                view($(this).attr('val'), $(this).attr('val2'));
            });


            function view(userId, actionId) {
                $.ajax({
                    type: 'GET', url: "/api/permission-action?userId=" + userId + "&actionId=" + actionId

                }).done(function (responseText) {
                    $('#viewDetail').modal();
                    $('#viewDetail .detail-userId').text(responseText.userId);
                    $('#viewDetail .detail-actionId').text(responseText.actionId);
                    $('#viewDetail .detail-licensed').text(responseText.licensed);
                    $('#viewDetail .detail-created_at').text(responseText.created_at);
                    $('#viewDetail .detail-updated_at').text(responseText.updated_at);
                    $('#viewDetail #edit').attr('href', '/admin/manage/user/edit?userId=' + responseText.userId + '&actionId=' + responseText.actionId);
                    $('#viewDetail #delete').attr('val', responseText.userId);
                    $('#viewDetail #delete').attr('val2', responseText.actionId);
                }).fail(function (jqXHR, status, error) {
                    if (jqXHR.status !== 500) {
                        warningAlert('Lỗi liệu lỗi');
                    } else warningAlert("Xảy ra lỗi. <br/>Vui lòng liên hệ Admin.");
                })
            }


            $("#btnDelete").click(function () {
                var data = {};
                var ids = $('tbody input[type=checkbox]:checked').map(function () {
                    return $(this).val();
                }).get();
                data['ids'] = ids;
                deleteNew(data);
            });


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
