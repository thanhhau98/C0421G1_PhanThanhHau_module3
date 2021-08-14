<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 8/12/2021
  Time: 10:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Customer List</title>
    <link rel="stylesheet" href="../assert/css/bootstrap.min.css">
    <script src="../assert/jquery/jquery-3.5.1.min.js"></script>
    <script src="../assert/jquery/popper.min.js"></script>
    <script src="../assert/js/bootstrap.min.js"></script>
</head>
<body>
<h1 style="text-align: center">Services</h1>
<p style="text-align: center">
    <c:if test="${messager != null}">
        <span>${messager}</span>
    </c:if>
</p>
<a class="btn btn-primary" href="/services?action=create" role="Create">Create</a>
<form action="/customers" method="post">
    <input hidden name="action" value="search">
    <div class="form-group">
        <label>Search By Name</label>
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
        <th>Area</th>
        <th>Cost</th>
        <th>Max People</th>
        <th>Rent Type</th>
        <th>Service Type</th>
        <th>Standard Room</th>
        <th>Description Other Convenience</th>
        <th>Poll Area</th>
        <th>Number Of Floors</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="service" items="${services}">
        <tr>
            <td scope="row"><a class="btn btn-danger" href="/services?action=view&customerId=${service.serviceId}"
                               role="Id">${service.serviceId}</a></td>
            <td>${service.serviceName}</td>
            <td>${service.serviceArea}</td>
            <td>${service.serviceCost}</td>
            <td>${service.serviceMaxPeople}</td>
            <td>
                <c:if test="${service.rentTypeId == 1}">
                    Year
                </c:if>
                <c:if test="${service.rentTypeId == 2}">
                    Month
                </c:if>
                <c:if test="${service.rentTypeId == 3}">
                    Day
                </c:if>
                <c:if test="${service.rentTypeId == 4}">
                    Hour
                </c:if>
            </td>
            <td>
                <c:if test="${service.serviceTypeId == 1}">
                    Villa
                </c:if>
                <c:if test="${service.serviceTypeId == 2}">
                    House
                </c:if>
                <c:if test="${service.serviceTypeId == 3}">
                    Room
                </c:if>
            </td>
            <td>${service.standardRoom}</td>
            <td>${service.descriptionOtherConvenience}</td>
            <td>${service.pollArea}</td>
            <td>${service.numberOfFloors}</td>
            <td><a class="btn btn-danger" href="/services?action=edit&serviceId=${service.serviceId}"
                   role="Edit">Edit</a>
                    <%--            <td><a  class="btn btn-danger" href="/products?action=delete&id=${product.id}" role="Delete">Delete</a></td>--%>
                <button onclick="onDelete('${service.serviceId}','${service.serviceName}')" type="button"
                        class="btn btn-danger" data-toggle="modal" data-target="#modelId">Delete
                </button>
            </td>
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
            <form action="/services">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="serviceId" id="id">
                <div class="modal-body">
                    Ban co muon xoa <input style="border: none ; color: red " id="name" readonly>
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
    function onDelete(id, name) {
        document.getElementById("id").value = id;
        document.getElementById("name").value = name;
    }
</script>
</body>
</html>
