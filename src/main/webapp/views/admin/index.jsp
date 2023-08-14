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

<!--Double navigation-->
<!--/.Double navigation-->
<main class="mt-1">
    <%User user = (User) SessionUntil.get(request, Variable.Global.USER.toString());%>
    <div class="container-fluid panel-scroll">

        <div id="container">
            <div class="row col col-12 col-sm-12 col-md-12 col-lg-12 ml-auto mr-auto float-none pl-1 pr-0">
                <div class="col col-12 p-0">

                    <div class="row w-100 mx-auto">
                        <%if (user.get(Variable.Global.ORDER.toString()) != null) {%>
                        <div class="col-3 my-3">
                            <a href="">
                                <!-- Card -->
                                <div class="card">
                                    <!-- Card image -->
                                    <div class="view overlay">
                                        <img class="card-img-top"
                                             src="https://mdbootstrap.com/img/Mockups/Lightbox/Thumbnail/img%20(67).webp"
                                             alt="Card image cap">
                                        <a href="/admin/manage/order">
                                            <div class="mask rgba-white-slight"></div>
                                        </a>
                                    </div>

                                    <!-- Card content -->
                                    <div class="card-body">

                                        <!-- Title -->
                                        <h6 class="card-title  text-uppercase">Quản lí đơn hàng</h6>

                                    </div>

                                </div>

                                <!-- Card -->
                            </a>

                        </div>
                        <%}%>
                        <div class="col-3 my-3">
                            <a href="">
                                <!-- Card -->
                                <div class="card">

                                    <!-- Card image -->
                                    <div class="view overlay">
                                        <img class="card-img-top"
                                             src="https://mdbootstrap.com/img/Mockups/Lightbox/Thumbnail/img%20(67).webp"
                                             alt="Card image cap">
                                        <a href="/src/views/admin/manareview/index.html">
                                            <div class="mask rgba-white-slight"></div>
                                        </a>
                                    </div>

                                    <!-- Card content -->
                                    <div class="card-body">

                                        <!-- Title -->
                                        <h6 class="card-title  text-uppercase">Quản lí đánh giá</h6>

                                    </div>

                                </div>

                                <!-- Card -->
                            </a>

                        </div>
                        <%if (user.get(Variable.Global.PHONE.toString()) != null) {%>
                        <div class="col-3 my-3">
                            <a href="">
                                <!-- Card -->
                                <div class="card">

                                    <!-- Card image -->
                                    <div class="view overlay">
                                        <img class="card-img-top"
                                             src="https://mdbootstrap.com/img/Mockups/Lightbox/Thumbnail/img%20(67).webp"
                                             alt="Card image cap">
                                        <a href="/admin/manage/phone">
                                            <div class="mask rgba-white-slight"></div>
                                        </a>
                                    </div>

                                    <!-- Card content -->
                                    <div class="card-body">

                                        <!-- Title -->
                                        <h6 class="card-title  text-uppercase">Quản lí sản phẩm</h6>

                                    </div>

                                </div>

                                <!-- Card -->
                            </a>

                        </div>
                        <%}%>
                        <%if (user.get(Variable.Global.USER.toString()) != null) {%>
                        <div class="col-3 my-3">
                            <a href="">
                                <!-- Card -->
                                <div class="card">

                                    <!-- Card image -->
                                    <div class="view overlay">
                                        <img class="card-img-top"
                                             src="https://mdbootstrap.com/img/Mockups/Lightbox/Thumbnail/img%20(67).webp"
                                             alt="Card image cap">
                                        <a href="/admin/manage/user">
                                            <div class="mask rgba-white-slight"></div>
                                        </a>
                                    </div>

                                    <!-- Card content -->
                                    <div class="card-body">

                                        <!-- Title -->
                                        <h6 class="card-title  text-uppercase">Quản lí user</h6>

                                    </div>

                                </div>

                                <!-- Card -->
                            </a>

                        </div>
                        <%}%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>

    </div>
</main>
<content tag="local_script">


    <script src="/src/js/admin/form.js"></script>
    <script>
        // Data
        const usersChrome = 243;
        const usersFirefox = 70;
        const usersOpera = 100;
        const usersSafari = 60;
        const usersEdge = 120;

        //pie
        var ctxP = document.getElementById("pieChart").getContext('2d');
        var myPieChart = new Chart(ctxP, {
            type: 'pie',
            data: {
                labels: ["Chrome", "FireFox", "Opera", "Safari", "Edge"],
                datasets: [{
                    data: [usersChrome, usersFirefox, usersOpera, usersSafari, usersEdge],
                    backgroundColor: ["#9c27b0", "#ad1457", "#0277bd", "#303f9f ", "#009688"],
                    hoverBackgroundColor: ["#a34cb3", "#a85076", "#679bb9", "#6d74a1", "#28a89b"],
                    borderWidth: 4,
                    borderColor: '#eee'
                }]
            },
            options: {
                responsive: true,
                legend: {
                    position: 'bottom',
                    labels: {
                        padding: 20,
                        boxWidth: 10
                    }
                },
                plugins: {
                    datalabels: {
                        formatter: (value, ctx) => {
                            let sum = 0;
                            let dataArr = ctx.chart.data.datasets[0].data;
                            dataArr.map(data => {
                                sum += data;
                            });
                            let percentage = (value * 100 / sum).toFixed(2) + "%";
                            return percentage;
                        },
                        color: 'white',
                        labels: {
                            title: {
                                font: {
                                    size: '10'
                                }
                            }
                        }
                    }
                },
                tooltips: {
                    callbacks: {
                        label: function (tooltipItem, data) {
                            return data.labels[tooltipItem.index] + ' users ' + ': ' + data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index];
                        }
                    }
                }
            }
        });

        // Table
        document.getElementById("cell-chrome").innerHTML = usersChrome;
        document.getElementById("cell-firefox").innerHTML = usersFirefox;
        document.getElementById("cell-opera").innerHTML = usersOpera;
        document.getElementById("cell-safari").innerHTML = usersSafari;
        document.getElementById("cell-edge").innerHTML = usersEdge;

        //bar
        var ctxB = document.getElementById("barChart").getContext('2d');
        var myBarChart = new Chart(ctxB, {
            type: 'bar',
            data: {
                labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
                datasets: [{
                    label: '# of Votes',
                    data: [12, 19, 3, 5, 2, 3],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255,99,132,1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });
    </script>
    <script>
        $(document).ready(function () {
            // SideNav Initialization
            $(".button-collapse").sideNav({
                slim: true
            });
            new WOW().init();

            $('#tableData').DataTable();


        })
    </script>
</content>
</body>

</html>
