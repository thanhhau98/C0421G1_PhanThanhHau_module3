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
    <script src="/js/jquery-3.6.0.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
</head>
<body>
<h1 style="text-align: center">Products</h1>
<a class="btn btn-primary" href="/products?action=create" role="Create">Create</a>
<form action="/products" method="post">
    <input hidden name="action" value="search">
    <div class="form-group">
        <label >Search By Name</label>
        <input type="text" class="form-control" name="name">
    </div>
    <div>
        <button type="submit" class="btn btn-success">Search</button>
    </div>
</form>
<table class="table" style="text-align: center">
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
            <td scope="row"><a class="btn btn-danger" href="/products?action=view&id=${product.id}" role="Id">${product.id}</a></td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td><a class="btn btn-danger" href="/products?action=edit&id=${product.id}" role="Edit">Edit</a></td>
<%--            <td><a  class="btn btn-danger" href="/products?action=delete&id=${product.id}" role="Delete">Delete</a></td>--%>
            <td><button onclick="onDelete(${product.id})" type="button" class="btn btn-danger" data-toggle="modal" data-target="#modelId">Delete</button></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<div class="modal fade" id="modelId" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Confirm delete</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/products">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="" id="id">
                <div class="modal-body">
                    Ban co muon xoa...
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">OK</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function onDelete(id) {
        document.getElementById("id").value = id;
    }
</script>
</body>
</html>
