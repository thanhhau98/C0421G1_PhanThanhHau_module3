<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 8/5/2021
  Time: 3:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<head>
    <title>View product</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
</head>
<body>
<title>View product</title>
<a class="btn btn-primary" href="/products" role="Back">Back</a>
<form action="/products">
    <input hidden name="action" value="view">
    <input hidden name="id" value="${product.id}">
    <div class="form-group">
        <label >Name</label>
        <input type="text" class="form-control" name="name" readonly value="${product.name}">
    </div>
    <div class="form-group">
        <label >Price</label>
        <input type="text" class="form-control" name="price" readonly value="${product.price}">
    </div>
</form>
</body>
</html>
