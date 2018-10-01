<%@page import="hero.member.CaseDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<jsp:useBean id="mgr" class="hero.member.CaseManager"/>

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
String nowPage = request.getParameter("nowPage");
String name = request.getParameter("name");
String title = request.getParameter("title");
String no = request.getParameter("no");

if(request.getParameter("name") == null || request.getParameter("name").equals("x")) {
name = "x";
}
if(request.getParameter("title") == null || request.getParameter("title").equals("x")) {
title = "x";
}

ArrayList<CaseDto> list = new ArrayList<>();
    if(nowPage == null) {
    nowPage = "1";
    }
    if(no == null) {
    no = "0";
    }
    list = mgr.loadCase(nowPage, name, title);
    int ttlPage = mgr.calcPage(name, title);
    String imsi = "";
    %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

    <title>게시판</title>
    <script type="text/javascript" src="../../js/js_mb.js"></script>
    <script type="text/javascript">
        window.onload = function() {
            document.getElementById("btnMyText").onclick = MyText;
            document.getElementById("btnLogout").onclick = Logout;
            document.getElementById("btnSearch").onclick = Search;
            document.getElementById("btnWrite").onclick = Write;
            document.getElementById("btnMain").onclick = Main;
        }

        function passCheck() {
            frm3.submit();
        }
    </script>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <link rel="stylesheet" href="../../css/materialFormStyles.css">
    <link rel="stylesheet" href="../../css/common.css">
    <link rel="stylesheet" href="../../css/bootstrap-select.min.css">
</head>
<body>
<h1 align="center">사건 게시판</h1>
<div align="right" style="margin-right: 50px"><%=session.getAttribute("idKey") %>님 영웅의 도움이 필요하신가요? 어서오세요</div>
<div align="right" style="margin-right: 50px">
<form name="frm1" style="color: black">
		<input type="hidden" name = "name" value="<%=session.getAttribute("idKey")%>">
		<input type="button" value="내글보기" id="btnMyText">
		<input type="button" value="로그아웃" id="btnLogout">
</form>
</div>



<div class="contents container" style="background-color: #35435a;">

    <div class="col-md-12">

        <table class="table table-hover">
            <thead>
            <tr>
                <th scope="col">번 호</th>
                <th scope="col">제 목</th>
                <th scope="col">진행상황</th>
                <th scope="col">작성자</th>
                <th scope="col">작성일</th>
            </tr>
            <%
            if(list.size()==0) {
            %>
            </thead>

            <tr>
                <th colspan="5">현재 등록된 사건 없음.</th>
            </tr>

        </table>
        <%
        }else {
        for(CaseDto a : list) {

        if(a.getStatus().equals("0")) {
        imsi = "접수완료";
        } else if(a.getStatus().equals("1")) {
        imsi = "결제완료";
        } else if(a.getStatus().equals("2")) {
        imsi = "해결중";
        } else if(a.getStatus().equals("3")) {
        imsi = "해결완료";
        } else if(a.getStatus().equals("4")) {
        imsi = "거부됨";
        }
        %>
        <tr>
            <th><%=a.getNo() %></th>
            <th><a href ="board.jsp?nowPage=<%=nowPage %>&no=<%=a.getNo() %>">
                <%=a.getTitle()%></a></th>
            <th><%=imsi %></th>
            <th><%=a.getId() %></th>
            <th><%=a.getTime()%></th>
        </tr>
        <%
        if(no.equals(a.getNo())) {
        %>
        <tr>
            <th scope="col" colspan="5">
                <form action="boardproc.jsp" name="frm3" method="post" class="form form-inline">
                    <input type="hidden" name="nowPage" value="<%=nowPage %>">
                    <input type="hidden" name = "no" value = "<%=a.getNo() %>">

                    <div class="col-md-12" >
                    <div class="col-md-3 col-md-offset-3"><span> 비밀번호를 입력하세요 </span></div>
                    <input type="password" name="passwd" class="col-md-2 form-control" style="margin: 0;">
                    <input type="button" name="btnPasswd" style="margin: 0 0 0 1rem;" class="btn btn-success flatButton" value="확인" onclick = "passCheck()">
                    </div>
                </form>
            </th>
        </tr>
        <%
        }
        }
        %>
		<tr><td colspan="5" align="center">
        <%
        for(int i = 1; i<=ttlPage; i++) {
        %>
        <a href="board.jsp?nowPage=<%=i %>&name=<%=name %>&title=<%=title %>" style="al"><%=i %></a>
        <%
        }
        }
        %>
        </td></tr>
        </table>
</div>
<!-- // .col-md-12; -->

</div>
<!-- // .contents container; -->

<div class="col-md-12" align="center">
    <form action="#" name="frm2" class="form-inline col" style="width: 100%">
        <div class="form-group col-md-6 col-md-offset-3" style="width:100%">

            <div class="col-md-12">
            <select name="stype" class="selectpicker reg-form-sel">
                <option value="#" selected="selected">선택하세요</option>
                <option value="title">글제목</option>
                <option value="name">작성자</option>
   
            </select>
           
            <input type="text" name="sword" class="form-control" style="width: 200px; height: 44px; margin-top: 10px;">
            </div>
            <div class="col-md-12" style="width: 100%">
            <input type="button" value="검색" id="btnSearch" class="btn form-control">
            <input type="button" value="메인으로" id="btnMain" class="btn form-control">
            <input type="button" value="글쓰기" id="btnWrite" class="btn form-control">
            </div>

        </div>
        <!-- .col-md-12; -->
    </form>
</div>
<!-- #bottom col-md-12; -->

<script src="../../js/jquery-3.3.1.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script src="../../js/materialForm.js"></script>
<script src="../../js/bootstrap-select.min.js"></script>
<script src="../../js/defaults-ko_KR.min.js"></script>
</body>
</html>


</html>
