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
    <title>Customer Edit</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
</head>
<body>
<h1>Customer Edit</h1>
<a class="btn btn-primary" href="/customers" role="Back">Back</a>
<p>
    <c:if test="${messager != null}">
        <span >${messager}</span>
    </c:if>
</p>
<form action="/customers" method="post">
    <input hidden name="action" value="edit">
    <input hidden name="customerId" value="${customer.customerId}">
    <div class="form-group">
        <label >Type </label>
        <input type="text" class="form-control" name="customerTypeId" value="${customer.customerTypeId}">
    </div>
    <div class="form-group">
        <label >Name</label>
        <input type="text" class="form-control" name="customerName" value="${customer.customerName}">
    </div>
    <div class="form-group">
        <label >Birthday</label>
        <input type="text" class="form-control" name="customerBirthday" value="${customer.customerBirthday}">
    </div>

    <div class="form-group">
        <label >Gender</label>
        <div class="form-check ">
            <input ${customer.customerGender == 1 ? 'checked' : ''} class="form-check-input" type="radio" name="customerGender" id="inlineRadio1" value="1">
            <label class="form-check-label" for="inlineRadio1">Male</label>
        </div>
        <div class="form-check ">
            <input ${customer.customerGender == 0 ? 'checked' : '' } class="form-check-input" type="radio" name="customerGender" id="inlineRadio2" value="0">
            <label class="form-check-label" for="inlineRadio2">Female</label>
        </div>
<%--        <input  type="text" class="form-control" name="customerGender" value="${customer.customerGender}">--%>
    </div>

    <div class="form-group">
        <label >Id Card</label>
        <input type="text" class="form-control" name="customerIdCard" value="${customer.customerIdCard}">
    </div>
    <div class="form-group">
        <label >Phone</label>
        <input type="text" class="form-control" name="customerPhone" value="${customer.customerPhone}">
    </div>
    <div class="form-group">
        <label >Email</label>
        <input type="text" class="form-control" name="customerEmail" value="${customer.customerEmail}">
    </div>
    <div class="form-group">
        <label >Address</label>
        <input type="text" class="form-control" name="customerAddress" value="${customer.customerAddress}">
    </div>
    <div class="form-group">
        <button type="submit" class="btn btn-success">Update</button>
    </div>
</form>
</body>
</html>
