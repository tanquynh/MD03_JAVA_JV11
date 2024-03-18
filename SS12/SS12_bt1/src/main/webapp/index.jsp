<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Product List!" %>
</h1>
<br/>
<a href="${pageContext.request.contextPath}/products">Product List</a>
</body>
</html>