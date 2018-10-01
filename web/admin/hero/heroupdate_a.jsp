<%@page import="hero.admin_manager.HeroBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="heroMgr" class="hero.admin_manager.HeroAdminMgr" />
<%@include file="../session.jsp" %>
<%
	String name = request.getParameter("name");
	String race = request.getParameter("race");
	String publisher = request.getParameter("publisher");
	String group = request.getParameter("groups");
%>
<!DOCTYPE html>
<!--[if IE 7 ]><html class="ie ie7 lte9 lte8 lte7" lang="en-US"><![endif]-->
<!--[if IE 8]><html class="ie ie8 lte9 lte8" lang="en-US">  <![endif]-->
<!--[if IE 9]><html class="ie ie9 lte9" lang="en-US"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/responsive.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


</head>
<body>

<div id="wrap">

    <header>
      <div id="header-wrap" class="cnotainer col-sm-12 col-md-12">
        <h2>abc</h2>
      </div>
    </header>

    <section>

      <div class="wrap col-sm-12 col-md-12">

        <!-- navbar -->
        <div class="navbar col-sm-2 col-md-2">
          <ul>
            <li>
              <a href="#">
                <img src="../images/manage/logo.png" alt="">
              </a>
              <li><a href="../hero/herolist_a.jsp">영웅관리</a></li>
	         <li><a href="../incident/incidentlist_a.jsp">사건관리</a></li>
	         <li><a href="../present/presentlist_a.jsp">현황관리</a></li>
	         <li><a href="../approval/approvallist_a.jsp">결재관리</a></li>
	         <li><a href="../ranking/ranking.jsp">순위</a></li>
	         <li><a href="../../login_am/logout.jsp">로그아웃</a></li>
          </ul>
        </div>

        <!-- contents -->
        <div class="contents col-sm-8 col-md-8">

          <div id="center" class="col-sm-12 col-md-12">

            <div class="col-sm-12 col-md-12 sub-menu">
              <h1>submenu</h1>
            </div>


            <div class="form-container col-sm-12 col-md-12">

              <form action="heroproc_m.jsp?flag=update" name="updateFrm" method="post" class="form-inline">

				<%
					HeroBean bean = heroMgr.getHeroDetail(name);
				%>
			
              <!-- Small profile image -->
              <div class="hero-modi-img col-sm-6 col-md-6">
                <img src="../images/hero/003cap_com_crd_01.jpg" alt="">
              </div>
              <!-- //.f-img -->


                <div class="form-group">
                  <label for="lbname" class="lb-ctrl">Name</label>
                  <input type="text" name="name" id="lbname" class="col-md-12 form-control" placeholder="name" value="<%=name%>">
                </div>

                <div class="form-group">
                  <label for="lbname" class="lb-ctrl">Gender</label>
                  <select name="gender" id="lbname" class="col-md-12 form-control">
							<%
								if (bean.getGender().equals("Male")) {
							%>
							<option value="<%=bean.getGender()%>"><%=bean.getGender()%></option>
							<option value="Female">Female</option>
							<%
								} else {
							%>
							<option value="<%=bean.getGender()%>"><%=bean.getGender()%></option>
							<option value="Male">Male</option>
							<%
								}
							%>
					</select>                
                </div>
                <div class="form-group">
                  <label for="lbname" class="lb-ctrl">Race</label>
                  <select name="race" id="lbname" class="col-md-12 form-control">
							<%
								ArrayList<HeroBean> races = heroMgr.getRaceList();
							for (HeroBean r : races) {
								if (r.getRace().equals(race)) {
							%>
							<option value="<%=r.getRace()%>" selected><%=r.getRace()%></option>
							<%
								} else {
							%>
							<option value="<%=r.getRace()%>"><%=r.getRace()%></option>
							<%
								}
							}
							%>
					</select>
                </div>
                
                <div class="form-group">
                  <label for="lbname" class="lb-ctrl">Height</label>
                  <input type="text" name="height" id="lbname" class="col-md-12 form-control" placeholder="Height">
                  
                </div>
					
                <div class="form-group">
                  <label for="lbname" class="lb-ctrl">Weight</label>
                  <input type="text" name="weight" id="lbname" class="col-md-12 form-control" placeholder="Weight">
                  
                </div>
                
                <div class="form-group">
                  <select name="publisher" id="lbname" class="col-md-12 form-control">
							<%
								ArrayList<HeroBean> publishers = heroMgr.getPublishersList();
							for (HeroBean p : publishers) {
								if (p.getPublisher().equals(publisher)) {
							%>
							<option value="<%=p.getPublisher()%>" selected><%=p.getPublisher()%></option>
							<%
								} else {
							%>
							<option value="<%=p.getPublisher()%>"><%=p.getPublisher()%></option>
							<%
								}
							}
							%>
					</select>
                </div>

                <div class="form-group">
                  <label for="lbname" class="lb-ctrl">Hair color</label>
                  <input type="text" name="hair_color" id="lbname" class="col-md-12 form-control" placeholder="Hair color" value="<%=bean.getHair_color()%>">
                </div>

                <div class="form-group">
                  <label for="lbname" class="lb-ctrl">Eye color</label>
                  <input type="text" name="eye_color" id="lbname" class="col-md-12 form-control" placeholder="Eye Color" value="<%=bean.getEye_color()%>">
                </div>

				<div class="form-group">
                  <label for="lbname" class="lb-ctrl">Skin color</label>
                  <input type="text" name="skin_color" id="lbname" class="col-md-12 form-control" placeholder="Skin Color" value="<%=bean.getSkin_color()%>">
                </div>
                
                <div class="form-group">
                  <label for="lbname" class="lb-ctrl">Alignment</label>
                  <input type="text" name="alignment" id="lbname" class="col-md-12 form-control" placeholder="Alignment" value="<%=bean.getAlignment()%>">
                </div>
                
                <div class="form-group">
                  <label for="lbname" class="lb-ctrl">Group</label>
                  <input type="text" name="group" id="lbname" class="col-md-12 form-control" placeholder="Alignment" value="<%=bean.getGroups()%>" readonly="readonly">
                </div>
				
				
                <div class="col-sm-3 col-md-3 btn-size">
                  <input type="button" value="수정">
                </div>

                <div class="col-sm-3 col-md-3 btn-size">
                  <input type="button" value="확인">
                </div>

              </form>

            </div>
            <!-- // .container -->


            <div class="col-sm-12 col-md-12 modi-middle">
              <h1>center</h1>
            </div>
            <!-- modi-middle -->


          </div>
          <!-- // #center -->

        </div>
        <!-- // .contents -->


        <div class="sit-box col-sm-2 col-md-2">
          <div class="col-sm-12 col-md-12 sit-bubble">
            <div class="col-sm-3 col-md-3 sit-icon">
              <i class="fa fa-exclamation-triangle fa-2x" aria-hidden="true"></i>
            </div>
            <div class="col-sm-9 col-md-9">
              <p>Warning!</p>
              <p>빌런이 ㅊ들어옴</p>
            </div>
          </div>
        </div>



      </div>
      <!-- // section : wrap -->

    </section>

</div>

<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/Chart.min.js"></script>
</body>
</html>
