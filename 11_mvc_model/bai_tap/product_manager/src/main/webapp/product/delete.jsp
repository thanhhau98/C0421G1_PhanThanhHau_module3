<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 8/5/2021
  Time: 3:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Deleting product</title>
</head>
<body>
<h1>Delete product</h1>

<form method="post">
    <h3>Are you sure?</h3>
    <fieldset>
        <legend>Product information</legend>
        <table>
            <tr>
                <td>Name: </td>
                <td>${product.name}</td>
            </tr>
            <tr>
                <td>Price: </td>
                <td>${product.price}</td>
            </tr>
            <tr>
                <td><input type="submit" value="Delete product"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
