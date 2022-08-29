<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="../LifeCycle.do" method="post">
	<input type="submit" value="post전송버튼" />
</form>

<form action="../LifeCycle.do" method="get">
	<input type="submit" value="get전송버튼" />
</form>

<a href="/Board/LifeCycle.do">get 전송버튼</a>


</body>
</html>