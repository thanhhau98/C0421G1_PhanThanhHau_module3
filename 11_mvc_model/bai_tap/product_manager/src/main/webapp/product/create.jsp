<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 8/5/2021
  Time: 2:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new customer</title>
</head>
<body>
<h1>Create new customer</h1>
<p>
    <c:if test="${message != null}">
        <span >${message}</span>
    </c:if>
</p>
<h3>Customer Information</h3>
<div class="container">
    <form method="post" action="/products">
        <div class="form-group row">
            <label for="inputName" class="col-sm-1-12 col-form-label"></label>
            <div class="col-sm-1-12">
                <input type="text" class="form-control" name="id" id="inputName" placeholder="Id">
            </div>
            <div class="col-sm-1-12">
                <input type="text" class="form-control" name="name"  placeholder="Name">
            </div>
            <div class="col-sm-1-12">
                <input type="text" class="form-control" name="price"  placeholder="Price">
            </div>
        </div>
        <div class="form-group row">
            <div class="offset-sm-2 col-sm-10">
                <button type="submit" class="btn btn-primary">Action</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
