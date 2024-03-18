<%--
  Created by IntelliJ IDEA.
  User: 84787
  Date: 03/12/2024
  Time: 1:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        /* Thêm CSS cho bảng */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        ul {
            list-style: none;
            padding: 0;
        }

        li {
            margin-bottom: 10px;
        }

        img {
            max-width: 100px;
            max-height: 100px;
        }
    </style>
</head>
<body>
<h1>Danh sach khach hang</h1>

<table>
    <thead>
    <tr>
        <th>Name</th>
        <th>Birthday</th>
        <th>Address</th>
        <th>Image</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${employees}" var="emp">
        <tr>
            <td>${emp.name}</td>
            <td>${emp.birthday}</td>
            <td>${emp.address}</td>
            <td><img src="${emp.url}" alt="Employee Image"></td>
        </tr>
    </c:forEach>
    </tbody>
</table>


</body>
</html>
