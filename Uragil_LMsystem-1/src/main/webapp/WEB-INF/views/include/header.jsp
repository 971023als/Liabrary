<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content.css?after">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main.css?after">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member.css?after">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/header.css?after">

<title>Insert title here</title>
</head>
<body>
	<table width="100%" cellspacing="0" cellpadding="0">
		<tr height="50" bgcolor="#111111" >
			<td width="70%" class="header01">&nbsp;</td>
			
			<td width="10%" class="header01">
			<%
				String sessionValid = (String) session.getAttribute("id");
				if(sessionValid == null){
			%>
			&nbsp;</td>
			<%
			}else{
			%>
			<a href="home" >HOME</a></td>
			<%
			}
			%>
			
			
			<td width="10%" class="header01">		
			<%
				if(sessionValid == null){
			%>
			<a href="login"  >LOG-IN</a>
			<%
			}else{
			%>
			<a href="logout"  >LOGOUT</a></td>
			<%
			}
			%>
								
			<td width="10%" class="header01">
			<%
				if(sessionValid == null){
			%>
			<a href="join"  >JOIN</a>
			<%
			}else{
			%>
			<a href="infoModify"  >MODIFY</td>
			<%
			}
			%>
			
		</tr>
		
		<tr height="50">
			<td>&nbsp;</td>
		</tr>
					
	</table>
	
	

</body>
</html>