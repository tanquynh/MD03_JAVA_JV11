<%--
  Created by IntelliJ IDEA.
  User: 84787
  Date: 03/15/2024
  Time: 10:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Management Application</title>
</head>
<body>
<center>
    <h1>User Management</h1>
    <a href="/users?action=users">ListAll Users</a>
</center>
<div class="center">
    <form action="" method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>Add New User</h2>
            </caption>
            <tr>
                <th>User Name :</th>
                <td><input type="text" name="name" id="name" size="45"></td>
            </tr>
            <tr>
                <th>User email</th>
                <td><input type="text" name="email" id="email" size="45"></td>
            </tr>
            <tr>
                <th>User country</th>
                <td><input type="text" name="country" id="country" size="45"></td>
            </tr>
            <tr >

                <td colspan="2" align="center"><input type="submit" value="save"></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
