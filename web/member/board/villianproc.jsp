<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
{"villain":
[
<jsp:useBean id="mgr" class="hero.member.CaseManager"/>
<%
request.setCharacterEncoding("utf-8");

String char1 = request.getParameter("char1");
String char2 = request.getParameter("char2");
String voca = request.getParameter("con");

ArrayList<String> list = mgr.loadVillian(char1, char2, voca);
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