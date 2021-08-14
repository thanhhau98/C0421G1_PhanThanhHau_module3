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
    <title>Create new service</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script src="../assert/jquery/jquery-3.5.1.min.js"></script>
    <script src="../assert/jquery/popper.min.js"></script>
    <script src="../assert/js/bootstrap.min.js"></script>
</head>
<body>
<h1 style="text-align: center">Create new service</h1>
<a class="btn btn-primary" href="/services" role="Back">Back</a>
<p style="text-align: center">
    <c:if test="${messager != null}">
        <span >${messager}</span>
    </c:if>
</p>
<h3>Service Information</h3>
<form action="/services" method="post">
    <input hidden name="action" value="create">
    <div class="form-group">
        <label > Id</label>
        <input type="text" class="form-control" name="serviceId" placeholder="Id">
    </div>
    <div class="form-group">
        <label > Name</label>
        <input type="text" class="form-control" name="serviceName" placeholder="Name">
    </div>
    <div class="form-group">
        <label > Area</label>
        <input type="text" class="form-control" name="serviceArea" placeholder="Area">
    </div>
    <div class="form-group">
        <label > Cost</label>
        <input type="text" class="form-control" name="serviceCost" placeholder="Cost">
    </div>
    <div class="form-group">
        <label > Max People</label>
        <input type="text" class="form-control" name="serviceMaxPeople" placeholder="Max People">
    </div>
    <div class="form-group">
        <label > Rent Type</label>
        <select class="custom-select" name="rentTypeId">
            <option selected>Type</option>
            <option value="1">Year</option>
            <option value="2">Month</option>
            <option value="3">Day</option>
            <option value="4">Hour</option>
        </select>
    </div>
    <div class="form-group">
        <label > Service Type</label>
        <select class="custom-select" name="serviceTypeId">
            <option selected>Type</option>
            <option value="1">Villa</option>
            <option value="2">House</option>
            <option value="3">Room</option>
        </select>
    </div>
    <div class="form-group">
        <label > Standard Room</label>
        <input type="text" class="form-control" name="standardRoom" placeholder="Standard Room">
    </div>
    <div class="form-group">
        <label > Description Other Convenience</label>
        <input type="text" class="form-control" name="descriptionOtherConvenience" placeholder="Description Other Convenience">
    </div>
    <div class="form-group">
        <label > Poll Area</label>
        <input type="text" class="form-control" name="pollArea" placeholder="Poll Area">
    </div>
    <div class="form-group">
        <label > Number Of Floors</label>
        <input type="text" class="form-control" name="numberOfFloors" placeholder="Number Of Floors">
    </div>
    <div class="form-group">
        <button type="submit" class="btn btn-success">Create</button>
    </div>
</form>
</body>
</html>
