<%@page import="java.util.ArrayList"%>
<%@page import="hero.admin_manager.HeroBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<jsp:useBean id="heroMgr" class="hero.admin_manager.HeroManagerMgr"/>
<%@include file="../session.jsp" %>

<%
String stype = request.getParameter("stype");
String sword = request.getParameter("sword");
%>
<html>
<head>
    <title>Title</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <link rel="stylesheet" href="../../css/common.css">
    <link rel="stylesheet" href="../../css/swiper.min.css">
    <link rel="stylesheet" href="../../css/responsive.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="../../js/jquery-3.3.1.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
    <style>
      .swiper-slide {
      width: 20%;    height: 30%;
      width:170px !important;
      margin:0 11px;
      box-shadow:5px 5px 10px 0px #333;
      transition:0.5s;
    }
    .swiper-wrapper {
    	width: 100%;
	}
	
	.swiper-slide:hover{ background:#eb2328; }
	.swiper-slide:hover a, .swiper-slide:hover i, .swiper-slide:hover span{ color:#fff; }
    </style>
    <script>
   window.onload = function() {
      document.getElementById("btnSearch").onclick = function() {
         if (frm.sword.value === "") {
            frm.sword.focus();
            alert("검색어를 입력해 주세요");
            return;
         }

         frm.submit();
      }
      
      $('.header-btn').click(function(e){
    	  /* e.preventDefault();
    	  
    	  var idx = $(this).index();
    	  
    	  $('.header .header-btns a.active').removeClass('active');
    	  $(this).addClass('active');
    	  
    	  $('.header > div').css('display', 'block');
    	  
    	  if(idx == 0) $('.header > div:nth-of-type(3)').css('display', 'block');
    	  else $('.header > div:nth-of-type(2)').css('display', 'block'); */
	});
   }
</script>
</head>
<body>

	<div id="wrap">

		<section>

			<div class="wrap col-md-12" style="padding:0;">
				<!-- navbar -->
				<div class="header">
					<!-- <div class="header-btns">
						<a href="#" class="header-btn active">버튼1</a>
						<a href="#" class="header-btn">버튼2</a>
					</div> -->
					<div class="navbar col-xs-2 col-md-2" style="background-color: #35435a;">
						<ul>
						<li><a href="#"> <img src="../../images/logo.png" alt=""></a></li>
							<li><a href="../hero/herolist_m.jsp">영웅관리</a></li>
							<li><a href="../hero/heroinsert_m.jsp">영웅등록</a></li>
				            <li><a href="../incident/incidentlist_m.jsp">사건관리</a></li>
				            <li><a href="../present/presentlist_m.jsp">현황관리</a></li>
				            <li><a href="../ranking/ranking.jsp">순위</a></li>
				            <li><a href="../../login_am/logout.jsp">로그아웃</a></li>
						</ul>
						<div class="search-form col-md-12">
						
							<form action="herolist2_m.jsp" name="frm" method="post" class="col-md-12">
							<div class="col-md-12">
								<select name="stype" class="form-control" style="height: 40px; margin-top: 2rem;">
									<% 
									if (stype == null || stype.equals("name")) {
									%>
									<option value="name" selected="selected">이름</option>
									<option value="alignment">속성</option>
									<option value="groups">지역</option>
									<%
									} else if (stype.equals("alignment")) {
									%>
									<option value="name">이름</option>
									<option value="alignment" selected="selected">속성</option>
									<option value="groups">지역</option>
									<%
									} else if (stype.equals("groups")) {
									%>
									<option value="name">이름</option>
									<option value="alignment">속성</option>
									<option value="groups" selected="selected">지역</option>
									<%
									} 
									%>
								</select>
							</div>
								<input type="text" name="sword" class="form-control" style="width: 100%;">
								<!-- <button type="submit" id="btnSearch" class="form-control" value="검색"></button>  -->
								<input type="submit" id="btnSearch" class="form-control btn" value="검색"> 	
							</form>
						</div>
					</div>
					<!-- <div class="sit-box col-xs-2 col-md-2"></div> -->
				</div>

				<!-- contents -->
				<div class="contents col-md-10">

					<div id="center" class="swiper-container col-xs-12 col-md-12" style="margin-top: 4rem;">
					
					<div class="swiper-wrapper">
	<%
 
    ArrayList<HeroBean> list  = heroMgr.getHeroesAll(stype, sword, areas);
	for(HeroBean h:list) {
		if(h.getApproval() == 1) {	
	%>	
						<div class="swiper-slide card-common col-xs-3 col-md-3">
							<div class="prof-img col-xs-12 col-md-12">
								<img src="../../datas/<%=h.getName()%>.jpg" alt="">
							</div>
							<div class="prof-article col-xs-12 col-md-12">
								<span><%=h.getName()%></span>
							</div>
							<div class="prof-options col-xs-12 col-md-12">
								<div class="prof-opt-left col-xs-6 col-md-6">
									<i class="fa fa-pencil-square-o fa-1x" aria-hidden="true"></i>
									<a href="heroupdate_m.jsp?name=<%=h.getName()%>">Edit</a>
								</div>
								<div class="prof-opt-right col-xs-6 col-md-6">
									<i class="fa fa-user-o fa-1x" aria-hidden="true"></i> <a
										href="herodetail_m.jsp?name=<%=h.getName()%>">Profile</a>
								</div>
							</div>
						</div>					
	<%
		}
	}
	%>
	
					</div><!-- // swiper-wrapper; -->
						
						

						<div class="swiper-button-next"></div>
						<!-- 다음 버튼 (오른쪽에 있는 버튼) -->
						<div class="swiper-button-prev"></div>
						<!-- 이전 버튼 -->

						<!-- <div class="swiper-pagination"></div> -->
					</div>
					<!-- // #center -->

					<script src="../../js/swiper.min.js"></script>
					<script>

      var swiper = new Swiper ('.swiper-container', {
        // Optional parameters
        // direction: 'horizon',
        loop: true,
        // autoHeight: true, //enable auto height
        slidesPerView: 5,
        slidesPerGroup: 3,
        slidesPerColumn: 3,
        //spaceBetween: 10,

        // If we need pagination
        pagination: {
          el: '.swiper-pagination',
          clickable: true
        },

        // Navigation arrows
        navigation: {
          nextEl: '.swiper-button-next',
          prevEl: '.swiper-button-prev'
        }
      });
  </script>
				</div>
			</div>
			<!-- // section : wrap -->

		</section>

	</div>
	<div id="Section"></div>
</body>
</html>
