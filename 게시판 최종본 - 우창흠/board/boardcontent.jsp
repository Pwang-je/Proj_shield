<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cmgr" class="marvel.CaseManager"></jsp:useBean>       
<jsp:useBean id="cdto" class="marvel.CaseDto" ></jsp:useBean> 


<%request.setCharacterEncoding("utf-8"); %>
<%
if(session.getAttribute("idKey") == null) {
%>
<script>
alert("세션이 종료 되었습니다.\n 다시 로그인하세요");
location.href = "../civil/login.jsp";
</script>
<%
}
%>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신고글 상세보기</title>
<%
String bpage = request.getParameter("page");
String no = request.getParameter("no");

cdto = cmgr.getCaseData(no);

String area = cdto.getArea() + " 지역";
String detail = cdto.getDetail();
String status = "";

if(cdto.getStatus().equals("0")) {
	status = "접수완료";
} else if(cdto.getStatus().equals("1")) {
	status = "결제완료";
} else if(cdto.getStatus().equals("2")) {
	status = "해결중";
} else if(cdto.getStatus().equals("3")) {
	status = "해결완료";
} else if(cdto.getStatus().equals("4")) {
	status = "거부됨";
} 
String heroes = "";
if(cdto.getHeroes().equals("0")) {
	heroes = "아직 배치된 영웅이 없습니다.";
} else {
	heroes = cdto.getHeroes() + "가 투입됨.";
}

String id = cdto.getId();
String time = cdto.getTime();
String title = cdto.getTitle();
String content = cdto.getContent();

String type = "";
if(cdto.getType().equalsIgnoreCase("villian_unknown")) {
	type = "신원을 알 수 없는 빌런";
} else {
	type = cdto.getType();
}
%>

</head>
<body>
<form name = "frm">
글번호 : <%=no %>
<table border="1">
	<tr>
		<td colspan="4"> 
		선택지역 : 
		<input type="text" name = "area" value = "<%=area %>" readonly>
		</td>
	</tr>
	<tr>
		<td> 
		사건 종류 : 
		</td>
		<td>
		<input type="text" name = "type" value = "<%=type %>" readonly>
		</td>
		<td> 
		진행 상황 : 
		</td>
		<td>
		<input type="text" name = "status" value = "<%=status %>" readonly>
		</td>
	</tr>
	<tr>
		<td> 
		상세 상황 : 
		</td>
		<td colspan="3">
		<input type="text" name = "detail" size="30" value = "<%=detail %>" readonly>
		</td>
	</tr>
	<tr>
		<td> 
		투입 영웅 : 
		</td>
		<td colspan="3">
		<input type="text" name = "heroes" size="50" value = "<%=heroes %>" readonly>
		</td>
	</tr>
	<tr>
		<td> 
		신고자 id : 
		</td>
		<td>
		<input type="text" name = "id" value = "<%=id %>" readonly>
		</td>
		<td> 
		등록 일자 : 
		</td>
		<td>
		<input type="text" name = "time" value = "<%=time %>" readonly>
		</td>
	</tr>
	<tr>
		<td colspan="4"> 
		제목 : 
		<input type="text" name = "title" value = "<%=title %>" readonly>
		</td>
	</tr>
	<tr>
		<td colspan="4"> 
		내용 : 
		<textarea rows="10" cols="50" name="content" readonly><%=content %></textarea>
		</td>
	</tr>

	<tr>
		<td colspan="4" align="center">
			<input type="button" name="return" value="되돌아가기" onclick="location.href='board.jsp?nowPage=<%=bpage%>'">
			<input type="button" id = "delete" style="display: ;" name="delete" value="접수 취소 하기" onclick="location.href='boarddelete.jsp?no=<%=no%>&page=<%=bpage%>'">
		</td>
	</tr>
</table>
	<script>
	if(frm.status.value !== "접수완료") {
		document.getElementById('delete').style.display = "none";
	}
	</script>
</form>
</body>
</html>