<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="mgr" class="hero.member.MemberManager"/>
<% String id = request.getParameter("id"); %>
<html>
<!--[if IE 7 ]><html class="ie ie7 lte9 lte8 lte7" lang="en-US"><![endif]-->
<!--[if IE 8]><html class="ie ie8 lte9 lte8" lang="en-US">  <![endif]-->
<!--[if IE 9]><html class="ie ie9 lte9" lang="en-US"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<title>ID Check</title>
  <link rel="stylesheet" href="../../css/bootstrap.min.css">
  <link rel="stylesheet" href="../../css/common.css">
  <link rel="stylesheet" href="../../css/materialFormStyles.css">

</head>
<body>

<div class="container">
<form id="materialForm" class="form col-md-12" method="post" action="idproc2.jsp" role="form" autocomplete="off">
<%
	if(id == null) { %>
	  <div class="form-group">
	    <div class="col-md-3" style="text-align: center;">
	      <span>아이디을 입력하세요</span>
	      <input type="text" name="id" class="form-control idproc-sp" placeholder="Username">
	      <input type="submit" value="검색" class="btn btn-info flatButton">
	    </div>
	  </div>		
	<% } else { %>
		<script type="text/javascript">
			location.href = "idproc2.jsp?id=<%=id%>";
		</script>
	<% }
%>
</form>

</div>



  <script src="../../js/jquery-3.3.1.min.js"></script>
  <script src="../../js/bootstrap.min.js"></script>
  <script src="../../js/materialForm.js"></script>
</body>
</html>
