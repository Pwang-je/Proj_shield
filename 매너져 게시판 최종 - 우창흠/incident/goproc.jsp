<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="imsi" class="hero.cases.manager.imsihero" scope="session"/>
<jsp:useBean id="mgr" class="hero.cases.manager.caseManager"/>
<%
request.setCharacterEncoding("utf-8");
String number = request.getParameter("number");
ArrayList<String> list = imsi.getHero();
boolean b = false;
boolean c = false;
b = mgr.updateHero(list, number);
c = mgr.updateCase(list, number);
imsi.newlist();
if(b && c) {
%>
<script>
alert("출동 명령을 전송합니다.")
window.close();
</script>

<%
} else {
%>
<script>
alert("처리실패 \n 관리자에게 문의하세요.")
window.close();
</script>
<%	
}
%>
