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




