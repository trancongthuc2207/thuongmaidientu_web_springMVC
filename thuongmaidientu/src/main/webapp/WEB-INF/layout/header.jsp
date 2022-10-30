<%-- 
    Document   : header
    Created on : Jul 24, 2022, 1:10:04 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@page contentType="text/html" pageEncoding="UTF-8" %>

<%--<nav class="navbar navbar-expand-sm navbar-dark header bg-nav-header">--%>
<%--    <div class="container-fluid">--%>
<%--        <a class="navbar-brand" href="/thuongmaidientu">THƯƠNG MẠI ĐIỆN TỬ</a>--%>
<%--        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">--%>
<%--            <span class="navbar-toggler-icon"></span>--%>
<%--        </button>--%>
<%--        <div class="collapse navbar-collapse" id="mynavbar">--%>
<%--            &lt;%&ndash;            DANH MUC             &ndash;%&gt;--%>
<%--            <ul class="navbar-nav me-auto">--%>
<%--                <li class="nav-item li-type-product">--%>
<%--                    <a class="nav-link" href="/thuongmaidientu">&#9969; Trang Chủ</a>--%>
<%--                </li>--%>
<%--                <c:forEach items="${type_products}" var="c">--%>
<%--                    <c:url value="/" var="cUrl">--%>
<%--                        <c:param name="type_Id" value="${c.idTypeProduct}"/>--%>
<%--                    </c:url>--%>
<%--                    <li class="nav-item li-type-product">--%>
<%--                        <a class="nav-link" href="${cUrl}">${c.typeName}</a>--%>
<%--                    </li>--%>
<%--                </c:forEach>--%>
<%--            </ul>--%>

<%--            <ul class="nav nav-pills navTask">--%>
<%--                <sec:authorize access="!isAuthenticated()">--%>
<%--                    <c:url value="/login" var="log"/>--%>
<%--                    <li class="nav-item dropdown">--%>
<%--                        <div class="dropdown">--%>
<%--                            <a type="submit" class="dropbtn" href="${log}"> <span--%>
<%--                                    class="fas fa-user-circle"></span> Đăng Nhập</a>--%>
<%--                            <div class="dropdown-content">--%>
<%--                                <a href="#">Thông Tin Tài Khoản</a>--%>
<%--                                <a href="<c:url value="/logout"/>">Đăng Xuất</a>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                </sec:authorize>--%>
<%--                <sec:authorize access="isAuthenticated()">--%>
<%--                    <sec:authorize access="hasRole('ROLE_USER')">--%>
<%--                        <li class="nav-item dropdown">--%>
<%--                                <c:url value="/user/customer-orders" var="cus_bag"/>--%>
<%--                        <li class="nav-item dropdown">--%>
<%--                            <div class="dropdown">--%>
<%--                                <a type="submit" class="dropbtn" href="${cus_bag}"><i--%>
<%--                                        class="fas fa-shopping-cart"></i> My Bag--%>
<%--                                    <i class="badge badge-danger"></i>${amountPro}--%>
<%--                                    <i class="fa fa-caret-down"></i>--%>
<%--                                </a>--%>
<%--                                <c:url value="/user/cus-orders-manager" var="my_orders"/>--%>
<%--                                <div class="dropdown-content">--%>
<%--                                    <a href="${my_orders}">Đơn Hàng Của Tôi</a>--%>
<%--                                    <a href="#">Đơn Hàng Đang Giao</a>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                        <li class="nav-item">--%>
<%--                            <div class="dropdown">--%>
<%--                                <a class="fas fa-user-circle dropbtn"/>--%>
<%--                                    ${pageContext.session.getAttribute("currentUser").idAccount}--%>
<%--                                (<sec:authentication property="principal.username"/>)--%>
<%--                                </a>--%>
<%--                                <div class="dropdown-content">--%>
<%--                                    <c:url value="/user/infor-customer" var="in4"></c:url>--%>
<%--                                    <a href="${in4}">Thông Tin Tài Khoản</a>--%>
<%--                                    <a href="<c:url value="/logout"/>">Đăng Xuất</a>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                    </sec:authorize>--%>
<%--                    <sec:authorize access="hasRole('ROLE_SHOP')">--%>
<%--                        <li class="nav-item">--%>
<%--                            <div class="dropdown">--%>
<%--                                <a class="fas fa-user-circle dropbtn"/>--%>
<%--                                    ${pageContext.session.getAttribute("currentUser").idAccount} Shopper--%>
<%--                                (<sec:authentication property="principal.username"/>)--%>
<%--                                </a>--%>

