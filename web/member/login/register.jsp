<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<!--[if IE 7 ]><html class="ie ie7 lte9 lte8 lte7" lang="en-US"><![endif]-->
<!--[if IE 8]><html class="ie ie8 lte9 lte8" lang="en-US">  <![endif]-->
<!--[if IE 9]><html class="ie ie9 lte9" lang="en-US"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<title>Document</title>
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/materialFormStyles.css">
<link rel="stylesheet" href="../../css/common.css">
<link rel="stylesheet" href="../../css/bootstrap-select.min.css">
<script type="text/javascript">
window.onload = function(){
      regForm.id.focus();
      document.getElementById("btnId").onclick = idCheck;
      document.getElementById("btnSubmit").onclick = inputCheck;
}
  //중복확인 버튼
function idCheck() {
	if(regForm.id.value === "") {
		alert("ID를 입력하세요")
		regForm.id.focus();
	} else {
		url = "idproc.jsp?id=" + regForm.id.value;
	    window.open(url, "", "toolbar=no, width=360, height=200, top=200, left=300, scrollbar=yes, menubar=no");
	}
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
<div class="container" id="formOutterWrapper">
        <div class="container" id="formInnerWrapper">
			<form name="regForm" class="form col-md-12" method="post" action="regproc.jsp" role="form" id="materialForm" autocomplete="off">
               <div class="form-group">
                     <div class="col-md-3">
                         <label class="labels" for="id">아이디</label>
                         <input type="text" class="formInput" id="id" name="id">
                     </div>
                     <div class="col-md-3">
                         <input type="button" class="form-control btn" value="ID중복확인" id="btnId">
                     </div>
                 </div>

                 <div class="form-group">
                     <div class="col-md-3">
                         <label class="labels" for="passwd">패스워드</label>
                         <input type="password" class="formInput" id="passwd" name="passwd">
                     </div>
                     <div class="col-md-3">
                         <label class="labels" for="repwd">패스워드 확인</label>
                         <input type="password" class="formInput" id="repwd" name="repwd">
                     </div>
                 </div>

                 <div class="form-group">
                     <div class="col-md-3">
                         <label class="labels" for="name">이름</label>
                         <input type="text" class="formInput" id="name" name="name">
                     </div>
                     <div class="col-md-3">
                         <label class="labels" for="email">이메일</label>
                         <input type="text" class="formInput" id="email" name="email">
                     </div>
                 </div>

                 <div class="form-group">
                     <div class="col-md-3">
                         <label class="labels" for="phone">전화번호</label>
                         <input type="text" class="formInput" id="phone" name="phone">
                     </div>
                 </div>

                 <div class="form-group reg-form-wrap">

                     <div class="col-md-3">
                         <!-- <label class="labels">지역</label> -->
                         <span>지역</span>
                           <select class="form-control" name="area">
                             <option value="0">선택하세요</option>
                             <option value="1 지역" data-subtext="수도권">1</option>
                             <option value="2 지역">2</option>
                             <option value="3 지역">3</option>
                             <option value="4 지역">4</option>
                           </select>
                     </div>

                     <div class="col-md-3">
                         <!-- <label class="labels">직업</label> -->
                         <span>직업</span>
                         <select class="form-control" name="job">
                             <option value="0">선택하세요</option>
                             <option value="회사원">회사원</option>
                             <option value="학생">학생</option>
                             <option value="주부">주부</option>
                             <option value="개인사업">개인사업</option>
                             <option value="기타">기타</option>
                           </select>
                     </div>
                 </div>



                 <div class="form-group col-md-6 col-md-offset-6" style="width: 100%">
                	 <div class="col-md-3 text-center" style="margin: 0 auto;">
                         <input type="reset" value="다시쓰기" class="btn form-control">                     
                         <input type="button" value="가입완료" id="btnSubmit" class="btn form-control">
                     </div>
                     
                 </div>

             </form>
	    </div>
</div>
  <script src="../../js/jquery-3.3.1.min.js"></script>
  <script src="../../js/bootstrap.min.js"></script>
  <script src="../../js/materialForm.js"></script>
  <script src="../../js/bootstrap-select.min.js"></script>
  <script src="../../js/defaults-ko_KR.min.js"></script>
</body>
</html>
