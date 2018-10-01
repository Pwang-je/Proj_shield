<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if IE 7 ]><html class="ie ie7 lte9 lte8 lte7" lang="en-US"><![endif]-->
<!--[if IE 8]><html class="ie ie8 lte9 lte8" lang="en-US">  <![endif]-->
<!--[if IE 9]><html class="ie ie9 lte9" lang="en-US"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/common.css">
<link rel="stylesheet" href="../../css/bootstrap-select.min.css">
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

<div class="container col-md-12">

<form name="frm1">

	<div class="col-md-12" style="margin-bottom: 2rem;">
		<div class="col-md-4" style="margin-top: 4rem;">
			<p>능력</p>
		</div>

		<div class="col-md-8">
			<select name = "char1" id = "char1" class="form-control selectpicker" onchange="ee()">
				<option value="none" selected="selected">능력을 선택하세요</option>
				<option value="enhancement">Enhancement</option>
				<option value="emission">Emission</option>
				<option value="manipulation">Manipulation</option>
				<option value="transformation">Transformation</option>
				<option value="psionic">Psionic</option>
			</select>
		</div>
	</div>

	<div class="col-md-12">
		<div class="col-md-4">
			<p>외관</p>
		</div>

		<div class="col-md-8">
			<select name = "char2" id = "char2" class="form-control selectpicker" onchange="ee()">
				<option value="none" selected="selected">외관을 선택하세요</option>
				<option value="0~180">~180</option>
				<option value="180~190">180~190</option>
				<option value="190~200">190~200</option>
				<option value="200~">200~</option>
				<option value="계속변화하는">크기가 바뀜</option>
			</select>
		</div>
	</div>


	<!-- ??? -->

	<div id="disp1" style="display: none; ; margin-top:4rem;">
		<div class="col-md-12">
		<p>이름을 모르는 경우, NA를 입력하고 '선택하기'를 누르세요.</p>
				<p>이름 검색 :</p>
				<input type="text" name = "name" class="form-control" onkeydown="start()">
				<input type="hidden" name = "unknown" id = "unknown">
				<input type="button" class="btn btn-default" value = "선택하기" onclick=" 
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
	</div>
	<!-- // #disp1; -->

	<div id="disp2" style="display: ; margin-top:4rem;">
		<p>** 대분류를 먼저 선택하세요 **</p>
	</div>

	<div id = "disp3" style="display: ; position: absolute; left:80px; top: 280px;">
			<div id = "disp4" style="background-color: white;">
			</div>
	</div>

</form>
<!-- // form; -->

</div>
<!-- // .container; -->




<script src="../../js/jquery-3.3.1.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script src="../../js/bootstrap-select.min.js"></script>
<script src="../../js/defaults-ko_KR.min.js"></script>
</body>
</html>
