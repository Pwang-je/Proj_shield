<%@page import="hero.admin_manager.IncidentBean"%>
<%@page import="hero.admin_manager.CaseDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<jsp:useBean id="mgr" class="hero.admin_manager.CaseManager"/>
<jsp:useBean id="heroMgr" class="hero.admin_manager.HeroAdminMgr"></jsp:useBean>
<%@include file="../session.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사건목록 admin</title>
<!-- <link href="../../css/herodetail.css" rel="stylesheet" type="text/css"> -->
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/common.css">
<link rel="stylesheet" href="../../css/bootstrap-select.min.css">
<script src="../../js/js_a.js"></script>
<script>
	window.onload = function() {
		document.getElementById("btnASearch").onclick = ASearch;
		document.getElementById("btnSearch").onclick = Search;
	}
	var cnt = 0;
</script>

<%
	String nowPage = request.getParameter("nowPage");
	String id = request.getParameter("id");
	String title = request.getParameter("title");
	String area = request.getParameter("area");
	String no = request.getParameter("no");

	if (nowPage == null) {
		nowPage = "1";
	}
/*	if (id != null || title != null) { //검색시
		nowPage = "1";
	}*/
	if (no == null) {
		no = "0";
	}

	ArrayList<IncidentBean> list = new ArrayList<>();
	list = heroMgr.loadCase(nowPage, id, title);
	int ttlPage = heroMgr.calcPage(id, title);

	ArrayList<IncidentBean> alist = new ArrayList<>();
	alist = heroMgr.AreaCase(area);
	int attlPage = heroMgr.calcAreaPage(area);

	
	
	String status = request.getParameter("status"); //case 수정
	boolean c = false;
	boolean d = false;
	if (status != null) {
		if (status.equals("ok")) {
			c = heroMgr.ConfirmStatus(no);	
			if(c){ 
%>
				<script type="text/javascript">
				cnt = 1;
				if(cnt == 1) {
				   location.href = "incidentlist_a.jsp"
				   cnt = 0;
				}
				</script>
<% 					
				c = false;
			}
		} else if (status.equals("cancle")) {
			d = heroMgr.CancelStatus(no);
			if(d){
				%>
				<script type="text/javascript">
				cnt = 1;
				if(cnt == 1) {
				   location.href = "incidentlist_a.jsp"
				   cnt = 0;
				}
				</script>
<% 					
				d = false;
			}
		}
	}
%>

</head>
<body>

<div class="contents container">
<%
ArrayList<IncidentBean> incilist = new ArrayList<>();
incilist = heroMgr.getIncidentAll(areas);
%>
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
           <h2 class="text-center" style="margin-bottom: 2rem;">사건목록</h2>
        </div>
        
		<div class="col-md-12">
		<table class="table table-hover">
			<thead>
				<tr>
					  <th scope="col">no</th>
			          <th scope="col">area</th>
			          <th scope="col">title</th>
			          <th scope="col">id</th>
			          <th scope="col">time</th>
			          <th scope="col">status</th>

				</tr>
				<%
				String str = "";
				if (area == null) {
					for (IncidentBean b : list) {
						if (b.getStatus().equals("1")) {
							str = "사건접수";
						} else if (b.getStatus().equals("4")) {
							str = "사건거부";
						} else {
							str = "접수 전";
						}
				%>
			</thead>


			</div>
					
					<tr>
						<th><%=b.getNo()%></th>
						<th><%=b.getArea()%> 지역</th>
						<th><%=b.getTitle()%></th>
						<th><%=b.getId()%></th>
						<th><%=b.getTime()%></th>
						<th><%=str%></th>
						<th>
							<form action="incidentdetail_a.jsp" name="frm2" method="post">
								<input type="hidden" name="incidentNo" class="form-control" value="<%=b.getNo()%>">
								<input type="hidden" name="nowPage" class="form-control" id="nowPage"
									value="<%=nowPage%>"> 
									<input type="submit" name="btnDetail" class="btn btn-submit" value="상세보기">
							</form>
						</th>
					</tr>
				</td></tr>

					<%
					}
					%>
				</table>	
			</div>
			

			<!-- pagination -->
			<div align="center">
				<%
			for (int i = 1; i <= ttlPage; i++) {
				if(id == null && title == null){
		%>
		<a href="incidentlist_a.jsp?nowPage=<%=i%>"><%=i%></a>
		<%
			}else if (title != null) {
		%>
		<a href="incidentlist_a.jsp?nowPage=<%=i%>&title=<%=title%>"><%=i%></a>
		<%
			}else if (id != null){	
		%>
		<a href="incidentlist_a.jsp?nowPage=<%=i%>&id=<%=id%>"><%=i%></a>
		<%
			}

				}
			}
		%>
			</div>

			<!--  전체지역 지역별보기 -->
			


