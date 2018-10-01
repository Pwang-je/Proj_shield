<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="imsi" class="hero.admin_manager.Imsihero" scope="session"/>
<%@include file="../session.jsp" %>
<%
String no = request.getParameter("no");
String type = request.getParameter("type");
String char1 = request.getParameter("char1");
String char2 = request.getParameter("char2");
String number = request.getParameter("number");

String filter = request.getParameter("filter3");
String gender = request.getParameter("gender");
String publisher = request.getParameter("publisher");
String height = request.getParameter("height");
String weight = request.getParameter("weight");




ArrayList<String> list = imsi.getHero(number);
imsi.remove(no, list);
response.sendRedirect("hero.jsp?type="+type+"&char1="+char1+"&char2="+char2+"&number="+number+"&filter3="+filter+"&height="+height+"&weight="+weight+"&publisher="+publisher+"&gender="+gender);
%>