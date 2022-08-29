<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>useBean 액션 태그</h2>
<h3>자바빈즈 생성하기</h3>
<jsp:useBean id="person" class="common.Person" scope="request" />

<h3>setProperty 액션 태그로 자바빈즈 속성 지정하기</h3>
<jsp:setProperty property="name" value="임꺽정" name="person"/>
<jsp:setProperty property="age" value="41" name="person"/>

<h3>getProperty 액션 태그로 자바빈즈 속성 읽기</h3>
<ul>
	<li>이름 : <jsp:getProperty property="name" name="person"/> </li>
	<li>나이 : <jsp:getProperty property="age" name="person"/> </li>
</ul>
</body>
</html>