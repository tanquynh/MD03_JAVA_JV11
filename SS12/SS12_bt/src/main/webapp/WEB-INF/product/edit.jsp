<%--
  Created by IntelliJ IDEA.
  User: 84787
  Date: 03/13/2024
  Time: 3:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Product</title>
</head>
<body>
<h1>Edit Product</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span>${requestScope["message"]}</span>
    </c:if>
</p>
<p><a href="/products">Back to product List</a></p>
<form action="" method="post">
    <fieldset>
        <legend>
            product information
        </legend>
        <table>
            <tr>
                <td>ProductName</td>
                <td><input type="text" name="productName" id="productName"
                           value="${requestScope["product"].getProductName()}"></td>
            </tr>
            <tr>
                <td>Catalog</td>
                <td><input type="text" name="catalog" id="catalog" value="${requestScope["product"].getCatalog()}"></td>
            </tr>
            <tr>
                <td>Stock</td>
                <td><input type="text" name="stock" id="stock" value="${requestScope["product"].getStock()}"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Update Product"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
