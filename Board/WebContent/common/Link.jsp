<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- BootStrap --------------------------------------------------------------->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!-- BootStrap -->
<style>
	.mystyle1{
	background-color: cyan;
	color: navy;
	}
</style>
<div class="container mystyle1">
	<table border="1" style="width: 90%">
		<tr>
			<td align="center">
				<!-- 로그인 여부에 따른 메뉴 변화 -->
				<%
					if (session.getAttribute("UserId") == null) {
				%>
				<a href="LoginForm.jsp">로그인</a>
				<%
					} else {
				%>
				<a href="Logout.jsp" style="border: 1px solid black;">로그아웃</a>
				<%
					}
				%>
				<!-- 8장과 9장의 회원제 게시판 프로젝트에서 사용할 링크 -->
				<span style="padding-left: 20px; border: 1px solid black;"> <a href="List.jsp">게시판(페이징O)</a>
				</span>
			</td>
		</tr>
	</table>
</div>