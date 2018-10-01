<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="mgr" class="hero.admin_manager.CaseManager"/>
<jsp:useBean id="imsi" class="hero.admin_manager.Imsihero" scope="session"/>
<%@include file="../session.jsp" %>
<%

String char1= request.getParameter("char1");

String char2= request.getParameter("char2");

String number = request.getParameter("number");

String filter = "n";

if(request.getParameter("filter3") != null) {
	filter = request.getParameter("filter3");
}

ArrayList<String> list = imsi.getHero(number);
ArrayList<String> list3 = null;

String gender = "none";
String publisher = "none";
String height = "none";
String weight = "none";

String type = "";

String name = "";

if(filter.equals("y")) {
	gender = request.getParameter("gender");
	publisher = request.getParameter("publisher");
	height = request.getParameter("height");
	weight = request.getParameter("weight");
	list3 = mgr.filter(gender, publisher, height, weight, areas);
	if(list3.size() == 0) {
	%>
	<script>
		alert("조건에 해당하는 영웅이 없습니다.\n조건을 다시 검색하세요");
		location.href = "hero.jsp?type=2&char1=<%=char1%>&char2=<%=char2%>&number=<%=number%>"
	</script>
	<%	
	}
	
	if(request.getParameter("name4") != null) {
		boolean b = false;
		b = mgr.checkHero(request.getParameter("name4"), areas);
		if (b == true) {
			list = imsi.addHero(request.getParameter("name4"), list);		
		}else {
	%>
		<script>
			alert("해당 영웅은 사건 해결 중입니다.\n다른 영웅을 선택하세요");
		</script>
	<%		
		}
	}
}

int cnt = 0;

if(request.getParameter("type")==null) {
	type = "0";
} else if (request.getParameter("type").equals("1")) {
	type = "1";
} else if (request.getParameter("type").equals("2")) {
	type = "2";
} else if (request.getParameter("type").equals("3")) {
	type = "3";
}

if(request.getParameter("name3") != null) {
	boolean b = false;
	boolean c = true;
	b = mgr.checkHero(request.getParameter("name3"), areas);
	if (b == true) {
		for(int i = 0; i < list.size(); i++) {
			if(request.getParameter("name3").equals(list.get(i))) {
				c = false;
			}
		}
		if(c) {
			list = imsi.addHero(request.getParameter("name3"), list);					
		}else {
			%>
				<script>
					alert("해당 영웅은 이미 리스트에 있습니다.\n다른 영웅을 선택하세요");
				</script>
			<%
		}
	}else {
%>
	<script>
		alert("해당 영웅은 사건 해결 중이거나 타 지역 영웅입니다.\n다른 영웅을 선택하세요");
	</script>
<%		
	}
}
%>
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

var ajax;
var ready = false;
var voca = "";
var areas = <%=areas%>;

function start() {
	ready = true;
	setTimeout("send()", 500);
}

function send() {
	if(ready === false) {
		return;
	}
	var nowVoca = document.frm1.name3.value;
	if(nowVoca === "") {
		voca = "";
		hide("disp3");
	} else if (nowVoca !== voca) {
		voca = nowVoca;
		if(voca !== "") {
			var content = "con="+voca + "&areas=" + areas;
			ajax = new XMLHttpRequest();
			ajax.open("post", "heroproc.jsp", true);
			ajax.onreadystatechange = function() {
				if(ajax.readyState === 4) {
					if(ajax.status === 200) {
						receive();
					}
				}
			}
			ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			ajax.send(content);
		}
	}
}

function receive() {

	var txt = ajax.responseText;
	var jason = JSON.parse(txt);
	var outprint = "";
	for(var i = 0; i<jason.hero.length; i++) {
		outprint += "<a href = \"#\" onclick = \"setName('"+jason.hero[i].name+"')\">"+jason.hero[i].name + "</a><br>"
	}
	document.getElementById("disp4").innerHTML = outprint;
	show("disp3");
}

function hide(disp3) {
	var imsi = document.getElementById("disp3");
	if(imsi) {
		imsi.style.display = "none";
	}
}

function show(disp3) {
	var imsi = document.getElementById("disp3");
	if(imsi) {
		imsi.style.display = "";
	}
}

function init() {
	ready = false;
	voca = "";
	hide("disp3");
}

function setName(name) {
	
	hide("disp3");
	document.frm1.name3.value = name;
}

function aa() {
	frm3.name3.value = frm3.recommand.value;
	frm3.submit();
}

function choose3() {
	frm1.submit();
	
}

function gogo() {
	if(<%=list.size()%> === 0) {
		alert("등록된 영웅이 없습니다.");
	}else {
		location.href = "goproc.jsp?number=<%=number%>";
		
	}
}

