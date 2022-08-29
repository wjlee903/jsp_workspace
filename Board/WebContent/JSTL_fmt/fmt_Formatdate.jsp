<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 현재 날짜 시간 저장 -->
<c:set var="today" value="<%= new java.util.Date() %>" />

<!-- type 은 생략해도 된다. -->
<fmt:formatDate value="${ today }" type="both" pattern="yyyy-MM-dd hh:mm:ss" />
</body>
</html>