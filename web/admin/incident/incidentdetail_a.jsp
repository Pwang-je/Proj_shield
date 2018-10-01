<%@page import="java.util.ArrayList"%>
<%@page import="hero.admin_manager.IncidentBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="cmgr" class="hero.admin_manager.CaseManager"/>    
<jsp:useBean id="cdto" class="hero.admin_manager.CaseDto"/> 
<jsp:useBean id="heroMgr" class="hero.admin_manager.HeroAdminMgr"></jsp:useBean>
<%@include file="../session.jsp" %>
<%

String no = request.getParameter("incidentNo");
String npage = request.getParameter("nowPage");
IncidentBean bean = heroMgr.getIncident(no);

String id = bean.getId();
String ip = bean.getIp();
String area = bean.getArea();
String type = bean.getType();
String title = bean.getTitle();
String time = bean.getTime();
String detail = bean.getDetail();
String content = bean.getContent();
String status = bean.getStatus();

if (status.equals("1")) {
	status = "배당";
} else if (status.equals("4")) {
	status = "사건거부";
} else {
	status = "접수 전";
}	

%>
<!DOCTYPE html> 
<!--[if IE 7 ]><html class="ie ie7 lte9 lte8 lte7" lang="en-US"><![endif]-->
<!--[if IE 8]><html class="ie ie8 lte9 lte8" lang="en-US">  <![endif]-->
<!--[if IE 9]><html class="ie ie9 lte9" lang="en-US"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<title>hero</title>
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/common.css">
<link rel="stylesheet" href="../../css/bootstrap-select.min.css">
<script src="../../js/js_m.js"></script>
</head>
<body>
<%
ArrayList<IncidentBean> incilist = new ArrayList<>();
incilist = heroMgr.getIncidentAll(areas);
%>

<div class="wrap col-sm-12 col-md-12">

    <div class="contents container">

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

		<div class="contents col-md-8">
            <form name="frm">
            <div class="col-md-12 contents-wrap">

            <div class="col-md-12">
                <h2 class="text-center" style="margin-bottom: 2rem;">사건세부내용</h2>
            </div>

			<div class="col-md-12">
				<p>글번호 : <%=no %></p>
			</div>

			<div class="col-md-12">
				<div class="col-md-4">
					<p class="text-center">선택 지역</p>
				</div>
				<div class="col-md-8">
					<input type="text" class="form-control" name = "area" value = "<%=area %>" readonly>
				</div>
			</div>
			
			<div class="col-md-12">
				<div class="col-md-4">
					<p class="text-center">IP</p>
				</div>
				<div class="col-md-8">
					<input type="text" class="form-control" name = "ip" value = "<%=ip %>" readonly>
				</div>
			</div>
			
			<div class="col-md-12">
				<div class="col-md-4">
					<p class="text-center">상황</p>
				</div>
				<div class="col-md-8">
					<input type="text" class="form-control" name = "type" value = "<%=type %>" readonly>
				</div>
			</div>

			<div class="col-md-12">
				<div class="col-md-4">
					<p class="text-center">진행 상황</p>
				</div>
				<div class="col-md-8">
					<input type="text" class="form-control" name = "status" value = "<%=status %>" readonly>
				</div>
			</div>

			<div class="col-md-12">
				<div class="col-md-4">
					<p class="text-center">신고자 ID</p>
				</div>
				<div class="col-md-2">
					<input type="text" class="form-control" name = "id" value = "<%=id %>" readonly>
				</div>

				<div class="col-md-4">
					<p class="text-center">등록 일자</p>
				</div>
				<div class="col-md-2">
					<input type="text" class="form-control" name = "time" value = "<%=time %>" readonly>
				</div>
			</div>

			<div class="col-md-12">
				<div class="col-md-4">
					<p class="text-center">제목</p>
				</div>
				<div class="col-md-8">
					<input type="text" class="form-control" name = "title" value = "<%=title %>" readonly>
				</div>
			</div>

			<div class="col-md-12">
				<div class="col-md-4">
					<p class="text-center">사건내용</p>
				</div>
				<div class="col-md-8">
					<textarea class="form-control" rows="10" cols="50" name="content" readonly><%=content %></textarea>
				</div>
			</div>
			
			<div class="col-md-12">
				<div class="col-md-4">
					<p class="text-center">세부상황</p>
				</div>
				<div class="col-md-8">
					<textarea class="form-control" rows="10" cols="50" name="content" readonly><%=detail %></textarea>
				</div>
			</div>

			<div class="col-md-12" align="center">

					<input style="color: black;" type="button" id = "go" value="배 치" onclick="location.href='incidentlist_a.jsp?no=<%=no%>&nowPage=<%=npage%>&status=ok'">
					<input style="color: black" type="button" id = "decline" value="사건 거부" onclick="location.href='incidentlist_a.jsp?no=<%=no%>&nowPage=<%=npage%>&status=cancle'">
					<input style="color: black" type="button" value="목록으로" onclick="location.href='incidentlist_a.jsp?no=<%=no%>&nowPage=<%=npage%>'">

			</div>
		</div>
		
		</form>
	</div>
		<!-- // frm; -->
		

		<!-- // from2; -->

		<div class="sit-box col-sm-2 col-md-2">
		<%
		for(IncidentBean i : incilist) {
		%>
          <div class="col-sm-12 col-md-12 sit-bubble">
            <div class="col-sm-3 col-md-3 sit-icon">
              <i class="fa fa-exclamation-triangle fa-2x" aria-hidden="true"></i>
            </div>
            <div class="col-sm-9 col-md-9">
              <a href="incidentdetail_a.jsp?no=<%=i.getNo() %>"><%= i.getTitle() %></a>
              <p><%= i.getContent() %></p>
            </div>
          </div>
			<% } %>
        </div>

	</div>


<script>
if(frm.status.value === "배당" || frm.status.value === "사건거부") {
	document.getElementById("go").style.display = "none";
	document.getElementById("decline").style.display = "none";
}
</script>
</div>
<!-- // .container; -->
<script src="../../js/jquery-3.3.1.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script src="../../js/bootstrap-select.min.js"></script>
<script src="../../js/defaults-ko_KR.min.js"></script>
</body>
</html>
