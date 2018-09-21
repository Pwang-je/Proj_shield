<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>

<script type="text/javascript">
window.onload = function(){
	regForm.id.focus();
	document.getElementById("btnId").onclick = idCheck;
	document.getElementById("btnSubmit").onclick = inputCheck;
}
//중복확인 버튼
function idCheck() {
		url = "idproc.jsp";
		window.open(url, "", "toolbar=no, width=300, height=150, top=200, left=300, scrollbar=yes, menubar=no");	
}

//회원가입시 정보입력 확인
function inputCheck() {
	if(regForm.passwd.value === ""){
		alert("비밀번호를 입력하세요")
		regForm.passwd.focus();
		return;
	}
	
	if(regForm.passwd.value !== regForm.repwd.value){
		alert("비밀번호가 일치하지 않습니다")
		regForm.passwd.focus();
		return;
	}
	
	if(regForm.name.value === ""){
		alert("이름을 입력해주세요")
		regForm.name.focus();
		return;
	}
	
	if(regForm.email.value ===""){
		alert("이메일을 입력해주세요")
		regForm.email.focus();
		return;
	}
	
	if(regForm.phone.value === ""){
		alert("전화번호를 입려해주세요");
		regForm.phone.focus();
		return;
	}
	
	if(regForm.area.value === "0"){
		alert("지역을 선택해주세요");
		regForm.area.focus();
		return;
	}
	
	if(regForm.job.value === "0"){
		alert("직업을 선택해주세요");
		regForm.job.focus();
		return;
	}
	regForm.submit();
}
</script>


</head>
<body>
<br>
<table class="table">
<tr>

	<td align="center" valign="middle" style="background-color: #8899aa;">

		<form name="regForm" method="post" action="regproc.jsp"><!--registerproc.jsp  -->

			<table border="1">

				<tr align="center" style="background-color: red">

					<td colspan="2"><b style="color: #FFFFFF">회원 가입</b></td>

				</tr>

				<tr>

					<td width="16%">아이디</td>

					<td width="57%">
						<input type="text" name="id" size="15" readonly>
						<input type="button" value="ID중복확인" id="btnId">
						<br>아이디를 등록하려면 중복확인 버튼을 누르세요
					</td>

				</tr>

				<tr>

					<td>패스워드</td>

					<td><input type="password" name="passwd" size="15"></td>

				</tr>

				<tr>

					<td>패스워드 확인</td>

					<td><input type="password" name="repwd" size="15"></td>

				</tr>

				<tr>

					<td>이름</td>

					<td><input type="text" name="name" size="15"></td>

				</tr>

				<tr>

					<td>이메일</td>

					<td><input type="text" name="email" size="27"></td>

				</tr>

				<tr>

					<td>전화번호</td>

					<td><input type="text" name="phone" size="20"></td>

				</tr>

				<tr>

					<td>지역</td>

					<td>
						<select name="area">
							<option value="0">선택하세요
							<option value="1지역">1지역
							<option value="2지역">2지역
							<option value="3지역">3지역
							<option value="4지역">4지역
						</select>
					
					</td>

					
				</tr>

				<tr>

					<td>직업</td>

					<td>

						<select name="job">

							<option value="0">선택하세요

							<option value="회사원">회사원

							<option value="학생">학생

							<option value="주부">주부
							
							<option value="개인사업">개인사업
							
							<option value="기타">기타

						</select>

					</td>

				</tr>

				<tr>

					<td colspan="2" align="center">

						<input type="button" value="회원가입" id="btnSubmit">

						&nbsp;&nbsp;&nbsp;&nbsp; 

						<input type="reset" value="다시쓰기">

					</td>

				</tr>

			</table>

		</form>

	</td>

</tr>



</table>
</body>
</html>