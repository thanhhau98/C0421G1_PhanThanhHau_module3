<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 8/5/2021
  Time: 3:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer Edit</title>
</head>
<body>
<h1>Product Edit</h1>
<p>
    <c:if test="${message != null}">
        <span >${message}</span>
    </c:if>
</p>
<div class="container">
    <form>
        <div class="form-group row">
            <label for="inputName" class="col-sm-1-12 col-form-label"></label>
            <div class="col-sm-1-12">
                <input type="text" class="form-control" name="name" id="inputName"  value="${product.name}">
            </div>
            <div class="col-sm-1-12">
                <input type="text" class="form-control" name="price"  value="${product.price}">
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
