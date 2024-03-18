<%--
  Created by IntelliJ IDEA.
  User: 84787
  Date: 03/13/2024
  Time: 3:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete product</title>
</head>
<body>
<p><a href="/products">back to product list</a></p>
<form action="" method="post">
    <fieldset>
        <legend>product Information</legend>
        <table>
            <tr>
                <td>Name</td>
                <td>${requestScope["product"].getProductName()}</td>
            </tr>
            <tr>
                <td>Catalog</td>
                <td>${requestScope["product"].getCatalog()}</td>
            </tr>
            <tr>
                <td>Stock</td>
                <td>${requestScope["product"].getStock()}</td>
            </tr>
            <tr>
                <td><input type="submit" value="Delete product"></td>
                <td><a href="/products"> Back to product List</a></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
