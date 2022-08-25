<%-- 
    Document   : header
    Created on : Jul 24, 2022, 1:10:04 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- Topbar Start -->
<div class="container-fluid">
    <div class="row bg-secondary py-1 px-xl-5">
        <div class="col-lg-6 d-none d-lg-block">
            <div class="d-inline-flex align-items-center h-100">
                <a class="text-body mr-3" href="">Giới Thiệu</a>
                <a class="text-body mr-3" href="">Liên Hệ</a>
                <a class="text-body mr-3" href="">Trợ Giúp</a>
                <a class="text-body mr-3" href="">Giải Đáp</a>
            </div>
        </div>
        <div class="col-lg-6 text-center text-lg-right">
            <div class="d-inline-flex align-items-center">
                <div class="dropdown">
                    <button class="dropbtn">Tài Khoản  <i class="fa fa-caret-down"></i></button>
                    <div class="dropdown-content">
                        <a href="#">Đăng Nhập</a>
                        <a href="#">Đăng Ký</a>
                    </div>
                </div>
                <div class="dropdown" style="margin-left: 10px; margin-right: 10px;">
                    <button class="dropbtn">VN  <i class="fa fa-caret-down"></i></button>
                    <div class="dropdown-content">
                        <a href="#">EN</a>
                    </div>
                </div>
                <div class="dropdown">
                    <button class="dropbtn" style="font-size: 15px;">Kênh Buôn Bán</button>
                </div>
            </div>
            <div class="d-inline-flex align-items-center d-block d-lg-none">
                <a href="" class="btn px-0 ml-2">
                    <i class="fas fa-heart text-dark"></i>
                    <span class="badge text-dark border border-dark rounded-circle" style="padding-bottom: 2px;">0</span>
                </a>
                <a href="" class="btn px-0 ml-2">
                    <i class="fas fa-shopping-cart text-dark"></i>
                    <span class="badge text-dark border border-dark rounded-circle" style="padding-bottom: 2px;">0</span>
                </a>
            </div>
        </div>
    </div>
    <div class="row align-items-center bg-light py-3 px-xl-5 d-none d-lg-flex">
        <div class="col-lg-4">
            <a href="/thuongmaidientu" class="text-decoration-none">
                <span class="h1 text-uppercase text-primary bg-dark px-2">THƯƠNG MẠI</span>
                <span class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">ĐIỆN TỬ</span>
            </a>
        </div>
        <div class="col-lg-4 col-6 text-left">
            <c:url value="/" var="action"/>
            <form action="">
                <div class="input-group">
                    <input type="text" class="form-control" name="kw" placeholder="Tìm kiếm sản phẩm">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-primary" type="button">Tìm Kiếm</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-lg-4 col-6 text-right">
            <p class="m-0">Chăm Sóc Khách Hàng</p>
            <h5 class="m-0">0344564075</h5>
        </div>
    </div>
</div>
<!-- Topbar End -->


<!-- Navbar Start -->
<div class="container-fluid bg-dark mb-30">
    <div class="row px-xl-5">
        <div class="col-lg-3 d-none d-lg-block">
            <a class="btn d-flex align-items-center justify-content-between bg-primary w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; padding: 0 30px;">
                <h6 class="text-dark m-0"><i class="fa fa-bars mr-2"></i>Danh Mục</h6>
                <i class="fa fa-angle-down text-dark"></i>
            </a>
            <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 999;">
                <div class="navbar-nav w-100">
                    <c:forEach items="${type_products}" var="c">
                        <c:url value="/" var="cUrl">
                            <c:param name="type_Id" value="${c.idTypeProduct}"/>
                        </c:url>
                        <a href="${cUrl}" class="nav-item nav-link">${c.typeName}</a>
                    </c:forEach>
                </div>
            </nav>
        </div>
        <div class="col-lg-9">
            <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
                <a href="/thuongmaidientu" class="text-decoration-none d-block d-lg-none">
                    <span class="h1 text-uppercase text-dark bg-light px-2">THƯƠNG MẠI</span>
                    <span class="h1 text-uppercase text-light bg-primary px-2 ml-n1">ĐIỆN TỬ</span>
                </a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav mr-auto py-0">
                        <a href="/thuongmaidientu" class="nav-item nav-link active">Trang Chủ</a>
                        <a href="" class="nav-item nav-link">Cửa Hàng</a>
                    </div>
                    <div class="navbar-nav ml-auto py-0 d-none d-lg-block">
                        <a href="" class="btn px-0">
                            <i class="fas fa-heart text-primary"></i>
                            <span class="badge text-secondary border border-secondary rounded-circle" style="padding-bottom: 2px;">0</span>
                        </a>
                        <a href="" class="btn px-0 ml-3">
                            <i class="fas fa-shopping-cart text-primary"></i>
                            <span class="badge text-secondary border border-secondary rounded-circle" style="padding-bottom: 2px;">0</span>
                        </a>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>
