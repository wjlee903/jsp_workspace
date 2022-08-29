<%@page import="utils.BoardPage"%>
<%@page import="model1.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	// DAO 를 생성해 DB에 연결
BoardDAO dao = new BoardDAO(application);

// 사용자가 입력한 검색 조건을 Map에 저장
Map<String, Object> param = new HashMap<String, Object>();
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
if (searchWord != null) {
	param.put("searchField", searchField);
	param.put("searchWord", searchWord);
}

int totalCount = dao.selectCount(param); // 게시물 수 확인

/*** 페이지 처리 start ***/
//전체 페이지 수 계산
int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
int totalPage = (int) Math.ceil((double) totalCount / pageSize); // 전체 페이지 수

//현재 페이지 확인
int pageNum = 1; // 기본값
String pageTemp = request.getParameter("pageNum");
if (pageTemp != null && !pageTemp.equals(""))
	pageNum = Integer.parseInt(pageTemp); // 요청받은 페이지로 수정

//목록에 출력할 게시물 범위 계산
int start = (pageNum - 1) * pageSize + 1; // 첫 게시물 번호
int end = pageNum * pageSize; // 마지막 게시물 번호
param.put("start", start);
param.put("end", end);
/*** 페이지 처리 end ***/

List<BoardDTO> boardLists = dao.selectListPage(param); // 게시물 목록 받기
dao.close(); // DB 연결 닫기
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
<style>
.bg1 {
	background-color: black;
	color: white;
}
</style>
</head>
<body>

	<div class="container">

		<!-- 공통 링크 -->
		<jsp:include page="../common/Link.jsp" />

		<h2 class="table-dark">
			목록 보기(List) - 현재페이지 :
			<%=pageNum%>(전체 :
			<%=totalPage%>)
		</h2>

		<!-- 검색폼 -->
		<form method="get">
			<table class="table-info" border="1" style="width: 90%;">
				<tr>
					<td align="center">
						<select name="searchField">
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select>
						<input type="text" name="searchWord" /> <input type="submit" class="btn btn-primary btn-sm" value="검색하기" />
					</td>
				</tr>
			</table>
		</form>

		<!-- 게시물 목록 테이블 표 -->
		<table class="table table-dark table-hover" border="1" style="width: 90%;">
			<!-- 각 컬럼의 이름 -->
			<thead class="thead-dark" align="center">
				<tr>
					<th width="10%">번호</th>
					<th width="50%">제목</th>
					<th width="15%">작성자</th>
					<th width="10%">조회수</th>
					<th width="15%">작성일</th>
				</tr>
			</thead>
			<!-- 목록의 내용 -->
			<%
				if (boardLists.isEmpty()) {
				//게시물이 하나도 없을때
			%>
			<tr>
				<td colspan="5" align="center">등록된 게시물이 없습니다.</td>
			</tr>
			<%
				} else {
			// 게시물이 있을 때
			int virtualNum = 0; // 화면상에서의 게시물 번호, 실제 번호가 아님
			virtualNum = totalCount - (pageNum - 1) * pageSize;
			int countNum = 0;
			for (BoardDTO dto : boardLists) {
				//virtualNum = totalCount - (((pageNum - 1) * pageSize) + countNum++);	// 페이징을 위한 코드
			%>
			<tr align="center">
				<!-- 게시물 번호 -->
				<%-- 				<td><%=virtualNum%></td> --%>
				<td><%=virtualNum--%></td>
				<!-- 제목(+ 하이퍼링크) -->
				<td align="left">
					<a style="color: white" href="View.jsp?num=<%=dto.getNum()%>"> <%=dto.getTitle()%>
					</a>
				</td>
				<td align="center"><%=dto.getId()%></td>
				<td align="center"><%=dto.getVisitcount()%></td>
				<td align="center"><%=dto.getPostdate()%></td>
			</tr>

			<%
				}
			}
			%>
		</table>

		<!-- 목록 하단의 [글쓰기] 버튼 -->
		<table class="table bg1 table-hover" border="1" style="width: 90%;">
			<tr align="center">
				<!-- 페이징 처리 -->
				<td>
					<%=BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, request.getRequestURI())%>
				</td>
				<!-- 글쓰기 버튼 -->
				<td>
					<button type="button" class="btn btn-outline-info" onclick="location.href='Write.jsp';">글쓰기</button>
				</td>
			</tr>
		</table>

	</div>

</body>
</html>