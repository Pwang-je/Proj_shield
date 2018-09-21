<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function ee() {
	if(frm1.char1.value !== "none" && frm1.char2.value !== "none") {
		frm1.unknown.value = frm1.char1.value+"의 능력과"+frm1.char2.value+"의 키";
		document.getElementById("disp1").style.display ="";
		document.getElementById("disp2").style.display ="none";
	} else {
		document.getElementById("disp1").style.display ="none";
		document.getElementById("disp2").style.display ="";
	}
	
}

var ajax;
var ready = false;
var voca = "";


function start() {
	ready = true;
	setTimeout("send()", 500);
}

function send() {
	if(ready === false) {
		return;
	}
	var nowVoca = document.frm1.name.value;
	if(nowVoca === "") {
		voca = "";
		hide("disp3");
	} else if (nowVoca !== voca) {
		voca = nowVoca;
		var char1 = frm1.char1.value;
		var char2 = frm1.char2.value;
		if(voca !== "") {
			var content = "con="+voca+"&char1="+char1+"&char2="+char2;
			ajax = new XMLHttpRequest();
			ajax.open("post", "villianproc.jsp", true);
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
	for(var i = 0; i<jason.villain.length; i++) {
		outprint += "<a href = \"#\" onclick = \"setName('"+jason.villain[i].name+"')\">"+jason.villain[i].name + "</a><br>"
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
	document.frm1.name.value = name;
}


</script>
</head>
<body>
<form name="frm1">
<table>
	<tr>
		<td>
			능력:
			<select name = "char1" id = "char1" onchange="ee()">
				<option value="none" selected="selected">능력을 선택하세요</option>
				<option value="enhancement">enhancement</option>
				<option value="emission">emission</option>
				<option value="manipulation">manipulation</option>
				<option value="transformation">transformation</option>
				<option value="psionic">psionic</option>
			</select>
			외관:
			<select name = "char2" id = "char2" onchange="ee()">
				<option value="none" selected="selected">외관을 선택하세요</option>
				<option value="0~180">~180</option>
				<option value="180~190">180~190</option>
				<option value="190~200">190~200</option>
				<option value="200~">200~</option>
				<option value="계속변화하는">크기가 바뀜</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>
			<div id = "disp1" style="display: none">
				이름을 모르는 경우, NA를 입력하고 '선택하기'를 누르세요.<br>
				이름 검색 : 
				<input type="text" name = "name" onkeydown="start()">
				<input type="hidden" name = "unknown" id = "unknown">
				<input type="button" value = "선택하기" 
				onclick="
				if(document.frm1.name.value === '') {
					alert('이름을 입력하세요');
					document.frm1.name.focus();
					return;
				} else {
					if(document.frm1.name.value === 'na' || document.frm1.name.value === 'NA') {
						opener.document.frm.villian_name.value = document.frm1.name.value; 
						opener.document.frm.unknown.value = document.frm1.unknown.value;
						window.close();
					} else {
						opener.document.frm.villian_name.value = document.frm1.name.value; 
						window.close();
					}
				}
				">
			</div>
			<div id = "disp2" style="display: ">
				**대분류를 먼저 선택하세요**
			</div>
		</td>
	</tr>
</table>
		<div id = "disp3" style="display: ; position: absolute; left:80px; top: 110px;">
			<div id = "disp4" style="background-color: pink">
			</div>
		</div>
</form>
</body>
</html>