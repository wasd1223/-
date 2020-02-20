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
function gb_search() {
	document.form1.action="${path}/guestbook_servlet/list.do";
	document.form1.submit();
}
function list(page) {
	location.href="${path}/guestbook_servlet/list.do?curPage="+page;
}
</script>
</head>
<body>
<h3 align="right">※ ${count}개의 방명록이 있습니다. </h3>

<!-- 검색폼 -->
<form name="form1" id="form1" method="post" style="text-align: center;">
<select name="searchkey" id="searchkey" style="width: 150px; ">
<c:choose>
  <c:when test="${searchkey == 'name'}">
    <option value="name" selected="selected">이름</option>
    <option value="content">내용</option>
    <option value="name_content">이름+내용</option>
  </c:when>
  <c:when test="${searchkey == 'content'}">
    <option value="name">이름</option>
    <option value="content" selected="selected">내용</option>
    <option value="name_content">이름+내용</option>
  </c:when>
    <c:when test="${searchkey == 'name_content'}">
    <option value="name">이름</option>
    <option value="content">내용</option>
    <option value="name_content" selected="selected">이름+내용</option>
  </c:when>
</c:choose>
</select>
<input name="search" id="search" value="${search}" style="width: 400px;">
<input type="button" value="조회" onclick="gb_search()">
</form>


<div align="right">
<input type="button" value="글쓰기" 
onclick="location.href='${path}/guestbook/write.jsp'" > 
</div><br>

<c:forEach var="dto" items="${list}">
<form method="post" action="${path}/guestbook_servlet/passwd_check.do">
<!-- 편집을 위해서는 게시물 번호가 필요함 -->
<input type="hidden" name="idx" value="${dto.idx}">
<table border="1" width="880px" style="text-align: center; font-weight: bold; font-size: 15px">
 <tr>
    <td>이름</td>
    <td>${dto.name}</td>
    <td>날짜</td>
    <td>${dto.post_date}</td>
 </tr>
 <tr>
    <td>이메일</td>
    <td colspan="3">${dto.email}</td>
  </tr>
 <tr>
    <td colspan="4" style="text-align: left;">${dto.content}</td>
  </tr>
 <tr>
    <td colspan="4">
      비밀번호 <input type="password" name="passwd">
     <input type="submit" value="수정/삭제">
    </td>
  </tr>
 </table>
</form>
</c:forEach>
</body>
</html>