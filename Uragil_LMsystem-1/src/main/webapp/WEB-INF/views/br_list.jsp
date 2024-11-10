<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/input.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/menu.css?after">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board.css?after">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/header.css?after">
<meta charset="UTF-8">
<title>대출정보 열람</title>
</head>
<body>

<%@ include file="include/header.jsp" %>

	<center>	
	<table width="70%" border="0" cellspacing="0" cellpadding="10">
		<tr>
			<td align="center"></td>
		</tr>
		<tr>
			<td align="center" height=""></td>
		</tr>
					<table border="0" cellspacing="0" cellpadding="10">
					
						<form action="br_list"> 
							<tr>
								<td colspan="2"align="left">
								<span class="content01">대출정보 목록</span></td>
								<td colspan="5" align="right">
								<select name="searchOption">
           							<option value="brmid">아이디</option>
          						</select>
									
          						<%
								String id=(String)session.getAttribute("id");
								if(id.equals("admin")){
								%>
									<input type="text" name="searchKeyword" >
									<input class="button08" type="submit" value="검색">
							    <%
							    } else {
						    	%>
							    	${id}님의 대출정보 
						    	<%
						    	}
						    	%>

							      
							   </td>
							</tr>
								
						</form>
													
							<tr class="board01" >
								<td >대출코드</td>
								<td >도서코드</td>
								<td >회원ID</td>
								<td >대출일</td>
								<td >반납예정일</td>
								<td >반납상태</td>
								<td > </td>
							</tr>
							<c:forEach items="${br_list}" var="brdto">
							<tr>
								<td class="board02">${brdto.brcode}</td>
								<td class="board02">${brdto.brbcode}</td>
								<td class="board03">${brdto.brmid}</td>
								
								<td class="board02">
								<c:out value="${fn:substring(brdto.sdate,2,11)}"/>
								</td>
								
								<td class="board02">
								<c:out value="${fn:substring(brdto.rdate,2,11)}"/>
								</td>
								
								<td class="board03">${brdto.bstate}</td>
								
								<%
								
								if(id.equals("admin")){
								%>
								<c:if test="${brdto.rdate == null}">
								<td colspan="5" align="right">
								
									<input class="button09" type="button" value="반납완료" >
								</td>
								</c:if>
								<c:if test="${brdto.rdate != null}">
								<td colspan="5" align="right">
								
								<form action='br_update?brcode=${brdto.brcode}'> 
									<input type="hidden" name= "brcode" value="${brdto.brcode}">
									<input type="hidden" name= "brbcode" value="${brdto.brbcode}">
									<input class="button02" type="submit" value="반납확인">
								</form>	
								
								</td>
								</c:if>
								<%
								}
								%>								
							</tr>
							</c:forEach>
							<tr>
							<td colspan="7"  align="right">
								<hr>	

								<%
								
								if(id.equals("admin")){
								%>
								
								<input class="button07" type="button" value="대출입력" onclick="location.href='br_input'">&nbsp;&nbsp;
								<%
								}
								%>
								
								<input class="button03" type="button" value="도서열람" onclick="location.href='book_list'">&nbsp;&nbsp;	
								<input class="button03"type="button" value="홈으로" onclick="location.href='home'">
							</td>
						</tr>						
					</table>
				</form>
			
		</tr>
	</table>
	</center>
<%@ include file="include/footer.jsp" %>
</body>
</html>