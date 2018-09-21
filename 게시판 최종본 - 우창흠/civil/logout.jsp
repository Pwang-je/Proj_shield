<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그아웃 눌렀을때</title>
</head>
<body>
<% session.removeAttribute("idKey"); %>
<script type="text/javascript">
alert("로그아웃 성공");
location.href = "login.jsp"
</script>
</body>
</html>