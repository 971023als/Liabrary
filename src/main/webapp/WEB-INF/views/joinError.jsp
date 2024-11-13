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
  <title>회원가입 실패</title>
</head>
<body>

<%@ include file="include/header.jsp" %>

<center>
  <table width="70%" border="0" cellspacing="0" cellpadding="20">
    <tr height="500">
      <td bgcolor="#f8d7da" align="center">
        <%
          Object checkIdObj = request.getAttribute("checkId");
          int checkId = (checkIdObj != null) ? Integer.parseInt(checkIdObj.toString()) : -1; // null일 경우 -1 설정

          if(checkId == 1) {
        %>
        <div style="color: #721c24; background-color: #f8d7da; border: 1px solid #f5c6cb; padding: 15px;">
          <strong>회원가입 실패!</strong> 입력하신 아이디는 이미 사용 중입니다. 다른 아이디를 입력해 주세요.
        </div>
        <script type="text/javascript">
          alert("회원가입에 실패하였습니다. 다른 아이디를 입력하세요.");
          history.go(-1);
          reg_frm.mid.focus();
        </script>
        <%
        } else {
        %>
        <div style="color: #721c24; background-color: #f8d7da; border: 1px solid #f5c6cb; padding: 15px;">
          <strong>회원가입 실패!</strong> 알 수 없는 오류가 발생하였습니다. 잠시 후 다시 시도해 주세요.
        </div>
        <%
          }
        %>
        <hr>
        <input class="button03" type="button" value="다시 시도" onclick="location.href='joinForm'">
        <input class="button03" type="button" value="홈으로" onclick="location.href='${pageContext.request.contextPath }/index'">
      </td>
    </tr>
  </table>
</center>

<%@ include file="include/footer.jsp" %>
</body>
</html>
