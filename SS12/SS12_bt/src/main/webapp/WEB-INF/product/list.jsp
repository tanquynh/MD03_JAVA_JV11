<%--
  Created by IntelliJ IDEA.
  User: 84787
  Date: 03/13/2024
  Time: 2:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product List</title>
</head>
<body>
<p><a href="${pageContext.request.contextPath}/products?action=create">Create new product</a></p>
<form action="/products" method="get">
    <table>
        <tr>
            <td>Search</td>

            <td><input type="text" name="searchName" /></td>
        </tr>
        <tr>
            <td></td>
            <td><a href="/products?action=search&searchName=${searchName}"><button type="submit">Search</button></a></td>
        </tr>
    </table>
</form>
<table border="1">
    <tr>
        <td>Name</td>
        <td>Catalog</td>
        <td>Stock</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach items='${requestScope["products"]}' var="product">
        <tr>
            <td>
                <a href="${pageContext.request.contextPath}/products?action=view&id=${product.getId()}">${product.getProductName()}</a>
            </td>
            <td>${product.getCatalog()}</td>
            <td>${product.getStock()}</td>
            <td><a href="${pageContext.request.contextPath}/products?action=edit&id=${product.getId()}">Edit</a></td>
            <td><a href="${pageContext.request.contextPath}/products?action=delete&id=${product.getId()}">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
