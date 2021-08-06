<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 8/6/2021
  Time: 11:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
</head>
<body>
<center>
    <h1>User Management</h1>
    <c:if test="${messager != null}" >
        <h3  style="color: red">${messager}</h3>
    </c:if>
    <h2>
        <a href="/users?action=create">Add New User</a>
    </h2>
    <div align="center">
        <form method="get" action="/users">
            <input type="hidden" name="action" value="search" />
            <table border="1" cellpadding="5">
                <caption>
                    <h2>
                        Search By Country
                    </h2>
                </caption>
                <tr>
                    <th>Country Name:</th>
                    <td>
                        <input type="text" name="countryName" size="45"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="Search"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</center>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List of Users</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${userList}">
            <tr>

                <td><a href="/users?action=view&id=${user.id}"><c:out value="${user.id}"/></a></td>
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
</div>
</body>
</html>
