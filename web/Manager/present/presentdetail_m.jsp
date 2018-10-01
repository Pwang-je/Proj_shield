<%@page import="hero.admin_manager.IncidentBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="cmgr" class="hero.admin_manager.CaseManager"/>
<jsp:useBean id="cdto" class="hero.admin_manager.CaseDto"/>
<jsp:useBean id="heroMgr" class="hero.admin_manager.HeroManagerMgr" />
<%@include file="../session.jsp" %>
<%
String bpage = request.getParameter("nowPage");
String no = request.getParameter("no");

cdto = cmgr.getCaseData(no);

String area = cdto.getArea() + " 지역";
String detail = cdto.getDetail();
String status = "";

if(cdto.getStatus().equals("0")) {
  status = "접수완료";
} else if(cdto.getStatus().equals("1")) {
  status = "해결요청";
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
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>사건 세부내용 manager용</title>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <link rel="stylesheet" href="../../css/common.css">
    <link rel="stylesheet" href="../../css/bootstrap-select.min.css">
    </style>
    <script type="text/javascript">
      function zz() {
        if(confirm("해결이 완료되었습니까?")) {
          frm2.submit();
        }
      }
    </script>
</head>
<body>
<%
ArrayList<IncidentBean> incilist = new ArrayList<>();
incilist = heroMgr.getIncidentAll(areas);
%>
<div class="wrap col-sm-12 col-md-12">

    <div class="contents container">

        <div class="navbar col-sm-2 col-md-2">
          <ul>
            <li>
              <a href="#">
                <img src="../../images/logo.png" alt="">
              </a>
              <li><a href="../hero/herolist_m.jsp">영웅관리</a></li>
              <li><a href="../hero/heroinsert_m.jsp">영웅등록</a></li>
              <li><a href="../incident/incidentlist_m.jsp">사건관리</a></li>
              <li><a href="../present/presentlist_m.jsp">현황관리</a></li>
              <li><a href="../ranking/ranking.jsp">순위</a></li>
              <li><a href="../../login_am/logout.jsp">로그아웃</a></li>
          </ul>
        </div>

        <div class="contents col-md-8">
            <form name="frm">
                <div class="col-md-12 contents-wrap">

                    <div class="col-md-12">
                        <h2 class="text-center" style="margin-bottom: 2rem;">현황세부내용</h2>
                    </div>

                    <div class="col-md-12">
                        <p>글번호 : <%=no %></p>
                    </div>

                    <div class="col-md-12">
                        <div class="col-md-2">
                            <p class="text-center">선택지역</p>
                        </div>
                        <div class="col-md-10">
                            <input type="text" class="form-control" name = "area" value = "<%=area %>" readonly>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="col-md-5">
                            <p class="text-center">사건 종류</p>
                        </div>
                        <div class="col-md-7">
                            <input type="text" class="form-control" name = "type" value = "<%=type %>" readonly>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="col-md-5">
                            <p class="text-center">진행 상황</p>
                        </div>
                        <div class="col-md-7">
                            <input type="text" class="form-control" name = "status" value = "<%=status %>" readonly>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="col-md-2 content-pd">
                            <p class="text-center">상세상황</p>
                        </div>
                        <div class="col-md-10">
                            <input type="text" class="form-control" name = "detail" size="30" value = "<%=detail %>" readonly>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="col-md-2 content-pd">
                            <p class="text-center">출동 영웅</p>
                        </div>
                        <div class="col-md-10">
                            <input type="text" class="form-control" name = "heroes" size="50" value = "<%=heroes %>" readonly>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="col-md-5">
                            <p class="text-center">신고자id</p>
                        </div>
                        <div class="col-md-7">
                            <input type="text" class="form-control" name = "id" value = "<%=id %>" readonly>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="col-md-5">
                            <p class="text-center">등록일자</p>
                        </div>
                        <div class="col-md-7">
                            <input type="text" class="form-control" name = "time" value = "<%=time %>" readonly>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="col-md-2">
                            <p class="text-center">제목</p>
                        </div>
                        <div class="col-md-10">
                            <input type="text" class="form-control" name = "title" value = "<%=title %>" readonly>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="col-md-2">
                            <p class="text-center">내용</p>
                        </div>
                        <div class="col-md-10">
                            <textarea rows="10" class="form-control" cols="50" name="content" readonly><%=content %></textarea>
                        </div>
                    </div>

                    <div class="col-md-12 text-center">
                        <input type="button" value="되돌아가기" class="btn btn-default" onclick="location.href='presentlist_m.jsp?nowPage=<%=bpage%>'">
                        <input type="button" name="check" id = "check" class="btn btn-default" value="해결 완료" onclick="zz()" style="display: ;">
                    </div>
                </div>
                <script>
                  if(frm.status.value === "해결완료") {
                    document.getElementById('check').style.display = "none";
                  }
                  </script>
            </form>
        </div>

        <div class="sit-box col-sm-2 col-md-2">
        <% for(IncidentBean i : incilist) { %>
          <div class="col-sm-12 col-md-12 sit-bubble">
            <div class="col-sm-3 col-md-3 sit-icon">
              <i class="fa fa-exclamation-triangle fa-2x" aria-hidden="true"></i>
            </div>
            <div class="col-sm-9 col-md-9">
              <a href="../incident/incidentdetail_m.jsp?no=<%=i.getNo() %>"><%= i.getTitle() %></a>
              <p><%= i.getContent() %></p>
            </div>
          </div>
		<% } %>
        </div>

    </div>
    
    
    <!-- contents container; -->
	<form action="update.jsp" method="post" name = "frm2">
		<input type="hidden" id = "nowPage" name = "nowPage" value = "<%=bpage %>">
		<input type="hidden" id = "number" name = "number" value = "<%=no %>">
	</form>
</div>
<!-- // .wrap -->

<script src="../../js/jquery-3.3.1.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script src="../../js/materialForm.js"></script>
<script src="../../js/bootstrap-select.min.js"></script>
<script src="../../js/defaults-ko_KR.min.js"></script>
</body>
</html>
