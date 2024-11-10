<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member.css">

<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/join.js"></script>
<title>회원정보 수정완료</title>
</head>
<body>
<%@ include file="include/header.jsp" %>

	<center>	
	<table width="75%" border="0" cellspacing="0" cellpadding="10">
		<tr height="530">
			<td bgcolor="#bbbbbb" align="center" height="500">
				<form action="" method="post" name="reg_frm">
				<table>
					<table bgcolor="#333333" height="120" width="400" cellspacing="10px">
						
						<tr align="right" >
							<td colspan="2" align="center">
								<span class="text03">'${memberDto.mid}' </span><span class="text02">님의 회원정보가 수정되었습니다.</span>
							</td>
							
						</tr>
						
						<tr align="right" >
							<td>
								<span class="text01">MEMBER ID:</span>
							</td>
							<td>
								<span class="text02">${memberDto.mid }</span>
								
							</td>
						</tr>
						
						<tr align="right">
							<td>
								<span class="text01">PASSWORD :</span>
							</td>
							<td>
								<span class="text02">${memberDto.mid }</span>
							</td>
						</tr>	
											
						<tr align="right">
							<td>
									<span class="text01">NAME :</span>
							</td>
							<td>
								<span class="text02">${memberDto.mname }</span>
							</td>
						</tr>
						
						<tr align="right">
							<td>
									<span class="text01">PHONE :</span>
							</td>
							<td>
								<span class="text02">${memberDto.mphone }</span>
							</td>
						</tr>
						<tr>
							<td colspan="2"  align="right">
									
								<input class="button04" type="button" value="HOME" onclick="location.href='home'">
							</td>
						</tr>
											
						</table>						

					</table>
					</form>
		</tr>
	</table>
	</center>
	<%@ include file="include/footer.jsp" %>
</body>
</html>