<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="mgr" class="marvel.MemberManager"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 확인 페이지</title>
</head>
<body>
아이디를 입력하세요.<br>
<form action="idproc2.jsp" method="post">
<input type="text" size="10" name  = "id">
<input type="submit" value="검색">
</form>
</body>
</html>