<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../session.jsp" %>
{"hero":
[
<jsp:useBean id="mgr" class="hero.admin_manager.CaseManager"/>
<%
String voca = request.getParameter("con");

ArrayList<String> list = mgr.heroAll(voca, areas);
%>
<%
String jason = "";
for(int i = 0; i < list.size(); i++) {
	jason += "{";
	jason += "\"name\":" + "\"" + list.get(i) + "\"";
	jason += "},";
}
if(jason.length() > 0) {
	jason = jason.substring(0, jason.length()-1);
}
out.print(jason);
%>
]
}