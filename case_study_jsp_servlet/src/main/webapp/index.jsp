<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 8/11/2021
  Time: 11:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
  <head>
    <title>case_study</title>
    <link rel="stylesheet" href="assert/css/bootstrap.min.css">
    <script src="assert/jquery/jquery-3.5.1.min.js"></script>
    <script src="assert/jquery/popper.min.js"></script>
    <script src="assert/js/bootstrap.min.js"></script>
  </head>
  <body>

  <div class="container-fluid">
    <div class="jumbotron text-center" style="margin-bottom:0">
      <h1>WELLCOME TO FURAMA RESORT</h1>
    </div>

    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
      <a class="navbar-brand" href="">Furama</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item">
            <a class="nav-link" href="">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/customers">Customers</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/services">Services</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Employee</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Contract</a>
          </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
          <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
      </div>
    </nav>
    <div class="row">
      <div class="col-sm-3">
        <ul class="nav nav-pills flex-column">
          <li class="nav-item mr-auto">
            <a class="nav-link" href="#">Kích hoạt</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Liên kết 1</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Liên kết 2</a>
          </li>
          <li class="nav-item">
            <a class="nav-link disabled" href="#">Vô hiệu hóa</a>
          </li>

        </ul>
        <hr class="d-sm-none">
      </div>
      <div class="col-sm-9">
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img alt="First slide" class="d-block w-100" src="assert/img/resort1.jpg"/>
              <div class="carousel-caption d-none d-md-block">
                <h5>Wellcome to Furama Resort</h5>
              </div>
            </div>
            <div class="carousel-item">
              <img alt="Second slide" class="d-block w-100" src="assert/img/resort2.jpg"/>
            </div>
            <div class="carousel-item">
              <img alt="Third slide" class="d-block w-100" src="assert/img/resort3.jpg"/>
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
      </div>
    </div>
    <div class="jumbotron text-center" style="margin-bottom:0">
      <p>Bản quyền 2020 thuộc về Thờ </p>
    </div>
  </div>
  </body>
</html>
