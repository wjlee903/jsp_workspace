<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
   		if(session.getAttribute("UserId") == null) {
   			JSFunction.alertLocation("로그인 후 이용해 주시기 바랍니다.", "LoginForm.jsp", out);
   			
   			return;
   		}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Confirm</title>
</head>
<body>
	
</body>
</html>