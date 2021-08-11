<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 8/5/2021
  Time: 3:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<head>
    <title>Product Edit</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
</head>
<body>
<h1>Product Edit</h1>
<a class="btn btn-primary" href="/products" role="Back">Back</a>
<p>
    <c:if test="${message != null}">
        <span >${message}</span>
    </c:if>
</p>
<form action="/products" method="post">
    <input hidden name="action" value="edit">
    <input hidden name="id" value="${product.id}">
    <div class="form-group">
        <label >Name</label>
        <input type="text" class="form-control" name="name" value="${product.name}">
    </div>
    <div class="form-group">
        <label >Price</label>
        <input type="text" class="form-control" name="price" value="${product.price}">
    </div>
    <div class="form-group">
        <button type="submit" class="btn btn-success">Update</button>
    </div>
</form>
</body>
</html>
