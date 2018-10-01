<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="heroMgr" class="hero.admin_manager.HeroManagerMgr"/>
<%@include file="../session.jsp" %>

<%
String flag = request.getParameter("flag");
boolean result = false;

if(flag.equals("insert")){
	result = heroMgr.insertHero(request); // Hero Insert
} else if(flag.equals("update")) {
	result = heroMgr.updateHero(request); // Hero Update
} else {
	response.sendRedirect("herolist_m.jsp");
}

if(result) {
%>
	<script>
	alert("정상 등록 완료!!");
	location.href = "herolist_m.jsp";
	</script>
<% } else { %>
<script>
	alert("등록 실패!!\n관리자에게 문의 바람");
	location.href = "herolist_m.jsp";
	</script>
<%
}
%>