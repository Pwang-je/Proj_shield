<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<html>
<!--[if IE 7 ]><html class="ie ie7 lte9 lte8 lte7" lang="en-US"><![endif]-->
<!--[if IE 8]><html class="ie ie8 lte9 lte8" lang="en-US">  <![endif]-->
<!--[if IE 9]><html class="ie ie9 lte9" lang="en-US"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<head>
<title>ID Check</title>
  <link rel="stylesheet" href="../../css/bootstrap.min.css">
  <link rel="stylesheet" href="../../css/common.css">
  <link rel="stylesheet" href="../../css/materialFormStyles.css">
<script type="text/javascript">
window.onload = function() {
	document.getElementById("btnOk").onclick = function() {
		opener.document.regForm.id.value = frm.hidden.value;
		window.close();
	}
	document.getElementById("btnCancel").onclick = function() {
		location.href = "idproc.jsp";
	}
}
</script>
</head>
<body>


<div class="container">

  <form id="materialForm" class="form col-md-12" method="post" action="#" role="form" autocomplete="off" name="frm">
  <input type="hidden" name = "hidden" value="<%= request.getParameter("id") %>">
    <div class="form-group">
      <div class="col-md-6">
        <div class="col-md-12">
        <span class="col-md-6"><b><%= request.getParameter("id") %>는 사용가능</b></span>
        </div>
        <div class="col-md-12">
        <input type="button" id = "btnOk" value="사용하기" class="btn btn-info flatButton col-md-offset-2">
        <input type="button" id = "btnCancel" value="재검색" class="btn btn-info flatButton">
        </div>
      </div>
    </div>
  </form>

</div>


  <script src="../../js/jquery-3.3.1.min.js"></script>
  <script src="../../js/bootstrap.min.js"></script>
  <script src="../../js/materialForm.js"></script>
</body>
</html>
