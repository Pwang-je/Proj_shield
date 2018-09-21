<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="mgr" class="marvel.MemberManager"/>
<%
String id = request.getParameter("id");
boolean b = mgr.loginCheck(request);	//mgr.loginCheck(id, pwd);
if(b) {
	session.setAttribute("idKey", id);
	response.sendRedirect("../board/board.jsp");
	
} else {
%>
<script>
alert("로그인 정보를 다시 확인하세요");
location.href = "login.jsp";
</script>
<%	
}
%>