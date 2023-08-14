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

                      <a href="" class="white-text mx-3">Table name</a>

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

                      <div class="table-wrapper">
                          <!--Table-->
                          <table class="table table-hover">
                              <thead>

                              </thead>
                              <tbody>

                              <tr>
                                  <th>phone</th>
                                  <td><!-- Material outline counter input -->
                                      <input id="input-char-counter1" type="text" length="10" class="form-control">
                                      <label for="input-char-counter1">Input text</label>
                              </tr>
                              <tr>
                                  <th>name</th>
                                  <td> <input id="input-char-counter2" type="text" length="10" class="form-control">
                                      <label for="input-char-counter1">Input text</label></td>
                              </tr>
                              <tr>
                                  <th>address</th>
                                  <td> <input id="input-char-counter2" type="text" length="10" class="form-control">
                                      <label for="input-char-counter2">Input text</label></td>
                              </tr>
                              <tr>
                                  <th>gender</th>
                                  <td>
                                      <!-- Material inline 1 -->
                                      <div class="form-check form-check-inline">
                                          <input type="radio" class="form-check-input" id="materialInline1" name="inlineMaterialRadiosExample">
                                          <label class="form-check-label" for="materialInline1">1</label>
                                      </div>

                                      <!-- Material inline 2 -->
                                      <div class="form-check form-check-inline">
                                          <input type="radio" class="form-check-input" id="materialInline2" name="inlineMaterialRadiosExample">
                                          <label class="form-check-label" for="materialInline2">2</label>
                                      </div>

                                      <!-- Material inline 3 -->
                                      <div class="form-check form-check-inline">
                                          <input type="radio" class="form-check-input" id="materialInline3" name="inlineMaterialRadiosExample">
                                          <label class="form-check-label" for="materialInline3">3</label>
                                      </div>


                                  </td>
                              </tr>
                              <tr>
                                  <th>email</th>
                                  <td><input id="input-char-counter4" type="text" length="10" class="form-control">
                                      <label for="input-char-counter4">Input text</label></td></td>
                              </tr>
                              <tr>
                                  <th>active</th>
                                  <td><div class="custom-control custom-switch">
                                      <input type="checkbox" class="custom-control-input" id="customSwitches">
                                      <label class="custom-control-label" for="customSwitches">Toggle this switch element</label>
                                  </div></td>
                              </tr>
                              <tr>
                                  <th>permission</th>
                                  <td><div class="form-check form-check-inline">
                                      <input type="radio" class="form-check-input" id="materialInline1" name="inlineMaterialRadiosExample">
                                      <label class="form-check-label" for="materialInline1">1</label>
                                  </div>

                                      <!-- Material inline 2 -->
                                      <div class="form-check form-check-inline">
                                          <input type="radio" class="form-check-input" id="materialInline2" name="inlineMaterialRadiosExample">
                                          <label class="form-check-label" for="materialInline2">2</label>
                                      </div>

                                      <!-- Material inline 3 -->
                                      <div class="form-check form-check-inline">
                                          <input type="radio" class="form-check-input" id="materialInline3" name="inlineMaterialRadiosExample">
                                          <label class="form-check-label" for="materialInline3">3</label>
                                      </div></td>
                              </tr>
                              <tr>
                                  <th>status</th>
                                  <td><input id="input-char-counter5" type="text" length="10" class="form-control">
                                      <label for="input-char-counter5">Input text</label></td>
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
          $(document).ready(function() {
              // SideNav Initialization
              $(".button-collapse").sideNav({
                  slim: true});
              new WOW().init();

              $('#dtBasicExample').DataTable();
              $('.dataTables_length').addClass('bs-select');


          })
      </script>
  </content>
</body>

</html>
