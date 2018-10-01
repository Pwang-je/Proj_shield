<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="imsi" class="hero.admin_manager.Imsihero" scope="session"/>
<jsp:useBean id="mgr" class="hero.admin_manager.CaseManager"/>
<%@include file="../session.jsp" %>
<%
String number = request.getParameter("number");

ArrayList<String> list = imsi.getHero(number);
boolean b = false;
boolean c = false;
b = mgr.updateHero(list, number);
c = mgr.updateCase(list, number);
imsi.newlist(list);
if(b && c) {
%>
<script>
alert("출동 명령을 전송합니다.")
opener.location.href = "incidentlist_m.jsp"
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
