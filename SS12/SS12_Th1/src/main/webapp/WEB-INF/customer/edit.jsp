<%--
  Created by IntelliJ IDEA.
  User: 84787
  Date: 03/13/2024
  Time: 11:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit customer</title>
</head>
<body>
<h1>Edit customer</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message" >${requestScope["message"]}</span>
    </c:if>
</p>
<p><a href="/customers"> Back to customer list</a></p>
<form method="post">
    <fieldset>
        <legend>
            Customer information
        </legend>
        <table>
            <tr>
                <td>Name</td>
                <td><input type="text" name="name" id="name" value="${requestScope["customer"].getName()}"></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><input type="text" name ="email" id="email" value="${requestScope["customer"].getEmail()}"></td>
            </tr>
            <tr>
                <td>Address</td>
                <td><input type="text" id="address" name="address" value="${requestScope["customer"].getAddress()}"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Update customer"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
