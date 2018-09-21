<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="cmgr" class="hero.cases.manager.caseManager"/>    
<jsp:useBean id="cdto" class="hero.cases.manager.caseDto"/> 

<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../../css/herodetail.css" rel="stylesheet" type="text/css">
<script src="../js/js_m.js"></script>
<style type="text/css">
.incident td:first-of-type {
	text-align: center;
}
</style>


<%

String bpage = request.getParameter("nowPage");
String no = request.getParameter("no");

cdto = cmgr.getCaseData(no);

String area = cdto.getArea() + " 지역";
String detail = cdto.getDetail();
String status = "";

if(cdto.getStatus().equals("0")) {
	status = "접수완료";
} else if(cdto.getStatus().equals("1")) {
	status = "해결요청";
} else if(cdto.getStatus().equals("2")) {
	status = "해결중";
} else if(cdto.getStatus().equals("3")) {
	status = "해결완료";
} else if(cdto.getStatus().equals("4")) {
	status = "거부됨";
} 


String id = cdto.getId();
String time = cdto.getTime();
String title = cdto.getTitle();
String content = cdto.getContent();

String type = "";
if(cdto.getType().equalsIgnoreCase("villian_unknown")) {
	type = "신원을 알 수 없는 빌런";
} else {
	type = cdto.getType();
}
%>
</head>
<body>
<%@include file="../index/manager_top_m.jsp" %>
<h2 align="center">** 사건세부내용(manager) **</h2>
<form name="frm">
글번호 : <%=no %>
<table border="1">
	<tr>
		<td colspan="4"> 
		선택지역 : 
		<input type="text" name = "area" value = "<%=area %>" readonly>
		</td>
	</tr>
	<tr>
		<td> 
		사건 종류 : 
		</td>
		<td>
		<input type="text" name = "type" value = "<%=type %>" readonly>
		</td>
		<td> 
		진행 상황 : 
		</td>
		<td>
		<input type="text" name = "status" value = "<%=status %>" readonly>
		</td>
	</tr>
	<tr>
		<td> 
		상세 상황 : 
		</td>
		<td colspan="3">
		<input type="text" name = "detail" size="30" value = "<%=detail %>" readonly>
		</td>
	</tr>
	<tr>
		<td> 
		신고자 id : 
		</td>
		<td>
		<input type="text" name = "id" value = "<%=id %>" readonly>
		</td>
		<td> 
		등록 일자 : 
		</td>
		<td>
		<input type="text" name = "time" value = "<%=time %>" readonly>
		</td>
	</tr>
	<tr>
		<td colspan="4"> 
		제목 : 
		<input type="text" name = "title" value = "<%=title %>" readonly>
		</td>
	</tr>
	<tr>
		<td colspan="4"> 
		내용 : 
		<textarea rows="10" cols="50" name="content" readonly><%=content %></textarea>
		</td>
	</tr>

	<tr>
		<td colspan="4" align="center">
			<input type="button" name="return" value="되돌아가기" onclick="location.href='incidentlist_m.jsp?nowPage=<%=bpage%>'">
			<input type="button" name="check" id = "check" value="처리하기" onclick="
			window.open('','hero','width=500, height =500, top=200, left=300 scrollbar = yes, menubar = no;');
			document.frm2.action = 'hero.jsp';
			document.frm2.target = 'hero';
			document.frm2.method = 'post';
			document.frm2.submit();
			">
		</td>
	</tr>
	
</table>
</form>
<form action="hero.jsp" method="post" name = "frm2">
<input type="hidden" id = "char1" name = "char1" value = "<%=type %>">
<input type="hidden" id = "char2" name = "char2" value = "<%=detail %>">
<input type="hidden" id = "number" name = "number" value = "<%=no %>">
</form>
<br>

<%@include file="../index/manager_bottom_m.jsp" %>
</body>
</html>