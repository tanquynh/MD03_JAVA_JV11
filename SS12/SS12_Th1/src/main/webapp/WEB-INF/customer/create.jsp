<%--
  Created by IntelliJ IDEA.
  User: 84787
  Date: 03/13/2024
  Time: 9:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new customer</title>
    <style>
        .message {
            color: green;
        }
    </style>
</head>
<body>
<h1>Create new customer</h1>
<p><c:if test='${requestScope["message"] !=null}'>
    <span class="message">${requestScope["message"]}</span>
</c:if></p>
<p>
    <a href="${pageContext.request.contextPath}/customers">back to customer list</a>
</p>
<form method="post">
    <fildset>
        <legend>Customer information</legend>
        <table>
            <tr>
                <td>Name</td>
                <td><input type="text" name="name" id="name"></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><input type="text" name="email" id="email"></td>
            </tr>
            <tr>
                <td>Address</td>
                <td><input type="text" name="address" id="address"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="create customer"></td>
            </tr>
        </table>
    </fildset>
</form>
</body>
</html>
