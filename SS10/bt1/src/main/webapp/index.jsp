<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Calculate" %></h1>
<br/>
<form method="post" action = "/discount">
  <label >Description</label> <br/>
  <input type="text" name="description" placeholder="description"/><br/>
  <label >List Price</label> <br/>
  <input type="text" name="price" placeholder="price"/><br>
  <label >Discount Percent</label> <br/>
  <input type="text" name="discount_percent" placeholder="discount percent"/><br>
  <input type = "submit" id = "submit" value = "Submit"/>
</form>
</body>
</html>