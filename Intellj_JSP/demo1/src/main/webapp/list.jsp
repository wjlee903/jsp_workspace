<%@ page import="com.example.demo1.utlls.DBConnUtils" %>
<%@ page import="java.lang.reflect.ParameterizedType" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: dark_
  Date: 2022-08-29
  Time: 오전 12:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Connection conn = DBConnUtils.getConnection();
    PreparedStatement pstmt = null;
    String query = "insert into coffee (coffee_name, price, reg_date) values (?, ?, ?)";
    if (conn != null) {
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, request.getParameter("coffeeName"));
            pstmt.setString(2, request.getParameter("price"));
            pstmt.setString(3, new SimpleDateFormat("yyyyMMdd").format(new java.util.Date()));
            pstmt.executeUpdate();
            conn.close();
            pstmt.close();
%>
<script>
    alert("insert success");
    location.href = "index.jsp";
</script>
<%
    } catch (Exception e) {
        e.printStackTrace();
    }
} else {
%>
<script>
    alert("database connection fail");
    history.back();
</script>
<%
    }
%>
</body>
</html>
