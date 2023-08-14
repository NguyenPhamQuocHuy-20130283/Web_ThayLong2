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
    Image image = (Image) request.getAttribute("image");
%>
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

                    <a href="" class="white-text mx-3">CHỈNH SỬA MÀU</a>

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
<input hidden name="id" value="<%=image.getId() %>" >
                            <img width="50" height="50" id="image" src="<%=image.getLink()%>"
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
                            <table class="table table-hover border">
                                <thead>

                                </thead>
                                <tbody>
                                <tr>
                                    <th>link</th>
                                    <td>
                                        <input type='file' value="<%=(image.getLink()!=null)?image.getLink():""%>"
                                               id="image-upload" accept=".png, .jpg, .jpeg"
                                               name="link"/>
                                    </td>

                                </tr>
                                <tr>
                                    <th>desc</th>
                                    <td>
                                        <input type="text" name="desc" id="desc" class="form-control"
                                               value="<%=(image.getDesc()!=null)?image.getDesc():""%>">
                                        <label for="desc"></label>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <!--Table-->
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

            $('form#form').submit(function (event) {
                event.preventDefault();
                $.ajax({
                    method: "PUT",
                    url: "/api/image",
                    miniType: "multipart/form-data",
                    data: new FormData(document.getElementById("form")),
                    cache: false,
                    contentType: false,
                    processData: false,
                }).done(function (data) {
                    alert('thanh cong')
                })
            });
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
