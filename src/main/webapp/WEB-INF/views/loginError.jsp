<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 실패</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member.css?after">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main.css?after">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/menu.css?after">
</head>

<body>
<%@ include file="include/header.jsp" %>

<center>
    <table width="70%" border="0" cellspacing="0" cellpadding="20">
        <tr height="500">
            <td bgcolor="#f8d7da" align="center">
                <h2 style="color: #721c24;">로그인 실패</h2>
                <p style="color: #721c24;">아이디 또는 비밀번호가 올바르지 않습니다.</p>
                <p>다시 시도해 주세요.</p>
                <hr>
                <input class="button03" type="button" value="이전으로" onclick="history.go(-1);">
            </td>
        </tr>
    </table>
</center>

<%@ include file="include/footer.jsp" %>
</body>
</html>