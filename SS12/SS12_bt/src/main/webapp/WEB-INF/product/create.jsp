<%--
  Created by IntelliJ IDEA.
  User: 84787
  Date: 03/13/2024
  Time: 3:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new product</title>
    <style>
        .message {
            color: green;
        }
    </style>
</head>
<body>
<h1>Create new product</h1>
<p><c:if test='${requestScope["message"] !=null}'>
    <span class="message"> ${requestScope["message"]}</span>
</c:if></p>
<p><a href="${pageContext.request.contextPath}/products">Back to product List</a></p>
<form action="" method="post">
    <table>
        <tr>
            <td>Product Name</td>
            <td><input type="text" name="productName" id="productName"/></td>
        </tr>
        <tr>
            <td>Catalog</td>
            <td><input type="text" name="catalog" id="catalog"></td>
        </tr>
        <tr>
            <td>Stock</td>
            <td><input type="text" name="stock" id="stock"></td>
        </tr>
        <tr>
            <td><input type="submit" value ="Create product"></td>
        </tr>
    </table>
</form>
</body>
</html>
