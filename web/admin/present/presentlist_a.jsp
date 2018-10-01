<%@page import="hero.admin_manager.IncidentBean"%>
<%@page import="hero.admin_manager.CaseDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="mgr" class="hero.admin_manager.CaseManager"/>
<jsp:useBean id="heroMgr" class="hero.admin_manager.HeroAdminMgr" />
<%@include file="../session.jsp" %>
<%

String nowPage = request.getParameter("nowPage");
String name = request.getParameter("name");
String title = request.getParameter("title");
if(request.getParameter("name") == null || request.getParameter("name").equals("x")) {
  name = "x";
}
if(request.getParameter("title") == null || request.getParameter("title").equals("x")) {
  title = "x";
}
ArrayList<CaseDto> list = new ArrayList<>();

if(nowPage==null) {
  nowPage = "1";
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

    <title>게시판</title>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <link rel="stylesheet" href="../../css/common.css">
    <link rel="stylesheet" href="../../css/bootstrap-select.min.css">
    <script type="text/javascript">
      window.onload = function() {
        document.getElementById("btnSearch").onclick = Search;
        document.getElementById("btnMain").onclick = Main;
      }

      function Search() {
        if(frm2.sword.value !== "") {
          if(frm2.stype.value === "title") {
            location.href = "presentlist_a.jsp?title="+frm2.sword.value;
          } else if(frm2.stype.value === "name") {
            location.href = "presentlist_a.jsp?name="+frm2.sword.value;
          }
        } else {
          alert("검색 내용 입력 요망");
          frm2.sword.focus();
          return;
        }
      }

      function Main() {
        location.href = "presentlist_a.jsp?nowPage=1";
      }
      </script>
</head>
<body>
<%
ArrayList<IncidentBean> incilist = new ArrayList<>();
incilist = heroMgr.getIncidentAll(areas);


list = mgr.loadCase2(nowPage, name, title, areas);
int ttlPage = mgr.calcPage2(name, title, areas);

String imsi = "";
%>

<div id="Header">

</div>


<div class="contents container" style="background-color: #35435a;">

		<div class="navbar col-sm-2 col-md-2">
          <ul>
            <li>
              <a href="#">
                <img src="../../images/logo.png" alt="">
              </a>
              <li><a href="../hero/herolist_a.jsp">영웅관리</a></li>
         <li><a href="../incident/incidentlist_a.jsp">사건관리</a></li>
         <li><a href="../present/presentlist_a.jsp">현황관리</a></li>
         <li><a href="../approval/approvallist_a.jsp">결재관리</a></li>
         <li><a href="../ranking/ranking.jsp">순위</a></li>
         <li><a href="../../login_am/logout.jsp">로그아웃</a></li>
          </ul>
        </div>
        
        
    <div class="col-md-8" style="margin-top: 4rem;">

		<div class="col-md-12">
           <h2 class="text-center" style="margin-bottom: 2rem;">현황목록</h2>
        </div>

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
                <th colspan="5">현재 등록된 사건이 없습니다.</th>
            </tr>

      
        <%
              	}else {
                                      for(CaseDto a : list) {

                                        if(a.getStatus().equals("0")) {
                                          imsi = "접수완료";
                                        } else if(a.getStatus().equals("1")) {
                                          imsi = "해결요청";
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
            <th>
              <a href ="presentdetail_a.jsp?nowPage=<%=nowPage %>&no=<%=a.getNo() %>"><%=a.getTitle()%></a>
            </th>
            <th><%=imsi %></th>
            <th><%=a.getId() %></th>
            <th><%=a.getTime()%></th>
        </tr>
        <%
          }
        
        %>
        
        <%
        
        
        %>
    <tr><td colspan="5" align="center">
        <%
        for(int i = 1; i<=ttlPage; i++) {
        %>
          <a href="presentlist_a.jsp?nowPage=<%=i %>&name=<%=name %>&title=<%=title %>"><%=i %></a>
        <%
        }
      }
      %>
      </td></tr>
      </table>
      
      <div class="col-md-12 text-center">
    <form action="#" name="frm2" class="form-inline col-md-12">
        <div class="form-group col-md-12">

            <div class="col-md-12">
              <select name="stype" class="selectpicker reg-form-sel">
                  <option value="title" selected>글제목</option>
                  <option value="name">작성자</option>
              </select>
	            <input type="text" name="sword" class="form-control">
	            <input type="button" value="검색" id="btnSearch" class="btn btn-default">
	            <input type="button" value="메인으로" id="btnMain" class="btn btn-default">
            </div>

        </div>
        <!-- .col-md-12; -->
    </form>
</div>
<!-- #bottom col-md-12; -->
            
</div>
<!-- // .col-md-12; -->

		<div class="sit-box col-sm-2 col-md-2">
        <% for(IncidentBean i : incilist) { %>
          <div class="col-sm-12 col-md-12 sit-bubble">
            <div class="col-sm-3 col-md-3 sit-icon">
              <i class="fa fa-exclamation-triangle fa-2x" aria-hidden="true"></i>
            </div>
            <div class="col-sm-9 col-md-9">
              <a href="../incident/incidentdetail_a.jsp?no=<%=i.getNo() %>"><%= i.getTitle() %></a>
              <p><%= i.getContent() %></p>
            </div>
          </div>
		<% } %>
        </div>



</div>
<!-- // .contents container; -->




<script src="../../js/jquery-3.3.1.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script src="../../js/bootstrap-select.min.js"></script>
<script src="../../js/defaults-ko_KR.min.js"></script>
</body>
</html>