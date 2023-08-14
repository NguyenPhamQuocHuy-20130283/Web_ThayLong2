<%@ page import="vn.edu.hcmuaf.fit.model.phone.Promot" %>
<%@ page import="vn.edu.hcmuaf.fit.model.phone.Brand" %>
<%@ page import="vn.edu.hcmuaf.fit.model.review.Review" %>
<%@ page import="vn.edu.hcmuaf.fit.model.user.User" %>
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

<%
    Review review = (Review) request.getAttribute("review");
    User user = (User) SessionUntil.get(request, Variable.Global.USER.toString());
%>

<!--Double navigation-->
<!--/.Double navigation-->

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
                    <a href="" class="white-text mx-3 text-uppercase ">tra loi</a>
                    <div>
                        <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2">
                            <i class="fa-solid fa-rotate-left"></i>
                        </button>
                        <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2">
                            <i class="fa-solid fa-repeat"></i>
                        </button>
                        <button type="button" onclick="$('form#form').submit()"
                                class="btn btn-outline-white btn-rounded btn-sm px-2">
                            <i class="fa-regular fa-floppy-disk"></i>
                        </button>
                    </div>

                </div>
                <!--/Card image-->

                <div class="px-4">

                    <div class="table-wrapper">
                        <!--Table-->

                        <table class="table table-hover border">
                            <thead>

                            </thead>
                            <tbody>

                            <tr>
                                <th>name</th>
                                <td><!-- Material outline counter input -->
                                    <input id="name" type="text" class="form-control"
                                           value="<%=(review.getUserId()!=null)?review._user().getName():review._customer().getName()%>"
                                           disabled readonly>
                                    <label for="name"></label>
                            </tr>
                            <tr>
                                <th>phone</th>
                                <td><input id="key" type="text" class="form-control"
                                           value="<%=(review.getPhoneId()!=null)?review._phone().getName()+" "+review._phone()._cap().getCap()+" "+review._phone()._cap().getUnit():""%>"
                                           disabled readonly>
                                    <label for="key"></label></td>
                            </tr>
                            <tr>
                                <th>content</th>
                                <td>

                                    <div class="form-group">
                                        <label for="question"> </label>
                                        <textarea class="form-control" id="question" rows="7"
                                                  readonly>  <%=(review.getContent() != null) ? review.getContent() : ""%> </textarea>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>my reply</th>
                                <td>
                                    <form id="form" action="/admin/manage/question/reply" method="post">
                                        <input hidden name="id" value="<%=review.getId()%>">
                                        <input hidden name="userId" value="<%=user.getId()%>">
                                        <input hidden name="phoneId" value="<%=review.getPhoneId()%>">
                                        <div class="form-group">
                                            <label for="content"> </label>
                                            <textarea class="form-control" id="content" rows="7"></textarea>
                                        </div>
                                    </form>
                                </td>
                            </tr>
                            <tr>
                                <th>created_at</th>
                                <td><input id="created_at" type="text" class="form-control"
                                           value="<%=(review.getCreated_at()!=null)?review.getCreated_at():""%>"
                                           disabled readonly>
                                    <label for="created_at"></label></td>
                            </tr>
                            <tr>
                                <th>updated_at</th>
                                <td><input id="updated_at" type="text" class="form-control"
                                           value="<%=(review.getUpdated_at()!=null)?review.getUpdated_at():""%>"
                                           disabled readonly>
                                    <label for="updated_at"></label></td>
                            </tr>
                            <tr>
                                <th>typeId</th>
                                <td><input id="typeId" type="text" class="form-control"
                                           value="<%=(review.getTypeId()!=null)?review._questionType().getName():""%>"
                                           disabled readonly>
                                    <label for="typeId"></label></td>
                            </tr>

                            </tbody>
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
    <script>
        $(document).ready(function () {
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
