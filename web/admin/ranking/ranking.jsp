<%@page import="hero.admin_manager.HeroBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="hero.admin_manager.IncidentBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="heroMgr" class="hero.admin_manager.HeroAdminMgr"/>
<%@include file="../session.jsp" %>
<%
ArrayList<IncidentBean> incilist = new ArrayList<>();
incilist = heroMgr.getIncidentAll(areas);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Document</title>
  <link rel="stylesheet" href="../../css/bootstrap.min.css">
  <link rel="stylesheet" href="../../css/common.css">
</head>
<body>
  <div class="wrap col-sm-12 col-md-12">

    <!-- navbar -->
    <div class="navbar col-sm-2 col-md-2">
      <ul>
        <li>
          <a href="#">
            <img src="../../images/logo.png" alt="">
          </a>
          <li><a href="../hero/herolist_a.jsp">영웅관리</a></li>
         <li><a href="../incident/incidentlist_a.jsp">사건관리</a></li>
         <li><a href="../present/presentlist_a.jsp">현황관리</a></li>
         <li><a href="../approval/approvallist_a.jsp">결재관리</a></li>
         <li><a href="../ranking/ranking.jsp">순위</a></li>
         <li><a href="../../login_am/logout.jsp">로그아웃</a></li>
      </ul>
    </div>


    <div class="col-md-8 contents-wrap">

      <div class="col-md-12">

        <div class="col-md-12">
          <h3>RANKING</h3>
        </div>
<%
	ArrayList<HeroBean> list = heroMgr.getmemberAll();
	
	%>

        <div class="col-md-12">
          <div class="rank-1 center-block">
            <img src="../../datas/Aquaman.jpg" alt="" class="img-responsive tocenter">
          </div>
          <div class="center-block rank-img">
            <img src="../../images/rank1.png" alt="" class="img-responsive tocenter">
          </div>
        </div>

        <div class="col-md-6">
          <div class="rank-2 center-block">
            <img src="../../datas/Adam Monroe.jpg" alt="" class="img-responsive tocenter">
          </div>
          <div class="rank-img center-block">
            <img src="../../images/rank2.png" alt="" class="img-responsive tocenter">
          </div>
        </div>

        <div class="col-md-6">
          <div class="rank-3 center-block">
            <img src="../../datas/A-Bomb.jpg" alt="" class="img-responsive tocenter">
          </div>
          <div class="center-block rank-img">
            <img src="../../images/rank3.png" alt="" class="img-responsive tocenter">
          </div>
        </div>
		
	
        <div class="col-md-12">
          <table class="table table-hover">
            <thead>
            	<tr>
	            	<th>Name</th>
	            	<th>Group</th>
	            	<th>Level</th>
	            	<th>Solved Crises</th>
            	</tr>
            	<%
            	for(HeroBean m:list) {%>
				<tr>
					<td><%=m.getName() %></td>
					<td><%=m.getGroups()%></td>
					<td><%=m.getLevel() %></td>
					<td><%=m.getAccum_event_num()%></td>
				</tr>
				<%
				}
				%>
            </thead>
          </table>
        </div>


      </div>
      <!-- // .col-md-12; -->
    </div>
    <!-- //.contents-wrap; -->


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
<script src="../../js/jquery-3.3.1.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
</body>
</html>
