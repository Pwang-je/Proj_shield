// Admin JS

function main() { // Main
	location.href = "../index/admin_index_a.jsp";
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

function etc() { // 사건 처리 Display
	var etc = document.getElementById("etc");
	
	if(etc.style.display == "none") {
		etc.style.display = "block";
	}
}

function ASearch() { //지역별 보기
		if(frm3.atype.value ==="0") {
			location.href = "incidentlist_a.jsp";
		}else if(frm3.atype.value ==="1") {
			location.href = "incidentlist_a.jsp?area=1";
		}else if(frm3.atype.value ==="2") {
			location.href = "incidentlist_a.jsp?area=2";
		}else if(frm3.atype.value ==="3") {
			location.href = "incidentlist_a.jsp?area=3";
		}else if(frm3.atype.value ==="4") {
			location.href = "incidentlist_a.jsp?area=4";
		}
}


	
function Search() {	//검색 
	if(frm.sword.value !== "") {
		if(frm.stype.value === "id") {
			location.href = "incidentlist_a.jsp?id="+frm.sword.value;
		} else if(frm.stype.value === "title") {
			location.href = "incidentlist_a.jsp?title="+frm.sword.value;
		}
	} else {
		alert("검색 내용 입력 요망");
		frm.sword.focus();
		return;
	}
}

function approvalUpdate() {
	if(confirm("정말로 영웅을 등록하시겠습니까?")){
		updateFrm.submit();
	}
}

