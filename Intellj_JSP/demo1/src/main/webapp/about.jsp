<%@ page import="static jdk.javadoc.internal.doclets.formats.html.markup.HtmlStyle.title" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.example.demo1.common.Person" %>
<%@ page import="java.util.Set" %><%--
  Created by IntelliJ IDEA.
  User: dark_
  Date: 2022-08-28
  Time: 오후 11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>application 영역의 속성 읽기</h2>
<%
    Map<String, Person> maps
            = (Map<String, Person>) application.getAttribute("maps");
    Set<String> keys = maps.keySet();
    for (String key : keys) {
        Person person = maps.get(key);
%>
<p><%=person.getName()%>
</p>
<p><%=person.getAge()%>
</p>

<%
    }
%>

</body>
</html>
