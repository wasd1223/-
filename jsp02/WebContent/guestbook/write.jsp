<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
function check() {
	document.form1.action = "${path}/guestbook_servlet/insert.do";
	document.form1.submit();
}

</script>
</head>
<body style="text-align: center; font-weight: bold;">
<h2>★ 방명록 작성 ★</h2>
<form name="form1" id="form1" method="post">
  <table border="1" width="890px">
    <tr>
      <td>이름</td>
      <td align="left"><input name="name" id="name" size="40"></td>
    </tr>
    <tr>
      <td>이메일</td>
      <td align="left"><input name="email" id="email" size="40"></td>
    </tr>
    <tr>
      <td>비밀번호</td>
      <td align="left"><input type="password" name="passwd" id="passwd" size="40"></td>
    </tr>
    <tr align="center" height="400px">
      <td colspan="2"><textarea rows="5" cols="55"
      name="content" id="content" style="width: 880px; height: 350px"></textarea></td>
    </tr>
    <tr align="center">
      <td colspan="2">
        <input type="button" value="확인" onclick="check()">
        <input type="button" value="취소" onclick="location.href='${path}/guestbook_servlet/list.do'">
      </td>
    </tr>
  </table>
</form>
</body>
</html>