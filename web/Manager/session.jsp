<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String areas = (String)session.getAttribute("areas");

if(session.getAttribute("areas") == null) {
%>
<script>
    alert("세션이 종료 되었습니다.\n 다시 로그인하세요");
    location.href = "../../login_am/login.jsp";
</script>
<%
}
%>