<!-- durldurl -->
<%
		if (area != null) {
			for (IncidentBean b : alist) {
				if (b.getStatus().equals("1")) {
					str = "사건접수";
				} else if (b.getStatus().equals("4")) {
					str = "사건거부";
				} else {
					str = "접수 전";
				}
	%>
	<tr>
		<td><%=b.getNo()%></td>
		<td><%=b.getArea()%> 지역</td>
		<td><%=b.getTitle()%></td>
		<td><%=b.getId()%></td>
		<td><%=b.getTime()%></td>
		<td><%=str%></td>
		<td>
			<form action="incidentdetail_a.jsp" name="frm2" method="post">
				<input type="hidden" name="incidentNo" value="<%=b.getNo()%>">
				<input type="hidden" name="nowPage" id="nowPage"
					value="<%=nowPage%>"> <input type="submit" name="btnDetail"
					value="상세보기">
			</form>
		</td>
	</tr>
	<%
		}
	%>
	</table>
	</div>
<!-- durldurl -->




			
			<%
			for (int i = 1; i <= attlPage; i++) {
				if(id == null && title == null){
		%>
		<a href="incidentlist_a.jsp?nowPage=<%=i%>"><%=i%></a>
		<%
			}else if (title != null) {
		%>
		<a href="incidentlist_a.jsp?nowPage=<%=i%>&title=<%=title%>"><%=i%></a>
		<%
			}else if (id != null){	
		%>
		<a href="incidentlist_a.jsp?nowPage=<%=i%>&id=<%=id%>"><%=i%></a>
		<%
			}

				}
			}
		%>
			
			
			
<div class="col-md-12">
	

	<div class="col-md-6">	
	<form action="frm3" name="frm3" method="post" class="text-center">
		
		<select name="atype" class="form-control">
			
			<option value="0">전체지역</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>

		</select>
		<input type="button" value="지역별 보기" id="btnASearch" class="btn btn-default">
	</form>
	</div>


	<div class="col-md-6">
		<form name="frm" method="post" class="text-center">			
			<select name="stype" class="form-control">
				<option value="id">신고자</option>
				<option value="title">글제목</option>
			</select> 
			
			<div class="col-md-8">
			<input type="text" name="sword" class="form-control">
			</div>
			 
			<input type="button" value="검색" id="btnSearch" class="btn btn-default">
		</form>		
	</div>




</div>


		</div>
		<!-- // contents; -->
	
		
		<div class="sit-box col-sm-2 col-md-2">
        <%
		for(IncidentBean i : incilist) {
		%>
          <div class="col-sm-12 col-md-12 sit-bubble">
            <div class="col-sm-3 col-md-3 sit-icon">
              <i class="fa fa-exclamation-triangle fa-2x" aria-hidden="true"></i>
            </div>
            <div class="col-sm-9 col-md-9">
              <a href="incidentdetail_a.jsp?no=<%=i.getNo() %>"><%= i.getTitle() %></a>
              <p><%= i.getContent() %></p>
            </div>
          </div>
			<% } %>
          
		
        </div>

<script src="../../js/jquery-3.3.1.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script src="../../js/bootstrap-select.min.js"></script>
<script src="../../js/defaults-ko_KR.min.js"></script>
</body>
</html>