function find() {
	if(frm4.gender.value === "none" && frm4.publisher.value === "none" && frm4.height.value === "none" && frm4.weight.value === "none") {
		alert("적어도 하나의 필터를 적용하세요");
		return;
		
	} else {
		frm4.submit();

	}
}

function bb() {
	frm5.name4.value = frm5.filterlist.value;
	frm5.filter3.value = "y";
	frm5.submit();
}

function cc() {
	frm5.name4.value = null;
	frm5.filter3.value = "n";
	frm5.submit();
}

function remove(no1) {
	frm2.no.value = no1;
	frm2.submit();
}

function filtershow() {
	document.getElementById("filter").style.display = "none";
	document.getElementById("filter1").style.display = "";
}


</script>
</head>
<body style="background:#35435a; color:white; ">
**영웅 선택 페이지**<br>
<form action="hero.jsp" name = "frm">
<input type = "hidden" id = "type" name = "type">
<input type = "hidden" id = "char2" name = "char2" value="<%=char2%>">
<input type = "hidden" id = "char1" name = "char1" value="<%=char1%>">
<input type="hidden" id = "number" name = "number" value = "<%=number %>">
<input type="hidden" name = "filter3"  id = "filter3" value="n">
<input type="button" onclick="frm.type.value='1'; frm.submit();" value = "추천 영웅 목록">
<input type="button" onclick="frm.type.value='2'; frm.submit();" value = "필터 적용 검색">
<input type="button" onclick="frm.type.value='3'; frm.submit();" value = "직접 검색">
</form>
<%
if(type.equals("0")) {

%>
<br><br><br>
현재는 <%= char1 %> 의 <%= char2 %> 상황입니다.<br> 
영웅 선택 방법을 눌러주세요.
<br><br>
<%
} else if(type.equals("1")) {
	if(char1.equals("신원을 알 수 없는 빌런")) {
	%>
	 신원을 알 수 없기에 추천이 이루어지지 않습니다.<br>직접 검색 또는 필터 검색을 누르세요.
	 <br><br><br><br><br>
	<%
	} else {
	ArrayList<String> list1 = null;
	list1 = mgr.recommand(char1, char2, areas);
%>
			<form action="hero.jsp" name="frm3" method="post">

** 추천 영웅 목록 **<br><br>
영웅이름:
			<select name = "recommand" id = "recommand" >
				<option value="none" selected="selected">영웅을 선택하세요</option>
		<%
			for(int i =0; i < list1.size(); i++) {
		%>
				<option value="<%=list1.get(i)%>"><%=list1.get(i)%></option>
		
		<%		
			}
		%>		
			</select>
			<input type="button" value = "선택하기" onclick="aa()">
			<input type = "hidden" id = "char2" name = "char2" value="<%=char2%>">
			<input type = "hidden" id = "char1" name = "char1" value="<%=char1%>">
			<input type="hidden" id = "number" name = "number" value = "<%=number %>">
			<input type="hidden" name = "type"  id = "type" value="1">
			<input type="hidden" name = "name3"  id = "name3">
			<input type="hidden" name = "filter3"  id = "filter3" value="n">
			</form>
			<br><br><br><br><br>
<%
	}
} else if(type.equals("2")) {
%>

<form action="hero.jsp" name = "frm4" method="post">
** 필터 적용 검색 **<br>
<br>
			<div id="filter1" style="display: ">
성별:
			<select name = "gender" id = "gender" >
				<option value="none" selected="selected">성별을 선택하세요</option>
				<option value="Male">남자</option>
				<option value="Female">여자</option>
			</select>
			
소속:
			<select name = "publisher" id = "publisher" >
				<option value="none" selected="selected">소속을 선택하세요</option>
				<option value="Marvel">마블</option>
				<option value="DC">DC</option>
				<option value="else">기타</option>
			</select>
<br><br>			
신장:
			<select name = "height" id = "height" >
				<option value="none" selected="selected">신장을 선택하세요</option>
				<option value="1">~180</option>
				<option value="2">180~200</option>
				<option value="3">200~</option>
				<option value="4">알 수 없음</option>
			</select>
무게:
			<select name = "weight" id = "weight" >
				<option value="none" selected="selected">무게를 선택하세요</option>
				<option value="1">~80KG</option>
				<option value="2">80KG~</option>
				<option value="3">알 수 없음</option>
			</select>			
			
			<input type = "hidden" id = "char2" name = "char2" value="<%=char2%>">
			<input type = "hidden" id = "char1" name = "char1" value="<%=char1%>">
			<input type="hidden" id = "number" name = "number" value = "<%=number %>">
			<input type="hidden" name = "type"  id = "type" value="2">
			<input type="hidden" name = "filter3"  id = "filter3" value="y">
			<input type="button" onclick="find()" value="필터 적용">
<br><br>
			</div>
			
			</form>
			<form action="hero.jsp" name = "frm5" method="post">		

			<div id="filter" style="display: none">

			영웅 목록 :
				<select name = "filterlist" id = "filterlist" >
				<%
				if (filter.equals("y")) {
				%>
				
				<option value="none" selected="selected">영웅을 선택하세요</option>
				<%
				
					for(int i =0; i < list3.size(); i++) {
				%>
						<option value="<%=list3.get(i)%>"><%=list3.get(i)%></option>
				
				<%		
						
					}
				}
				%>	
				</select>
				
				<input type = "hidden" id = "gender" name = "gender" value="<%=gender%>">
				<input type = "hidden" id = "publisher" name = "publisher" value="<%=publisher%>">
				<input type = "hidden" id = "height" name = "height" value="<%=height%>">
				<input type = "hidden" id = "weight" name = "weight" value="<%=weight%>">
				
				<input type = "hidden" id = "char2" name = "char2" value="<%=char2%>">
				<input type = "hidden" id = "char1" name = "char1" value="<%=char1%>">
				<input type="hidden" id = "number" name = "number" value = "<%=number %>">
				<input type="hidden" name = "type"  id = "type" value="2">
				<input type="hidden" name = "name4"  id = "name4">
				<input type="hidden" name = "filter3"  id = "filter3" value="n">
				
				<input type="button" value = "선택하기" onclick="bb()">
				
				<input type="button" value = "필터 다시 적용" onclick="cc()">

				
<br><br><br><br>			
			</div>
		</form>
		
			


<%
				if(filter.equals("y")) {
				%>
				<script>
						document.getElementById("filter").style.display = "";
						document.getElementById("filter1").style.display = "none";
				</script>
				
				<%	
				} else if(filter.equals("n")){
				%>
				<script>
						document.getElementById("filter").style.display = "none";
						document.getElementById("filter1").style.display = "";
				</script>
				<%	
				}



} else if(type.equals("3")) {
%>
<form action="hero.jsp" name="frm1" method="post">
				<input type = "hidden" id = "char2" name = "char2" value="<%=char2%>">
				<input type = "hidden" id = "char1" name = "char1" value="<%=char1%>">
				<input type="hidden" id = "number" name = "number" value = "<%=number %>">
				<input type="hidden" name = "filter3"  id = "filter3" value="n">
** 영웅 이름을 검색하세요 **<br><br>
<input type="hidden" name = "type"  id = "type" value="3">
이름 검색 : 
<input type="text" name = "name3"  id = "name3" onkeydown="start()">
<input type="button" value = "선택하기" onclick="choose3()">
		<div id = "disp3" style="display: ; position: absolute; left:90px; top: 100px;">
			<div id = "disp4" style="background-color: pink">
			</div>
		</div>
</form>
<br><br><br><br><br>
<%
}
%>

