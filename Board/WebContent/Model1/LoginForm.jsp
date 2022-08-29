<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션과 DB를 이용한 로그인 구현</title>
<!-- BootStrap --------------------------------------------------------------->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!-- BootStrap -->
</head>
<body>
	<jsp:include page="../common/Link.jsp" />
	<div class="container bg-secondary text-white">
		<h2>로그인 페이지</h2>
		<span style="color: red; font-size: 1.2em;"> <%=request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg")%>
		</span>
		<%
			if (session.getAttribute("UserId") == null) {
			// 로그아웃 상태
		%>
		<script>
			function validateForm(form) {
				if (!form.user_id.value) {
					alert("아이디를 입력하세요!");
					return false;
				}
				if (form.user_pw.value == "") {
					alert("패스워드를 입력하세요!")
					return false;
				}

			}
		</script>

		<form action="LoginProcess.jsp" method="post" name="loginFrm" onsubmit="return validateForm(this);">
			아이디 : <input type="text" name="user_id" /> <br /> 패스워드 : <input type="password" name="user_pw" /> <br /> <input type="submit" class="btn btn-primary" value="로그인하기" style="cursor: pointer;" />
		</form>
		<%
			} else { // 로그인 된 상태
		%>
		<%=session.getAttribute("UserName")%>
		회원님, 로그인하셨습니다. <br /> <a href="Logout.jsp">[로그아웃]</a>
		<%
			}
		%>

	</div>

</body>
</html>