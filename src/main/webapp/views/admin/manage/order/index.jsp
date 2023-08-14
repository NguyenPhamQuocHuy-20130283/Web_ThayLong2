<%@ page import="vn.edu.hcmuaf.fit.model.phone.Brand" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.model.phone.Promot" %>
<%@ page import="vn.edu.hcmuaf.fit.model.review.Review" %>
<%@ page import="vn.edu.hcmuaf.fit.model.order.Order" %>
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
    List<Order> orders = (List<Order>) request.getAttribute("orders");
%>
<!--Double navigation-->

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
                                        <th>userId</th>
                                        <td class="font-weight-normal align-left-10 detail-userId"></td>
                                    </tr>
                                    <tr>
                                        <th>customerId</th>
                                        <td class="font-weight-normal align-left-10 detail-customerId"></td>
                                    </tr>
                                    <tr>
                                        <th>payment</th>
                                        <td class="font-weight-normal align-left-10 detail-payment"></td>
                                    </tr>
                                    <tr>
                                        <th>total</th>
                                        <td class="font-weight-normal align-left-10 detail-total"></td>
                                    </tr>
                                    <tr>
                                        <th>order_stateId</th>
                                        <td class="font-weight-normal align-left-10 detail-order_stateId"></td>
                                    </tr>
                                    <tr>
                                        <th>codeId</th>
                                        <td class="font-weight-normal align-left-10 detail-codeId"></td>
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
                                <button type="button" class="btn btn-outline-default text-uppercase">
                                    close
                                </button>
                            </div>
                        </div>

                    </div>
                </div>
                <!--Modal: modalConfirmDelete-->
                <!--Modal: modalConfirmDelete-->
                <div class="px-4">

                    <div class="table-wrapper">
                        <!--Table-->
                        <table id="detail" class="table border table-hover mb-0">

                            <!--Table head-->
                            <thead>
                            <tr>
                                <th class="th-sm">
                                    #
                                </th>
                                <th class="th-sm">
                                    id
                                </th>
                                <th class="th-lg">
                                    user name
                                </th>
                                <th class="th-lg">
                                    total
                                </th>
                                <th class="th-lg">
                                    state
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
                            <tr>
                                <%
                                    for (int i = 0; i < orders.size(); i++) {

                                %>
                                <td><%=i%>
                                </td>
                                <td><%=orders.get(i).getId()%>
                                </td>
                                <td><%=(orders.get(i).getUserId() != null) ? orders.get(i)._user().getName() : orders.get(i)._customer().getName()%>
                                </td>
                                <td><%=orders.get(i).getTotal()%>
                                </td>
                                <td><%=(orders.get(i).getOrder_stateId() != null) ? orders.get(i)._orderState().getName() : ""%>
                                </td>
                                <td><%=orders.get(i).getUpdated_at()%>
                                </td>
                                <td>
                                    <a><i val="<%=orders.get(i).getId()%>"
                                          class="fa-regular fa-eye"></i></a>
                                    <a href="/admin/manage/order?id=<%=orders.get(i).getId()%>">
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

    <script>
        $(document).ready(function () {


            $(' tbody').on('click', 'i.fa-eye', function () {
                view($(this).attr('val'));
            });


            function view(id) {
                $.ajax({
                    type: 'GET', url: "/api/order" + "?id=" + id


                }).done(function (responseText) {
                    $('#viewDetail').modal();
                    $('#viewDetail .detail-id').text(responseText.id);
                    $('#viewDetail .detail-userId').text(responseText.userId);
                    $('#viewDetail .detail-customerId').text(responseText.customerId);
                    $('#viewDetail .detail-payment').text(responseText.payment);
                    $('#viewDetail .detail-total').text(responseText.total);
                    $('#viewDetail .detail-codeId').text(responseText.codeId);
                    $('#viewDetail .detail-order_stateId').text(responseText.order_stateId);
                    $('#viewDetail .detail-created').text(responseText.created_at);
                    $('#viewDetail .detail-updated').text(responseText.updated_at);
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