<%--                                <div class="dropdown-content">--%>
<%--                                    <a href="#">Thông Tin Tài Khoản</a>--%>
<%--                                    <a href="<c:url value="/logout"/>">Đăng Xuất</a>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                    </sec:authorize>--%>
<%--                    <sec:authorize access="hasRole('ROLE_ADMIN')">--%>
<%--                        <li class="nav-item">--%>
<%--                            <div class="dropdown">--%>
<%--                                <a class="fas fa-user-circle dropbtn"/>--%>
<%--                                    ${pageContext.session.getAttribute("currentUser").idAccount} Administrator--%>
<%--                                (<sec:authentication property="principal.username"/>)--%>
<%--                                </a>--%>
<%--                                <div class="dropdown-content">--%>
<%--                                    <a href="#">Thông Tin Tài Khoản</a>--%>
<%--                                    <a href="<c:url value="/logout"/>">Đăng Xuất</a>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                    </sec:authorize>--%>
<%--                    <sec:authorize access="hasRole('ROLE_EMPLOYEE')">--%>
<%--                        <li class="nav-item">--%>
<%--                            <div class="dropdown">--%>
<%--                                <a class="fas fa-user-circle dropbtn"/>--%>
<%--                                    ${pageContext.session.getAttribute("currentUser").idAccount} EMPLOYEE--%>
<%--                                (<sec:authentication property="principal.username"/>)--%>
<%--                                </a>--%>
<%--                                <c:url value="/employee" var="emp"></c:url>--%>
<%--                                <div class="dropdown-content">--%>
<%--                                    <c:url value="/user/infor-customer" var="in4"></c:url>--%>
<%--                                    <a href="${in4}">Thông Tin Tài Khoản</a>--%>
<%--                                    <a href="${emp}">Trang quản trị chính</a>--%>
<%--                                    <a href="<c:url value="/logout"/>">Đăng Xuất</a>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                    </sec:authorize>--%>
<%--                </sec:authorize>--%>
<%--            </ul>--%>

<%--            &lt;%&ndash;            TIM KIEM             &ndash;%&gt;--%>
<%--            <c:url value="/" var="action"/>--%>
<%--            <form class="d-flex">--%>
<%--                <input class="form-control me-2" type="text" name="kw" placeholder="Nhap tu khoa...">--%>
<%--                <button type="submit" class="btn btn-primary" type="button">Tim</button>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</nav>--%>

