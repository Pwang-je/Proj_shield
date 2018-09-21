<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="imsi" class="hero.cases.manager.imsihero" scope="session"/>
<%
request.setCharacterEncoding("utf-8");
String no = request.getParameter("no");
String type = request.getParameter("type");
String char1 = request.getParameter("char1");
String char2 = request.getParameter("char2");
String number = request.getParameter("number");
imsi.remove(no);
response.sendRedirect("hero.jsp?type="+type+"&char1="+char1+"&char2="+char2+"&number="+number);
%>