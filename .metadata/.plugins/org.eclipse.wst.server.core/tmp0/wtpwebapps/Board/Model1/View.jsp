<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
String num = request.getParameter("num"); // 일련번호 받기
BoardDAO dao = new BoardDAO(application); // DAO 생성


dao.updateVisitCount(num); // 조회수 증가


BoardDTO dto = dao.selectView(num); // 게시물 가져오기
dao.close(); // DB 연결 해제
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<!-- JQuery------------------------------------------------------ -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- JQuery -->
<!-- BootStrap --------------------------------------------------------------->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!-- BootStrap -->
<script>
	function deletePost() {
		var confirmer = confirm("정말로 삭제하시겠습니까?");
		if (confirmer) {
			var form = document.writeFrm; // 이름(name)이 "writeFrm"인 폼 선택
			form.method = "post"; // 전송 방식
			form.action = "DeleteProcess.jsp"; // 전송 경로
			form.submit(); // 폼값 전송
		}

	}
</script>

</head>
<body>
	<jsp:include page="../common/Link.jsp" />
	<!-- 공동 링크 -->
	<div class="container bg-dark text-white">
		<h2>회원제 게시판 - 상세보기 (View)</h2>
		<form name="writeFrm">
			<input type="hidden" name="num" value="<%=num%>" />
			<table border="1" style="width: 90%">
				<tr>
					<td>번호</td>
					<td><%=dto.getNum()%></td>
					<td>작성자</td>
					<td><%=dto.getName()%></td>
				</tr>
				<tr>
					<td>작성일</td>
					<td><%=dto.getPostdate()%></td>
					<td>조회수</td>
					<td><%=dto.getVisitcount()%></td>
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="3"><%=dto.getTitle()%></td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="3" height="100"><%=dto.getContent().replace("\r\n", "<br />")%></td>
				</tr>
				<tr>
					<td colspan="4" align="center">
						<%
							if (session.getAttribute("UserId") != null && session.getAttribute("UserId").toString().equals(dto.getId())) {
						%>

						<button type="button" class="btn btn-primary" onclick="location.href='Edit.jsp?num=<%=dto.getNum()%>';">수정하기</button>
						<button type="button" class="btn btn-primary" onclick="deletePost();">삭제하기</button>

						<%
							}
						%>
						<button type="button" class="btn btn-primary" onclick="location.href='List.jsp';">목록보기</button>
					</td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>