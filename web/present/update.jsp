<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mgr" class="hero.cases.manager.caseManager"/>
<%
request.setCharacterEncoding("utf-8");
String nowPage = request.getParameter("nowPage");
String no = request.getParameter("number");
boolean b = false;
boolean c = false;

b = mgr.complete(no);
c = mgr.updateHero2(no);


if(b && c) {
%>
	<script>
		alert("업데이트 완료.")
		location.href = "presentlist_m.jsp?nowPage=<%=nowPage%>";
	</script>

<%	
}else {
%>
		alert("업데이트 실패.\n관리자에게 문의하세요")
		location.href = "history.back()";
<%
}
%>