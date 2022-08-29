<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.demo1.utlls.DBConnUtils" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.demo1.utlls.CoffeeDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1>Insert</h1>
<form action="list.jsp" method="post">
    <input type="text" name="coffeeName" placeholder="coffee_name" autofocus> <br>
    <input type="number" name="price" placeholder="price"> <br>
    <input type="submit" value="submit">
</form>
<%
    List<CoffeeDTO> list = new ArrayList<>();
    Connection conn = DBConnUtils.getConnection();
    PreparedStatement pstmt = null;
    String sql = "select * from coffee";
    if (conn != null) {
        try {
            pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                CoffeeDTO coffeeDTO = new CoffeeDTO();
                coffeeDTO.setCoffeeNum(rs.getLong("coffee_num"));
                coffeeDTO.setCoffeeName(rs.getString("coffee_name"));
                coffeeDTO.setPrice(rs.getInt("price"));
                coffeeDTO.setRegDate(rs.getDate("reg_date"));
                list.add(coffeeDTO);
            }
            for (CoffeeDTO lists : list) {
%>
<div>
    <span> Coffee Number : <%= lists.getCoffeeNum()%> </span>
    <span> Coffee Name : <%= lists.getCoffeeName()%> </span>
    <span> Coffee Price : <%= lists.getPrice()%> Won </span>
    <span> Coffee create : <%= lists.getRegDate()%> </span>
</div>
<%
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>

</body>
</html>
