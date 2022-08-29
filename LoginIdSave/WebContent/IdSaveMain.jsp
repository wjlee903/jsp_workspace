<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String loginId = CookieManager.readCookie(request, "loginId"); // CookieManager 클래스 의 메소드 호출
//  loginId == 로그인 value == 로그인한 ID ==> return 값 String
String cookieCheck = "";
if (!loginId.equals("")) {
	cookieCheck = "checked";	// cookie에 저장된 아이디가 있으면 체크박스 계속 체크
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>로그인 페이지</h2>
	<form action="IdSaveProcess.jsp" method="post">
		아이디 : <input type="text" name="user_id" value="<%=loginId%>" />	<!-- 쿠키에서 읽어온 id value 값으로 초기화 --> 
		<input type="checkbox" name="save_check" value="Y" <%=cookieCheck%> />아이디 저장하기 <br /> <!-- 체크박스 checked -->
		패스워드 : <input type="text" name="user_pw" /> <br />
		<input type="submit" value="로그인하기" />
	</form>
</body>
</html>