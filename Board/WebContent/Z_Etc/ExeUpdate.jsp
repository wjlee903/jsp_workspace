<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC Update</title>
</head>
<body>
	<h2>회원 추가 테스트</h2>
	<%
		//DB에 연결
	JDBConnect jdbc = new JDBConnect();

	// 테스트를 입력값 준비
	String id = "test1";
	String pass = "1234";
	String name = "테스트1회원";

	// 쿼리문 생성
	String sql = "insert into member values (?, ?, ?, sysdate)";
	PreparedStatement psmt = jdbc.con.prepareStatement(sql);
	psmt.setString(1, id);
	psmt.setString(2, pass);
	psmt.setString(3, name);

	// 쿼리문 수행 영향을 받은 행의 수가 리턴됨
	int inResult = psmt.executeUpdate();
	out.println(inResult + "행이 입력되었습니다.");

	// 연결 닫기
	jdbc.close();
	%>
</body>
</html>