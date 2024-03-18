<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Current Converter</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<form action="converter.jsp" method="post">
    <label>Rate</label>
    <input type="text" name="rate" placeholder="RATE" value="250000"/><br>
    <label>USD</label>
    <input type="text" name="usd" placeholder="USD" value="0"/><br/>
    <input type="submit" id="submit" value="Converter"/>
</form>
</body>
</html>