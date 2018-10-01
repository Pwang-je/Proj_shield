<%@page import="hero.admin_manager.IncidentBean"%>
<%@page import="hero.admin_manager.CaseDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="session.jsp" %>
<jsp:useBean id="heroMgr" class="hero.admin_manager.HeroManagerMgr" />
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAzaHp6hK8i5jdZb7GxKzVGIg5uzBAAAQY&callback=initMap"
  type="text/javascript"></script>
    <script src="../js/Chart.min.js"></script>
</head>
<body>
<%
ArrayList<IncidentBean> incilist = new ArrayList<>();
incilist = heroMgr.getIncidentAll(areas);
%>
<div id="wrap">



    <section>

      <div class="wrap col-sm-12 col-md-12">

        <!-- navbar -->
        <div class="navbar col-sm-2 col-md-2">
          <ul>
            <li>
              <a href="#">
                <img src="../images/logo.png" alt="">
              </a>
              <li><a href="hero/herolist_m.jsp">영웅관리</a></li>
              <li><a href="incident/incidentlist_m.jsp">사건관리</a></li>
              <li><a href="present/presentlist_m.jsp">현황관리</a></li>
              <li><a href="ranking/ranking.jsp">순위</a></li>
              <li><a href="../login_am/logout.jsp">로그아웃</a></li>
          </ul>
        </div>

        <!-- contents -->
        <div class="contents container-fluid col-sm-8 col-md -8">

          <div id="center" class="col-sm-12 col-md-12">

            <!-- Map -->
            <div class="col-sm-12 col-md-12 contents-maps">
              <iframe src="https://snazzymaps.com/embed/99067" width="100%" height="100%" style="border:none;"></iframe>
            </div>


            <!-- Chart -->

            <div class="col-sm-5 col-md-5 chart">
              <canvas id="myChart2" style="width: 100%; height: 100%"></canvas>
              <script>
                var ctx = document.getElementById("myChart2");
                var myChart2 = new Chart(ctx, {
                  type: 'radar',
                  data: {
                    labels: ["자연재해", "빌런", "Unknown"],
                      datasets: [{
                          label: '빌런',
                          data: [14, 49, 36],
                          backgroundColor: [
                              'rgba(255, 99, 132, 0.1)',
                              // 'rgba(54, 162, 235, 0.2)',
                              // 'rgba(255, 206, 86, 0.2)',
                              // 'rgba(75, 192, 192, 0.2)',
                              // 'rgba(153, 102, 255, 0.2)',
                              // 'rgba(255, 159, 64, 0.2)'
                          ],
                          borderColor: [
                              'rgba(255,99,132,1)',
                              // 'rgba(54, 162, 235, 1)',
                              // 'rgba(255, 206, 86, 1)',
                              // 'rgba(75, 192, 192, 1)',
                              // 'rgba(153, 102, 255, 1)',
                              // 'rgba(255, 159, 64, 1)'
                          ],
                          borderWidth: 2
                        }, {
                          label: '재해',
                          data: [41, 42, 66],
                          backgroundColor: [
                              // 'rgba(255, 99, 132, 0.2)',
                              // 'rgba(54, 162, 235, 0.2)',
                              // 'rgba(255, 206, 86, 0.2)',
                              // 'rgba(75, 192, 192, 0.2)',
                              'rgba(153, 102, 255, 0.2)',
                              // 'rgba(255, 159, 64, 0.2)'
                          ],
                          borderColor: [
                              // 'rgba(255,99,132,1)',
                              // 'rgba(54, 162, 235, 1)',
                              // 'rgba(255, 206, 86, 1)',
                              // 'rgba(75, 192, 192, 1)',
                              'rgba(153, 102, 255, 1)',
                              // 'rgba(255, 159, 64, 1)'
                          ],
                          borderWidth: 2
                        }, {
                          label: 'Unknown',
                          data: [71, 55, 37],
                          backgroundColor: [
                              // 'rgba(255, 99, 132, 0.2)',
                              'rgba(54, 162, 235, 0.2)',
                              // 'rgba(255, 206, 86, 0.2)',
                              // 'rgba(75, 192, 192, 0.2)',
                              // 'rgba(153, 102, 255, 0.2)',
                              // 'rgba(255, 159, 64, 0.2)'
                          ],
                          borderColor: [
                              // 'rgba(255,99,132,1)',
                              'rgba(54, 162, 235, 1)',
                              // 'rgba(255, 206, 86, 1)',
                              // 'rgba(75, 192, 192, 1)',
                              // 'rgba(153, 102, 255, 1)',
                              // 'rgba(255, 159, 64, 1)'
                          ],
                          borderWidth: 2
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
            </div>

            <div class="col-sm-5 col-md-5 chart">
              <canvas id="myChart3" style="width: 100%; height: 100%"></canvas>
              <script>
                var ctx = document.getElementById("myChart3");
                var myChart3 = new Chart(ctx, {
                  type: 'pie',
                  data: {
                    labels: ["빌런1", "빌런2", "빌런3", "빌런4", "빌런5", "빌런6"],
                      datasets: [{
                          label: '# Example',
                          data: [14, 49, 36, 57, 22, 30],
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
            </div>


            <div class="col-sm-12 col-md-12 chart-1">
              <canvas id="myChart1" style="width: 40%"></canvas>
              <script>
                var ctx = document.getElementById("myChart1");
                var myChart1 = new Chart(ctx, {
                  type: 'line',
                  data: {
                    labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
                      datasets: [{
                          label: '8월사건들',
                          data: [14, 49, 36, 57, 22, 30],
                          backgroundColor: [
                              // 'rgba(255, 99, 132, 0.2)',
                              'rgba(54, 162, 235, 0.2)',
                              // 'rgba(255, 206, 86, 0.2)',
                              // 'rgba(75, 192, 192, 0.2)',
                              // 'rgba(153, 102, 255, 0.2)',
                              // 'rgba(255, 159, 64, 0.2)'
                          ],
                          borderColor: [
                              // 'rgba(255,99,132,1)',
                              'rgba(54, 162, 235, 1)',
                              // 'rgba(255, 206, 86, 1)',
                              // 'rgba(75, 192, 192, 1)',
                              // 'rgba(153, 102, 255, 1)',
                              // 'rgba(255, 159, 64, 1)'
                          ],
                          borderWidth: 1
                        }, {
                          label: '7월사건들',
                          data: [44, 19, 26, 77, 32, 60],
                          backgroundColor: [
                              'rgba(255, 99, 132, 0.2)',
                              // 'rgba(54, 162, 235, 0.2)',
                              // 'rgba(255, 206, 86, 0.2)',
                              // 'rgba(75, 192, 192, 0.2)',
                              // 'rgba(153, 102, 255, 0.2)',
                              // 'rgba(255, 159, 64, 0.2)'
                          ],
                          borderColor: [
                              'rgba(255,99,132,1)',
                              // 'rgba(54, 162, 235, 1)',
                              // 'rgba(255, 206, 86, 1)',
                              // 'rgba(75, 192, 192, 1)',
                              // 'rgba(153, 102, 255, 1)',
                              // 'rgba(255, 159, 64, 1)'
                          ],
                          borderWidth: 1
                        }, {
                          label: '6월사건들',
                          data: [7, 19, 55, 82, 23, 41],
                          backgroundColor: [
                              // 'rgba(255, 99, 132, 0.2)',
                              // 'rgba(54, 162, 235, 0.2)',
                              // 'rgba(255, 206, 86, 0.2)',
                              // 'rgba(75, 192, 192, 0.2)',
                              // 'rgba(153, 102, 255, 0.2)',
                              'rgba(255, 159, 64, 0.2)'
                          ],
                          borderColor: [
                              // 'rgba(255,99,132,1)',
                              // 'rgba(54, 162, 235, 1)',
                              // 'rgba(255, 206, 86, 1)',
                              // 'rgba(75, 192, 192, 1)',
                              // 'rgba(153, 102, 255, 1)',
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
            </div>


            <div class="col-sm-5 col-md-5 chart">
              <canvas id="myChart4" style="width: 100%; height: 100%"></canvas>
              <script>
                var ctx = document.getElementById("myChart4");
                var myChart2 = new Chart(ctx, {
                  type: 'bar',
                  data: {
                    labels: ["1 area", "2 area", "3 area", "4 area"],
                      datasets: [{
                          label: '지역별 사건수',
                          data: [14, 49, 36, 57],
                          backgroundColor: [
                              'rgba(255, 99, 132, 1)',
                              'rgba(54, 162, 235, 1)',
                              // 'rgba(255, 206, 86, 0.2)',
                              // 'rgba(75, 192, 192, 0.2)',
                              'rgba(153, 102, 255, 1)',
                              'rgba(255, 159, 64, 1)'
                          ],
                          borderColor: [
                              'rgba(255,99,132,1)',
                              'rgba(54, 162, 235, 1)',
                              // 'rgba(255, 206, 86, 1)',
                              // 'rgba(75, 192, 192, 1)',
                              'rgba(153, 102, 255, 1)',
                              'rgba(255, 159, 64, 1)'
                          ],
                          borderWidth: 2
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
            </div>


            <div class="col-sm-5 col-md-5 chart">
              <canvas id="myChart5" style="width: 100%; height: 100%"></canvas>
              <script>
                var ctx = document.getElementById("myChart5");
                var myChart2 = new Chart(ctx, {
                  type: 'bar',
                  data: {
                    labels: ["S", "A", "B", "C", "D"],
                      datasets: [{
                          label: '투입된 영웅 타입',
                          data: [14, 49, 36, 57, 22],
                          backgroundColor: [
                              'rgba(255, 99, 132, 1)',
                              'rgba(54, 162, 235, 1)',
                              'rgba(255, 206, 86, 1)',
                              'rgba(75, 192, 192, 1)',
                              'rgba(153, 102, 255, 1)',
                              'rgba(255, 159, 64, 1)'
                          ],
                          borderColor: [
                              'rgba(255,99,132,1)',
                              'rgba(54, 162, 235, 1)',
                              'rgba(255, 206, 86, 1)',
                              'rgba(75, 192, 192, 1)',
                              'rgba(153, 102, 255, 1)',
                              'rgba(255, 159, 64, 1)'
                          ],
                          borderWidth: 2
                        },]
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
            </div>




          </div>
          <!-- // #center -->

        </div>

        <div class="sit-box col-sm-2 col-md-2">
		<% for(IncidentBean i : incilist) { %>
          <div class="col-sm-12 col-md-12 sit-bubble">
            <div class="col-sm-3 col-md-3 sit-icon">
              <i class="fa fa-exclamation-triangle fa-2x" aria-hidden="true"></i>
            </div>
            <div class="col-sm-9 col-md-9">
              <a href="incident/incidentdetail_m.jsp?no=<%=i.getNo() %>"><%= i.getTitle() %></a>
              <p><%= i.getContent() %></p>
            </div>
          </div>
		<% } %>
        </div>


      </div>
      <!-- // section : wrap -->

    </section>








        </div>
    </div>




    <div id="Section">


    </div>


</div>

<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
</body>
</html>
