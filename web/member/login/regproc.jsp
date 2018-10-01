<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="mgr" class="hero.member.MemberManager"/>
<jsp:useBean id="dto" class="hero.member.MemberDto"/>
<jsp:setProperty property="*" name="dto"/>
<%
boolean b = mgr.registerMember(dto);

if(b) { %>
	<script>
	alert("회원가입을 축하드립니다\n로그인을 해주세요.");
	location.href = "login.jsp";
	</script>
<%
} else { %>
	<script>
	alert("회원가입 실패");
	location.href = "register.jsp";
	</script>
<%
}
%>
