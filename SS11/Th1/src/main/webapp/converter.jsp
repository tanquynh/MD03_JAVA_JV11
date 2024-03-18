<%--
  Created by IntelliJ IDEA.
  User: 84787
  Date: 03/12/2024
  Time: 8:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    float rate = Float.parseFloat(request.getParameter("rate"));
    float usd = Float.parseFloat(request.getParameter("usd"));
    float vnd = rate * usd;
%>
<h1>Rate : <%=rate%> </h1>
<h1>USD : <%=usd%> $ </h1>
<h1>VND : <%=vnd%> VND </h1>
</body>
</html>
