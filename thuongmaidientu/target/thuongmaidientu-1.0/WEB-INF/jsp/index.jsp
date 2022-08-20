<%-- 
    Document   : index
    Created on : Jul 10, 2022, 1:27:12 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<div class="container">
    <ul class="nav nav-pills navTask">
        <%--    QUẢNG CÁO  --%>
        <div id="mySidenav" class="sidenav" style="background-image: linear-gradient(#7C0D0D, #DC0404);">
            <div class="dropdown">
                <button class="dropbtn"
                        [ngStyle]="{'color': 'white','font-style': 'bold', 'font-size': '20.01px', 'font-family':'sans-serif'}">
                    <img src="assets/icon-overview-white.png" style="padding-right:14px; ">Screening
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
                <a type="submit" class="btn btn-sm btn-secondary dropdown-toggle dropdown-toggle-split dropbtn-right-side"
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
        <ul class="pagination">
            <c:forEach begin="1" end="${Math.ceil(productCounter/8)}" var="i">
                <c:url value="/" var="c">
                    <c:param value="${i}" name="page"/>
                </c:url>
                <li class="page-item"><a class="page-link" href="${c}">${i}</a></li>
            </c:forEach>
        </ul>
        <%--    SAN PHAM    --%>
        <c:forEach items="${products}" var="p">
            <c:url value="/products/" var="cUrl">
                <c:param name="ID_Product" value="${p.idProduct}"/>
            </c:url>
            <div class="col-md-3 col-xs-12" style="padding: 5px;">
                <form action="${book_pro}">
                    <div class="card">
                        <img class="card-img-top" class="img-fluid"
                             src="https://res.cloudinary.com/dxxwcby8l/image/upload/v1647248722/r8sjly3st7estapvj19u.jpg"
                             alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title">${p.nameProduct}</h4>
                            <p class="card-text">
                                <fmt:formatNumber type="number" maxFractionDigits="3" value="${p.unitPrice}"/> VND
                            </p>
                            <a href="${cUrl}" class="btn btn-primary">Xem chi tiet</a>
                            <button name="idPro" value="${p.idProduct}" class="btn btn-primary"
                                    type="submit">Đặt Hàng
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </c:forEach>
    </div>
</div>
<%--<style>--%>
<%--    .row {--%>
<%--        padding-top: 10px;--%>
<%--    }--%>
<%--    .container {--%>
<%--        padding: 16px;--%>
<%--        margin-top: 30px;--%>
<%--        height: 1500px; /* Used in this example to enable scrolling */--%>
<%--    }--%>

<%--    &lt;%&ndash;  BOX  &ndash;%&gt;--%>
<%--    .speech-bubble {--%>
<%--        width: 150px;--%>
<%--        /*height: 80px;*/--%>
<%--        position: absolute;--%>
<%--        background: #2997e8;--%>
<%--        border-radius: 10px;--%>
<%--        text-align: center;--%>
<%--        color: white;--%>
<%--    }--%>

<%--    .speech-bubble::before {--%>
<%--        width: 0;--%>
<%--        height: 0;--%>
<%--        margin: 13px 0 0 -25px;--%>
<%--        position: absolute;--%>
<%--        content: "";--%>
<%--        border-top: 13px solid transparent;--%>
<%--        border-bottom: 13px solid transparent;--%>
<%--        border-right: 26px solid #2997e8;--%>
<%--    }--%>

<%--    .dropbtn-right-side {--%>
<%--        background-color: #04AA6D;--%>
<%--        color: white;--%>
<%--        padding: 10px;--%>
<%--        font-size: 16px;--%>
<%--        border: none;--%>
<%--        border-radius: 20px 20px;--%>
<%--    }--%>

<%--    /* The container <div> - needed to position the dropdown content */--%>
<%--    .dropdown-right {--%>
<%--        position: relative;--%>
<%--        display: flex;--%>
<%--    }--%>

<%--    /* Dropdown Content (Hidden by Default) */--%>
<%--    .dropdown-content-right {--%>
<%--        margin-left: 115%;--%>
<%--        display: none;--%>
<%--        position: absolute;--%>
<%--        background-color: #f1f1f1;--%>
<%--        min-width: 160px;--%>
<%--        box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);--%>
<%--        z-index: 1;--%>
<%--    }--%>

<%--    /* Links inside the dropdown */--%>
<%--    .dropdown-content-right a {--%>
<%--        color: black;--%>
<%--        padding: 12px 16px;--%>
<%--        text-decoration: none;--%>
<%--        display: block;--%>
<%--    }--%>

<%--    /* Change color of dropdown links on hover */--%>
<%--    .dropdown-content-right a:hover {--%>
<%--        background-color: #ddd;--%>
<%--    }--%>

<%--    /* Show the dropdown menu on hover */--%>
<%--    .dropdown-right:hover .dropdown-content-right {--%>
<%--        display: block;--%>
<%--    }--%>

<%--    /* Change the background color of the dropdown button when the dropdown content is shown */--%>
<%--    .dropdown-right:hover .dropbtn-right-side {--%>
<%--        background-color: #3e8e41;--%>
<%--    }--%>

<%--    /*  ------------------ĐỘNG NGANG------------------ */--%>
<%--    .sidenav {--%>
<%--        height: 70%;--%>
<%--        width: 10%;--%>
<%--        position: fixed;--%>
<%--        z-index: 0;--%>
<%--        top: 120px;--%>
<%--        left: 0px;--%>
<%--        right: 50px;--%>
<%--        background-color: #ff0000;--%>
<%--        overflow-x: hidden;--%>
<%--        padding-top: 0px;--%>
<%--        transition: 0.5s;--%>
<%--        margin-bottom: 20%;--%>
<%--    }--%>

<%--    /* ON HOVER */--%>
<%--    .sidenav:hover {--%>
<%--        width: 250px;--%>
<%--    }--%>

<%--    .sidenav normalb:hover {--%>
<%--        background-color: #4F0909;--%>
<%--    }--%>

<%--    .buttonGroup {--%>
<%--        align-content: baseline;--%>
<%--    }--%>

<%--    /* Darker background on mouse-over */--%>
<%--    .btn:hover {--%>
<%--        background-color: #4F0909;--%>
<%--    }--%>

<%--    .sidenav h1 {--%>
<%--        background-color: #850101; /* Blue background */--%>
<%--        border: thin; /* Remove borders */--%>
<%--        color: white; /* White text */--%>
<%--        font-size: 16px; /* Set a font size */--%>
<%--        cursor: pointer; /* Mouse pointer on hover */--%>
<%--        overflow: hidden;--%>
<%--    }--%>

<%--    .sidenav h1:hover {--%>
<%--        background-color: #4F0909;--%>
<%--    }--%>

<%--    /* The navigation menu links */--%>
<%--    .sidenav a {--%>
<%--        padding-left: 10px;--%>
<%--        text-decoration: none;--%>
<%--        font-size: 18px;--%>
<%--        color: #f1f1f1;--%>
<%--        display: block;--%>
<%--        transition: 0.3s--%>
<%--    }--%>

<%--    .sidenav a:hover, .offcanvas a:focus {--%>
<%--        color: #f1f1f1;--%>
<%--    }--%>
<%--</style>--%>