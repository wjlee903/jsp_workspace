<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="IsLoggedIn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- BootStrap --------------------------------------------------------------->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!-- BootStrap -->
<style>
.bgmy1{
background-color: black;
color: silver;
}
</style>
<script type="text/javascript">
	function validateForm(form) {
		if (form.title.value == "") {
			alert("제목을 입력하세요.");
			form.title.focus();
			return false;
		}
		if (form.content.value == "") {
			alert("내용을 입력하세요.");
			form.content.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<jsp:include page="../common/Link.jsp" />
	<div class="container bg-dark text-white">
		<h2>회원제 게시판 - 글쓰기(Write)</h2>
		<form action="WriteProcess.jsp" name="writeFrm" method="post" onsubmit="return validateForm(this);">
			<table border="1" style="width: 90%;">
				<tr>
					<td>제목</td>
					<td>
						<input type="text" class="bgmy1" name="title" style="width: 90%;" />
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea class="bgmy1" name="content" style="width: 90%; height: 100px;">
			</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-info">작성완료</button>
						<button type="reset" class="btn btn-primary">다시 입력</button>
						<button type="button" class="btn btn-warning" onclick="location.href='List.jsp';">목록보기</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>