<!-- Navbar End -->


<style>
    body{
        background-color:#F5F5F5;
    }

    .dropbtn {
        background-color: white;
        color: black;
        padding: 5px;
        font-size: 14px;
        border: none;
        border-radius: 3px;
    }

    .dropdown {
        position: relative;
        display: inline-block;
    }

    .dropdown-content {
        display: none;
        position: absolute;
        background-color: #f1f1f1;
        min-width: 120px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1;
    }

    .dropdown-content a {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }

    .dropdown-content a:hover {background-color: #ddd;}

    .dropdown:hover .dropdown-content {display: block;}

    .dropdown:hover .dropbtn {background-color: lightgray;}




    * {
        padding: 0;
        margin: 0;
        box-sizing: border-box;
        font-family: 'Poppins', sans-serif;
    }

    .navbar .navbar-nav .nav-item .active {
        color: #67971f;
    }

    a.fas {
        position: relative;
        font-size: 20px;
        text-decoration: none;
        color: black;
    }

    .num {
        position: absolute;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        top: -8px;
        left: 18px;
        width: 15px;
        height: 15px;
        font-size: 8px;
        background-color: #67971f;
        color: white;
    }


    .col-lg-3 .btn.btn-primary {
        width: 100%;
        height: 43px;
        box-shadow: none;
        outline: none;
        background-color: #67971f;
        color: white;
        font-weight: 800;
        padding: 0px 15px;
        line-height: 22px;
        border: none;
    }

    .col-lg-3 .btn.btn-primary:focus {
        outline: none;
        box-shadow: none;
    }

    .col-lg-3 .btn.btn-primary:hover {
        background-color: #aadf5a;

    }

    .col-lg-3 ul {
        width: 100%;
    }

    .col-lg-9 .btn.btn-secondary {
        width: 100%;
        height: 100% !important;
        box-shadow: none;
        outline: none;
        background-color: transparent;
        color: black;
        font-weight: 800;
        padding: 0px 15px;
        line-height: 22px;
        border: none;
    }


    .col-lg-9 .btn.btn-primary {
        background-color: #67971f;
        border: none;
        height: 100%;
        width: 100px;
    }

    .col-lg-9 .btn.btn-primary:hover {
        background-color: #aadf5a;
    }

    .col-lg-9 ul {
        width: 100%;
    }

    .fas.fa-phone {
        width: 40px;
        height: 40px;
        display: flex;
        justify-content: center;
        align-items: center;
        color: #67971f;
    }

    .p-green {
        letter-spacing: 2px;
        color: #67971f;
        font-size: 14px;
    }

    input {
        width: 230px;
        border: none;
        outline: none;
    }

    p {
        margin: 0%;
    }

    .text-muted {
        font-size: 14px;
    }


    .btn.btn-success {
        color: white;
        background-color: #67971f;
        outline: none;
        border: none;
    }

    .btn.btn-success:hover {
        background-color: #aadf5a;
    }

    @media(max-width:1022px) {
        input {
            width: 100%;
            border: none;
        }

    }

</style>