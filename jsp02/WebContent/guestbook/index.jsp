<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../include/jquery-3.4.1.min.js"></script>
</head>
<body>
<%
//컨텍스트 패스(웹프로젝트의 식별자)
String context = request.getContextPath();
//컨트롤러 이동, post로 명시안하면 get방식임
response.sendRedirect(context + "/guestbook_servlet/list.do");
%>
</body>
</html>