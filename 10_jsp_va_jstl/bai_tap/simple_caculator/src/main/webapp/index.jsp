<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 7/1/2021
  Time: 2:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
    <link rel="stylesheet" href="WEB-INF/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  <body>
  <h2>Currency Converter</h2>
  <form action="/calculator" method="post">
    <label>First operand: </label><br/>
    <input type="text" name="first_operand" placeholder="first" value="0"/><br/>
    <label>Operator: </label><br/>
    <select id="operator" name="operator" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
      <option selected>Choose operator</option>
      <option value="1">+</option>
      <option value="2">-</option>
      <option value="3">*</option>
      <option value="4">/</option>
    </select><br/>
    <label>Second operand: </label><br/>
    <input type="text" name="second_operand" placeholder="USD" value="0"/><br/>
    <input type = "submit" id = "submit" value = "Converter"/>
  </form>
  </body>
</html>
