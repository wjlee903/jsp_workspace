<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
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
</head>
<body>
	<div class="container">
		<h2 class="bg-color1" align="center">글상세보기</h2>
		<table class="table">
			<tr>
				<td class="bg-color1">번호</td>
				<td class="bg-color4">${dto.idx}</td>
				<td class="bg-color1">작성자</td>
				<td class="bg-color4">${dto.name}</td>
			</tr>
			<tr>
				<td class="bg-color1">작성일</td>
				<td class="bg-color4">${dto.postdate}</td>
				<td class="bg-color1">조회수</td>
				<td class="bg-color4">${dto.visitcount}</td>
			</tr>
			<tr>
				<td class="bg-color1">제목</td>
				<td colspan="3" class="bg-color4">${dto.title}</td>
			</tr>
			<tr>
				<td class="bg-color1">내용</td>
				<td colspan="3" height="100" class="bg-color4">${dto.content}</td>
			</tr>
			<tr>
				<td class="bg-color1">첨부파일</td>
				<td class="bg-color4">
					<c:if test="${not empty dto.ofile }">
					${dto.ofile} 
					<a href="../mvcboard/download.do?ofile=${dto.ofile}&sfile=${dto.sfile}&idx=${dto.idx}" style="color: silver;">[다운로드]</a>
					</c:if>
				</td>
				<td class="bg-color1">다운로드수</td>
				<td class="bg-color4">${dto.downcount}</td>
			</tr>
			<tr>
				<td class="bg-color5" colspan="4" align="center">
					<a href="../mvcboard/pass.do?mode=edit&idx=${param.idx}" class="btn bg-color3">수정하기</a> 
					<a href="../mvcboard/pass.do?mode=delete&idx=${param.idx}" class="btn bg-color3">삭제하기</a> 
					<a href="../mvcboard/list.do" class="btn bg-color3">목록보기</a>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>