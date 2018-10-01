<%@page import="hero.admin_manager.HeroBean"%>
<%@page import="hero.admin_manager.IncidentBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<jsp:useBean id="cmgr" class="hero.admin_manager.CaseManager"/>
<jsp:useBean id="heroMgr" class="hero.admin_manager.HeroAdminMgr" />
<%@include file="../session.jsp" %>
<%

String name = request.getParameter("name");

ArrayList<IncidentBean> incilist = new ArrayList<>();
incilist = heroMgr.getIncidentAll(areas);
%>
<!DOCTYPE html>
<!--[if IE 7 ]><html class="ie ie7 lte9 lte8 lte7" lang="en-US"><![endif]-->
<!--[if IE 8]><html class="ie ie8 lte9 lte8" lang="en-US">  <![endif]-->
<!--[if IE 9]><html class="ie ie9 lte9" lang="en-US"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<head>
<title>Title</title>
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/common.css">
<link rel="stylesheet" href="../../css/responsive.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="../../js/js_a.js"></script>
</head>
<body>

<div id="wrap">

    <header>
      <div id="header-wrap" class="cnotainer col-sm-12 col-md-12">

      </div>
    </header>

   <section>

      <div class="wrap col-sm-12 col-md-12">

        <!-- navbar -->
        <div class="navbar col-sm-2 col-md-2">
          <ul>
            <li>
              <a href="#">
                <img src="../images/manage/logo.png" alt="">
              </a>
              <li><a href="../hero/herolist_a.jsp">영웅관리</a></li>
         <li><a href="../incident/incidentlist_a.jsp">사건관리</a></li>
         <li><a href="../present/presentlist_a.jsp">현황관리</a></li>
         <li><a href="../approval/approvallist_a.jsp">결재관리</a></li>
         <li><a href="../ranking/ranking.jsp">순위</a></li>
         <li><a href="../../login_am/logout.jsp">로그아웃</a></li>
            </a>
          </ul>
        </div>

        <!-- contents -->
        <div class="contents col-sm-8 col-md-8">

          <div id="center" class="col-sm-12 col-md-12">

            <div class="col-sm-12 col-md-12">
              <h1>*영웅 상세보기 admin*</h1>
            </div>

            <div class="top col-sm-12 col-md-12">
              <!-- Small profile image -->
              <div class="hero-f-img col-sm-4 col-md-4">
                <img src="../../datas/<%=name%>.jpg" alt="">
              </div>
              <!-- //.f-img -->

              <div class="col-md-6 cont-list">
                <!-- 여기에 상세정보 아웃풋 -->
                <%
                  HeroBean bean = heroMgr.getHeroDetail(name);
                %>
                <div class="col-md-6">
                  <p class="stat-up">NAME</p><p><%=name%></p>
                </div>
                <div class="col-md-6">
                  <p class="stat-up">GENDER</p><p><%=bean.getGender()%></p>
                </div>
                <div class="col-md-6">
                  <p class="stat-up">Race</p><p><%=bean.getRace()%></p>
                </div>
                <div class="col-md-6">
                  <p class="stat-up">Height</p><p><%=bean.getHeight()%></p>
                </div>
                <div class="col-md-6">
                  <p class="stat-up">weight</p><p><%=bean.getWeight()%></p>
                </div>
                <div class="col-md-6">
                  <p class="stat-up">Publisher</p><p><%=bean.getPublisher()%></p>
                </div>
                <div class="col-md-6">
                  <p class="stat-up">Hair color</p><p><%=bean.getHair_color()%></p>
                </div>
                <div class="col-md-6">
                  <p class="stat-up">Eye Color</p><p><%=bean.getEye_color()%></p>
                </div>
                <div class="col-md-6">
                  <p class="stat-up">Skin Color</p><p><%=bean.getSkin_color()%></p>
                </div>
                <div class="col-md-6">
                  <p class="stat-up">Alignment</p><p><%=bean.getAlignment()%></p>
                </div>
              </div>
            </div>

            <div class="col-md-12" style="margin-top : 4rem;">
              <div class="col-md-6">
                <input type="button" value="수정" class="form-control" onclick="javascript:heroUpdate()">
              </div>
              <div class="col-md-6">
                <input type="button" value="삭제" class="form-control" onclick="javascript:heroDelete()">
              </div>
            </div>
            
            <div class="desc-char col-sm-12 col-md-12 text-center">
              	 <img src="../../datas/<%=bean.getLevel()%>.jpg" alt=""  height= "250px" width= auto>
            </div>


            <div class="hero-profile-chart col-sm-6 col-md-6 col-sm-offset-3 col-md-offset-3">
                <canvas id="pf-Chart1" style="width: 100%; height: 100%"></canvas>
              <script>
                var ctx = document.getElementById("pf-Chart1");
                var myChart2 = new Chart(ctx, {
                  type: 'radar',
                  data: {
                    labels: ["DURABILITY", "ENERGY", "FIGHTING SKILLS", "INTELLIGENCE", "SPEED", "STRENGTH"],
                      datasets: [{
                          label: 'SKILLS',
                          data: [3,1,6,3,2,3],
                          backgroundColor: [
                              'rgba(255, 99, 132, 0.2)'
                          ],
                          borderColor: [
                              'rgba(255,99,132,1)'
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



            <!-- <div class="cont-news col-sm-12 col-md-12">
              <div class="embed-responsive embed-responsive-1by1">
                <iframe class="embed-responsive-item" src="https://www.marvel.com/characters/captain-america-steve-rogers#content_grid-3" frameborder="0" scrolling="no"></iframe>
              </div>
            </div> -->




          </div>
          <!-- // #center -->


        </div>
        <!-- // .contents -->


        <div class="sit-box col-sm-2 col-md-2">


          <%
		for(IncidentBean i : incilist) {
		%>
          <div class="col-sm-12 col-md-12 sit-bubble">
            <div class="col-sm-3 col-md-3 sit-icon">
              <i class="fa fa-exclamation-triangle fa-2x" aria-hidden="true"></i>
            </div>
            <div class="col-sm-9 col-md-9">
              <a href="../incident/incidentdetail_m.jsp?no=<%=i.getNo() %>"><%= i.getTitle() %></a>
              <p><%= i.getContent() %></p>
            </div>
          </div>
			<% } %>
          </div>

        </div>



        <form action="heroupdate_a.jsp" name="updateFrm" method="post">
        <input type="hidden" name="name" value="<%=name%>">
        <input type="hidden" name="race" value="<%=bean.getRace()%>">
        <input type="hidden" name="publisher" value="<%=bean.getPublisher()%>">
        <input type="hidden" name="groups" value="<%=bean.getGroups()%>">
      </form>
      <form action="heroproc_a.jsp?flag=delete" name="deleteFrm" method="post">
        <input type="hidden" name="name" value="<%=name%>">
      </form>

      </div>
      <!-- // section : wrap -->

    </section>



        </div>
    </div>




</div>
<script src="../../js/jquery-3.3.1.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script src="../../js/Chart.min.js"></script>
</body>
</html>
