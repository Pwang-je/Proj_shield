function MyText() {
	location.href = "board.jsp?name="+frm1.name.value;
}
function Logout() {
	location.href = "logout.jsp";
}
function Search() {
	if(frm2.sword.value !== "") {
		if(frm2.stype.value === "title") {
			location.href = "board.jsp?title="+frm2.sword.value;
		} else if(frm2.stype.value === "name") {
			location.href = "board.jsp?name="+frm2.sword.value;
		}
	} else {
		alert("검색 내용 입력 요망");
		frm2.sword.focus();
		return;
	}
}
function Write() {
	location.href = "boardwrite.jsp";
}

function Main() {
	location.href = "board.jsp?nowPage=1";
}































