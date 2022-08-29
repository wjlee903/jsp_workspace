<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//클라이언트가 보내온 inactiveToday수집
String listNum=request.getParameter("num");

	Cookie cookie=new Cookie("VisitCookie", listNum);//쿠키생성
	cookie.setMaxAge(-1);		// 브라우저 닫으면 쿠키 삭제
	response.addCookie(cookie);
%>