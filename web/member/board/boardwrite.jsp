<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mgr" class="hero.member.CaseManager"/>
<%
request.setCharacterEncoding("utf-8");
int maxNo = mgr.maxNo()+1;
if(session.getAttribute("idKey") == null) {
%>
<!-- <script>
alert("세션이 종료 되었습니다.\n 다시 로그인하세요");
location.href = "../civil/login.jsp";
</script> -->
<%
}
%>

<!DOCTYPE html>
<!--[if IE 7 ]><html class="ie ie7 lte9 lte8 lte7" lang="en-US"><![endif]-->
<!--[if IE 8]><html class="ie ie8 lte9 lte8" lang="en-US">  <![endif]-->
<!--[if IE 9]><html class="ie ie9 lte9" lang="en-US"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Boardwrite</title>
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/common.css">
<link rel="stylesheet" href="../../css/bootstrap-select.min.css">

<script type="text/javascript" src="../../js/js_mb.js"></script>
<script type="text/javascript">
	function dd() {
		if(frm.type.value === "none" || frm.area.value === "none") {
			document.getElementById("disp1").style.display ="";
			document.getElementById("disp2").style.display ="none";
			document.getElementById("disp3").style.display ="none";
		} else if (frm.type.value === "nature" && frm.area.value !== "none") {
			document.getElementById("disp1").style.display ="none";
			document.getElementById("disp2").style.display ="";
			document.getElementById("disp3").style.display ="none";
		} else if (frm.type.value === "villian" && frm.area.value !== "none") {
			document.getElementById("disp1").style.display ="none";
			document.getElementById("disp2").style.display ="none";
			document.getElementById("disp3").style.display ="";
		}
	}

	 function villain() {
		 window.open('villian.jsp','','width=500, height =500, top=200, left=300 scrollbar = yes, menubar = no;');
	}

	 function check(){
	 		if(frm.type.value === "none"){
				alert("상황을 선택하세요");
				frm.type.focus();
				return;

	 		}else if(frm.type.value === "nature" && frm.detailtype.value === "none"){
					alert("세부상황을 선택하세요");
					frm.detailtype.focus();
					return;

			}else if(frm.type.value === "villian" && frm.villian_name.value === "'검색하기'버튼을 누르세요"){
					alert("악당을 선택하세요")
					frm.villian_name.focus();
					return;
	 		}else if(frm.villian_name.value === ""){
				alert("악당 이름을 선택하세요");
				frm.villian_name.focus();
				return;

	 		}else if(frm.passwd.value === ""){
				alert("비밀번호를 입력하세요");
				frm.passwd.focus();
				return;

	 		}else if(frm.title.value === ""){
				alert("제목을 입력하세요");
				frm.title.focus();
				return;

	 		}else if(frm.content.value === ""){
				alert("내용을 입력하세요");
				frm.content.focus();
				return;

	 		}else if(frm.area.value === "none"){
				alert("지역을 입력하세요");
				frm.area.focus();
				return;
	 		}else{
				frm.submit();
			}
	 }

</script>
</head>

<body>

<div class="wrap col-sm-12 col-md-12">

  <div class="container contents">

    <div id="Contents" class="col-md-8 col-md-offset-2 contents">
      <form action="submit.jsp" name="frm" role="form" autocomplete="off">

        <div class="col-md-12"><h2>사건 신고</h2></div>

        <div class="col-md-9">
          <p>글번호 : <%=maxNo %></p>
        </div>

        <div class="col-md-12" style="margin-top:2rem;">
          <div class="col-md-6">
            <p>지역선택</p>
          </div>
          <div class="col-md-6">
            <select class="form-control selectpicker" name="area" id="area" onchange="dd()">
              <option value="none" selected="selected">지역 선택</option>
              <option value="1">1지역</option>
              <option value="2">2지역</option>
              <option value="3">3지역</option>
              <option value="4">4지역</option>
            </select>
          </div>
        </div>

        <div class="col-md-12" style="margin-top:2rem;">
          <div class="col-md-6">
            <p>상황선택</p>
          </div>
          <div class="col-md-6">
            <select class="form-control selectpicker" name = "type" id = "type" onchange="dd()">
              <option value="none" selected="selected">사건 선택</option>
              <option value="nature">자연재해</option>
              <option value="villian">악 당</option>
            </select>
          </div>
        </div>

        <div class="col-md-9" style="width: 100%">

          <div id="disp1" style="display: ; margin-top:2rem;"><h4>지역/상황을 선택하세요</h4></div>
          <div id="disp2" style="display: none; margin-left: 30px"><h4>세부 상황</h4>
          <select name="detailtype" id="detailtype" style="color: black; width: 200px; height: 30px">
            <option value="none" selected="selected">세부 상황을 선택하세요</option>
            <option value="asteroid">소행성 충돌</option>
            <option value="fire">화염피해</option>
            <option value="pollution">대기오염</option>
            <option value="flood_storm">홍수</option>
            <option value="earthquake">지진</option>
          </select>
		</div>
          <div id="disp3" style="display: none;">
            <h4>악당 선택</h4>
            <label for="villian_name">이름 검색</label>
            <input style="color: black" type="text" name="villian_name" id="villian_name" value="'검색하기' 버튼을 누르세요" readonly>
            <input style="color: black" type="button" value="검색하기" name="btnSearch" onclick="villain()">
        </div>

        <div class="col-md-12" style="margin-top: 20px">
          <div class="col-md-4">
            ID
          </div>
          <div class="col-md-8">
            <%=session.getAttribute("idKey") %>
            <input type="hidden" name = "id" id = "id" value="<%=session.getAttribute("idKey") %>">
          </div>
        </div>

        <div class="col-md-12" style="margin-top: 20px">
          <div class="col-md-4">
            <p>암 호</p>
          </div>
          <div class="col-md-8">
            <input type="password" name="passwd" id="passwd" class="form-control">
          </div>
        </div>

        <div class="col-md-12">
          <div class="col-md-4">
            <p>글제목</p>
          </div>
          <div class="col-md-8">
            <input type="text" id="title" name="title" class="form-control">
          </div>
        </div>

        <div class="col-md-12">
          <div class="col-md-4">
            <p>글내용</p>
          </div>
          <div class="col-md-8">
            <textarea name="content" id="content" cols="50" rows="10"  class="form-control"></textarea>
          </div>
        </div>

        <div class="col-md-12">
          <div class="col-md-12 text-center">
            <input type="hidden" id = "no" name = "no" value="<%=maxNo %>">
            <input type="hidden" id = "unknown" name = "unknown">
            <input type="button" value="신고목록" class="btn btn-default" onclick="location.href='board.jsp?nowPage=1'">
            <input type="button" value="접수하기" class="btn btn-default"  onclick="check()">
          </div>
        </div>
		</div>
      </form>
    </div>
    <!-- // #Contents; -->
  </div>
  <!-- // .container; -->
</div>
<!-- // .wrap -->

<script src="../../js/jquery-3.3.1.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script src="../../js/bootstrap-select.min.js"></script>
<script src="../../js/defaults-ko_KR.min.js"></script>
</body>
</html>
