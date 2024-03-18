<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Simple Calculator" %>
</h1>
<br/>
<form action="CalculatorServlet" method="post">
    Enter num1: <input type="text" name="num1"><br>
    Enter num2: <input type="text" name="num2"><br>
    Select operation:
    <select name="operation">
        <option value="add">Addition</option>
        <option value="subtract">Subtraction</option>
        <option value="multiply">Multiplication</option>
        <option value="divide">Division</option>
    </select><br>
    <input type="submit" value="Calculate">
</form>
</body>
</html>