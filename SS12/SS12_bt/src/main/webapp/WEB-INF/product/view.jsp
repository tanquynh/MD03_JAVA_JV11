<%--
  Created by IntelliJ IDEA.
  User: 84787
  Date: 03/13/2024
  Time: 4:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Product Detail</title>
</head>
<body>

<h2>Product Detail</h2>
<p><a href="/products">Back to product List</a></p>
<table>
    <tr>
            <td>Product Name</td>
            <td>${product.getProductName()}</td>
        </tr>
        <tr>
            <td>Catalog</td>
            <td>${product.getCatalog()}</td>
        </tr>
        <tr>
            <td>Stock</td>
            <td>${product.getStock()}</td>
        </tr>


</table>

</body>
</html>
