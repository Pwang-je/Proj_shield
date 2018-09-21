<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="mgr" class="marvel.MemberManager"/>
<jsp:useBean id="dto" class="marvel.MemberDto"/>
<jsp:setProperty property="*" name="dto"/>
<%
mgr.registerMember(dto);
%>
<script>
alert("회원가입을 축하드립니다.\n로그인을 해주세요.");
location.href = "login.jsp";
</script>