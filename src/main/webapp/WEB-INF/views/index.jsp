<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<title>Insert title here</title>
</head>


<body>
<%@ include file="include/header.jsp" %>
<h2 align="center">Uragil 도서 관리시스템 웹에 방문해 주셔서 감사합니다.</h2> <br>


<center>
		<table width="600" border="0" cellspacing="0" cellpadding="10">
		<tr height="450">
			<td style="background-image:url('${pageContext.request.contextPath }/resources/img/open-book.jpg'); " align="center" height="400" >

					<h3 style="color:white;"> 공지사항 입니다.</h3>
					<h5 style="color:white;"> 접속하신 웹은 테스트 버전으로 <br>
			발견하지 못한 오류가 숨어있을수 있습니다. 당첨되신 분은 <br> 
		uragiljay@gmail.com 혹은 <a href="http://uragil-jay.tistory.com">블로그</a>에 남겨주시면 <br>
		감사한 마음으로 최대한 수정하겠습니다!!. <br>
		현재 관리자 ID/PW 는 <span style="color:black;">'admin' 'admin'</span> 이며<br> 
		Guest ID/PW 는 <span style="color:black;">'tiger' '123'</span>  입니다.  자유롭게 로그인 후 이용해주세요!!</h5>
				
			
					
					
		<form action="loginOk" method="post">
		
			<table bgcolor="#210" height="120" width="300" cellspacing="10px">
			
		
			<tr align="center">
				<td class="board_br" colspan="2" >
				<span class="content06">도서관리시스템 사용을 위해<br> 로그인 해주세요</span><br><br>
				</td>
			</tr>
				
				<tr align="right" >
					<td>
						
					</td>
					<td>
						
					</td>
				</tr>
				
				<tr align="right">
					<td>
						
					</td>
					<td>
						
					</td>
					
				</tr>
				
				<tr>
					<td colspan="2"  align="right">
						<input class="button01" type="button" value="로그인" onclick="location.href='login'">
					</td>
				</tr>
				<tr>	
					<td colspan="2"  align="right">
						
						<input class="button04" type="button" value="회원가입" onclick="location.href='join'">
						
					</td>
				</tr>					
			</table>
				</td>
				</tr>
			</table>
			
		</form>
		
		
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