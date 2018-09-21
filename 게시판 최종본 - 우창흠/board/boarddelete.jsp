<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cmgr" class="marvel.CaseManager"></jsp:useBean>    

<%   
String bpage = request.getParameter("page");
String no = request.getParameter("no");
%>    
<script type="text/javascript">
if(confirm("정말 삭제할거임?")){
	
	<% cmgr.caseDelete(no); %>
	
	alert("삭제완료");
	location.href = "board.jsp?nowPage="+ <%=bpage%>;
}
</script>
