<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%//아이디 받기
request.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("idKey");  //loginproc 에서 다시 받는다.
%> -->
<!--[if IE 7 ]><html class="ie ie7 lte9 lte8 lte7" lang="en-US"><![endif]-->
<!--[if IE 8]><html class="ie ie8 lte9 lte8" lang="en-US">  <![endif]-->
<!--[if IE 9]><html class="ie ie9 lte9" lang="en-US"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
		<title>Member Login Page</title>
		<link rel="stylesheet" href="../../css/bootstrap.min.css">
  	<link rel="stylesheet" href="../../css/materialFormStyles.css">
    <link rel="stylesheet" href="../../css/common.css">
    <link rel="stylesheet" href="../../css/responsive.css">
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
<body>

<div class="login-bg">



<%
if(id != null){	//로그인
	response.sendRedirect("");
%>
<%--
	<b><%=id %>님 환영합니다.</b><p/>

--%>
<%}else{%>

			<div class="container" id="formOutterWrapper">

        <div class="container login-form" id="formInnerWrapper">


                <form id="materialForm" class="form col-md-12" method="post" action="#" name="loginForm" role="form" autocomplete="off" style="margin-top: 17%;">

                    <div class="form-group">
                        <div class="col-md-3">
                            <label class="labels" for="id">아이디</label>
                            <input type="text" class="formInput" id="id" name="id">
                        </div>
                        <div class="col-md-3">
                            <label class="labels" for="passwd">패스워드</label>
                            <input type="password" class="formInput" id="passwd" name="passwd">
                        </div>
                    </div>

                    <div class="form-group col-md-12 col-md-offset-6">
                        <div class="col-md-2">
                            <input type="button" value="로그인" id="btnLogin" class="btn form-control">
                        </div>
                        <div class="col-md-2">
                            <input type="button" id="btnNewMember" value="회원가입" class="btn form-control ">
                        </div>
                    </div>

                </form>
				</div>

			</div>
<%
}
%>

</div>


  <script src="../../js/jquery-3.3.1.min.js"></script>
  <script src="../../js/bootstrap.min.js"></script>
  <script src="../../js/materialForm.js"></script>
  <script src="../../js/bootstrap-select.min.js"></script>
  <script src="../../js/defaults-ko_KR.min.js"></script>
</body>
</html>
<!--



<a style="font: red"  href="logout.jsp">[로그아웃]</a> -->
