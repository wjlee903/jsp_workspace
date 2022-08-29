<%@page import="utils.JSFunction"%>
<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String user_id = request.getParameter("user_id");		// main 에서 입력한 아이디
	String user_pw = request.getParameter("user_pw");		// main 에서 입력한 패스워드
	String save_check = request.getParameter("save_check");	// 체크박스 value == checked  

if ("must".equals(user_id) && "1234".equals(user_pw)) {
	if (save_check != null && save_check.equals("Y")) {
		CookieManager.makeCookie(response, "loginId", user_id, 86400);	
	} else {
		CookieManager.deleteCookie(response, "loginId");
	}

	JSFunction.alertLocation("로그인에 성공하셨습니다.", "IdSaveMain.jsp", out);
} else {
	JSFunction.alertBack("로그인에 실패하셨습니다.", out);
}
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