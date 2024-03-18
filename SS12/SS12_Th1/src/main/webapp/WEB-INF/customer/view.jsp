<%--
  Created by IntelliJ IDEA.
  User: 84787
  Date: 03/13/2024
  Time: 11:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Customer</title>
</head>
<body>
<h1>Customer detail</h1>
<p>
    <a href="/customers"> Back to customer list</a>
</p>
<table>
    <tr>
        <td>
            Name
        </td>
        <td>${requestScope["customer"].getName()}</td>
    </tr>
    <tr>
        <td>Email</td>
        <td>
            ${requestScope["customer"].getEmail()}
        </td>
    </tr>
    <tr>
        <td>Address</td>
        <td>${requestScope["customer"].getAddress()}</td>
    </tr>

</table>
</body>
</html>
