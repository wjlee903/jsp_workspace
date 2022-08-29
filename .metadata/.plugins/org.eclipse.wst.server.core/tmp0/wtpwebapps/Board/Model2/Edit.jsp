<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 첨부형 게시판</title>
<!-- BootStrap --------------------------------------------------------------->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!-- BootStrap -->
<!-- css ---------------------------------------->
<link rel="stylesheet" href="../css/style.css">
<!-- css -->
<script type="text/javascript">
	function validateForm(form) {
		if (form.name.value == "") {
			alert("작성자를 입력하세요.");
			form.name.focus();
			return false;
		}
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
	<div class="container">
		<h2 class="bg-color1" align="center">파일 첨부형 게시판 - 수정하기(Edit)</h2>
		<form name="writeFrm" method="post" enctype="multipart/form-data" action="../mvcboard/edit.do" onsubmit="return validateForm(this);">
			<input type="hidden" name="idx" value="${ dto.idx }" /> 
			<input type="hidden" name="prevOfile" value="${ dto.ofile }" /> 
			<input type="hidden" name="prevSfile" value="${ dto.sfile }" />

			<table class="table">
				<tr>
					<td class="bg-color1">작성자</td>
					<td class="bg-color4">
						<input class="bg-color3"  type="text" name="name" value="${ dto.name }" />
					</td>
				</tr>
				<tr>
					<td class="bg-color1">제목</td>
					<td class="bg-color4">
						<input type="text" name="title" style="width: 90%;" value="${ dto.title }" class="bg-color3" />
					</td>
				</tr>
				<tr>
					<td class="bg-color1">내용</td>
					<td class="bg-color4">
						<textarea name="content" style="width: 90%; height: 100px;" class="bg-color3">${ dto.content }</textarea>
					</td>
				</tr>
				<tr>
					<td class="bg-color1">첨부 파일</td>
					<td class="bg-color4">
						<input type="file" name="ofile" />
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn bg-color3">작성 완료</button>
						<button type="reset" class="btn bg-color3">RESET</button>
						<button type="button" onclick="location.href='../mvcboard/list.do';" class="btn bg-color3">목록 바로가기</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
