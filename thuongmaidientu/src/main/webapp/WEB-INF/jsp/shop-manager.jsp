<%--
    Document   : index
    Created on : Jul 10, 2022, 1:27:12 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://kit.fontawesome.com/6f26e389c8.js" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>

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

<div class="container shop">
    <ul class="nav nav-pills navTask">
        <%--        QUẢNG CÁO  --%>
        <div id="mySidenav" class="sidenav" style="background-image: linear-gradient(#7C0D0D, #DC0404);">
            <div class="dropdown">
                <button class="dropbtn"
                        [ngStyle]="{'color': 'white','font-style': 'bold', 'font-size': '20.01px', 'font-family':'sans-serif'}">
                    Screening
                </button>
                <div class="dropdown-content">
                    <a href="#">Link 1</a>
                    <a href="#">Link 2</a>
                    <a href="#">Link 3</a>
                </div>
            </div>
        </div>
        <%--     ------------       --%>
        <%--     NAV HEADER PAGE INDEX      --%>
        <li class="nav-item dropdown">
            <div class="dropdown-right">
                <a type="submit"
                   class="btn btn-sm btn-secondary dropdown-toggle dropdown-toggle-split dropbtn-right-side"
                   href="#"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <span
                        class="fas fa-user-circle"></span> Kênh Buôn Bán </a>
                <div class="dropdown-content-right">
                    <div class="speech-bubble"><i> </i>Bạn muốn trở thành người bán hàng ?</div>
                </div>
            </div>
        </li>
    </ul>

    <div class="row">
        <%--    PHAN TRANG   --%>
<%--        <ul class="pagination">--%>
<%--            <c:forEach begin="1" end="${Math.ceil(productCounter/8)}" var="i">--%>
<%--                <c:url value="/" var="c">--%>
<%--                    <c:param value="${i}" name="page"/>--%>
<%--                </c:url>--%>
<%--                <li class="page-item"><a class="page-link" href="${c}">${i}</a></li>--%>
<%--            </c:forEach>--%>
<%--        </ul>--%>
        <%--    SAN PHAM    --%>
<%--        <c:forEach items="${products}" var="p">--%>
<%--            <c:url value="/products/" var="cUrl">--%>
<%--                <c:param name="ID_Product" value="${p.idProduct}"/>--%>
<%--            </c:url>--%>
<%--            <div class="col-md-3 col-xs-12" style="padding: 5px;">--%>
<%--                <form action="${book_pro}">--%>
<%--                    <div class="card">--%>
<%--                        <img class="card-img-top" class="img-fluid"--%>
<%--                             src="https://res.cloudinary.com/dxxwcby8l/image/upload/v1647248722/r8sjly3st7estapvj19u.jpg"--%>
<%--                             alt="Card image">--%>
<%--                        <div class="card-body">--%>
<%--                            <h4 class="card-title">${p.nameProduct}</h4>--%>
<%--                            <p class="card-text">--%>
<%--                                <fmt:formatNumber type="number" maxFractionDigits="3" value="${p.unitPrice}"/> VND--%>
<%--                            </p>--%>
<%--                            <a href="${cUrl}" class="btn btn-primary">Xem chi tiet</a>--%>
<%--                            <button name="idPro" value="${p.idProduct}" class="btn btn-primary"--%>
<%--                                    type="submit">Đặt Hàng--%>
<%--                            </button>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </form>--%>
<%--            </div>--%>
<%--        </c:forEach>--%>
    </div>
</div>

<style>
    .header {
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

    /*  ------------------ INDEX ---------------------------  */
    .row {
        padding-top: 10px;
    }

    .container {
        padding: 16px;
        margin-top: 30px;
    }

    .shop {
        margin-top: 90px;
    }

    <%--  BOX  --%>
    .speech-bubble {
        width: 150px;
        /*height: 80px;*/
        position: absolute;
        background: #2997e8;
        border-radius: 10px;
        text-align: center;
        color: white;
    }

    .speech-bubble::before {
        width: 0;
        height: 0;
        margin: 13px 0 0 -25px;
        position: absolute;
        content: "";
        border-top: 13px solid transparent;
        border-bottom: 13px solid transparent;
        border-right: 26px solid #2997e8;
    }

    .dropbtn-right-side {
        background-color: #04AA6D;
        color: white;
        padding: 10px;
        font-size: 16px;
        border: none;
        border-radius: 20px 20px;
    }

    /* The container <div> - needed to position the dropdown content */
    .dropdown-right {
        position: relative;
        display: flex;
    }

    /* Dropdown Content (Hidden by Default) */
    .dropdown-content-right {
        margin-left: 115%;
        display: none;
        position: absolute;
        background-color: #f1f1f1;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
        z-index: 1;
    }

    /* Links inside the dropdown */
    .dropdown-content-right a {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }

    /* Change color of dropdown links on hover */
    .dropdown-content-right a:hover {
        background-color: #ddd;
    }

    /* Show the dropdown menu on hover */
    .dropdown-right:hover .dropdown-content-right {
        display: block;
    }

    /* Change the background color of the dropdown button when the dropdown content is shown */
    .dropdown-right:hover .dropbtn-right-side {
        background-color: #3e8e41;
    }

    /*  ------------------ĐỘNG NGANG------------------ */
    .sidenav {
        height: 70%;
        width: 10%;
        position: fixed;
        z-index: 0;
        top: 120px;
        left: 0px;
        right: 50px;
        background-color: #ff0000;
        overflow-x: hidden;
        padding-top: 0px;
        transition: 0.5s;
        margin-bottom: 20%;
    }

    /* ON HOVER */
    .sidenav:hover {
        width: 250px;
    }

    .sidenav normalb:hover {
        background-color: #4F0909;
    }

    .buttonGroup {
        align-content: baseline;
    }

    /* Darker background on mouse-over */
    .btn:hover {
        background-color: #4F0909;
    }

    .sidenav h1 {
        background-color: #850101; /* Blue background */
        border: thin; /* Remove borders */
        color: white; /* White text */
        font-size: 16px; /* Set a font size */
        cursor: pointer; /* Mouse pointer on hover */
        overflow: hidden;
    }

    .sidenav h1:hover {
        background-color: #4F0909;
    }

    /* The navigation menu links */
    .sidenav a {
        padding-left: 10px;
        text-decoration: none;
        font-size: 18px;
        color: #f1f1f1;
        display: block;
        transition: 0.3s
    }

    .sidenav a:hover, .offcanvas a:focus {
        color: #f1f1f1;
    }
</style>
