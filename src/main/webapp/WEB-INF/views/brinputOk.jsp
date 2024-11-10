<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/join.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member.css?after">
<title>Insert title here</title>
</head>
<body>

<%@ include file="include/header.jsp" %>

	<center>	
	<table width="70%" border="0" cellspacing="0" cellpadding="20">
		<tr height="500">
			<td bgcolor="d5d5d5" align="center">
				<%
					int checkbrbcode = Integer.parseInt(request.getAttribute("checkbrbcode").toString());
					int checkhavebcode = Integer.parseInt(request.getAttribute("checkhavebcode").toString());
					int checkbrmid = Integer.parseInt(request.getAttribute("checkbrmid").toString());
					if(checkbrbcode != 1) {
				%>
				<script type="text/javascript">
					alert("입력하신 도서코드가 존재하지 않습니다. 도서코드를 확인해주세요.");
					history.go(-1);
					brreg_frm.brbcode.focus();
				</script>
				<%
					}else if(checkhavebcode ==1){
			 	%>
				<script type="text/javascript">
					alert("이미 대출중인 도서코드 입니다. 도서코드를 확인해주세요.");
					history.go(-1);
					brreg_frm.brbcode.focus();
				</script>
				<%
					}else if(checkbrmid !=1){
			 	%>
				<script type="text/javascript">
					alert("입력하신 ID가 존재하지 않습니다. 회원ID를 확인해주세요");
					history.go(-1);
					brreg_frm.brmid.focus();
				</script>
				<%
					} 
				%>
				
										
				<span class="content01"> 
				도서코드 '${brbcode }' 의 도서정보가 입력되었습니다.<br><hr>
				
				
				<input class="button01" type="button" value="계속입력" onclick="location.href='br_input'"><br><br><br>
				
				<input class="button03" type="button" value="대출정보열람" onclick="location.href='br_list'">
			</td>		
		</tr>
	</table>
	</center>
	
<%@ include file="include/footer.jsp" %>
</body>
</html>