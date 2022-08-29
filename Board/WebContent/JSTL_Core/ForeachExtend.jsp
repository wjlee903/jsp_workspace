<%@page import="common.Person"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>향상된 for문 형태의 forEach 태그</h4>
<%
	String [] rgba = {"Red", "Green", "Blue", "Black"};
%>

<c:forEach var="c" items="<%=rgba %>">
	<span style="color:${c}">${ c }</span>
</c:forEach>

<h4>varStatus 속성 살펴보기</h4>
<table border="1">
	<c:forEach var="c" items="<%=rgba %>" varStatus="loop">
		<tr>
			<td>count : ${ loop.count }</td>	
			<td>index : ${ loop.index }</td>	
			<td>current : ${ loop.current }</td>	
			<td>first : ${ loop.first }</td>	
			<td>last : ${ loop.last }</td>	
		</tr>	
	</c:forEach>
</table>

<h4>List 컬렉션 사용하기</h4>
<%
LinkedList <Person> lists = new LinkedList<Person>();
lists.add(new Person("맹사성", 34));
lists.add(new Person("장열심", 44));
lists.add(new Person("신숙주", 54));
%>




</body>
</html>