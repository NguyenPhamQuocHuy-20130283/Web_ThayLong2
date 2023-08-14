<%@ page import="java.util.List" %>
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
    List<Sale> listSale = (List<Sale>) request.getAttribute("sales");
%>
<!--Double navigation-->


<!--Double navigation-->
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
                <form id="form">
                    <table class="table table-hover border">
                        <thead>

                        </thead>
                        <tbody>


                        <tr>
                            <th>name</th>
                            <td><input id="name" type="text" name="name" class="form-control">
                                <label for="name"></label></td>
                        </tr>
                        <tr>
                            <th>desc</th>
                            <td><input id="desc" type="text" name="desc" class="form-control">
                                <label for="desc"></label></td>
                        </tr>
                        <tr>
                            <th>img</th>
                            <td><input id="img" type="file" name="img" class="form-control">
                                <label for="img"></label></td>
                        </tr>
                        <tr>
                            <th>start_at</th>
                            <td><input
                                    id="start"
                                    type="datetime-local"
                                    name="start_at"
                            /></td>
                        </tr>
                        <tr>
                            <th>end at</th>
                            <td><input
                                    id="end"
                                    type="datetime-local"
                                    name="end_at"
                            /></td>
                        </tr>
                        <tr>
                            <th>value</th>
                            <td><input id="value" data-value-type="number" type="number" name="value"
                                       class="form-control">
                                <label for="value"></label></td>
                        </tr>
                        <tr>
                            <th>unit</th>
                            <td><input id="unit" type="text" name="unit" class="form-control">
                                <label for="unit"></label></td>
                        </tr>

                        </tbody>
                    </table>
                </form>
            </div>

            <!--Footer-->
            <div class="modal-footer justify-content-center">
                <a type="button" onclick="$('#form').submit()" class="btn btn-warning text-uppercase  ">tạo</a>
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

                    <a href="" class="white-text mx-3 text-uppercase ">danh sách khuyến mãi</a>

                    <div>
                        <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2">
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
                                        <th>desc</th>
                                        <td class="font-weight-normal align-left-10 detail-desc"></td>
                                    </tr>
                                    <tr>
                                        <th>value</th>
                                        <td class="font-weight-normal align-left-10 detail-value"></td>
                                    </tr>
                                    <tr>
                                        <th>unit</th>
                                        <td class="font-weight-normal align-left-10 detail-unit"></td>
                                    </tr>
                                    <tr>
                                        <th>img</th>
                                        <td class="font-weight-normal align-left-10 detail-img"></td>
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

                                        <th>start_at</th>
                                        <td class="font-weight-normal align-left-10 detail-start"></td>
                                    </tr>
                                    <tr>
                                        <th> end_at</th>
                                        <td class="font-weight-normal align-left-10 detail-end"></td>
                                    </tr>
                                    <tr>
                                    </tbody>
                                </table>

                            </div>
                            <!--Footer-->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline-default text-uppercase" id="delete" val="">
                                    close
                                </button>
                                <a href="" id="edit" class="btn btn-default text-uppercase edit">chỉnh sửa</a>
                            </div>
                        </div>

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
                                    id
                                </th>
                                <th class="th-lg">
                                    name
                                </th>
                                <th class="th-lg">
                                    desc
                                </th>
                                <th class="th-lg">
                                    img
                                </th>
                                <th class="th-lg">

                                    value
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
                                for (int i = 0; i < listSale.size(); i++) {


                            %>
                            <tr>
                                <th scope="row">
                                    <input class="form-check-input" type="checkbox" id="checkbox1">
                                    <label class="form-check-label" for="checkbox1" class="label-table"></label>
                                </th>
                                <td><%=i%>
                                </td>
                                <td><%=listSale.get(i).getId()%>
                                </td>
                                <td><%=listSale.get(i).getName()%>
                                </td>
                                <td><%=listSale.get(i).getDesc()%>
                                </td>
                                <td><img style="height: 50px;" src="<%=listSale.get(i).getImg()%>"></td>
                                <td><%=listSale.get(i).getValue()%>
                                </td>
                                <td>
                                    <a><i val="<%=listSale.get(i).getId()%>"
                                          class="fa-regular fa-eye"></i></a>
                                    <a href="/admin/manage/sale/edit?id=<%=listSale.get(i).getId()%>"><i
                                            class="far fa-edit"></i></a>

                                    <a><i val="<%=listSale.get(i).getId()%>"
                                          class="far fa-trash-alt"></i></a>
                                </td>

                            </tr>
                            <% }%>
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
            $('form#form').submit(function (event) {
                event.preventDefault();
                var form = $(this);
                var j = {};
                j = form.serializeJSON();
                add(j, "/api/sale");
            });

            $(' tbody').on('click', 'i.fa-trash-alt', function () {
                data = {

                    id: $(this).attr('val')
                }
                dele(data, "/api/sale");
            });
            $('#delete').on('click', function () {
                data = {

                    id: $(this).attr('val')
                }
                dele(data, "/api/sale");
            })


            $(' tbody').on('click', 'i.fa-eye', function () {
                view($(this).attr('val'));
            });


            function view(id) {
                $.ajax({
                    type: 'GET', url: "/api/sale" + "?id=" + id


                }).done(function (responseText) {
                    $('#viewDetail').modal();
                    $('#viewDetail .detail-id').text(responseText.id);
                    $('#viewDetail .detail-name').text(responseText.name);
                    $('#viewDetail .detail-img').text(responseText.img);
                    $('#viewDetail .detail-desc').text(responseText.desc);
                    $('#viewDetail .detail-value').text(responseText.value);
                    $('#viewDetail .detail-unit').text(responseText.unit);
                    $('#viewDetail .detail-created').text(responseText.created_at);
                    $('#viewDetail .detail-updated').text(responseText.updated_at);
                    $('#viewDetail .detail-end').text(responseText.end_at);
                    $('#viewDetail .detail-start').text(responseText.start_at);
                    $('#viewDetail #edit').attr('href', '/admin/manage/sale/edit?id=' + responseText.id);
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
