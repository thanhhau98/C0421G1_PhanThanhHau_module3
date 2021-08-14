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
    <title>Service Edit</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script src="../assert/jquery/jquery-3.5.1.min.js"></script>
    <script src="../assert/jquery/popper.min.js"></script>
    <script src="../assert/js/bootstrap.min.js"></script>
</head>
<body>
<h1>Service Edit</h1>
<a class="btn btn-primary" href="/services" role="Back">Back</a>
<p>
    <c:if test="${messager != null}">
        <span >${messager}</span>
    </c:if>
</p>
<form action="/services" method="post">
    <input hidden name="action" value="edit">
    <input hidden name="serviceId" value="${service.serviceId}">
    <div class="form-group">
        <label > Name</label>
        <input type="text" class="form-control" name="serviceName" value="${service.serviceName}">
    </div>
    <div class="form-group">
        <label > Area</label>
        <input type="text" class="form-control" name="serviceArea" value="${service.serviceArea}">
    </div>
    <div class="form-group">
        <label > Cost</label>
        <input type="text" class="form-control" name="serviceCost" value="${service.serviceCost}">
    </div>
    <div class="form-group">
        <label > Max People</label>
        <input type="text" class="form-control" name="serviceMaxPeople" value="${service.serviceMaxPeople}">
    </div>
    <div class="form-group">
        <label > Rent Type</label>
        <select class="custom-select" name="rentTypeId">
            <option ${service.rentTypeId == 1 ? 'selected' : ''} value="1">Year</option>
            <option ${service.rentTypeId == 2 ? 'selected' : ''}  value="2">Month</option>
            <option ${service.rentTypeId == 3 ? 'selected' : ''}  value="3">Day</option>
            <option ${service.rentTypeId == 4 ? 'selected' : ''}  value="4">Hour</option>
        </select>
    </div>
    <div class="form-group">
        <label > Service Type</label>
        <select class="custom-select" name="serviceTypeId">
            <option ${service.serviceTypeId == 1 ? 'selected' : ''}  value="1">Villa</option>
            <option ${service.serviceTypeId == 2 ? 'selected' : ''}  value="2">House</option>
            <option ${service.serviceTypeId == 3 ? 'selected' : ''}  value="3">Room</option>
        </select>
    </div>
    <div class="form-group">
        <label > Standard Room</label>
        <input type="text" class="form-control" name="standardRoom" value="${service.standardRoom}">
    </div>
    <div class="form-group">
        <label > Description Other Convenience</label>
        <input type="text" class="form-control" name="descriptionOtherConvenience" value="${service.descriptionOtherConvenience}">
    </div>
    <div class="form-group">
        <label > Poll Area</label>
        <input type="text" class="form-control" name="pollArea" value="${service.pollArea}">
    </div>
    <div class="form-group">
        <label > Number Of Floors</label>
        <input type="text" class="form-control" name="numberOfFloors" value="${service.numberOfFloors}">
    </div>
    <div class="form-group">
        <button type="submit" class="btn btn-success">Update</button>
    </div>
</form>
</body>
</html>
