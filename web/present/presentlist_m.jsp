<%@page import="hero.cases.manager.caseDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="mgr" class="hero.cases.manager.caseManager"/>

<%request.setCharacterEncoding("utf-8"); %>
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
ArrayList<caseDto> list = new ArrayList<>();

if(nowPage==null) {
	nowPage = "1";
}


list = mgr.loadCase2(nowPage, name, title);
int ttlPage = mgr.calcPage2(name, title);

String imsi = "";
%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../../css/herodetail.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
window.onload = function() {
	document.getElementById("btnSearch").onclick = Search;
	document.getElementById("btnMain").onclick = Main;
}

function Search() {
	if(frm2.sword.value !== "") {
		if(frm2.stype.value === "title") {
			location.href = "presentlist_m.jsp?title="+frm2.sword.value;
		} else if(frm2.stype.value === "name") {
			location.href = "presentlist_m.jsp?name="+frm2.sword.value;
		}
	} else {
		alert("검색 내용 입력 요망");
		frm2.sword.focus();
		return;
	}
}

function Main() {
	location.href = "presentlist_m.jsp?nowPage=1";
}
</script>
</head>
<body>
<%@include file="../index/manager_top_m.jsp" %>
<h2 align="center">** 사건목록(manager) **</h2>
<table style="width: 100%">
			<tr style="background-color: silver">
				<th>번 호</th><th>제 목</th><th>진행상황</th><th>작성자</th><th>작성일</th>
			</tr>
			<%
			if(list.size()==0) {
			%>
					<tr>
					<th colspan="5">현재 등록된 사건이 없습니다.<br><br><br></th>
					</tr>	
</table>
			<%
			}else {
				for(caseDto a : list) {

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
					<a href ="presentdetail_m.jsp?nowPage=<%=nowPage %>&no=<%=a.getNo() %>"><%=a.getTitle()%></a>
					</th>
					<th><%=imsi %></th>
					<th><%=a.getId() %></th>
					<th><%=a.getTime()%></th>
					</tr>	
				<%	
					
				}
				%>
</table>
				<%
				for(int i = 1; i<=ttlPage; i++) {
				%>
					<a href="presentlist_m.jsp?nowPage=<%=i %>&name=<%=name %>&title=<%=title %>"><%=i %></a>
				<%	
				}
			}
			%>

<form name="frm2">
	<select name="stype">
		<option value="title" selected="selected">글제목</option>
		<option value="name">작성자</option> 
	</select>
	<input type="text" name="sword">
	<input type="button" value="검색" id="btnSearch">
	<input type="button" value="메인으로" id = "btnMain">
</form>
<%@include file="../index/manager_bottom_m.jsp" %>
</body>
</html>