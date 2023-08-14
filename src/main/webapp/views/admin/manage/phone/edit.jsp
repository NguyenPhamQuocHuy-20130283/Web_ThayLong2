<%@ page import="vn.edu.hcmuaf.fit.model.phone.*" %>
<%@ page import="vn.edu.hcmuaf.fit.model.user.User" %>
<%@ page import="vn.edu.hcmuaf.fit.until.SessionUntil" %>
<%@ page import="vn.edu.hcmuaf.fit.constant.Variable" %>
<%@ page import="java.util.List" %>
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

<%
    Phone phone = (Phone) request.getAttribute("phone");
    User user = (User) SessionUntil.get(request, Variable.Global.USER.toString());
    List<Brand> brands = (List<Brand>) request.getAttribute("brands");
    List<Sale> sales = (List<Sale>) request.getAttribute("sales");
    List<Cap> caps = (List<Cap>) request.getAttribute("caps");
    List<Model> models = (List<Model>) request.getAttribute("models");
    List<State> phoneStates = (List<State>) request.getAttribute("state");
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
                    <a href="" class="white-text mx-3 text-uppercase ">sửa thông tin người dùng</a>
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
                        <form id="form">
                            <input hidden name="updated_by" value="<%=user.getId()%>">
                            <input hidden name="id" value="<%=phone.getId()%>">
                            <table class="table table-hover border">
                                <thead>

                                </thead>
                                <tbody>


                                <tr>
                                    <th>name</th>
                                    <td><input id="name" type="text" value="<%=phone.getName()%>" name="name"
                                               class="form-control"/>
                                        <label for="name"></label></td>
                                </tr>
                                <tr>
                                    <th>price</th>
                                    <td><input id="price" type="text" value="" name="price"
                                               class="form-control"/>
                                        <label for="price"></label></td>
                                </tr>
                                <tr>
                                    <th>desc</th>
                                    <td><input id="desc" type="text" name="desc" value="<%=phone.getDesc()%>"
                                               class="form-control"/>
                                        <label for="desc"></label></td>
                                </tr>


                                <tr>
                                    <th>content</th>
                                    <td>
                                        <div class="hidden mb-6">
                                                                        <textarea rows="" cols="" id="editor"
                                                                                  name="content"
                                                                        >

                                                                            <%=phone.getContent()%>
                                                                        </textarea>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>total</th>
                                    <td><input id="total" value="" data-value-type="number"
                                               type="number" name="total"
                                               class="form-control"/>
                                        <label for="total"></label></td>
                                </tr>


                                <tr>
                                    <th>is new</th>
                                    <td>
                                        <div class="custom-control custom-switch">
                                            <input type="checkbox" name="isNew" class="custom-control-input"
                                                   value="1"                                                <%=phone.getNew()?"checked":""%>
                                                   id="licensed"
                                            >
                                            <label class="custom-control-label" for="licensed"></label>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <th>thumbnail</th>
                                    <td>
                                        <img width="50" height="50" id="image" src="<%=phone.getThumbnail()%>"
                                             class="w-full h-full align-middle"/>
                                        <div class="absolute top-5 right-2">
                                            <div class="p-1 bg-white shadow-sm rounded-full border-solid border-2 border-white cursor-pointer">
                                                <label for="image-upload" class="cursor-pointer">
                                                    <svg class="w-6 h-6" fill="none" stroke="currentColor"
                                                         viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                                        <path stroke-linecap="round" stroke-linejoin="round"
                                                              stroke-width="2"
                                                              d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z"></path>
                                                    </svg>
                                                </label>
                                            </div>
                                        </div>

                                        <input type='file' multiple
                                               value="<%=(phone.getThumbnail()!=null)?phone.getThumbnail():""%>"
                                               id="image-upload" accept=".png, .jpg, .jpeg"
                                               name="thumbnail"/>

                                    </td>
                                </tr>

                                <tr>
                                    <th>brandId</th>
                                    <td>
                                        <select data-value-type="number" class="mdb-select md-form" name="brandId">
                                            <%

                                                for (Brand pc : brands
                                                ) {
                                            %>
                                            <option <%=pc.getId() == phone.getBrandId() ? "selected" : ""%>
                                                    value="<%=pc.getId()%>"><%=pc.getName()%>
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
                                            <option <%=pc.getId() == phone.getModelId() ? "selected" : ""%>
                                                    value="<%=pc.getId()%>"><%=pc.getName()%>
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
                                            <option <%=pc.getId() == phone.getSaleId() ? "selected" : ""%>
                                                    value="<%=pc.getId()%>"><%=pc.getName()%>
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
                                            <option <%=pc.getId() == phone.getCapId() ? "selected" : ""%>
                                                    value="<%=pc.getId()%>"><%=pc.getCap() + " " + pc.getUnit()%>
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
                                        <select data-value-type="number" name="phone_stateId" class="mdb-select md-form"
                                        >
                                            <%

                                                for (State pc : phoneStates
                                                ) {
                                            %>
                                            <option <%=pc.getId() == phone.getPhone_stateId() ? "selected" : ""%>
                                                    value="<%=pc.getId()%>"><%=pc.getName()%>
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
            $('.mdb-select').materialSelect();
            $('form#form').submit(function (event) {
                event.preventDefault();
                console.log(Object.fromEntries(new FormData(document.getElementById("form")).entries()))
                $.ajax({
                    method: "PUT",
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
            // SideNav Initialization
            $(".button-collapse").sideNav({
                slim: true
            });
            new WOW().init();

            $('#dtBasicExample').DataTable();
            $('.dataTables_length').addClass('bs-select');

            var currenAvatar = $("#image").attr("src")
            var file;
            $("#image-upload").on('change', function (e) {
                if (file) {
                    URL.revokeObjectURL(file.preview);
                }
                file = e.target.files[0];
                file.preview = URL.createObjectURL(file);
                $("#image").attr("src", file.preview);
                $("#buttonHandleAvatarContainer").removeClass("hidden")
            })
        })
    </script>
</content>
</body>

</html>
