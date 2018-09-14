<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%//아이디 받기
request.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("idKey");  //loginproc 에서 다시 받는다.
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 페이지</title>

<script>

</script>
<script type="text/javascript">//정보입력-> 버튼 눌렀을때-> 함수(확인 및 정보송출)-> loginproc -> DB비교-> 세션설정-> 다시 돌아온다.
window.onload = function(){
	document.getElementById("btnLogin").addEventListener("click", funcLogin, false);
	document.getElementById("btnNewMember").addEventListener("click", funcNew, false);
}

function funcLogin() {
	if(loginForm.id.value === "" || loginForm.passwd.value === "" ){
		alert("정보를 입력하샘");
	}else{
		loginForm.action = "loginproc.jsp";		//loginproc에 post방식으로 요청/ action method submit
		loginForm.method = "post";
		loginForm.submit();
	}
}

function funcNew() {
	location.href = "register.jsp";
}

</script>
</head>
<body style="margin-top: 20px; ">
<%
if(id != null){	//로그인
	response.sendRedirect("");
%>
<%--  
	<b><%=id %>님 환영합니다.</b><p/>
	<a style="font: red"  href="logout.jsp">[로그아웃]</a>
--%>	
<%}else{%>
	<form action="" name="loginForm">
	<table>
		<tr>
			<td colspan="2">마블 로그인</td>
		</tr>
		<tr>
			<td>아 이 디 : </td><td><input type="text" name="id"></td>
		</tr>
		<tr>
			<td>비밀번호 : </td><td><input type="text" name="passwd"></td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="button" value="로그인" id="btnLogin">
			<input type="button" value="회원가입" value="회원가입 " id="btnNewMember">
			</td>
		</tr>
	</table>
	</form>
<%	
}
%>
</body>
</html>