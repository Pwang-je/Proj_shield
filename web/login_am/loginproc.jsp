<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="heroMgr" class="hero.admin_manager.HeroAdminMgr"/>
<%
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
int b = heroMgr.loginCheck(request); //지역확인.

if(b == 1 || b == 2 || b == 3 || b == 4) {
	session.setAttribute("areas", Integer.toString(b));
	response.sendRedirect("../manager/mg_index.jsp");
} else if (b == 999) {
	session.setAttribute("areas", Integer.toString(b));
	response.sendRedirect("../admin/admin_index.jsp");
}
%>
<script>
alert("로그인 정보를 다시 확인하세요");
location.href = "login.jsp";
</script>

<%	
//}
%>