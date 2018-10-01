<%@page import="hero.admin_manager.IncidentBean"%>
<%@page import="hero.admin_manager.CaseDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="mgr" class="hero.admin_manager.CaseManager"/>
<jsp:useBean id="heroMgr" class="hero.admin_manager.HeroManagerMgr" />
<%@include file="../session.jsp" %>
<%
	String nowPage = request.getParameter("nowPage");
String name = request.getParameter("name");
String title = request.getParameter("title");

if(request.getParameter("name") == null || request.getParameter("name").equals("x")) {
	name = "x";
}
if(request.getParameter("title") == null || request.getParameter("title").equals("x")) {
	title = "x";
}

ArrayList<CaseDto> list = null;

if(nowPage==null) {
	nowPage = "1";
}

ArrayList<IncidentBean> incilist = null;
incilist = heroMgr.getIncidentAll(areas);

list = mgr.loadCase(nowPage, name, title, areas);
int ttlPage = mgr.calcPage(name, title, areas);

String imsi = "";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link href="../../css/herodetail.css" rel="stylesheet" type="text/css"> -->
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/common.css">
<link rel="stylesheet" href="../../css/bootstrap-select.min.css">
<script src="../../js/js_m.js"></script>
<script type="text/javascript">
window.onload = function() {
	document.getElementById("btnSearch").onclick = Search;
	document.getElementById("btnMain").onclick = Main;
}
</script>
</head>
<body>
<div class="contents container">

	<div class="navbar col-sm-2 col-md-2">
       <ul>
         <li>
           <a href="#">
             <img src="../../images/logo.png" alt="">
           </a>
           <li><a href="../hero/herolist_m.jsp">영웅관리</a></li>
           <li><a href="../hero/heroinsert_m.jsp">영웅등록</a></li>
           <li><a href="../incident/incidentlist_m.jsp">사건관리</a></li>
           <li><a href="../present/presentlist_m.jsp">현황관리</a></li>
           <li><a href="../ranking/ranking.jsp">순위</a></li>
           <li><a href="../../login_am/logout.jsp">로그아웃</a></li>
       </ul>
    </div>
        
     <div class="col-md-8" style="margin-top: 4rem;">
    
    	<div class="col-md-12">
           <h2 class="text-center" style="margin-bottom: 2rem;">사건목록</h2>
        </div>
        
		<div class="col-md-12">
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">번 호</th>
          <th scope="col">제 목</th>
          <th scope="col">진행상황</th>
          <th scope="col">작성자</th>
          <th scope="col">작성일</th>
				</tr>
				<%
					if(list.size()==0) {
				%>
			</thead>

				<tr>
					<th colspan="5">현재 요청된 사건이 없습니다.</th>
				</tr>

			</div>
		
			<%
						}else {
										for(CaseDto a : list) {
									
											if(a.getStatus().equals("0")) {
												imsi = "접수완료";
											} else if(a.getStatus().equals("1")) {
												imsi = "해결요청";
											} else if(a.getStatus().equals("2")) {
												imsi = "해결중";
											} else if(a.getStatus().equals("3")) {
												imsi = "해결완료";
											} else if(a.getStatus().equals("4")) {
												imsi = "거부됨";
											}
					%>
					<tr>
					<th><%=a.getNo() %></th>
					<th>
					<a href ="incidentdetail_m.jsp?nowPage=<%=nowPage %>&no=<%=a.getNo() %>"><%=a.getTitle()%></a>
					</th>
					<th><%=imsi %></th>
					<th><%=a.getId() %></th>
					<th><%=a.getTime()%></th>
					</tr>
				<%
				}
				%>
				<tr><td colspan="5" style="text-align: center;">
				<%
				for(int i = 1; i<=ttlPage; i++) {
				%>
					<a href="incidentlist_m.jsp?nowPage=<%=i %>&name=<%=name %>&title=<%=title %>"><%=i %></a>
				<%
				}
			}
			%>
				</td></tr>
				</table>	
			</div>
			
			<div class="col-md-12 text-center">
				<form name="frm2">
					<select name="stype" class="selectpicker">
						<option value="title" selected="selected">글제목</option>
						<option value="name">작성자</option>
					</select>
					<input type="text" name="sword" style="height: 40px; width: 200px">
					<input type="button" class="btn btn-default" value="검색" id="btnSearch">
					<input type="button" class="btn btn-default" value="메인으로" id = "btnMain">
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

<script src="../../js/jquery-3.3.1.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script src="../../js/bootstrap-select.min.js"></script>
<script src="../../js/defaults-ko_KR.min.js"></script>
</body>
</html>
