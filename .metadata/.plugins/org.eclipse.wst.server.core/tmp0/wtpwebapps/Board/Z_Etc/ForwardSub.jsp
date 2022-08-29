<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>포워드 결과</h2>
<ul>
	<li>
		<!-- page는 현재페이지에서만 사용 가능하기 때문에 포워드로 객체가 전달되지 않는다 -->
		page 영역 : <%=pageContext.getAttribute("pAttr") %>
	</li>
	<li>
		<!-- 포워드로 request 객체 가 전달된다. -->
		request 영역 : <%=request.getAttribute("rAttr") %>
	</li>
</ul>
</body>
</html>