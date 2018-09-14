<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 확인 페이지</title>
<script type="text/javascript">
window.onload = function() {
	document.getElementById("btnOk").onclick = function() {
		opener.document.regForm.id.value = frm.hidden.value;
		window.close();
	}
	document.getElementById("btnCancel").onclick = function() {
		location.href = "idproc.jsp";
	}
}
</script>
</head>
<body>
<form action="#" name="frm">
<input type="hidden" name = "hidden" value="<%= request.getParameter("id") %>">
<b><%= request.getParameter("id") %></b>는 사용 가능한 아이디 입니다.
<input type="button" id = "btnOk" value="사용하기">
<input type="button" id = "btnCancel" value="다시 정하기">
</form>
</body>
</html>