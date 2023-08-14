<%@ page import="vn.edu.hcmuaf.fit.model.phone.Brand" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.model.phone.Promot" %>
<%@ page import="vn.edu.hcmuaf.fit.model.review.Review" %>
<%@ page import="vn.edu.hcmuaf.fit.model.order.Order" %>
<%@ page import="vn.edu.hcmuaf.fit.model.order.OrderDetail" %>
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
<body>

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
                                        <th>quantity</th>
                                        <td class="font-weight-normal align-left-10 detail-quantity"></td>
                                    </tr>
                                    <tr>
                                        <th>price</th>
                                        <td class="font-weight-normal align-left-10 detail-price"></td>
                                    </tr>
                                    <tr>
                                        <th>discount</th>
                                        <td class="font-weight-normal align-left-10 detail-discount"></td>
                                    </tr>
                                    <tr>
                                        <th>phoneId</th>
                                        <td class="font-weight-normal align-left-10 detail-phoneId"></td>
                                    </tr>
                                    <tr>
                                        <th>orderId</th>
                                        <td class="font-weight-normal align-left-10 detail-orderId"></td>
                                    </tr>
                                    <tr>
                                        <th>colorId</th>
                                        <td class="font-weight-normal align-left-10 detail-colorId"></td>
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
                                    phone name
                                </th>
                                <th class="th-lg">
                                    color name
                                </th>
                                <th class="th-lg">
                                    user name
                                </th>
                                <th class="th-lg">
                                    total
                                </th>
                                <th class="th-lg">
                                    price
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
                                List<OrderDetail> ods = (List<OrderDetail>) request.getAttribute("ods");
                                for (int i = 0; i < ods.size(); i++) {

                            %>
                            <tr>

                                <td><%=i%>
                                </td>
                                <td><%=ods.get(i)._phone().getName()%>
                                </td>
                                <td><%=ods.get(i)._color().getName()%>
                                </td>
                                <td><%=ods.get(i)._order()._user().getName()%>
                                </td>
                                <td><%=ods.get(i).getTotal()%>
                                </td>
                                <td><%=ods.get(i).getPrice()%>
                                </td>
                                <td><%=ods.get(i).getUpdated_at()%>
                                </td>
                                <td>
                                    <a><i val="<%=ods.get(i).getPhoneId()%>"
                                          val2="<%=ods.get(i).getColorId()%>"
                                          val3="<%=ods.get(i).getOrderId()%>"
                                          class="fa-regular fa-eye"></i></a>
                                </td>

                            </tr>
                            <%
                                }
                            %>

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
                view($(this).attr('val'), $(this).attr('val2'), $(this).attr('val3'));
            });


            function view(id, colorId, orderId) {
                $.ajax({
                    type: 'GET', url: "/api/order-detail?phoneId=" + id + "&colorId=" + colorId + "&orderId=" + orderId


                }).done(function (responseText) {
                    $('#viewDetail').modal();
                    $('#viewDetail .detail-quantity').text(responseText.quantity);
                    $('#viewDetail .detail-price').text(responseText.price);
                    $('#viewDetail .detail-discount').text(responseText.discount);
                    $('#viewDetail .detail-phoneId').text(responseText.phoneId);
                    $('#viewDetail .detail-orderId').text(responseText.orderId);
                    $('#viewDetail .detail-colorId').text(responseText.colorId);
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
