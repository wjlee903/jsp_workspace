<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String chkVal = request.getParameter("inactiveToday"); // 체크박스 value 값 읽어오기

if (chkVal != null && chkVal.equals("1")) { // 체크박스 value 값은 현재 1
	Cookie cookie = new Cookie("PopupClose", "off"); // Cookie 객체 생성
	cookie.setPath(request.getContextPath()); // 경로 지정
	cookie.setMaxAge(60 * 60 * 24); // 하루 동안
	response.addCookie(cookie); // 쿠키 추가
	out.println("쿠키 : 하루 동안 열지 않음"); // php의 echo와 같은 개념
} // ajax에서는 출력이 아닌 클라이언트로 메시지를 보낸다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>