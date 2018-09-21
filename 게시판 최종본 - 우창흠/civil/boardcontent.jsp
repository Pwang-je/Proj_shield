<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cmgr" class="marvel.CaseManager"></jsp:useBean>    
<jsp:useBean id="mmgr" class="marvel.MemberManager"></jsp:useBean>    
<jsp:useBean id="cdto" class="marvel.CaseDto" ></jsp:useBean> 
<jsp:useBean id="mdto" class="marvel.MemberDto" ></jsp:useBean> 

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

String id = cdto.getId();
String ip = cdto.getIp();
String date = cdto.getTime();
String title = cdto.getTitle();
String type = cdto.getType();
String content = cdto.getContent();
%>

</head>
<body>
글번호 : <%=no %>
<table border="1">
	<tr>
		<td>작성자 : <%=id %></td>	<td> ip : <%=ip %></td>
	</tr>
	<tr>
		<td colspan="2">작성일 :  <%=date %> </td>
	</tr>
	<tr>
		<td>제 목 : <%=title %></td>	<td> 사건타입 : <%=type %> </td>
	</tr>
	<tr>
		<td colspan="2"><textarea readonly="readonly"><%=content %></textarea></td>
	</tr>	
	<tr>	
		<td colspan="2">
		<input type="button" name="return" value="되돌아가기" onclick="location.href='board.jsp?nowPage=<%=bpage%>'">
		<input type="button" name="edit" value="수정하기" onclick="location.href='boardedit.jsp?no=<%=no%>&page=<%=bpage%>'">
		<input type="button" name="delete" value="삭제하기" onclick="location.href='boarddelete.jsp?no=<%=no%>&page=<%=bpage%>'">
		</td>
	</tr>

</table>
</body>
</html>