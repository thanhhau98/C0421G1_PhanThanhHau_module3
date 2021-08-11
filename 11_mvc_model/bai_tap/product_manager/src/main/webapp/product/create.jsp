<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 8/5/2021
  Time: 2:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<head>
    <title>Create new customer</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
</head>
<body>
<h1 style="text-align: center">Create new customer</h1>
<a class="btn btn-primary" href="/products" role="Back">Back</a>
<p style="text-align: center">
    <c:if test="${message != null}">
        <span >${message}</span>
    </c:if>
</p>
<h3>Product Information</h3>
<form action="/products" method="post">
    <input hidden name="action" value="create">
    <div class="form-group">
        <label >Id</label>
        <input type="text" class="form-control" name="id" placeholder="id">
    </div>
    <div class="form-group">
        <label >Name</label>
        <input type="text" class="form-control" name="name" placeholder="Name">
    </div>
    <div class="form-group">
        <label >Price</label>
        <input type="text" class="form-control" name="price" placeholder="Price">
    </div>
    <div class="form-group">
        <button type="submit" class="btn btn-success">Create</button>
    </div>
</form>
</body>
</html>
