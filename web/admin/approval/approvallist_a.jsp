<%@page import="hero.admin_manager.HeroBean"%>
<%@page import="hero.admin_manager.IncidentBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="heroMgr" class="hero.admin_manager.HeroAdminMgr" />
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
  <link rel="stylesheet" href="../../css/bootstrap-select.min.css">
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

    <div class="col-md-12 text-center" style="margin-top : 4rem;">
      <h2>영웅 결재 목록</h2>
    </div>

    <div class="col-md-12">
      <table class="table table-hover">

        <tr>
          <th>No</th>
          <th>Name</th>
          <th>Gender</th>
          <th>Publisher</th>
          <th>Groups</th>
          <th>Approval</th>
          <th>Detail</th>
        </tr>
        <%
         String stype = request.getParameter("stype");
         String sword = request.getParameter("sword");

            ArrayList<HeroBean> list  = heroMgr.getHeroApprovalList();
            for (HeroBean h : list) {
         %>
        <tr>
          <td><%=h.getNo()%></td>
          <td><%=h.getName()%></td>
          <td><%=h.getGender()%></td>
          <td><%=h.getPublisher()%></td>
          <td><%=h.getGroups()%></td>
          <%
          if(h.getApproval() == 0) { %>
            <td>결제 대기중</td>
          <%
          }
          %>

          <td><a href="../approvaldetail_a.jsp?name=<%=h.getName()%>">상세보기</a></td>
        </tr>
        <%
          }
        %>
      </table>
    </div>

   <div class="col-md-12 text-center" style="margin-top: 2rem;">
       <form action="herolist.jsp" name="frm" method="post">
           <div class="col-md-4">
           <select name="stype" class="form-control">
              <option value="name" selected="selected">이름</option>
              <option value="groups">지역</option>
           </select>
           </div>
           <div class="col-md-4">
           <input type="text" name="sword" class="form-control">
           </div>
           <div class="col-md-4">
           <input type="button" value="검색" id="btnSearch" class="form-control">
           </div>
        </form>
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
              <a href="../incident/incidentdetail_m.jsp?no=<%=i.getNo() %>"><%= i.getTitle() %></a>
              <p><%= i.getContent() %></p>
            </div>
          </div>
			<% } %>
  </div>
   </div>





<script src="../../js/jquery-3.3.1.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script src="../../js/bootstrap-select.min.js"></script>
<script src="../../js/defaults-ko_KR.min.js"></script>
</body>
</html>