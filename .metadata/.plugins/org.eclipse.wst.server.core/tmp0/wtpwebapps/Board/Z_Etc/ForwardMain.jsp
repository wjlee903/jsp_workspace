<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	pageContext.setAttribute("pAttr", "김유신");
    	request.setAttribute("rAttr", "계백");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>액션 태그를 이용한 포워딩</h2>
<!-- 포워드 될 떄 리퀘스트 객체 전달된다. / 페이지 객체는 현재페이지에서만 사용. 전달되지 않는다. -->
<jsp:forward page="ForwardSub.jsp" />
</body>
</html>