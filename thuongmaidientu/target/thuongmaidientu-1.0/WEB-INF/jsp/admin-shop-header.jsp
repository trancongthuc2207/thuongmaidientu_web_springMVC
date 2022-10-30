<%--
    Document   : header
    Created on : Jul 24, 2022, 1:10:04 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<nav class="navbar navbar-expand-sm navbar-dark bg-dark header">
  <div class="container-fluid">
    <a class="navbar-brand" href="/thuongmaidientu">THUONG MAI DIEN TU</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="mynavbar">
      <%--            DANH MUC             --%>
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link" href="/thuongmaidientu">&#9969; Trang chu</a>
        </li>
        <c:forEach items="${type_products}" var="c">
          <c:url value="/" var="cUrl">
            <c:param name="type_Id" value="${c.idTypeProduct}"/>
          </c:url>
          <li class="nav-item">
            <a class="nav-link" href="${cUrl}">${c.typeName}</a>
          </li>
        </c:forEach>
      </ul>
      <%--            GIO HANG            --%>
      <ul class="nav nav-pills navTask">
<%--        <c:url value="/user/customer-orders" var="cus_bag"/>--%>
        <li class="nav-item dropdown">
          <div class="dropdown">
            <a type="submit" class="dropbtn" href="#"><i
                    class='fas fa-shopping-cart'></i> My Shop
              <i class="badge badge-danger" id="cartCounter"></i>0
              <i class="fa fa-caret-down"></i>
            </a>
<%--            <c:url value="/user/cus-orders-manager?idStatus=1" var="my_orders"/>--%>
            <div class="dropdown-content">
              <a href="#">Cửa Hàng Của Tôi</a>
              <a href="#">Đơn Hàng Của Tôi</a>
            </div>
          </div>
        </li>
      </ul>
      <%--            LOGIN             --%>
      <ul class="nav nav-pills navTask">
        <c:url value="/login" var="log"/>
        <li class="nav-item dropdown">
          <div class="dropdown">
            <a type="submit" class="dropbtn" href="${log}"> <span
                    class="fas fa-user-circle"></span> Đăng Nhập</a>
            <div class="dropdown-content">
              <a href="#">Thông Tin Tài Khoản</a>
              <a href="#">Đăng Xuất</a>
            </div>
          </div>
        </li>
      </ul>

      <%--            TIM KIEM             --%>
      <c:url value="/" var="action"/>
      <form class="d-flex">
        <input class="form-control me-2" type="text" name="kw" placeholder="Nhap tu khoa...">
        <button type="submit" class="btn btn-primary" type="button">Tim</button>
      </form>
    </div>
  </div>
</nav>


<style>
  .header{
    overflow: hidden;
    background-color: #333;
    position: absolute;
    top: 0;
    width: 100%;
    padding: 16px;
  }

  .navTask {
    margin-right: 2%;
  }
  /* Dropdown Button */
  .dropbtn {
    background-color: #04AA6D;
    color: white;
    padding: 10px;
    font-size: 16px;
    border: none;
    border-radius: 20px 20px;
  }

  /* The container <div> - needed to position the dropdown content */
  .dropdown {
    position: relative;
    display: inline-block;
  }

  /* Dropdown Content (Hidden by Default) */
  .dropdown-content {
    display: none;
    position: fixed;
    background-color: #f1f1f1;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
    z-index: 1;
  }

  /* Links inside the dropdown */
  .dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: flex;
  }

  /* Change color of dropdown links on hover */
  .dropdown-content a:hover {
    background-color: #ddd;
  }

  /* Show the dropdown menu on hover */
  .dropdown:hover .dropdown-content {
    display: block;
  }

  /* Change the background color of the dropdown button when the dropdown content is shown */
  .dropdown:hover .dropbtn {
    background-color: #3e8e41;
  }
</style>