<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mgr" class="marvel.CaseManager"/>
<%
request.setCharacterEncoding("utf-8");
int maxNo = mgr.maxNo()+1;
if(session.getAttribute("idKey") == null) {
%>
<script>
alert("세션이 종료 되었습니다.\n 다시 로그인하세요");
location.href = "../civil/login.jsp";
</script>
<%
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신고 글쓰기</title>
<script type="text/javascript" src="../js/script.js"></script>
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

	 function villian() {
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
<h2>사건 신고</h2>
글번호 : <%=maxNo %>
<form action="submit.jsp" name="frm" method="post">
<table border="1">
	<tr>
		<td colspan="2"> 
		지역선택
		<select name = "area" id = "area" onchange="dd()">
			<option value="none" selected="selected">지역 선택</option>
			<option value="1">1지역</option>
			<option value="2">2지역</option>
			<option value="3">3지역</option>
			<option value="4">4지역</option>
		</select>
		상황 선택
		<select name = "type" id = "type" onchange="dd()">
			<option value="none" selected="selected">사건 선택</option>
			<option value="nature">자연재해</option>
			<option value="villian">악 당</option>
		</select>
		</td>
	</tr>
	
	
	<tr>
		<td colspan="2">
		<div id = "disp1" style="display: ">**지역/상황을 선택하세요</div>
		<div id = "disp2" style="display: none">
		**세부상황** <br>
			<select name = "detailtype" id = "detailtype">
				<option value="none" selected="selected" >세부 상황을 선택하세요</option>
				<option value="asteroid">소행성 충돌</option>
				<option value="fire">화염피해</option>
				<option value="pollution">대기오염</option>
				<option value="flood_storm">홍수</option>
				<option value="earthquake">지진</option>
			</select>
		</div>

		<div id = "disp3" style="display: none">
		**악당 선택**<br>
		이름 검색 : <input type="text" name = "villian_name" id = "villian_name" value = "'검색하기'버튼을 누르세요" readonly>
		<input type="button" name = "btnSearch" value = "검색하기" onclick="villian()">
		</div>

		
		</td>
	</tr>


	<tr>
		<td>id</td><td><%=session.getAttribute("idKey") %>
		<input type="hidden" name = "id" id = "id" value="<%=session.getAttribute("idKey") %>">
		</td>
	</tr>
	<tr>
		<td>암 호</td><td><input type="password" id = "passwd" name="passwd" size="15"></td>
	</tr>
	<tr>
		<td>글제목</td><td><input type="text" id = "title" name="title" size="50"></td>
	</tr>
	<tr>
		<td>글내용</td><td><textarea rows="10" cols="50" id = "content" name="content" ></textarea></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="hidden" id = "no" name = "no" value="<%=maxNo %>">
			<input type="hidden" id = "unknown" name = "unknown">
			<input type="button" value="신고목록" onclick="location.href='board.jsp?nowPage=1'">
			<input type="button" value="접수하기" onclick="check()">
		</td>
	</tr>
	<tr>
	</table>
	</form>
</body>
</html>