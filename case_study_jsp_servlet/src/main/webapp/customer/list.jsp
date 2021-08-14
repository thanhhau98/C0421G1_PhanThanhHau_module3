<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 8/12/2021
  Time: 10:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<head>
    <title>Customer List</title>
    <link rel="stylesheet" href="../assert/css/bootstrap.min.css">
    <script src="../assert/jquery/jquery-3.5.1.min.js"></script>
    <script src="../assert/jquery/popper.min.js"></script>
    <script src="../assert/js/bootstrap.min.js"></script>
</head>
<body>
<h1 style="text-align: center">Customers</h1>
<p style="text-align: center">
    <c:if test="${messager != null}">
        <span >${messager}</span>
    </c:if>
</p>
<a class="btn btn-primary" href="/customers?action=create" role="Create">Create</a>
<form action="/customers" method="post">
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
        <th>Type</th>
        <th>Name</th>
        <th>Birth Day</th>
        <th>Gender</th>
        <th>Id Card</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Address</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="customer" items="${customers}">
        <tr>
            <td scope="row"><a class="btn btn-danger" href="/customers?action=view&customerId=${customer.customerId}" role="Id">${customer.customerId}</a></td>
            <td>${customer.customerTypeId}</td>
            <td>${customer.customerName}</td>
            <td>${customer.customerBirthday}</td>

            <td>
                <c:if test="${customer.customerGender == 0}">
                    Female
                </c:if>
                <c:if test="${customer.customerGender == 1}">
                    Male
                </c:if>
            </td>

            <td>${customer.customerIdCard}</td>
            <td>${customer.customerPhone}</td>
            <td>${customer.customerEmail}</td>
            <td>${customer.customerAddress}</td>
            <td><a class="btn btn-danger" href="/customers?action=edit&customerId=${customer.customerId}" role="Edit">Edit</a>
                <%--            <td><a  class="btn btn-danger" href="/products?action=delete&id=${product.id}" role="Delete">Delete</a></td>--%>
            <button onclick="onDelete('${customer.customerId}','${customer.customerName}')" type="button" class="btn btn-danger" data-toggle="modal" data-target="#modelId">Delete</button></td>
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
            <form action="/customers">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="customerId"  id="id">
                <div class="modal-body">
                    Ban co muon xoa <input style="border: none ; color: red " id="name"   readonly >
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
    function onDelete(id ,  name) {
        document.getElementById("id").value = id;
        document.getElementById("name").value = name;
    }
</script>
</body>
</html>
