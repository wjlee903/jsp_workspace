<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="IsLoggedIn.jsp"%>
<%
	String num = request.getParameter("num"); // 일련번호 가져오기
BoardDAO dao = new BoardDAO(application); // DAO 생성
BoardDTO dto = dao.selectView(num); // 게시물 가져오기
String sessionId = session.getAttribute("UserId").toString(); // 로그인 ID 얻기
if (!sessionId.equals(dto.getId())) {
	JSFunction.alertBack("작성자 본인만 수정할 수 있습니다.", out);
	return;
}
dao.close(); // DB 연결 해제
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<!-- BootStrap --------------------------------------------------------------->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!-- BootStrap -->
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
		<h2>회원제 게시판 - 수정하기(Edit)</h2>
		<form action="EditProcess.jsp" name="writeFrm" method="post" onsubmit="return validateForm(this);">
			<input type="hidden" name="num" value="<%=dto.getNum()%>" />
			<table border="1" style="width: 90%;">
				<tr>
					<td>제목</td>
					<td>
						<input type="text" name="title" style="width: 90%; background-color: gray; color: white" value="<%=dto.getTitle()%>" />
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea name="content" style="width: 90%; height: 100px; background-color: gray; color: white"><%=dto.getContent()%></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-primary">작성완료</button>
						<button type="reset" class="btn btn-primary">다시 입력</button>
						<button type="button" class="btn btn-primary" onclick="location.href='List.jsp';">목록보기</button>
					</td>
				</tr>
			</table>

		</form>

	</div>
</body>
</html>
