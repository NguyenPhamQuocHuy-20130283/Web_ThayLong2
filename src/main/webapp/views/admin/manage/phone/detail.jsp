<%@ page import="vn.edu.hcmuaf.fit.model.phone.Phone" %>
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
<main class="mt-1">
  <%
    Phone phone = (Phone) request.getAttribute("phone");
  %>
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

          <a href="" class="white-text mx-3 text-uppercase ">chi tiết điện thoại</a>

          <div>
            <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2">
              <i class="fa-solid fa-rotate-left"></i>
            </button>
            <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2">
              <i class="fa-solid fa-repeat"></i>
            </button>
            <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2">
              <i class="fa-regular fa-floppy-disk"></i>
            </button>
          </div>

        </div>
        <!--/Card image-->

        <div class="px-4">

          <a href="/admin/manage/phonecolor?id=<%=phone.getId()%>"> color </a>
          <br/>
          <a href="/admin/manage/phonecap?id=<%=phone.getId()%>"> cap </a>
          <br/>
          <a href="/admin/manage/phonepromot?id=<%=phone.getId()%>"> promot </a>
          <br/>
          <a href="/admin/manage/phonespec?id=<%=phone.getId()%>"> spec </a>
          <br/>
          <a href="/admin/manage/phoneimage?id=<%=phone.getId()%>"> images </a>

          <div class="row w-100 mx-auto">
            <div class="col-xl-3">
              <div class="card text-center border-0 rounded-0">
                <div class="card-body mt-4">
                  <p class="card-text mb-0 size-text"><%=phone.avg()%>
                  </p>
                  <ul class="nav justify-content-center">

                    <%

                      for (int i = 1; i <= phone.avg(); i++) {

                    %>

                    <li class="nav-item">
                      <i class="fa-solid fa-star" aria-hidden="true"></i>
                    </li>
                    <%
                      }
                      if (phone.avg() % 2 != 0 || phone.avg() % 2 != 1) {
                    %>
                    <li class="nav-item">
                      <i class="fa-solid fa-star-half-stroke"
                         style="color: #ff7500;"></i>
                    </li>
                    <%}%>

                  </ul>
                  <p class="card-text"><small
                          class="text-muted"><%=phone.count()%>
                    đánh
                    giá
                    và nhận xét</small></p>
                </div>
              </div>
            </div>
            <div class="col-xl-5">
              <div class="card border-0 rounded-0">
                <div class="card-body">
                  <ul class="nav flex-column">

                    <%
                      for (int i = 5; i >= 1; i--) {
                    %>
                    <li class="nav-item mt-4 position-relative">
                      <span class="stars font-text"><%=i%> sao</span>
                      <div class="progress">
                        <div class="progress-bar <%=(i==1)?"bg-danger":""%><%=(i==2)?"bg-warning":""%> <%=(i==3)?"bg-info":""%> <%=(i==4)?"bg-primary":""%> <%=(i==5)?"bg-success":""%> "
                             style="width: <%=(int)(phone.avg(i)*100)%>%"
                             aria-valuenow="<%= (int)(phone.avg(i)*100)%>"
                             aria-valuemin="0" aria-valuemax="100">
                        </div>
                      </div>
                      <span class="number-evaluate font-text"><%=phone.count(i)%></span>
                    </li>

                    <%}%>
                  </ul>
                </div>
              </div>
            </div>
            <div class="col-xl-4">
              <div class="card text-center border-0 rounded-0 mt-4">
                <div class="card-body">
                  <a href="/admin/manage/review?id=<%=phone.getId()%>"> review </a>
                  <br/>
                  <a href="/admin/manage/review?id=<%=phone.getId()%>">
                    <i class="fa-solid fa-up-right-from-square mr-1">
                    </i>
                  </a>

                </div>
              </div>
            </div>
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
      $('.mdb-select').materialSelect({});
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