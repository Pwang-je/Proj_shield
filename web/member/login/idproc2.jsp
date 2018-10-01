<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="mgr" class="hero.member.MemberManager"/>
<%
boolean b = mgr.idCheck(request.getParameter("id"));
if(b) {
%>
<script>
alert("이미 존재하는 아이디입니다.\n다시 확인하세요");
location.href = "idproc.jsp";
</script>
<%
} else {
%>
<script>
location.href = "idproc3.jsp?id=<%=request.getParameter("id")%>";
</script>
<%
}
%>
</body>
</html>