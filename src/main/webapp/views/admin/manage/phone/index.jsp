<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.model.user.User" %>
<%@ page import="vn.edu.hcmuaf.fit.until.SessionUntil" %>
<%@ page import="vn.edu.hcmuaf.fit.constant.Variable" %>
<%@ page import="vn.edu.hcmuaf.fit.model.phone.*" %>
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
    List<Phone> phones = (List<Phone>) request.getAttribute("phones");
    User user = (User) SessionUntil.get(request, Variable.Global.USER.toString());
    List<Brand> brands = (List<Brand>) request.getAttribute("brands");
    List<Sale> sales = (List<Sale>) request.getAttribute("sales");
    List<Cap> caps = (List<Cap>) request.getAttribute("caps");
    List<Model> models = (List<Model>) request.getAttribute("models");
    List<State> phoneStates = (List<State>) request.getAttribute("state");

%>

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
                    <input hidden name="created_by" value="<%=user.getId()%>">
                    <table class="table table-hover border">
                        <thead>

                        </thead>
                        <tbody>


                        <tr>
                            <th>name</th>
                            <td><input id="name" type="text" name="name" class="form-control"/>
                                <label for="name"></label></td>
                        </tr>
                        <tr>
                            <th>price</th>
                            <td><input id="price" type="text" name="price" class="form-control"/>
                                <label for="price"></label></td>
                        </tr>
                        <tr>
                            <th>desc</th>
                            <td><input id="desc" type="text" name="desc" class="form-control"/>
                                <label for="desc"></label></td>
                        </tr>


                        <tr>
                            <th>content</th>
                            <td>
                                <div class="hidden mb-6">
                                                                        <textarea rows="" cols="" id="editor"
                                                                                  name="content"
                                                                        ></textarea>
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
                            <th>total</th>
                            <td><input id="total" data-value-type="number" type="number" name="total"
                                       class="form-control"/>
                                <label for="total"></label></td>
                        </tr>


                        <tr>
                            <th>is new</th>
                            <td>
                                <div class="custom-control custom-switch">
                                    <input type="checkbox" name="isNew" class="custom-control-input"
                                           data-value-type="number" value="1" id="licensed" data-unchecked-value="0">
                                    <label class="custom-control-label" for="licensed"></label>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <th>thumbnail</th>
                            <td><input id="thumbnail" multiple type="file" name="thumbnail" class="form-control">
                                <label for="thumbnail"></label></td>
                        </tr>

                        <tr>
                            <th>brandId</th>
                            <td>
                                <select data-value-type="number" class="mdb-select md-form" name="brandId">
                                    <%

                                        for (Brand pc : brands
                                        ) {
                                    %>
                                    <option value="<%=pc.getId()%>"><%=pc.getName()%>
                                    </option>
                                    <%
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>model</th>
                            <td>
                                <select data-value-type="number" class="mdb-select md-form" name="modelId">
                                    <%

                                        for (Model pc : models
                                        ) {
                                    %>
                                    <option value="<%=pc.getId()%>"><%=pc.getName()%>
                                    </option>
                                    <%
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>sale</th>
                            <td>
                                <select data-value-type="number" class="mdb-select md-form" name="saleId">
                                    <%

                                        for (Sale pc : sales
                                        ) {
                                    %>
                                    <option value="<%=pc.getId()%>"><%=pc.getName()%>
                                    </option>
                                    <%
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>cap</th>
                            <td>
                                <select data-value-type="number" class="mdb-select md-form" name="capId">
                                    <%

                                        for (Cap pc : caps
                                        ) {
                                    %>
                                    <option value="<%=pc.getId()%>"><%=pc.getCap() + " " + pc.getUnit()%>
                                    </option>
                                    <%
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>state</th>
                            <td>
                                <select data-value-type="number" class="mdb-select md-form" name="phone_stateId">
                                    <%

                                        for (State pc : phoneStates
                                        ) {
                                    %>
                                    <option value="<%=pc.getId()%>"><%=pc.getName()%>
                                    </option>
                                    <%
                                        }
                                    %>
                                </select>
                            </td>
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
                        <th>img</th>
                        <td class="font-weight-normal align-left-10 detail-img"></td>
                    </tr>
                    <tr>
                        <th>typeId</th>
                        <td class="font-weight-normal align-left-10 detail-typeId"></td>
                    </tr>
                    <tr>
                        <th>price</th>
                        <td class="font-weight-normal align-left-10 detail-price"></td>
                    </tr>
                    <tr>
                        <th>content</th>
                        <td class="font-weight-normal align-left-10 detail-content"></td>
                    </tr>
                    <tr>
                        <th>total</th>
                        <td class="font-weight-normal align-left-10 detail-total"></td>
                    </tr>
                    <tr>
                        <th>thumbnail</th>
                        <td class="font-weight-normal align-left-10 ">
                            <img src="" class="detail-thumbnail" width="50" height="50">

                        </td>
                        1
                    </tr>
                    <tr>
                        <th>desc</th>
                        <td class="font-weight-normal align-left-10 detail-desc"></td>
                    </tr>
                    <tr>
                        <th>brandId</th>
                        <td class="font-weight-normal align-left-10 detail-brandId"></td>
                    </tr>
                    <tr>
                        <th>modelId</th>
                        <td class="font-weight-normal align-left-10 detail-modelId"></td>
                    </tr>
                    <tr>
                        <th>enable</th>
                        <td class="font-weight-normal align-left-10 detail-enable"></td>
                    </tr>
                    <tr>
                        <th>saleId</th>
                        <td class="font-weight-normal align-left-10 detail-saleId"></td>
                    </tr>
                    <tr>
                        <th>created by</th>
                        <td class="font-weight-normal align-left-10 detail-created_by"></td>
                    </tr>
                    <tr>
                        <th>capId</th>
                        <td class="font-weight-normal align-left-10 detail-capId"></td>
                    </tr>
                    <tr>
                        <th>update by</th>
                        <td class="font-weight-normal align-left-10 detail-updated_by"></td>
                    </tr>
                    <tr>
                        <th>deleted at</th>
                        <td class="font-weight-normal align-left-10 detail-deleted_at"></td>
                    </tr>
                    <tr>
                        <th>delete by</th>
                        <td class="font-weight-normal align-left-10 detail-delete_by"></td>
                    </tr>
                    <tr>
                        <th>phoneStateID</th>
                        <td class="font-weight-normal align-left-10 detail-phoneStateId"></td>
                    </tr>
                    <tr>
                        <th>isnew</th>
                        <td class="font-weight-normal align-left-10 detail-isnew"></td>
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
                    close
                </button>
                <a href="" class="btn btn-default text-uppercase edit">chỉnh sửa</a>
            </div>
        </div>

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

                    <a href="" class="white-text mx-3 text-uppercase ">danh sách điện thoại</a>

                    <div>
                        <button type="button" onclick="location.reload();"
                                class="btn btn-outline-white btn-rounded btn-sm px-2">
                            <i class="fa-solid fa-rotate-left"></i>
                        </button>
                        <a data-toggle="modal" data-target="#add"
                           class="btn btn-outline-white btn-rounded btn-sm px-2">
                            <i class="fa-solid fa-plus"></i>
                        </a>
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
                                <th class="th-lg">
                                    img
                                </th>
                                <th class="th-lg">
                                    name
                                </th>
                                <th class="th-lg">
                                    author
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
                                for (int i = 0; i < phones.size(); i++) {

                            %>
                            <tr>
                                <th scope="row">
                                    <input class="form-check-input" type="checkbox" id="checkbox1">
                                    <label class="form-check-label" for="checkbox1" class="label-table"></label>
                                </th>
                                <th><%=i%>
                                </th>
                                <th><%=phones.get(i).getId()%>
                                </th>
                                <td><img
                                        src="<%=phones.get(i).getThumbnail()%>"
                                        width="70px" height="70px" class="img-fluid " alt=""></td>
                                <td><%=phones.get(i).getName()%>
                                </td>
                                <td><%=phones.get(i).getCreated_by()%>
                                </td>
                                <td><%=phones.get(i).getUpdated_at()%>
                                </td>
                                <td>
                                    <a><i val="<%=phones.get(i).getId()%>"
                                          class="fa-regular fa-eye"></i></a>
                                    <a href="/admin/manage/phone/edit?id=<%=phones.get(i).getId()%>"><i
                                            class="far fa-edit"></i></a>


                                    <%if (phones.get(i)._createdBy().getId() == user.getId()) { %>
                                    <a><i val="<%=phones.get(i).getId()%>"
                                          class="far fa-trash-alt"></i></a>
                                    <%}%>
                                    <a href="/admin/manage/phone?id=<%=phones.get(i).getId()%>">
                                        <i class="fa-solid fa-up-right-from-square mr-1">
                                        </i>
                                    </a>
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
    <script src="/lib/ckfinder/ckfinder.js"></script>
    <script>


        $(document).ready(function () {
            $('.mdb-select').materialSelect();
            // ClassicEditor
            //     .create(document.querySelector('#editor'))
            //     .catch(error => {
            //         console.error(error);
            //     });
            // var content = CKEDITOR.replace('editor');


            $('form#form').submit(function (event) {
                event.preventDefault();
                // j['content'] = content.getData();


                $.ajax({
                    method: "POST",
                    url: "/api/phone",
                    miniType: "multipart/form-data",
                    data: new FormData(document.getElementById("form")),
                    cache: false,
                    contentType: false,
                    processData: false,
                }).done(function (data) {
                    alert('thanh cong')
                })
            });

            $(' tbody').on('click', 'i.fa-trash-alt', function () {
                data = {

                    id: $(this).attr('val'),
                    deleted_by:<%=user.getId()%>
                }
                dele(data, "/api/phone");
            });
            $('#delete').on('click', function () {
                data = {

                    id: $(this).attr('val'),
                    deleted_by:<%=user.getId()%>
                }
                dele(data, "/api/phone");
            })


            $(' tbody').on('click', 'i.fa-eye', function () {
                view($(this).attr('val'));
            });


            function view(id) {
                $.ajax({
                    type: 'GET', url: "/api/phone" + "?id=" + id


                }).done(function (responseText) {
                    $('#viewDetail').modal();
                    $('#viewDetail .detail-id').text(responseText.id);
                    $('#viewDetail .detail-name').text(responseText.name);
                    $('#viewDetail .detail-typeId').text(responseText.typeId);
                    $('#viewDetail .detail-price').text(responseText.price);
                    $('#viewDetail .detail-content').text(responseText.content);
                    $('#viewDetail .detail-created_at').text(responseText.created_at);
                    $('#viewDetail .detail-updated_at').text(responseText.updated_at);
                    $('#viewDetail .detail-total').text(responseText.total);
                    $('#viewDetail .detail-thumbnail').attr('src', responseText.thumbnail)
                    $('#viewDetail .detail-desc').text(responseText.desc);
                    $('#viewDetail .detail-brandId').text(responseText.brandId);
                    $('#viewDetail .detail-modelId').text(responseText.modelId);
                    $('#viewDetail .detail-saleId').text(responseText.saleId);
                    $('#viewDetail .detail-created_by').text(responseText.created_by);
                    $('#viewDetail .detail-enable').text(responseText.enable);
                    $('#viewDetail .detail-capId').text(responseText.capId);
                    $('#viewDetail .detail-updated_by').text(responseText.updated_by);
                    $('#viewDetail .detail-deleted_at').text(responseText.deleted_at);
                    $('#viewDetail .detail-delete_by').text(responseText.deleted_by);
                    $('#viewDetail .detail-phoneStateId').text(responseText.phone_stateId);
                    $('#viewDetail .detail-isnew').text(responseText.isNew);
                    $('#viewDetail #edit').attr('href', '/admin/manage/phone/edit?id=' + responseText.id);
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
