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
    List<PhoneCap> phoneCaps = (List<PhoneCap>) request.getAttribute("pcap");
    Phone phone = (Phone) request.getAttribute("phone");
    List<Cap> caps = (List<Cap>) request.getAttribute("caps");
    List<Phone> phones = (List<Phone>) request.getAttribute("phones");
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
                        <th>capId</th>
                        <td class="font-weight-normal align-left-10 detail-capId"></td>
                    </tr>
                    <tr>
                        <th>phone cap Id</th>
                        <td class="font-weight-normal align-left-10 detail-phoneCapId"></td>
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
                <button type="button" class="btn btn-outline-default text-uppercase" id="delete" val="" val2="">
                    close
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
                <form id="form">
                    <table class="table table-hover border">
                        <thead>

                        </thead>
                        <tbody>


                        <tr>
                            <th>capId</th>
                            <td>
                                <select data-value-type="number" searchable="Search and add here..." class="mdb-select md-form" name="capId">
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
                            <th>phone cap Id</th>
                            <td>
                                <select data-value-type="number" searchable="Search and add here..." class="mdb-select md-form" name="phone_capId">
                                    <%
                                        for (Phone pc : phones
                                        ) {
                                    %>
                                    <option value="<%=pc.getId()%>"><%=pc.getName() + " " + pc._cap().getCap() + " " + pc._cap().getUnit()%>
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

                    <a href="" class="white-text mx-3">DANH SÁCH BỘ NHỚ</a>

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
                                    cap name
                                </th>
                                <th class="th-lg">
                                    phone cap name
                                </th>
                                <th class="th-lg">
                                    Updated_at
                                </th>
                                <th class="th-lg">
                                    Action
                                </th>
                            </tr>
                            </thead>
                            <!--Table head-->

                            <!--Table body-->
                            <tbody>
                            <tr>
                                <%
                                    for (int i = 0; i < phoneCaps.size(); i++) {

                                %>
                                <th scope="row">
                                    <input class="form-check-input" type="checkbox" id="checkbox1">
                                    <label class="form-check-label" for="checkbox1" class="label-table"></label>
                                </th>
                                <td><%=i%>
                                </td>
                                <td><%=phoneCaps.get(i)._cap().getCap() + " " + phoneCaps.get(i)._cap().getUnit()%>
                                </td>
                                <td><%=phoneCaps.get(i)._phone().getName() + " " + phoneCaps.get(i)._phone()._cap().getCap() + " " + phoneCaps.get(i)._phone()._cap().getUnit()%>
                                </td>
                                <td><%=phoneCaps.get(i).getUpdated_at()%>
                                </td>
                                <td>
                                    <a><i val="<%=phoneCaps.get(i).getPhoneId()%>"
                                          val2="<%=phoneCaps.get(i).getCapId()%>"
                                          class="fa-regular fa-eye"></i></a>
                                    <a href="/admin/manage/phonecap/edit?phoneId=<%=phoneCaps.get(i).getPhoneId()%>&capId=<%=phoneCaps.get(i).getCapId()%>"><i
                                            class="far fa-edit"></i></a>

                                    <a><i val="<%=phoneCaps.get(i).getPhoneId()%>"
                                          val2="<%=phoneCaps.get(i).getCapId()%>"
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
            $('.mdb-select').materialSelect({});
            $('form#form').submit(function (event) {
                event.preventDefault();
                var form = $(this);
                var j = {};
                j = form.serializeJSON();
                j['phoneId'] = <%=phone.getId()%>
                    add(j, "/api/phone-cap");
            });

            $(' tbody').on('click', 'i.fa-trash-alt', function () {
                data = {

                    phoneId: $(this).attr('val'),
                    capId: $(this).attr('val2')
                }
                dele(data, "/api/phone-cap");
            });
            $('#delete').on('click', function () {
                data = {

                    phoneId: $(this).attr('val'),
                    capId: $(this).attr('val2')
                }
                dele(data, "/api/phone-cap");
            })


            $(' tbody').on('click', 'i.fa-eye', function () {
                view($(this).attr('val'), $(this).attr('val2'));
            });


            function view(phoneId, capId) {
                $.ajax({
                    type: 'GET', url: "/api/phone-cap" + "?phoneId=" + phoneId + "&capId=" + capId
                }).done(function (responseText) {
                    $('#viewDetail').modal();
                    $('#viewDetail .detail-phoneId').text(responseText.phoneId);
                    $('#viewDetail .detail-capId').text(responseText.capId);
                    $('#viewDetail .detail-phoneCapId').text(responseText.phone_capId);
                    $('#viewDetail .detail-created').text(responseText.created_at);
                    $('#viewDetail .detail-updated').text(responseText.updated_at);
                    $('#viewDetail #edit').attr('href', '/admin/manage/phonecap/edit?phoneId=' + responseText.phoneId + '&capId=' + responseText.capId);
                    $('#viewDetail #delete').attr('val', responseText.phoneId);
                    $('#viewDetail #delete').attr('val2', responseText.capId);
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
