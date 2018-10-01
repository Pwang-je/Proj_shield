<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cmgr" class="hero.member.CaseManager"></jsp:useBean>
<jsp:useBean id="cdto" class="hero.member.CaseDto" ></jsp:useBean>


<%request.setCharacterEncoding("utf-8"); %>
<%
if(session.getAttribute("idKey") == null) {
%>
<!-- <script>
alert("세션이 종료 되었습니다.\n 다시 로그인하세요");
location.href = "../civil/login.jsp";
</script> -->
<%
}
%>

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


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>신고글 상세보기</title>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <link rel="stylesheet" href="../../css/common.css">
    <link rel="stylesheet" href="../../css/bootstrap-select.min.css">
</head>
<body>

<div class="wrap col-sm-12 col-md-12">

    <div class="contents container">

        <div class="contents col-md-8" style="width: 100%">
            <form action="form" name="frm">
                <div class="col-md-12 contents-wrap">

                    <div class="col-md-12">
                        <h2 class="text-center" style="margin-bottom: 2rem;">신고글 상세보기</h2>
                    </div>

                    <div class="col-md-12">
                        <p>글번호 : <%=no %></p>
                    </div>

                    <div class="col-md-12">
                        <div class="col-md-2">
                            <p class="text-center">지역</p>
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
                            <p class="text-center">투입 영웅</p>
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
                        <input type="button" value="되돌아가기" class="btn btn-default" onclick="history.back()">
            			<input type="button" id = "delete" style="display: ;" name="delete" value="접수 취소 하기" class="btn btn-default" onclick="location.href='boarddelete.jsp?no=<%=no%>&page=<%=bpage%>'">
                    </div>
                </div>
                <script>
				if(frm.status.value !== "접수완료") {
					document.getElementById('delete').style.display = "none";
				}
				</script>
            </form>
        </div>

    </div>
    <!-- contents container; -->

</div>
<!-- // .wrap -->

<script src="../../js/jquery-3.3.1.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script src="../../js/materialForm.js"></script>
<script src="../../js/bootstrap-select.min.js"></script>
<script src="../../js/defaults-ko_KR.min.js"></script>
</body>
</html>
