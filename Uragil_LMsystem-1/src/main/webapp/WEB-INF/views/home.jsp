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


<body bgcolor="#fff">



<%@ include file="include/header.jsp" %>
	<center>
	
	
	<div style="float: center; width: 1000px;">			
	<div style="float: left; width: 300;">
	<table bgcolor="#fff" height="120" width="700" cellspacing="0px">
		
			<tr align="center" height="50">
				
			
				
		
		<%
			String id=(String)session.getAttribute("id");
			if(id.equals("admin")){
		%>
			<td class="board_br2" colspan="2" height="60" >
				<span class="content06" >Uragil 도서관리시스템</span>
				</td>
			</tr>
			
			
			
			<tr>
			<td class="board_br2" align="center"> <a href="book_input"  width="250"  style="">1.도서정보 입력</a></td>
			<td rowspan="6" bgcolor="#210"><img align="middle" alt="" src="${pageContext.request.contextPath }/resources/img/open-book.jpg" width="500"> </td>
			
		</tr>
		
		<tr>
			<td class="board_br"  align="center"> <a href="book_list" style="">2. 도서정보 열람</a><td>
		</tr>
		<tr>
			<td class="board_br2" align="center"> <a href="br_input" style="" >3. 대출정보 입력</a></td>
		</tr>
		
		<tr>
			<td class="board_br" align="center"> <a href="br_list" >4. 대출정보 열람</a><td>
		</tr>
		
		<tr>
			<td class="board_br2" align="center" > <a href="member_list" style="">5. 회원정보 열람</a></td>
		</tr>
		<%
		} else{
		%>
			<td class="board_br" colspan="3" height="60">
				<span class="content06">Uragil 도서관리시스템</span>
				</td>
			</tr>
		<tr>
			<td class="board_br"  align="center"> <a href="book_list" >1. 도서정보 열람</a><td>
			<td rowspan="6" bgcolor="#210"><img align="middle" alt="" src="${pageContext.request.contextPath }/resources/img/open-book.jpg" width="500"> </td>
		</tr>
		
		<tr>
			<td    align="center"><td>
		</tr>
		<tr>
			<td class="board_br"  align="center"> <a href="mbr_list" >2. 대출정보 열람</a><td>
		</tr>
		
		<tr>
			<td   align="center"> <td>
		</tr>
		
		<tr>
			<td class="board_br" align="center" > <a href="infoModify?brmid=${id }" >3. 회원정보 수정</a></td>
		</tr>
		<%
		}
		%>
		
	</table>
	</div>
	
			<div  style="float: left; width: 200px;">
			
			<table width="200px" height="452px">
			<tr>
				<td bgcolor="#421" style="background-image:linear-gradient(to right, #160800, #403000);">
			<table width="200px" bgcolor="" cellspacing="0" padding="0">
			<tr class="board04">
			<td>공지사항</td>
			</tr>
			<tr class="board02">
			<td bgcolor="white"  height="170px">안녕하세요 Uragil도서관리시스템웹 입니다.
			2022-07-05 updated <br>
			1. 신규도서no.3 추가 <br>
			2.최다대출도서no.3 추가 
			
			</td>
			</tr>
			<tr><td> </td></tr>
			</table>		
			<table width="200px" bgcolor="" cellspacing="0" padding="0">
		      
		      <tr class="board04">
			    <th colspan="2">New no.3</th>
			  </tr>
			 <tr class="board02">
			    <td>${nbook01.bname}</td>
			    <td>${nbook01.bstate}</td>
			  </tr>
			  <tr class="board02">
			    <td>${nbook02.bname}</td>
			    <td>${nbook02.bstate}</td>
			  </tr>
			  <tr class="board02">
			    <td>${nbook03.bname}</td>
			    <td>${nbook03.bstate}</td>
			  </tr>
			</table>
		
				
		
			<table width="200px" bgcolor="" cellspacing="0" padding="0">
			
			      <tr class="board04">
			    <th  colspan="2">Best no.3</th>
			  </tr>
			  <tr class="board02">
			    <td>${bbook01.bname}</td>
			    <td>${bbook01.brcount}</td>
			  </tr>
			  <tr class="board02">
			    <td>${bbook02.bname}</td>
			    <td>${bbook02.brcount}</td>
			  </tr>
			 <tr class="board02">
			    <td>${bbook03.bname}</td>
			    <td>${bbook03.brcount}</td>
			  </tr>
			  
			</table>
		</div>
				</td>
			</tr>
		</table>

	</div>
	</center>
	<%@ include file="include/footer.jsp" %>
</body>
</html>