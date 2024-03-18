<%--
  Created by IntelliJ IDEA.
  User: 84787
  Date: 03/13/2024
  Time: 4:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Search</title>
</head>
<body>
<h2>Product Detail</h2>
<p><a href="/products">Back to product List</a></p>
<table border="1">
    <tr>
        <td>Name</td>
        <td>Catalog</td>
        <td>Stock</td>

    </tr>
    <c:forEach items="products" var="product">
        <tr>
            <td>
                ${product.getProductName()}
            </td>
            <td>${product.getCatalog()}</td>
            <td>${product.getStock()}</td>

        </tr>
    </c:forEach>
</table>
</body>
</html>
