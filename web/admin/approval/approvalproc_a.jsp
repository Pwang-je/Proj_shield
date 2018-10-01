<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="heroMgr" class="hero.admin_manager.HeroAdminMgr" />
<%@include file="../session.jsp" %>
<%
	String flag = request.getParameter("flag");
	boolean result = false;
	
	if(flag.equals("update")){ // Hero Update
		result = heroMgr.HeroApprovalUpdate(request);
		response.sendRedirect("approvallist_a.jsp");
	}else if(flag.equals("delete")){ // Hero Delete
		result = heroMgr.HeroApprovalDelete(request);
		response.sendRedirect("approvallist_a.jsp");
	}else{
		response.sendRedirect("approvallist_a.jsp");
	}
	
	if(result){
%>		
		<script>
			alert("정상 등록 완료!!");
			location.href="herolist_a.jsp";
		</script>		
		
<%}else{%>
	
		<script>
		alert("등록 실패!!\n관리자에게 문의 바람");
		location.href="herolist_a.jsp";
		</script>
	
<%	
}
%>