<%@page import="hero.admin_manager.HeroBean"%>
<%@page import="hero.admin_manager.IncidentBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<jsp:useBean id="heroMgr" class="hero.admin_manager.HeroAdminMgr" />
<jsp:useBean id="cmgr" class="hero.admin_manager.CaseManager"/>
<%@include file="../session.jsp" %>

<%
String name = request.getParameter("name");

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
  <link rel="stylesheet" href="../../css/bootstrap-select.min.css">
  
  <script src="../../js/js_a.js"></script>
</head>
<body>

<div class="wrap col-md-12">

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

  <div class="col-md-8 container contents">

    <div class="col-md-12 text-center">
      <h2>영웅 결재 정보</h2>
    </div>

    <div class="col-md-12">


      <div class="col-md-6">
        <div class="col-md-12 text-center">
          <img src="../../datas/<%=name %>.jpg" alt="">
        </div>
        <div class="col-md-12" style="margin-top:4rem;">
          <div class="col-md-6">
            <input type="button" value="목록" class="form-control" onclick="history.back();">
          </div>
          <div class="col-md-6">
            <input type="button" value="결재" class="form-control" onclick="javascript:approvalUpdate()">
          </div>
        </div>
      </div>
		<%
						HeroBean bean = heroMgr.getHeroDetail(name);
					%>

      <div class="col-md-6">
        <div class="col-md-12">
          <label>NAME</label>
          <input type="text" class="form-control" readonly="readonly" value="<%=name%>">
        </div>

        <div class="col-md-12">
          <label>GENDER</label>
          <input type="text" class="form-control" readonly="readonly" value="<%=bean.getGender()%>">
        </div>

        <div class="col-md-12">
          <label>RACE</label>
          <input type="text" class="form-control" readonly="readonly" value="<%=bean.getRace()%>">
        </div>

        <div class="col-md-12">
          <label>Height</label>
          <input type="text" class="form-control" readonly="readonly" value="<%=bean.getHeight()%>">
        </div>

        <div class="col-md-12">
          <label>weight</label>
          <input type="text" class="form-control" readonly="readonly" value="<%=bean.getWeight()%>">
        </div>

        <div class="col-md-12">
          <label>Publisher</label>
          <input type="text" class="form-control" readonly="readonly" value="<%=bean.getPublisher()%>">
        </div>

        <div class="col-md-12">
          <label>Hair color</label>
          <input type="text" class="form-control" readonly="readonly" value="<%=bean.getHair_color()%>">
        </div>

        <div class="col-md-12">
          <label>Eye Color</label>
          <input type="text" class="form-control" readonly="readonly" value="<%=bean.getEye_color()%>">
        </div>

        <div class="col-md-12">
          <label>Skin Color</label>
          <input type="text" class="form-control" readonly="readonly" value="<%=bean.getSkin_color()%>">
        </div>

        <div class="col-md-12">
          <label>Alignment</label>
          <input type="text" class="form-control" readonly="readonly" value="<%=bean.getAlignment()%>">
        </div>

        <div class="col-md-12">
          <label>Groups</label>
          <input type="text" class="form-control" readonly="readonly" value="<%=bean.getGroups()%>">
        </div>

      </div>
    </div>



  </div>

  <div class="sit-box col-sm-2 col-md-2">
    <%
		for(IncidentBean i : incilist) {
		%>
          <div class="col-sm-12 col-md-12 sit-bubble">
            <div class="col-sm-3 col-md-3 sit-icon">
              <i class="fa fa-exclamation-triangle fa-2x" aria-hidden="true"></i>
            </div>
            <div class="col-sm-9 col-md-9">
              <a href="../incident/incidentdetail_a.jsp?no=<%=i.getNo() %>"><%= i.getTitle() %></a>
              <p><%= i.getContent() %></p>
            </div>
          </div>
			<% } %>
  </div>


</div>

  <form action="approvalproc_a.jsp?flag=update" name="updateFrm" method="post">
    <input type="hidden" name="name" value="<%=name%>">
    <input type="hidden" name="approval" value="1">
  </form>


<script src="../../js/jquery-3.3.1.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script src="../../js/bootstrap-select.min.js"></script>
<script src="../../js/defaults-ko_KR.min.js"></script>
</body>
</html>