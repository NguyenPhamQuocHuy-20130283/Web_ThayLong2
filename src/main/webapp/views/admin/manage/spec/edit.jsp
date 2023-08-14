<%@ page import="vn.edu.hcmuaf.fit.model.phone.Spec" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.model.phone.SpecType" %>
<%@ page import="vn.edu.hcmuaf.fit.model.phone.Brand" %>
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
    Spec spec = (Spec) request.getAttribute("spec");
    List<SpecType> specTypes = (List<SpecType>) request.getAttribute("specTs");
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
                    <a href="" class="white-text mx-3 text-uppercase ">sửa thông tin thông số</a>
                    <div>
                        <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2">
                            <i class="fa-solid fa-rotate-left"></i>
                        </button>
                        <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2">
                            <i class="fa-solid fa-repeat"></i>
                        </button>
                        <button type="button" onclick="document.getElementById('form').submit()"
                                class="btn btn-outline-white btn-rounded btn-sm px-2">
                            <i class="fa-regular fa-floppy-disk"></i>
                        </button>
                    </div>

                </div>
                <!--/Card image-->

                <div class="px-4">

                    <div class="table-wrapper">
                        <!--Table-->
                        <!--Table-->
                        <form id="form">
                            <table class="table table-hover border">
                                <thead>

                                </thead>
                                <tbody>

                                <tr>
                                    <th>name</th>
                                    <td><!-- Material outline counter input -->
                                        <input id="name" type="text" name="name" class="form-control"
                                               value="<%=(spec.getName()!=null)?spec.getName():""%>">
                                        <label for="name"></label>
                                </tr>
                                <tr>
                                    <th>key</th>
                                    <td><input id="key" type="text" name="key" class="form-control"
                                               value="<%=(spec.getKey()!=null)?spec.getKey():""%>">
                                        <label for="key"></label></td>
                                </tr>

                                <tr>
                                    <th>spec type Id</th>
                                    <td>
                                        <select data-value-type="number" class="mdb-select md-form" name="spec_typeId">
                                            <%

                                                for (SpecType pc : specTypes
                                                ) {
                                            %>
                                            <option value="<%=pc.getId()%>" <%=(pc.getId() == spec.getSpec_typeId() ? "selected" : "")%> ><%=pc.getName()%>
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

                </div>

            </div>
            <!-- Table with panel -->
        </div>

    </div>
</main>
<content tag="local_script">
    <script>
        $(document).ready(function () {
            $('.mdb-select').materialSelect();

            $('form#form').submit(function (event) {
                event.preventDefault();
                var form = $(this);
                var j = {};
                j = form.serializeJSON();
                j['id'] = <%=spec.getId()%>;
                update(j, "/api/spec");
            })

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
