//Manager JS

function main() { // Main
	location.href = "../index/manager_index.jsp";
}

function back() { // 뒤로가기
	history.back();
}

function heroUpdate() { // 영웅 수정
	document.updateFrm.submit();
}


function heroDelete() { // 영웅 등록 폼
	document.deleteFrm.submit();
}

function heroInsert() { // 영웅 등록 폼
	location.href = "heroinsert.jsp";
}

function powerInsert(){
	window.open("powerInsert.jsp", powerInsert, "width=500, height=500, toolbar=no,status=no, location=no, scrollbar=yes, menubar=no, resizable-yes, left=50, right=50");
}

function heroInsertOk() { // 영웅 등록 완료
	document.insertFrm.submit();
}

function etc() { // 사건 처리 Display
	//alert("?")
	var etc = document.getElementById("etc");
	
	if(etc.style.display == "none") {
		etc.style.display = "block";
	}
}

function Search() {
	if(frm2.sword.value !== "") {
		if(frm2.stype.value === "title") {
			location.href = "incidentlist_m.jsp?title="+frm2.sword.value;
		} else if(frm2.stype.value === "name") {
			location.href = "incidentlist_m.jsp?name="+frm2.sword.value;
		}
	} else {
		alert("검색 내용 입력 요망");
		frm2.sword.focus();
		return;
	}
}

function Main() {
	location.href = "incidentlist_m.jsp?nowPage=1";
}




