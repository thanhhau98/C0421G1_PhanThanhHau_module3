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
<a class="btn btn-primary" href="/customers" role="Back">Back</a>
<p style="text-align: center">
    <c:if test="${messager != null}">
        <span >${messager}</span>
    </c:if>
</p>
<h3>Customer Information</h3>
<form action="/customers" method="post">
    <input hidden name="action" value="create">
    <div class="form-group">
        <label > Id</label>
        <input type="text" class="form-control" name="customerId" placeholder="id">
    </div>

    <div class="form-group">
        <label > Type </label>
        <div class="form-check ">
            <input class="form-check-input" type="radio" name="customerTypeId"  value="1">
            <label class="form-check-label" for="inlineRadio1">Diamond</label>
        </div>
        <div class="form-check ">
            <input class="form-check-input" type="radio" name="customerTypeId" value="2">
            <label class="form-check-label" for="inlineRadio2">Platinium</label>
        </div>
        <div class="form-check ">
            <input class="form-check-input" type="radio" name="customerTypeId"  value="3">
            <label class="form-check-label" for="inlineRadio2">Gold</label>
        </div>
        <div class="form-check ">
            <input class="form-check-input" type="radio" name="customerTypeId"  value="4">
            <label class="form-check-label" for="inlineRadio2">Silver</label>
        </div>
        <div class="form-check ">
            <input class="form-check-input" type="radio" name="customerTypeId"  value="5">
            <label class="form-check-label" for="inlineRadio2">Member</label>
        </div>
<%--        <input type="text" class="form-control" name="customerTypeId" placeholder="id">--%>
    </div>

    <div class="form-group">
        <label > Name</label>
        <input type="text" class="form-control" name="customerName" placeholder="Name">
    </div>
    <div class="form-group">
        <label > Birthday</label>
        <input type="text" class="form-control" name="customerBirthday" placeholder="Birthday">
    </div>

    <div class="form-group">
        <label > Gender</label>
        <div class="form-check ">
            <input class="form-check-input" type="radio" name="customerGender" id="inlineRadio1" value="1">
            <label class="form-check-label" for="inlineRadio1">Male</label>
        </div>
        <div class="form-check ">
            <input class="form-check-input" type="radio" name="customerGender" id="inlineRadio2" value="0">
            <label class="form-check-label" for="inlineRadio2">Female</label>
        </div>
<%--        <input type="text" class="form-control" name="customerGender" placeholder="Gender">--%>
    </div>

    <div class="form-group">
        <label > Id Card</label>
        <input type="text" class="form-control" name="customerIdCard" placeholder="Id Card">
    </div>
    <div class="form-group">
        <label > Phone</label>
        <input type="text" class="form-control" name="customerPhone" placeholder="Phone">
    </div>
    <div class="form-group">
        <label > Email</label>
        <input type="text" class="form-control" name="customerEmail" placeholder="Email">
    </div>
    <div class="form-group">
        <label > Address</label>
        <input type="text" class="form-control" name="customerAddress" placeholder="Address">
    </div>
    <div class="form-group">
        <button type="submit" class="btn btn-success">Create</button>
    </div>
</form>
</body>
</html>
