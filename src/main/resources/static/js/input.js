/**
 * 
 */
 
 
 /**
 * 
 */
 
 function inputCheck() {
	

	if(document.breg_frm.bname.value.length == 0) {
		alert("도서타이틀을 입력해주세요");
		breg_frm.bname.focus();
		return;		
	}
	
	if(document.breg_frm.bcategori.value.length == 0) {
		alert("도서장르를 입력해주세요.");
		breg_frm.bcategori.focus();
		return;		
	}
	
	
	
	document.breg_frm.submit();
	
}
	
function brinputCheck(){

	if(document.brreg_frm.brbcode.value.length == 0) {
		alert("도서코드를 입력해주세요.");
		brreg_frm.brbcode.focus();
		return;		
	}
	
	if(document.brreg_frm.brmid.value.length == 0) {
		alert("회원아이디를 입력해주세요");
		brreg_frm.brmid.focus();
		return;		
	}	
	
	document.brreg_frm.submit();
	
}
