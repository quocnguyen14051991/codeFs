<%--
  Created by IntelliJ IDEA.
  User: HK
  Date: 30/9/2020
  Time: 1:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<center>
    <h1>User Management</h1>
    <h2>
        <a href="/users?action=create">Add New User</a>
        <form action="/users">
            <label for="search">Search</label>
            <input type="text" name="find" id="search" value="${txt_Search}">
            <input type="submit" value="search" name="action">
        </form>
    </h2>
</center>
<div align="center">
    <p>${message}</p>
    <a href="/users">Back to customer list</a>
    <table border="1" cellpadding="5">
        <caption><h2>List of Users</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${listUser}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td>
                    <a href="/users?action=edit&id=${user.id}">Edit</a>
                    <a href="/users?action=delete&id=${user.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <div id="paging">
        <c:forEach begin="1" end="${end_Page}" var="i">
            <a id="${i}" href="/users?action=paging&page_index=${i}&txt_Search=${txt_Search}">${i}</a>
        </c:forEach>
    </div>
</div>
<script>
    document.getElementById(${i}).style.color="red";
</script>
</body>
</html>
