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
    List<Image> iamges = (List<Image>) request.getAttribute("pimage");
    Phone phone = (Phone) request.getAttribute("phone");

%>
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
                        <th>phoneId</th>
                        <td class="font-weight-normal align-left-10 detail-phoneId"></td>
                    </tr>
                    <tr>
                        <th>id</th>
                        <td class="font-weight-normal align-left-10 detail-id"></td>
                    </tr>
                    <tr>
                        <th>link</th>
                        <td class="font-weight-normal align-left-10 ">

                            <img width="50" height="50" src="" class="detail-link">
                        </td>
                    </tr>
                    <tr>
                        <th>desc</th>
                        <td class="font-weight-normal align-left-10 detail-desc"></td>
                    </tr>
                    <tr>

                        <th>created_at</th>
                        <td class="font-weight-normal align-left-10 detail-created"></td>
                    </tr>
                    <tr>
                        <th> updated_at</th>
                        <td class="font-weight-normal align-left-10 detail-updated"></td>
                    </tr>
                    <tr>
                    </tbody>
                </table>

            </div>
            <!--Footer-->
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-default text-uppercase" id="delete" val="">
                    xoa
                </button>
                <a href="" id="edit" class="btn btn-default text-uppercase edit">chỉnh sửa</a>
            </div>
        </div>

    </div>
</div>
<div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-notify modal-warning" role="document">
        <!--Content-->
        <div class="modal-content">
            <!--Header-->
            <div class="modal-header">
                <p class="heading lead text-uppercase">thêm </p>

                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true" class="white-text">&times;</span>
                </button>
            </div>

            <!--Body-->
            <div class="modal-body">
                <form id="form-add" enctype="multipart/form-data">
                    <table class="table table-hover border">
                        <thead>

                        </thead>
                        <tbody>


                        <tr>
                            <th>link</th>
                            <td>
                                <div class="mb-6">
                                    <label class="block mb-2 text-sm font-medium text-gray-900" for="images">Upload
                                        image</label>
                                    <input id="images"
                                    <%--                                           accept="image/png, image/jpeg"--%>
                                           type="file" name="link"
                                           multiple
                                           class="block w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 cursor-pointer dark:text-gray-400 focus:outline-none focus:border-transparent">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>desc</th>
                            <td><input id="desc" type="text" name="desc" class="form-control">
                                <label for="desc"></label></td>
                        </tr>
                        <input id="phoneId" hidden value="<%=phone.getId()%>" type="text" name="phoneId"
                               class="form-control">

                        </tbody>
                    </table>
                </form>
            </div>

            <!--Footer-->
            <div class="modal-footer justify-content-center">
                <a type="button" onclick="$('#form-add').submit()" class="btn btn-warning text-uppercase  ">tạo</a>
                <a type="button" class="btn btn-outline-warning waves-effect text-uppercase  "
                   data-dismiss="modal">Hủy</a>
            </div>
        </div>
        <!--/.Content-->
    </div>
</div>

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

                    <a href="" class="white-text mx-3">DANH SÁCH MÀU</a>

                    <div>
                        <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2">
                            <i class="fa-solid fa-rotate-left"></i>
                        </button>
                        <button data-toggle="modal" data-target="#add" type="button"
                                class="btn btn-outline-white btn-rounded btn-sm px-2">
                            <i class="fa-solid fa-plus"></i>
                        </button>
                        <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2">
                            <i class="fa-solid fa-file-arrow-down"></i>
                        </button>
                    </div>

                </div>
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
                                <th class="th-sm">
                                    desc
                                </th>
                                <th class="th-lg">
                                    link
                                </th>
                                <th class="th-lg">
                                    update
                                </th>
                                <th class="th-lg">
                                    Action
                                </th>
                            </tr>
                            </thead>
                            <!--Table head-->

                            <!--Table body-->
                            <tbody>

                            <%
                                for (int i = 0; i < iamges.size(); i++) {

                            %>

                            <tr>
                                <th scope="row">
                                    <input class="form-check-input" type="checkbox"
                                           id="checkbox-<%=iamges.get(i).getId()%>">
                                    <label class="form-check-label" for="checkbox-<%=iamges.get(i).getId()%>"
                                           class="label-table"></label>
                                </th>
                                <td><%=i%>
                                </td>
                                <td><%=iamges.get(i).getId()%>
                                </td>
                                <td><%=iamges.get(i).getDesc()%>
                                </td>
                                <td><img width="50" height="50" src="<%=iamges.get(i).getLink()%>">
                                </td>
                                <td><%=iamges.get(i).getUpdated_at()%>
                                </td>

                                <td>
                                    <a><i val="<%=iamges.get(i).getId()%>"
                                          class="fa-regular fa-eye"></i></a>
                                    <a href="/admin/manage/phoneimage/edit?id=<%=iamges.get(i).getId()%>"><i
                                            class="far fa-edit"></i></a>

                                    <a><i val="<%=iamges.get(i).getId()%>"
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

            $('form#form-add').submit(function (event) {
                event.preventDefault();
                $.ajax({
                    method: "POST",
                    url: "/api/image",
                    miniType: "multipart/form-data",
                    data: new FormData(document.getElementById("form-add")),
                    cache: false,
                    contentType: false,
                    processData: false,
                }).done(function (data) {
                  alert('thanh cong')
                })
            });

            $(' tbody').on('click', 'i.fa-trash-alt', function () {
                data = {

                    id: $(this).attr('val')
                }
                dele(data, "/api/image");
            });
            $('#delete').on('click', function () {
                data = {

                    id: $(this).attr('val')
                }
                dele(data, "/api/image");
            })


            $(' tbody').on('click', 'i.fa-eye', function () {
                view($(this).attr('val'));
            });


            function view(id) {
                $.ajax({
                    type: 'GET', url: "/api/image" + "?id=" + id
                }).done(function (responseText) {
                    $('#viewDetail').modal();
                    $('#viewDetail .detail-id').text(responseText.id);
                    $('#viewDetail .detail-link').attr('src', responseText.link);
                    $('#viewDetail .detail-desc').text(responseText.desc);
                    $('#viewDetail .detail-phoneId').text(responseText.phoneId);
                    $('#viewDetail .detail-created').text(responseText.created_at);
                    $('#viewDetail .detail-updated').text(responseText.updated_at);
                    $('#viewDetail #edit').attr('href', '/admin/manage/phoneimage/edit?id=' + responseText.id);
                    $('#viewDetail #delete').attr('val', responseText.id);
                }).fail(function (jqXHR, status, error) {
                    if (jqXHR.status !== 500) {
                        warningAlert('Lỗi liệu lỗi');
                    } else warningAlert("Xảy ra lỗi. <br/>Vui lòng liên hệ Admin.");
                })
            }

            $('.mdb-select').materialSelect({});
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
