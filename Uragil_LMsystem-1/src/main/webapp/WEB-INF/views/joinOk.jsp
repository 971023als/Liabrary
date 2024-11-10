<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/join.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member.css?after">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main.css?after">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/menu.css?after">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="include/header.jsp" %>

	<center>	
	<table width="70%" border="0" cellspacing="0" cellpadding="20">
		<tr height="500">
			<td bgcolor="#cba" align="center">
				<%
					int checkId = Integer.parseInt(request.getAttribute("checkId").toString());
					if(checkId == 1) {
				%>
				<script type="text/javascript">
					alert("입력하신 아이디는 이미 사용중 입니다!. 다른 아이디를 입력하세요.");
					history.go(-1);
					reg_frm.mid.focus();
				</script>
				<%
					}
				%>
										
				<span class="content01"> 
				'${mname }' 님 회원가입을 축하 드립니다.<br>
				가입한 ID는</span> <span class="text03">'${mid}' </span> 입니다.
				<hr>
					<input class="button03" type="button" value="홈으로" onclick="location.href='home'">
					
			</td>		
		</tr>
	</table>
	</center>
	
<%@ include file="include/footer.jsp" %>
</body>
</html>