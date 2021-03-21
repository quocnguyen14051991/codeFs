<%--
  Created by IntelliJ IDEA.
  User: HK
  Date: 30/9/2020
  Time: 9:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/templates/main.css">
    <title>Title</title>
</head>
<body>
<h1> Login to quocnguyen.com </h1>
<form action="/login" method="post">
    <label> Username: </label>
    <input type="text" name="username"> <br>
    <h6>${message}</h6>
    <label> Password: </label>
    <input type="password" name="password"> <br>
    <h6>${message}</h6>
    <label>&nbsp; </label>
    <input type="submit" value="Login" name="submit">
</form>
</body>
</html>
