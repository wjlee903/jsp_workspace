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
		<h2 class="bg-color1" align="center">목록보기</h2>
		<form method="get">
			<div style="text-align: center;">
				<select name="searchField" class="custom-select bg-color3" style="width: 15%; display: inline-block;">
					<option value="title" class="bg-color3">제목</option>
					<option value="content" class="bg-color3">내용</option>
				</select>
				<input type="text" name="searchWord" class="form-control bg-color3" style="width: 30%; display: inline-block; vertical-align: bottom !important;" />
				<input type="submit" value="검색하기" class="btn bg-color2" style="width: 10%; display: inline-block;" />
			</div>
		</form>

		<table class="table">
			<tr class="bg-color1">
				<th width="10%">번호</th>
				<th width="*">제목</th>
				<th width="15%">작성자</th>
				<th width="10%">조회수</th>
				<th width="15%">작성일</th>
				<th width="8%">첨부</th>
			</tr>
			<c:choose>
				<c:when test="${empty boardLists}">
					<tr>
						<td colspan="6" align="center">등록된 게시물이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${boardLists}" var="row" varStatus="loop">
						<tr align="center" class="bg-color3">
							<td>${map.totalCount-(((map.pageNum-1)*map.pageSize)+loop.index)}</td>
							<td>
								<a href="../mvcboard/view.do?idx=${row.idx}" class="btn bg-color3">${row.title}</a>
							</td>
							<td>${row.name}</td>
							<td>${row.visitcount}</td>
							<td>${row.postdate}</td>
							<td>
								<c:if test="${not empty row.ofile}">
									<a href="../mvcboard/download.do?ofile=${row.ofile}&sfile=${row.sfile}&idx=${row.idx}" class="btn bg-color3"> <c:set var="fileNm" value="${ row.ofile }" /> <c:forTokens var="token" items="${fileNm }" delims="." varStatus="status">
											<c:if test="${status.last }">
												<c:choose>
													<c:when test="${token eq 'php'}">
														<img src="../images/php.png" alt="${filename }" />
													</c:when>
													<c:when test="${token eq 'html'}">
														<img src="../images/html.png" alt="${filename }" />
													</c:when>
													<c:when test="${token eq 'zip'}">
														<img src="../images/zip.png" alt="${filename }" />
													</c:when>
													<c:when test="${token eq 'xml'}">
														<img src="../images/xml.png" alt="${filename }" />
													</c:when>
													<c:when test="${token eq 'sql'}">
														<img src="../images/sql.png" alt="${filename }" />
													</c:when>
													<c:when test="${token eq 'txt'}">
														<img src="../images/txt.png" alt="${filename }" />
													</c:when>
													<c:when test="${token eq 'jpg' || token eq 'gif' || token eq 'png' || token eq 'bmp' }">
														<img src="../images/png.png" alt="${filename }" />
													</c:when>
													<c:when test="${token eq 'pdf'}">
														<img src="../images/pdf.png" alt="${filename }" />
													</c:when>
													<c:when test="${token eq 'ppt' }">
														<img src="../images/ppt.png" alt="${filename}" />
													</c:when>
													<c:when test="${token eq 'mp3' }">
														<img src="../images/mp3.png" alt="${filename}" />
													</c:when>
													<c:otherwise>
														<img src="../images/exe.png" alt="${filename }" />
													</c:otherwise>
												</c:choose> 
												<div>${row.ofile}</div> 
											</c:if>
										</c:forTokens>
									</a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>

		<div style="text-align: center;">
			<span>${map.pagingImg }</span> <span>
				<button class="btn btn-warning bg-color3" type="button" onclick="location.href='../mvcboard/write.do';">글쓰기</button>
			</span>
		</div>
	</div>
</body>
</html>