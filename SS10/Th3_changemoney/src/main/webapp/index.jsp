<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<h2>Current Converter</h2>
<form method="post" action="/convert">
    <label>Rate :</label> <br/>
    <input type="text" name="rate" placeholder="RATE" value="25000"/><br>
    <label>USD </label><br/>
    <input type="text" name="usd" placeholder="USD" value="0"/><br/>
    <input type="submit" id="submit" value="Converter"/>
</form>
</body>
</html>