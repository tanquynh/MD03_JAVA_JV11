<%--
  Created by IntelliJ IDEA.
  User: 84787
  Date: 03/15/2024
  Time: 9:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Management</title>
</head>
<body>
<center>
    <h1>User Management</h1>
    <h2><a href="/users?action=create">Add New User</a></h2>
</center>
<div class="center">
    <table border="1" cellpadding="5">
        <cation>

            <h2>List of Users</h2>
        </cation>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Action</th>
        </tr>
        <c:forEach items="${listUser}" var="user">
            <tr>
                <td><c:out value="${user.id}"/> </td>
                <td><c:out value ="${user.name}"/></td>
                <td><c:out value="${user.email}"/> </td>
                <td><c:out value="${user.country}"/> </td>
                <td>
                    <a href="/users?action=edit&id=${user.id}">Edit</a>
                    <a href="/users?action=delete&id=${user.id}">Delete</a>
                </td>
            </tr>

        </c:forEach>
    </table>
</div>
</body>
</html>
