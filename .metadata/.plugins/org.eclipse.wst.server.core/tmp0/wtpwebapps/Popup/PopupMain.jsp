<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// popupMode on 설정
String popupMode = "on";
// cookie 배열로 가져옴 PopupCookie 
Cookie[] cookies = request.getCookies();
if (cookies != null) {
	for (Cookie c : cookies) {
		String cookieName = c.getName();
		String cookieValue = c.getValue();
		if (cookieName.equals("PopupClose")) {
	popupMode = cookieValue; // 쿠키명이 팝업 클로스이면 popupMode를 off로 초기화
		}
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#popup {
	position: absolute;
	top: 100px;
	left: 100px;
	color: yellow;
	width: 300px;
	height: 100px;
	background-color: gray;
}

#popup>div {
	position: relative;
	background-color: #ffffff;
	top: 0px;
	border: 1px solid gray;
	padding: 10px;
	color: black;
}
</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$('#closeBtn').click(function() {
			$('#popup').hide(); // 닫기 버튼 눌렀을때 팝업창 숨김
			var chkVal = $("input:checkbox[id=inactiveToday]:checked").val(); // == $("#inactiveToday").val()
			//var chkVal = $("#inactiveToday").val(); // == $("#inactiveToday").val()

			$.ajax({
				url : 'PopupCookie.jsp',
				type : 'get',
				data : {
					inactiveToday : chkVal
				}, // server로 보내는 형식
				dataType : "text", // server로 부터 받는 형식
				success : function(resData) { // data는 resDate로 초기화 됨 PopupCookie의 out.print가 들어옴
					if (resData != '')
						location.reload(); // resData가 빈 문자열이면 페이지 새로고침, 현재는 필요없는 작업니다.
					// 페이지 새로고침보다는 화면의 일부분의 컨텐츠를 변경 하는 코드작성
				}	 
			});
		});
	});
</script>
</head>
<body>
	<h2>팝업 메인 페이지</h2>
	<%
		for (int i = 0; i < 10; i++) {
		out.print("현재 팝업창은 " + popupMode + " 상태입니다.");
	}
	if (popupMode.equals("on")) {
	%>

	<div id="popup">
		<h2 align="center">공지사항 팝업입니다.</h2>
		<div align="right">
			<form name="popFrm">
				<input type="checkbox" id="inactiveToday" value="1" /> 하루 동안 열지 않음
				<input type="button" value="닫기" id="closeBtn" />
			</form>
		</div>
	</div>
	<%
		}
	%>

</body>
</html>