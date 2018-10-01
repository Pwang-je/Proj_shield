<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="hero.member.CaseDto"/>
<jsp:useBean id="mgr" class="hero.member.CaseManager"/>
<%
request.setCharacterEncoding("utf-8");
boolean b = false;

dto.setContent(request.getParameter("content"));
dto.setId(request.getParameter("id"));
dto.setIp(request.getRemoteAddr());
dto.setNo(request.getParameter("no"));
dto.setPasswd(request.getParameter("passwd"));
dto.setTime();
dto.setTitle(request.getParameter("title"));
dto.setArea(request.getParameter("area"));

if(request.getParameter("type").equals("nature")) {
	dto.setDetail(request.getParameter("detailtype"));
	dto.setType(request.getParameter("type"));
} else if (request.getParameter("type").equals("villian")) {
	if(request.getParameter("villian_name").equalsIgnoreCase("NA")) {
		dto.setDetail(request.getParameter("unknown"));
		dto.setType("villian_unknown");
	} else {
		dto.setDetail(request.getParameter("villian_name"));		
		dto.setType(request.getParameter("type"));
	}
}

b = mgr.registerCase(dto);
if(b) {
%>
<script>
alert("사건이 등록되었습니다.");
location.href = "board.jsp?nowPage=1";
</script>

<%	
}else {
%>
<script>
alert("등록실패 \n 관리자에게 문의하세요");
location.href = "board.jsp?nowPage=1";
</script>


<%
}
%>




