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
		if (form.pass.value == "") {
			alert("비밀번호를 입력하세요.");
			form.pass.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<div class="container">
		<h2 class="bg-color1" align="center">파일 첨부형 게시판 - 비밀번호 검증(Pass)</h2>
		<form name="writeFrm" method="post" action="../mvcboard/pass.do" onsubmit="return validateForm(this);">
			<input type="hidden" name="idx" value="${ param.idx }" class="bg-color3" /> 
			<input type="hidden" name="mode" value="${ param.mode }" class="bg-color3" />
			<div>
				<div align="center" style="margin: 10px">
					<span class="bg-color3" style="margin: 10px"> 비밀번호 </span> <input type="password" class="bg-color3" name="pass" style="width: 100px;" />
				</div>
				<div align="center">
					<button type="submit" class="btn bg-color2">검증하기</button>
					<button type="reset" class="btn bg-color2">RESET</button>
					<button type="button" class="btn bg-color2" onclick="location.href='../mvcboard/list.do';">목록 바로가기</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