<br><br><br><br><br><br>
-- 출동 예정 인원 --
<form action="addproc.jsp" name = "frm2" method="post">

				<input type = "hidden" id = "gender" name = "gender" value="<%=gender%>">
				<input type = "hidden" id = "publisher" name = "publisher" value="<%=publisher%>">
				<input type = "hidden" id = "height" name = "height" value="<%=height%>">
				<input type = "hidden" id = "weight" name = "weight" value="<%=weight%>">
				<input type="hidden" name = "filter3"  id = "filter3" value="<%=filter%>">
				
<input type="hidden" id = "number" name = "number" value = "<%=number %>">
<input type="hidden" name = "type" id = "type" value="<%=type%>">
<input type="hidden" name = "no" id = "no">
<input type="hidden" name = "char1" id = "char1" value="<%=char1%>">
<input type="hidden" name = "char2" id = "char2" value="<%=char2%>">

<table border="1">

<%
if(list.size()>0) {
	for(int i = 0; i< list.size(); i++) {
	cnt++;	
%>
<tr>
<td><%=list.get(i) %><input type="button" value="삭제하기" onclick="remove('<%=i%>')"></td>
</tr>

<%
	}
} else {
%>
<tr>
<td>선택하신 영웅이 없습니다.</td>
</tr>
<%
}
%>
<tr><td>
선택 인원:<%=cnt %>명 입니다.
<input type="button" value="출동명령하기" onclick = "gogo()">
</td></tr>
</table>
</form>













</body>
</html>