<header>
    <div class="mobile-fix-option"></div>
    <div class="top-header">
        <div class="" style="margin: 0px;padding: 0px 40px">
            <div class="row">
                <div class="col-lg-6">
                    <div class="header-contact">
                        <ul>
                            <li><i class="fa fa-phone" aria-hidden="true"></i>Call Us: 123 - 456 - 7890</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6 text-end">
                    <ul class="header-dropdown">
                        <sec:authorize access="isAuthenticated()">
                            <sec:authorize access="hasRole('ROLE_USER')">
                                <%--               ORDERS                 --%>
                                <li class="onhover-dropdown mobile-account">
                                    <c:url value="/user/cus-orders-manager" var="my_orders"/>
                                    <ul class="onhover-show-div">
                                        <li><a href="#">Đơn hàng đang giao</a></li>
                                    </ul>
                                    <a href="${my_orders}"><i class="fa fa-user" aria-hidden="true"></i>Quản lý đơn hàng</a>
                                </li>
                                <%--               ACCOUNT                 --%>
                                <li class="onhover-dropdown mobile-account">
                                    <ul class="onhover-show-div">
                                        <c:url value="/user/infor-customer" var="in4"></c:url>
                                        <li><a href="${in4}">Thông tin tài khoản</a></li>
                                        <li><a href="<c:url value="/logout"/>">Đăng xuất</a></li>
                                    </ul>
                                    <c:url value="/user/cus-orders-manager" var="my_orders"/>
                                    <a href="#"><i class="fa fa-user" aria-hidden="true"></i><c:out value="${sessionScope.nameCus}"/> (<sec:authentication
                                            property="principal.username"/>)</a>
                                </li>
                            </sec:authorize>
                            <sec:authorize access="hasRole('ROLE_SHOP')">
                                <li class="onhover-dropdown mobile-account">
                                    <c:url value="/shop-manager" var="urlShop"></c:url>
                                    <ul class="onhover-show-div">
                                        <li><a href="<c:url value="/logout"/>">Đăng xuất</a></li>
                                    </ul>
                                    <a href="${urlShop}"><i class="fa fa-user" aria-hidden="true"></i>Quản trị shop</a>
                                </li>
                            </sec:authorize>
                            <sec:authorize access="hasRole('ROLE_ADMIN')">
                                <li class="nav-item">
                                    <div class="dropdown">
                                        <a class="fas fa-user-circle dropbtn"/>
                                            ${pageContext.session.getAttribute("currentUser").idAccount} Administrator
                                        (<sec:authentication property="principal.username"/>)
                                        </a>
                                        <div class="dropdown-content">
                                            <a href="#">Thông Tin Tài Khoản</a>
                                            <a href="<c:url value="/logout"/>">Đăng Xuất</a>
                                        </div>
                                    </div>
                                </li>
                            </sec:authorize>
                            <sec:authorize access="hasRole('ROLE_EMPLOYEE')">
                                <li class="onhover-dropdown mobile-account">
                                    <ul class="onhover-show-div">
                                        <c:url value="/user/infor-customer" var="in4"></c:url>
                                        <c:url value="/employee" var="emp"></c:url>
                                        <li><a href="${in4}">Thông tin tài khoản</a></li>
                                        <li><a href="<c:url value="/logout"/>">Đăng xuất</a></li>
                                    </ul>
                                    <a href="${emp}"><i class="fa fa-user" aria-hidden="true"></i>Quản trị chinh</a>
                                </li>
                            </sec:authorize>
                        </sec:authorize>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="" style="background-color: orange; margin: 0px;padding: 0px 40px">
        <div class="row">
            <div class="col-sm-12">
                <div class="main-menu">
                    <div class="menu-left">
                        <div class="navbar">
                            <a href="javascript:void(0)" onclick="openNav()">
                                <div class="bar-style"><i class="fa fa-bars sidebar-bar" aria-hidden="true"><span
                                        style="font-weight: bold;font-size: 1.5rem;margin-left: 10px;font-family: 'Segoe UI'">DANH MỤC</span></i>
                                </div>
                            </a>
                            <div id="mySidenav" class="sidenav">
                                <a href="javascript:void(0)" class="sidebar-overlay" onclick="closeNav()"></a>
                                <nav>
                                    <div onclick="closeNav()">
                                        <div class="sidebar-back text-start"><i class="fa fa-angle-left pe-2"
                                                                                aria-hidden="true"></i> Back
                                        </div>
                                    </div>
                                    <ul id="sub-menu" class="sm pixelstrap sm-vertical">
                                        <c:forEach items="${type_products}" var="c">
                                            <c:url value="/" var="cUrl">
                                                <c:param name="type_Id" value="${c.idTypeProduct}"/>
                                            </c:url>
                                            <li>
                                                <a class="nav-link" href="${cUrl}">${c.typeName}</a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                        <div class="brand-logo">
                            <c:url value="/" var="index"></c:url>
                            <a href="${index}"><img width="60px" src="https://www.oucommunity.dev/assets/lib/loader-page/ou-logo-scroll.svg"
                                                      class="img-fluid blur-up lazyload" alt=""></a>
                        </div>
                    </div>
                    <div class="menu-right pull-right">
