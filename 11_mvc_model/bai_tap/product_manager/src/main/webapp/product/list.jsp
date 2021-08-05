<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 8/5/2021
  Time: 1:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<head>
    <title>Products List</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
</head>
<body>
<h1>Products</h1>

<a class="btn btn-primary" href="/products?action=create" role="Create"></a>
<table class="table">
    <thead>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Price</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="product" items="${products}">
        <tr>
            <td scope="row">${product.Id}</td>
            <td>${product.Name}</td>
            <td>${product.Price}</td>
            <a class="btn btn-danger" href="/products?action=edit&id=${product.Id}" role="Edit"></a>
            <a class="btn btn-danger" href="/products?action=delete&id=${product.Id}" role="Delete"></a>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
