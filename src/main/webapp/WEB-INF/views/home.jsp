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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board.css?after">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/aside.css?after">
<title>UragilLMSW_메인</title>
</head>


<body>
<%@ include file="include/header.jsp" %>
	<center>
	<table width="70%" border="0" cellspacing="0" cellpadding="0">
		<tr height="530">
			<td bgcolor="#fff" align="center" height="500">
			
	<table bgcolor="#fff" height="120" width="700" cellspacing="0px">
		
			<tr align="center" height="50">
				
			
				
		
		<%
			String id=(String)session.getAttribute("id");
			if(id.equals("admin")){
		%>
			<td class="board_br" colspan="2" height="60" >
				<span class="content06" style="color:white;">Uragil 도서관리시스템</span>
				</td>
			</tr>
			
			
			
			<tr>
			<td class="board_br" align="center"> <a href="book_input" style="color:white;" width="250">1.도서정보 입력</a></td>
			<td rowspan="6" bgcolor="#210"><img align="middle" alt="" src="${pageContext.request.contextPath }/resources/img/open-book.jpg" width="500"> </td>
			
		</tr>
		
		<tr>
			<td class="board_br"  align="center"> <a href="book_list" style="color:white;">2. 도서정보 열람</a><td>
		</tr>
		<tr>
			<td class="board_br" align="center"> <a href="br_input" style="color:white;">3. 대출정보 입력</a></td>
		</tr>
		
		<tr>
			<td class="board_br" align="center"> <a href="br_list" style="color:white;">4. 대출정보 열람</a><td>
		</tr>
		
		<tr>
			<td class="board_br" align="center" > <a href="member_list" style="color:white;">5. 회원정보 열람</a></td>
		</tr>
		<%
		} else{
		%>
			<td class="board_br" colspan="3" height="60">
				<span class="content06">Uragil 도서관리시스템</span>
				</td>
			</tr>
		<tr>
			<td class="board_br"  align="center"> <a href="book_list" style="color:white;">1. 도서정보 열람</a><td>
			<td rowspan="6" bgcolor="#210"><img align="middle" alt="" src="${pageContext.request.contextPath }/resources/img/open-book.jpg" width="500"> </td>
		</tr>
		
		<tr>
			<td    align="center"><td>
		</tr>
		<tr>
			<td class="board_br"  align="center"> <a href="mbr_list" style="color:white;">2. 대출정보 열람</a><td>
		</tr>
		
		<tr>
			<td   align="center"> <td>
		</tr>
		
		<tr>
			<td class="board_br" align="center" > <a href="infoModify?brmid=${id }" style="color:white;">3. 회원정보 수정</a></td>
		</tr>
		<%
		}
		%>
		
	</table>
			</td>
		</tr>
	</table>
	
			<aside>
		<div  style="float: left; width: 280px;margin-left:5px; margin-top:5px">
			<table width="280px" bgcolor="#432" color="blue">
		      <ul>
		      <tr class="board01">
			    <th>신규 도서</th>
			  </tr>
			 <tr class="board02">
			    <td>${book01.bname}</td>
			    
			  </tr>
			  <tr class="board02">
			    <td>${book02.bname}</td>
			  </tr>
			  <tr class="board02">
			    <td>${book03.bname}</td>
			  </tr>
		    </ul>
			</table>
		</div>
		
		<div  style="float: right; width: 280px; margin-right:5px; margin-top:5px">
			<table width="280px" bgcolor="darkgreen">
			    <ul>
			      <tr class="board02">
			    <th >인기 도서</th>
			  </tr>
			  <tr class="board01">
			    <td>${book01.bname}</td>
			    
			  </tr>
			  <tr class="board01">
			    <td>${book02.bname}</td>
			  </tr>
			 <tr class="board01">
			    <td>${book03.bname}</td>
			  </tr>
			    </ul>
			</table>
		</div>
		</aside>
	
	</center>
	<%@ include file="include/footer.jsp" %>
</body>
</html>