<%--                        <div>--%>
<%--                            <nav id="main-nav">--%>
<%--                                <div class="toggle-nav"><i class="fa fa-bars sidebar-bar"></i></div>--%>
<%--                                <ul id="main-menu" class="sm pixelstrap sm-horizontal">--%>
<%--                                    <li>--%>
<%--                                        <div class="mobile-back text-end">Back<i class="fa fa-angle-right ps-2"--%>
<%--                                                                                 aria-hidden="true"></i></div>--%>
<%--                                    </li>--%>
<%--                                    <li><a href="#">Home</a></li>--%>
<%--                                    <li><a href="#">Home</a></li>--%>
<%--                                    <li><a href="#">Home</a></li>--%>
<%--                                    <li><a href="#">Home</a></li>--%>
<%--                                    <li><a href="#">Home</a></li>--%>
<%--                                </ul>--%>
<%--                            </nav>--%>
<%--                        </div>--%>
                        <div>
                            <div class="icon-nav">
                                <ul>
                                    <li class="onhover-div mobile-search">
                                        <c:url value="/resources/assets/" var="ass"></c:url>
                                        <div><img src="${ass}images/icon/search.png" onclick="openSearch()"
                                                  class="img-fluid blur-up lazyload" alt=""> <i class="ti-search"
                                                                                                onclick="openSearch()"></i>
                                        </div>
                                        <div id="search-overlay" class="search-overlay">
                                            <div> <span class="closebtn" onclick="closeSearch()"
                                                        title="Close Overlay">×</span>
                                                <div class="overlay-content">
                                                    <div class="container">
                                                        <div class="row">
                                                            <div class="col-xl-12">
                                                                <form>
                                                                    <div class="form-group">
                                                                        <input name="kwAll" type="text"
                                                                               class="form-control"
                                                                               id="exampleInputPassword1"
                                                                               placeholder="Search a Product">
                                                                        <select name="isDiscount">
                                                                            <option value="" selected>Tất cả</option>
                                                                            <option value="DISCOUNT">Có mã giảm giá</option>
                                                                        </select>
                                                                        <select name="incre_des">
                                                                            <option value="" selected>Tất cả</option>
                                                                            <option value="INCRE">Giá từ thấp đến cao</option>
                                                                            <option value="DES">Giá từ cao đến thấp</option>
                                                                        </select>
                                                                    </div>
                                                                    <button type="submit" class="btn btn-primary"><i
                                                                            class="fa fa-search"></i></button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="onhover-div mobile-setting">
                                        <div><img src="${ass}images/icon/setting.png"
                                                  class="img-fluid blur-up lazyload" alt=""> <i
                                                class="ti-settings"></i></div>
                                        <div class="show-div setting">
                                            <h6>language</h6>
                                            <ul>
                                                <li><a href="#">english</a></li>
                                                <li><a href="#">french</a></li>
                                            </ul>
                                            <h6>currency</h6>
                                            <ul class="list-inline">
                                                <li><a href="#">euro</a></li>
                                                <li><a href="#">rupees</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="onhover-div mobile-cart">
                                        <div>
                                            <sec:authorize access="hasRole('ROLE_USER')">
                                                <c:url value="/user/customer-orders" var="cus_bag"/>
                                                <a href="${cus_bag}"><img src="${ass}images/icon/cart.png"
                                                                          class="img-fluid blur-up lazyload" alt=""> <i
                                                        class="ti-shopping-cart"></i></a>
                                                <p id="cart_amount_cus" class="cart_qty_cls">${amountPro}</p>
                                            </sec:authorize>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
