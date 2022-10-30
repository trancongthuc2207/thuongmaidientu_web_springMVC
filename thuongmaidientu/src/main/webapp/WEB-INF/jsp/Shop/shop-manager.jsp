<%--
    Document   : index
    Created on : Jul 10, 2022, 1:27:12 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>


<c:url value="/shop-manager/amount/" var="updateAm"/>
<c:url value="/shop-manager/add-product" var="addProduct"/>
<c:url value="/shop-manager/turnover-shop" var="turnover"/>
<c:url value="/shop-manager/reports" var="reports"/>
<c:url value="/resources/assets/" var="ass"></c:url>

<sec:authorize access="hasRole('ROLE_EMPLOYEE')">
    <div style="padding: 50px">
       <button onclick="clickBanAccount()" class="btn btn-primary">Cấm</button>
        <button onclick="clickOpenAccount()" class="btn btn-primary">Mở khoá</button>
    </div>
</sec:authorize>
<!-- dashboard section start -->
<section class="dashboard-section section-b-space">
    <div class="" style="padding: 0px 50px">
        <div class="row">
            <div class="col-lg-3">
                <div class="dashboard-sidebar">
                    <div class="profile-top">
                        <c:forEach items="${shopAcc}" var="shop">
                            <div class="profile-image">
                                <c:if test="${shop.imageS.startsWith('https') == false}">
                                    <img
                                            class="img-fluid"
                                            src="https://res.cloudinary.com/dxxwcby8l/image/upload/v1647248722/r8sjly3st7estapvj19u.jpg"
                                            alt="Card image">
                                </c:if>
                                <c:if test="${shop.imageS.startsWith('https') == true}">
                                    <img
                                            class="img-fluid"
                                            src="${shop.imageS}"
                                            alt="Card image">
                                </c:if></a>
                            </div>

                            <div class="profile-detail">
                                <h5>${shop.nameStore}</h5>
                                <h6>750 followers | 10 review</h6>
                                <h6>----@mail.com</h6>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="faq-tab">
                        <ul class="nav nav-tabs" id="top-tab" role="tablist">
                            <li class="nav-item"><a data-bs-toggle="tab" class="nav-link active"
                                                    href="#dashboard">dashboard</a></li>
                            <%--#dashboard--%>
                            <li class="nav-item"><a data-bs-toggle="tab" class="nav-link"
                                                    href="#products">products</a>
                            </li>
                            <li class="nav-item"><a data-bs-toggle="tab" class="nav-link" href="#orders">orders</a>
                            </li>
                            <li class="nav-item"><a data-bs-toggle="tab" class="nav-link"
                                                    href="#profile">profile</a>
                            </li>

                            <sec:authorize access="hasRole('ROLE_SHOP')">
                                <li class="nav-item"><a class="nav-link"
                                                        href="${reports}">report</a>
                                </li>
                            </sec:authorize>
                            <sec:authorize access="hasRole('ROLE_EMPLOYEE')">
                                <c:url value="/shop-manager/reports" var="reportsFromEmpl">
                                    <c:param name="idShop_FrEpl" value="${shopID}"></c:param>
                                </c:url>
                                <li class="nav-item"><a class="nav-link"
                                                        href="${reportsFromEmpl}">report</a>
                                </li>
                            </sec:authorize>

                            <li class="nav-item"><a class="nav-link" data-toggle="modal" data-bs-target="#logout"
                                                    href="">logout</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="faq-content tab-content" id="top-tabContent">
                    <div class="tab-pane fade show active" id="dashboard">
                        <div class="counter-section">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="counter-box">
                                        <img src="${ass}images/icon/dashboard/order.png" class="img-fluid">
                                        <div>
                                            <h3>${countPro}</h3>
                                            <h5>total products</h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="counter-box">
                                        <img src="${ass}images/icon/dashboard/sale.png" class="img-fluid">
                                        <div>
                                            <h3>${sizeOrdWaiting}</h3>
                                            <h5>total wait order</h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="counter-box">
                                        <img src="${ass}images/icon/dashboard/homework.png" class="img-fluid">
                                        <div>
                                            <h3>${sizeOrdAccept}</h3>
                                            <h5>order pending</h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <sec:authorize access="hasRole('ROLE_EMPLOYEE')">
                                    <a href="${turnover}?idS=${idS_FrEmpl}" class="btn btn-primary">Đi đến trang doanh
                                        thu</a>
                                </sec:authorize>
                                <sec:authorize access="hasRole('ROLE_SHOP')">
                                    <a href="${turnover}" class="btn btn-primary">Đi đến trang doanh thu</a>
                                </sec:authorize>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card dashboard-table">
                                    <div class="card-body">
                                        <h3>trending products</h3>
                                        <form>
                                            <label for="ip_hotPro">Xem theo tháng</label>
                                            <input id="ip_hotPro" name="monthSelect_Hot" type="month">
                                            <button type="submit" class="btn btn-primary"><i
                                                    class="fa fa-search"></i></button>
                                        </form>
                                        <table class="table mb-0">
                                            <thead>
                                            <tr>
                                                <th scope="col">image</th>
                                                <th scope="col">product name</th>
                                                <th scope="col">price</th>
                                                <th scope="col">sales</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${lstProHotSale}" var="hotPro">
                                                <tr>
                                                    <th scope="row">
                                                        <c:if test="${hotPro[3].startsWith('https') == false}">
                                                            <img
                                                                    class="blur-up lazyloaded"
                                                                    src="https://res.cloudinary.com/dxxwcby8l/image/upload/v1647248722/r8sjly3st7estapvj19u.jpg"
                                                                    alt="Card image">
                                                        </c:if>
                                                        <c:if test="${hotPro[3].startsWith('https') == true}">
                                                            <img
                                                                    class="blur-up lazyloaded"
                                                                    src="${hotPro[3]}"
                                                                    alt="Card image">
                                                        </c:if>
                                                    <td>${hotPro[1]}</td>
                                                    <td><fmt:formatNumber
                                                            type="number"
                                                            maxFractionDigits="3"
                                                            value="${hotPro[2]}"/></td>
                                                    <td>${hotPro[4]}</td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="card dashboard-table">
                                    <div class="card-body">
                                        <h3>recent orders</h3>
                                        <table class="table mb-0">
                                            <thead>
                                            <tr>
                                                <th scope="col">order id</th>
                                                <th scope="col">time</th>
                                                <th scope="col">status</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${lstOrdAction}" var="lstOrdAction">
                                                <c:url value="/order-details" var="detailsAction">
                                                    <c:param name="idOderFromShop"
                                                             value="${lstOrdAction[0]}"></c:param>
                                                    <c:param name="idShop" value="${shopID}"></c:param>
                                                </c:url>
                                                <tr>
                                                    <th scope="row">
                                                        <a href="${detailsAction}">#${lstOrdAction[0]}
                                                        </a>
                                                    </th>
                                                    <td>${lstOrdAction[1]}</td>
                                                    <td>
                                                        <c:if test="${lstOrdAction[2] == '1'}">
                                                            <span
                                                                    class="badge rounded-pill bg-danger-10 text-danger custom-badge">waitting</span>
                                                        </c:if>
                                                        <c:if test="${lstOrdAction[2] == '2'}">
                                                            <span
                                                                    class="badge rounded-pill bg-success-10 text-success custom-badge">accept</span>
                                                        </c:if>
                                                        <c:if test="${lstOrdAction[2] == 'CANCLE'}">
                                                            <span
                                                                    class="badge rounded-pill bg-secondary-10 text-secondary custom-badge">cancle</span>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="tab-pane fade " id="products">
                        <div class="row">
                            <div class="col-12">
                                <div class="card dashboard-table mt-0">
                                    <div class="card-body">
                                        <div class="top-sec">
                                            <h3>all products</h3>
                                            <a href="${addProduct}" class="btn btn-sm btn-solid">+ add new</a>
                                        </div>
                                        <div class="table-responsive-md">
                                            <table class="table mb-0 product-table">
                                                <thead>
                                                <tr>
                                                    <th scope="col">image</th>
                                                    <th scope="col">id</th>
                                                    <th scope="col">product name</th>
                                                    <th scope="col">category</th>
                                                    <th scope="col">amount</th>
                                                    <th scope="col">price</th>
                                                    <th scope="col">discount</th>
                                                    <th scope="col">real price</th>
                                                    <th scope="col">edit/delete</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${listProduct}" var="p">
                                                    <sec:authorize access="hasRole('ROLE_SHOP')">
                                                        <c:url value="/shop-manager/edit/" var="cUrl">
                                                            <c:param name="ID_Product"
                                                                     value="${p.shopProductsPK.idProduct}"/>
                                                        </c:url>
                                                    </sec:authorize>
                                                    <sec:authorize access="hasRole('ROLE_EMPLOYEE')">
                                                        <c:url value="/shop-manager/edit/" var="cUrl">
                                                            <c:param name="ID_Product"
                                                                     value="${p.shopProductsPK.idProduct}"/>
                                                            <c:param name="idShop_FrEpl" value="${shopID}"></c:param>
                                                        </c:url>
                                                    </sec:authorize>

                                                    <tr <c:if
                                                            test="${p.amount <= 1}"> style="background-color: lightgrey"</c:if>>
                                                        <th scope="row">
                                                            <c:if test="${p.product.image.startsWith('https') == false}">
                                                                <img class="blur-up lazyloaded"
                                                                     src="https://res.cloudinary.com/dxxwcby8l/image/upload/v1647248722/r8sjly3st7estapvj19u.jpg"
                                                                     alt="Card image">
                                                            </c:if>
                                                            <c:if test="${p.product.image.startsWith('https') == true}">
                                                                <img class="blur-up lazyloaded"
                                                                     src="${p.product.image}"
                                                                     alt="Card image">
                                                            </c:if></th>
                                                        <td class="id_pro">${p.product.idProduct}</td>
                                                        <td>${p.product.nameProduct}</td>
                                                        <td>${p.product.typeOfProduct.typeName}</td>
                                                        <td>
                                                            <input onchange="clickSave()" min="1"
                                                                   style="width: 50%" type="number"
                                                                   class="card-text amount"
                                                                   value="${p.amount}">
                                                            <a type="button"
                                                               class="btn btn-primary btn-save-amount">Lưu</a>
                                                        </td>
                                                        <td><fmt:formatNumber
                                                                type="number"
                                                                maxFractionDigits="3"
                                                                value="${p.product.unitPrice}"/></td>
                                                        <td>
                                                            <select onchange="saveDiscount(${p.product.idProduct})"
                                                                    style="width: 50%"
                                                                    class="form-select-discount">
                                                                <option value="1">Không</option>
                                                                <c:forEach items="${lst_discount}"
                                                                           var="dis">
                                                                    <option value="'${dis.idDiscount}'"
                                                                            <c:if test="${p.idDiscount.idDiscount == dis.idDiscount}">selected</c:if>>${dis.nameDiscount}</option>
                                                                </c:forEach>
                                                            </select>
                                                            <a type="button"
                                                               class="btn btn-primary save-discount">Lưu</a>
                                                        </td>
                                                        <td>
                                                            <c:forEach items="${lst_discount}" var="discount">
                                                                <c:if test="${p.idDiscount.idDiscount != '1' and p.idDiscount.idDiscount == discount.idDiscount}">
                                                                    <c:if test="${p.idDiscount.percentDiscount != null}">
                                                                        <fmt:formatNumber
                                                                                type="number"
                                                                                maxFractionDigits="3"
                                                                                value="${p.product.unitPrice - p.product.unitPrice * p.idDiscount.percentDiscount/100}"/>
                                                                    </c:if>
                                                                    <c:if test="${p.idDiscount.valueDiscount != null}">
                                                                        <fmt:formatNumber
                                                                                type="number"
                                                                                maxFractionDigits="3"
                                                                                value="${p.product.unitPrice - p.idDiscount.valueDiscount}"/>
                                                                    </c:if>
                                                                </c:if>
                                                            </c:forEach>
                                                        </td>
                                                        <td><a href="${cUrl}"><i class="fa fa-pencil-square-o me-1"
                                                                                 aria-hidden="true"></i>
                                                            <a href="#"></a><i
                                                                    class="fa fa-trash-o ms-1 text-theme"
                                                                    aria-hidden="true"></i></a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="product-pagination">
                                            <div class="theme-paggination-block">
                                                <div class="row">
                                                    <div class="col-xl-6 col-md-6 col-sm-12">
                                                        <nav aria-label="Page navigation">
                                                            <ul class="pagination">
                                                                <c:forEach begin="1" end="${Math.ceil(countPro/8)}"
                                                                           var="i">
                                                                    <c:url value="/shop-manager/" var="c">
                                                                        <c:param value="${i}" name="page"/>
                                                                        <sec:authorize
                                                                                access="hasRole('ROLE_EMPLOYEE')">
                                                                            <c:param value="${shopID}"
                                                                                     name="idShop_FrEpl"/>
                                                                        </sec:authorize>
                                                                    </c:url>
                                                                    <li class="page-item"><a class="page-link"
                                                                                             href="${c}">${i}</a></li>
                                                                </c:forEach>
                                                            </ul>
                                                        </nav>
                                                    </div>
                                                    <div class="col-xl-6 col-md-6 col-sm-12">
                                                        <div class="product-search-count-bottom">
                                                            <h5>Showing Products 1-8 Result</h5>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="orders">
                        <div class="row">
                            <div class="col-12">
                                <div class="card dashboard-table mt-0">
                                    <div class="card-body table-responsive-sm">
                                        <div class="top-sec">
                                            <h3>My Orders</h3>
                                        </div>
                                        <div class="table-responsive-xl">
                                            <table class="table cart-table order-table">
                                                <thead>
                                                <tr class="table-head">
                                                    <th colspan="4">
                                                        <input id="searchWait" type="text" placeholder="Tìm kiếm...">
                                                        <a id="searchOrd-waitting" onclick="api_searchOrd()"
                                                           class="btn btn-primary">Tìm
                                                        </a>
                                                        <select id="slt_order_waitting">
                                                            <option value="des" selected>Ngày gần đây</option>
                                                            <option value="incre">Ngày xa nhất</option>
                                                        </select>
                                                    </th>
                                                </tr>
                                                <tr class="table-head">
                                                    <th scope="col">Order Id</th>
                                                    <th scope="col">Status</th>
                                                    <th scope="col">Price</th>
                                                    <th scope="col">Time Booked</th>
                                                    <th scope="col">View</th>
                                                </tr>
                                                </thead>
                                                <tbody id="bd_waitting">
                                                <c:forEach items="${list_OrderWaitting}" var="o">
                                                    <tr>
                                                        <td>
                                                            <span class="mt-0">${o.idOrders}</span>
                                                        </td>
                                                        <td>
                                                                <span
                                                                        class="badge rounded-pill bg-danger-10 text-danger custom-badge">Waitting</span>
                                                        </td>
                                                        <td>
                                                            <span class="theme-color fs-6">
                                                            <fmt:formatNumber
                                                                    type="number"
                                                                    maxFractionDigits="3"
                                                                    value="${o.totalMoney}"/>
                                                            </span>
                                                        </td>
                                                        <td>${o.timeBooked}</td>
                                                        <td>
                                                            <c:url value="/order-details" var="detailsW">
                                                                <c:param name="idOderFromShop"
                                                                         value="${o.idOrders}"></c:param>
                                                                <c:param name="idShop" value="${shopID}"></c:param>
                                                            </c:url>
                                                            <a href="${detailsW}">
                                                                <i class="fa fa-eye text-theme"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                            <div class="product-pagination">
                                                <div class="theme-paggination-block">
                                                    <div class="container-fluid p-0">
                                                        <div class="row">
                                                            <div class="col-xl-6 col-md-6 col-sm-12">
                                                                <nav aria-label="Page navigation">
                                                                    <ul class="pagination">
                                                                        <c:forEach begin="1"
                                                                                   end="${Math.ceil(sizeOrdWaiting/20)}"
                                                                                   var="i">
                                                                            <c:url value="/shop-manager" var="c">
                                                                                <c:param value="${i}" name="pageOr_W"/>

                                                                                <c:param value="${kwOr_w}"
                                                                                         name="kwOrd_kw"/>

                                                                                <c:param value="${inc_desW}"
                                                                                         name="filDate"/>
                                                                                <sec:authorize
                                                                                        access="hasRole('ROLE_EMPLOYEE')">
                                                                                    <c:param value="${shopID}"
                                                                                             name="idShop_FrEpl"/>
                                                                                </sec:authorize>

                                                                            </c:url>
                                                                            <li class="page-item"><a class="page-link"
                                                                                                     href="${c}">${i}</a>
                                                                            </li>
                                                                        </c:forEach>
                                                                    </ul>
                                                                </nav>
                                                            </div>
                                                            <div class="col-xl-6 col-md-6 col-sm-12">
                                                                <div class="product-search-count-bottom">
                                                                    <h5>Showing Products 1-24 of 10 Result</h5>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="table-responsive-xl">
                                            <table class="table cart-table order-table">
                                                <thead>
                                                <tr class="table-head">
                                                    <th colspan="4">
                                                        <input id="searchAccept" type="text" placeholder="Tìm kiếm...">
                                                        <a id="searchOrd-accept" onclick="api_searchOrd_accept()"
                                                           class="btn btn-primary">Tìm
                                                        </a>
                                                        <select id="slt_order_accept">
                                                            <option value="des" selected>Ngày gần đây</option>
                                                            <option value="incre">Ngày xa nhất</option>
                                                        </select>
                                                    </th>
                                                </tr>
                                                <tr class="table-head">
                                                    <th scope="col">Order Id</th>
                                                    <th scope="col">Status</th>
                                                    <th scope="col">Price</th>
                                                    <th scope="col">Time Booked</th>
                                                    <th scope="col">View</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${list_OrderAccept}" var="o">
                                                    <tr>
                                                        <td>
                                                            <span class="mt-0">${o.idOrders}</span>
                                                        </td>
                                                        <td>
                                                                <span
                                                                        class="badge rounded-pill bg-success-10 text-success custom-badge">Accept</span>
                                                        </td>
                                                        <td>
                                                            <span class="theme-color fs-6">
                                                            <fmt:formatNumber
                                                                    type="number"
                                                                    maxFractionDigits="3"
                                                                    value="${o.totalMoney}"/>
                                                            </span>
                                                        </td>
                                                        <td>${o.timeBooked}</td>
                                                        <td>
                                                            <c:url value="/order-details" var="detailsAc">
                                                                <c:param name="idOderFromShop"
                                                                         value="${o.idOrders}"></c:param>
                                                                <c:param name="idShop" value="${shopID}"></c:param>
                                                            </c:url>
                                                            <a href="${detailsAc}">
                                                                <i class="fa fa-eye text-theme"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                            <div class="product-pagination">
                                                <div class="theme-paggination-block">
                                                    <div class="container-fluid p-0">
                                                        <div class="row">
                                                            <div class="col-xl-6 col-md-6 col-sm-12">
                                                                <nav aria-label="Page navigation">
                                                                    <ul class="pagination">
                                                                        <c:forEach begin="1"
                                                                                   end="${Math.ceil(sizeOrdAccept/20)}"
                                                                                   var="i">
                                                                            <c:url value="/shop-manager" var="c">
                                                                                <c:param value="${i}"
                                                                                         name="pageOrAc_W"/>

                                                                                <c:param value="${kwOrdAc_kw}"
                                                                                         name="kwOrdAc_kw"/>

                                                                                <c:param value="${inc_desAc}"
                                                                                         name="filDateAc"/>
                                                                                <sec:authorize
                                                                                        access="hasRole('ROLE_EMPLOYEE')">
                                                                                    <c:param value="${shopID}"
                                                                                             name="idShop_FrEpl"/>
                                                                                </sec:authorize>

                                                                            </c:url>
                                                                            <li class="page-item"><a class="page-link"
                                                                                                     href="${c}">${i}</a>
                                                                            </li>
                                                                        </c:forEach>
                                                                    </ul>
                                                                </nav>
                                                            </div>
                                                            <div class="col-xl-6 col-md-6 col-sm-12">
                                                                <div class="product-search-count-bottom">
                                                                    <h5>Showing Products 1-24 of 10 Result</h5>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="table-responsive-xl">
                                            <table class="table cart-table order-table">
                                                <thead>
                                                <tr class="table-head">
                                                    <th colspan="4">
                                                        <input id="searchCancle" type="text" placeholder="Tìm kiếm...">
                                                        <a id="searchOrd-cancle" onclick="api_searchOrd_cancle()"
                                                           class="btn btn-primary">Tìm
                                                        </a>
                                                        <select id="slt_order_cancle">
                                                            <option value="des" selected>Ngày gần đây</option>
                                                            <option value="incre">Ngày xa nhất</option>
                                                        </select>
                                                    </th>
                                                </tr>
                                                <tr class="table-head">
                                                    <th scope="col">Order Id</th>
                                                    <th scope="col">Status</th>
                                                    <th scope="col">Price</th>
                                                    <th scope="col">Time Booked</th>
                                                    <th scope="col">Reason</th>
                                                    <th scope="col">View</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${list_OrderCancle}" var="o">
                                                    <tr>
                                                        <td>
                                                            <span class="mt-0">${o.idOrders}</span>
                                                        </td>
                                                        <td>
                                                                <span
                                                                        class="badge rounded-pill bg-secondary-10 text-secondary custom-badge">Canclled</span>
                                                        </td>
                                                        <td>
                                                            <span class="theme-color fs-6">
                                                            <fmt:formatNumber
                                                                    type="number"
                                                                    maxFractionDigits="3"
                                                                    value="${o.totalMoney}"/>
                                                            </span>
                                                        </td>
                                                        <td>${o.timeBooked}</td>
                                                        <td>${o.reasonCancle}</td>
                                                        <td>
                                                            <c:url value="/order-details" var="detailsCa">
                                                                <c:param name="idOderFromShop"
                                                                         value="${o.idOrders}"></c:param>
                                                                <c:param name="idShop" value="${shopID}"></c:param>
                                                            </c:url>
                                                            <a href="${detailsCa}">
                                                                <i class="fa fa-eye text-theme"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                            <div class="product-pagination">
                                                <div class="theme-paggination-block">
                                                    <div class="container-fluid p-0">
                                                        <div class="row">
                                                            <div class="col-xl-6 col-md-6 col-sm-12">
                                                                <nav aria-label="Page navigation">
                                                                    <ul class="pagination">
                                                                        <c:forEach begin="1"
                                                                                   end="${Math.ceil(sizeOrdCancle/20)}"
                                                                                   var="i">
                                                                            <c:url value="/shop-manager" var="c">
                                                                                <c:param value="${i}"
                                                                                         name="pageOrCa_W"/>

                                                                                <c:param value="${kwOrdCa_kw}"
                                                                                         name="kwOrdCa_kw"/>

                                                                                <c:param value="${inc_desCa}"
                                                                                         name="filDateCa"/>
                                                                                <sec:authorize
                                                                                        access="hasRole('ROLE_EMPLOYEE')">
                                                                                    <c:param value="${shopID}"
                                                                                             name="idShop_FrEpl"/>
                                                                                </sec:authorize>
                                                                            </c:url>
                                                                            <li class="page-item"><a class="page-link"
                                                                                                     href="${c}">${i}</a>
                                                                            </li>
                                                                        </c:forEach>
                                                                    </ul>
                                                                </nav>
                                                            </div>
                                                            <div class="col-xl-6 col-md-6 col-sm-12">
                                                                <div class="product-search-count-bottom">
                                                                    <h5>Showing Products 1-24 of 10 Result</h5>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="profile">
                        <div class="row">
                            <div class="col-12">
                                <div class="card mt-0">
                                    <div class="card-body">
                                        <div class="dashboard-box">
                                            <div class="dashboard-title top-sec">
                                                <h4>profile</h4>
                                                <a href="#" class="btn btn-sm btn-solid">+ add new</a>
                                            </div>
                                            <c:forEach items="${shopAcc}" var="shop">
                                                <c:if test="${msgEr != null}">
                                                    <div class="danger"
                                                         style="color: #DC0404;background-color: lightslategray">
                                                        <p style="font-size: 30px;text-align: center">${msgEr}</p>
                                                    </div>
                                                </c:if>
                                                <%------------------  HEADER CONTENT  ----------------------%>
                                                <div class="col-md-3 col-xs-12" style="padding: 5px;width: 100%">
                                                    <div style="display: inline-flex">
                                                        <c:url value="/shop-manager/update-shopstore" var="action"/>
                                                        <form:form action="${action}" method="POST"
                                                                   modelAttribute="shopstore"
                                                                   enctype="multipart/form-data"
                                                                   style="display: flex" class="was-validated">
                                                            <div style="display: inline-flex;width: 450px;height: 400px"
                                                                 class="card">
                                                                <c:if test="${shop.imageS.startsWith('https') == false}">
                                                                    <img class="card-img-top" class="img-fluid"
                                                                         src="https://res.cloudinary.com/dxxwcby8l/image/upload/v1647248722/r8sjly3st7estapvj19u.jpg"
                                                                         alt="Card image">
                                                                </c:if>
                                                                <c:if test="${shop.imageS.startsWith('https') == true}">
                                                                    <img class="card-img-top" class="img-fluid"
                                                                         src="${shop.imageS}"
                                                                         alt="Card image">
                                                                </c:if>
                                                                <div class="form-group edit image"
                                                                     style="align-items: center; display: inline-flex; width: 100%; display: none">
                                                                    <form:input id="file" path="file" type="file"
                                                                                cssClass="form-control"
                                                                                required="required"/>
                                                                </div>
                                                            </div>
                                                            <div class="form-group"
                                                                 style="margin-left: 30px; width: 600px">
                                                                    <%--        TIEU DE                --%>
                                                                <h1 class="card-title">Mã shop: ${shop.idShopStore}</h1>
                                                                <form:input path="idShopStore"
                                                                            class="form-group card-text editS"
                                                                            cssStyle="font-size: 30px;border-color: transparent;display: none"
                                                                            value="${shop.idShopStore}"/>
                                                                    <%--  EDIT BUTTON  --%>
                                                                <i onclick="editClick()"
                                                                   style="float: right;margin-left: 30px;font-size: 20px"
                                                                   class="btn fa-solid fa-pen-to-square"></i>
                                                                    <%--  /EDIT BUTTON  --%>
                                                                <div style="display: flex;font-size: 18px">
                                                                    <h5 class="card-text">Tên shop:&ensp;&ensp;</h5>
                                                                    <form:input path="nameStore"
                                                                                class="form-group card-text editS"
                                                                                style="font-size: 30px;border-color: transparent"
                                                                                value="${shop.nameStore}"/>
                                                                </div>
                                                                <div class="form-group card-text"
                                                                     style="display: flex; font-size: 20px">
                                                                    <h5 class="card-text">Ngày tham gia:&ensp;</h5>
                                                                    <input path="dateBegin"
                                                                           class="form-group card-text editS"
                                                                           style="width: 180px;height: 30px;border-color: transparent"
                                                                           value="${shop.dateBegin}"/>
                                                                </div>
                                                                <div style="display: flex; font-size: 20px">
                                                                    <h5 class="card-text">Buôn bán sản phẩm
                                                                        chính:&ensp;</h5>
                                                                    <form:select
                                                                            cssStyle="text-align: center;width: 180px;height: 50px;border-color: transparent"
                                                                            path="mainType" class="form-select sl1">
                                                                        <c:forEach items="${type_products}" var="c">
                                                                            <option value="${c.idTypeProduct}"
                                                                                    <c:if test="${c.idTypeProduct == shop.mainType.idTypeProduct}"> selected</c:if>
                                                                            >${c.typeName}</option>
                                                                        </c:forEach>
                                                                    </form:select>
                                                                </div>
                                                                <div style="height: 20px;display: flex; font-size: 20px">
                                                                    <h5 class="card-text" style="margin-top: 10px">Sản
                                                                        phẩm phụ:&ensp;</h5>
                                                                        <%--                            <form:input path="ortherType1" class="form-group card-text editS"--%>
                                                                        <%--                                        style="text-align: center;width: 180px;height: 30px;border-color: transparent"--%>
                                                                        <%--                                        value="${shop.ortherType1.typeName}"/>--%>

                                                                    <form:select
                                                                            cssStyle="text-align: center;width: 180px;height: 50px;border-color: transparent"
                                                                            path="ortherType1" class="form-select">
                                                                        <c:forEach items="${type_products}" var="c">
                                                                            <option <c:if
                                                                                    test="${c.idTypeProduct == shop.ortherType1.idTypeProduct}"> selected</c:if>
                                                                                    value="${c.idTypeProduct}">${c.typeName}</option>
                                                                        </c:forEach>
                                                                    </form:select>

                                                                    <i>,&ensp;</i>
                                                                    <form:select
                                                                            cssStyle="text-align: center;width: 180px;height: 50px;border-color: transparent"
                                                                            path="ortherType2" class="form-select">
                                                                        <c:forEach items="${type_products}" var="c">
                                                                            <option <c:if
                                                                                    test="${c.idTypeProduct == shop.ortherType2.idTypeProduct}"> selected</c:if>
                                                                                    value="${c.idTypeProduct}">${c.typeName}</option>
                                                                        </c:forEach>
                                                                    </form:select>
                                                                </div>
                                                                <div style="margin-top: 50px">
                                                                        <%--  SAVE BUTTON  --%>
                                                                    <button type="submit"
                                                                            style="color: red;margin-left: 30px;font-size: 20px;display: none"
                                                                            class="btn fa-solid fa-pen-to-square edit save">
                                                                        save
                                                                    </button>
                                                                        <%--  SAVE BUTTON  --%>
                                                                        <%--  CANCLE BUTTON  --%>
                                                                    <button type="button" onclick="cancleEdit()"
                                                                            style="color: red;margin-left: 30px;font-size: 20px; display: none"
                                                                            class="btn fa-solid fa-xmark edit cancle"></button>
                                                                        <%--  CANCLE BUTTON  --%>
                                                                </div>
                                                                <div style="margin-top: 120px">
                                                                    <a href="${addProduct}" class="btn btn-primary"
                                                                       style="margin-top: 15px"> Thêm sản phẩm -
                                                                        discount
                                                                    </a>
                                                                    <a href="${addProduct}" class="btn btn-primary"
                                                                       style="margin-top: 15px"> Sản phẩm chờ duyệt
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </form:form>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                            <div class="dashboard-title mt-lg-5 mt-3 top-sec">
                                                <h4>login details</h4>
                                                <a href="#" class="btn btn-sm btn-solid">+ add new</a>
                                            </div>
                                            <div class="dashboard-detail">
                                                <div style="width: 100%">
                                                    <h3 type="button" onclick="clickChangePass()">* Đổi mật khẩu</h3>
                                                    <c:if test="${errMsgPass != null}">
                                                        <div>
                                                            <h3 style="color: red">${errMsgPass}</h3>
                                                        </div>
                                                    </c:if>
                                                    <c:url value="/shop-manager/update-account" var="upPas"/>
                                                    <form:form action="${upPas}" method="POST" modelAttribute="account"
                                                               enctype="multipart/form-data"
                                                               cssClass="editPass" style="display:none;">
                                                        <div style="width: 450px;padding: 10px;">
                                                            <form:input path="idAccount"
                                                                        style="width: 200px;height: 25px" type="text"
                                                                        cssStyle="display: none"
                                                                        value="${idAcc}"/>
                                                            <div style="display: flex">
                                                                <h6 class="mb-0" style="width: 200px">Nhập mật khẩu
                                                                    mới:</h6>
                                                                <form:input path="passwordC"
                                                                            style="width: 200px;height: 25px"
                                                                            type="password"
                                                                            class="col-sm-9 text-secondary form-control"/>
                                                            </div>
                                                            <div style="display: flex; margin-top: 10px">
                                                                <h6 class="mb-0" style="width: 200px">Xác nhận mật khẩu
                                                                    mới:</h6>
                                                                <form:input path="confirmPassword"
                                                                            style="width: 200px;height: 25px"
                                                                            type="password"
                                                                            class="col-sm-9 text-secondary form-control"/>
                                                            </div>
                                                            <button type="submit"
                                                                    style="color: red;margin-left: 30px;font-size: 20px;"
                                                                    class="btn fa-solid fa-pen-to-square saveP">save
                                                            </button>
                                                        </div>
                                                    </form:form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- dashboard section end -->

<script>
    var luu_cart = document.getElementsByClassName("btn-save-amount");
    var input_amount = document.getElementsByClassName("amount");
    var id_prod = document.getElementsByClassName("id_pro");
    var fSelect = document.getElementsByClassName("form-select");

    var save_discount = document.getElementsByClassName("save-discount");
    var fSelect_discount = document.getElementsByClassName("form-select-discount");
    var txt_disCount = document.getElementsByClassName("discount_txt");


    function clickSave() {
        for (var i = 0; i < luu_cart.length; i++) {
            var button = luu_cart[i]
            var amount = input_amount[i].value;
            var id = id_prod[i].innerHTML;

            button.setAttribute("onclick", "saveAmount('" + '${shopAcc.get(0).idShopStore}' + "'," + id + "," + amount + ")")
        }
    }

    //saveAmountProduct
    function saveAmount(idShop, idPro, Amount) {
        var answer = window.confirm("Do you want to confirm this amount?");
        if (answer) {
            if ('${active}' === 'actived') {
                fetch("http://localhost:8080/thuongmaidientu/api/update-amount-product", {
                    method: 'post',
                    body: JSON.stringify({
                        "idShop": idShop.toString(),
                        "idPro": idPro.toString(),
                        "amount": Amount.toString()
                    }),
                    headers: {
                        "Content-Type": "application/json"
                    }
                }).then(function (res) {
                    if (res.status === 200) {
                        alert('Chỉnh sửa số lượng thành công');
                    } else
                        alert('Xác nhận thất bại');
                })
            } else {
                alert('Hiện tại shop của bạn đang trong tình trạng bị khoá, vui lòng thử lại sau!!');
            }
        }
    }


    // /add-discount-product
    function saveDiscount(idPro) {
        if ('${active}' === 'actived') {
            for (var i = 0; i < save_discount.length; i++) {
                var fs = fSelect_discount[i]
                var fs_selectedName = fs.selectedIndex
                var idDiscount = fs.value.toString();
                save_discount[i].setAttribute("onclick", "api_dis('" + idPro + "'," + idDiscount + "," + i + ",'" + fs.options[fs_selectedName].innerText + "')")
            }
        } else {
            alert('Hiện tại shop của bạn đang trong tình trạng bị khoá, vui lòng thử lại sau!!');
        }
        // for (var i = 0; i < save_discount.length; i++) {
        //     var fs = fSelect_discount[i]
        //     var fs_selectedName = fs.selectedIndex
        //     var idDiscount = fs.value.toString();
        //     save_discount[i].setAttribute("onclick", "api_dis('" + idPro + "'," + idDiscount + "," + i + ",'" + fs.options[fs_selectedName].innerText + "')")
        // }
    }

    function api_dis(idPro, idDis, pos, nameDis) {
        var answer = window.confirm("Do you want to confirm this Discount?");
        if (answer) {
            fetch("http://localhost:8080/thuongmaidientu/api/add-discount-product", {
                method: 'post',
                body: JSON.stringify({
                    "idPro": idPro.toString(),
                    "idDis": idDis.toString()
                }),
                headers: {
                    "Content-Type": "application/json"
                }
            }).then(function (res) {
                if (res.status === 200) {
                    alert('Xác nhận discount thành công');
                    txt_disCount[pos].innerText = `Mã Discount: ` + nameDis + `- Active`
                } else
                    alert('Xác nhận thất bại');
            })
        } else {
            //some code
        }
    }


    function api_searchOrd() {
        if ('${active}' === 'actived') {
            let kw_waitting = document.getElementById("searchWait").value;
            let bodyWaiting = document.getElementById("bd_waitting")
            let btnSearch = document.getElementById("searchOrd-waitting");
            let sltFil = document.getElementById("slt_order_waitting").value;
            <c:url value="/shop-manager" var="Order_waiting">
            </c:url>

            let url = '${Order_waiting}' + `?pageOr_W=` + '1' + `&kwOrd_kw=` + kw_waitting + `&filDate=` + sltFil;
            <sec:authorize access="hasRole('ROLE_EMPLOYEE')">
            url += `&idShop_FrEpl=` + '${shopID}';
            </sec:authorize>
            btnSearch.setAttribute("href", url);
        } else {
            alert('Hiện tại shop của bạn đang trong tình trạng bị khoá, vui lòng thử lại sau!!');
        }
    }

    function api_searchOrd_accept() {
        if ('${active}' === 'actived') {
            let kw_accept = document.getElementById("searchAccept").value;
            let bodyWaiting = document.getElementById("bd_waitting")
            let btnSearch = document.getElementById("searchOrd-accept");
            let sltFil_accept = document.getElementById("slt_order_accept").value;
            <c:url value="/shop-manager" var="Order_accept">
            </c:url>

            let url = '${Order_accept}' + `?pageOrAc_W=` + '1' + `&kwOrdAc_kw=` + kw_accept + `&filDateAc=` + sltFil_accept;
            <sec:authorize access="hasRole('ROLE_EMPLOYEE')">
            url += `&idShop_FrEpl=` + '${shopID}';
            </sec:authorize>

            btnSearch.setAttribute("href", url);
        } else {
            alert('Hiện tại shop của bạn đang trong tình trạng bị khoá, vui lòng thử lại sau!!');
        }
    }

    function api_searchOrd_cancle() {
        if ('${active}' === 'actived') {
            let kw_accept = document.getElementById("searchCancle").value;
            let btnSearch = document.getElementById("searchOrd-cancle");
            let sltFil_accept = document.getElementById("slt_order_cancle").value;
            <c:url value="/shop-manager" var="Order_cancle">
            </c:url>

            let url = '${Order_cancle}' + `?pageOrCa_W=` + '1' + `&kwOrdCa_kw=` + kw_accept + `&filDateCa=` + sltFil_accept;
            <sec:authorize access="hasRole('ROLE_EMPLOYEE')">
            url += `&idShop_FrEpl=` + '${shopID}';
            </sec:authorize>

            btnSearch.setAttribute("href", url);
        } else {
            alert('Hiện tại shop của bạn đang trong tình trạng bị khoá, vui lòng thử lại sau!!');
        }
    }


    var inputCan = document.getElementsByClassName("editS");
    var editNone = document.getElementsByClassName("edit");
    var clickEdit = 0;

    window.onload = function () {
        for (var i = 0; i < inputCan.length; i++) {
            var inp = inputCan[i];
            inp.setAttribute("readonly", true);
        }

        for (var i = 0; i < fSelect.length; i++) {
            var f = fSelect[i];
            f.setAttribute("disabled", true);
            f.style.backgroundColor = "transparent";
        }
    }

    function editClick() {
        for (var i = 0; i < inputCan.length; i++) {
            var inp = inputCan[i];
            inp.removeAttribute("readonly");
        }

        for (var i = 0; i < editNone.length; i++) {
            var ed = editNone[i];
            ed.style.display = "block";
        }

        for (var i = 0; i < fSelect.length; i++) {
            var f = fSelect[i];
            f.removeAttribute("disabled");
            f.style.backgroundColor = "transparent";
        }
    }

    function cancleEdit() {
        for (var i = 0; i < inputCan.length; i++) {
            var inp = inputCan[i];
            inp.setAttribute("readonly", true);
        }

        for (var i = 0; i < editNone.length; i++) {
            var ed = editNone[i];
            ed.style.display = "none";
        }
    }

    var fEditPass = document.getElementsByClassName("editPass")
    var clickChangeP = 0;

    function clickChangePass() {
        if (clickChangeP == 0) {
            clickChangeP = 1;
            fEditPass[0].style.display = "block";
        } else {
            clickChangeP = 0;
            fEditPass[0].style.display = "none";
        }
    }

    function clickOpenAccount() {
        if ('${active}' == 'actived') {
            var answer = window.confirm("Do u want to open?");
            if (answer) {
                let idAccEmpl = '${accEmpl}';
                let idAccShop = '${idAcc}';
                fetch('http://localhost:8080/thuongmaidientu/api/update-stt-account', {
                    method: 'post',
                    body: JSON.stringify({
                        "id_Role": idAccEmpl.toString(),
                        "id_Update": idAccShop.toString(),
                        "Stt": "actived"
                    }),
                    headers: {
                        "Content-Type": "application/json"
                    }
                }).then(function (res) {
                    if (res.status === 200) {
                        alert('Mờ khoá thành công');
                    } else
                        alert('Mờ khoá không thành công');
                })
            } else {
                //some code
            }
        } else {
            alert('Hiện tại tài khoản của bạn đang trong tình trạng bị khoá, vui lòng thử lại sau!!');
        }
    }

    function clickBanAccount() {
        if ('${active}' == 'actived') {
            var answer = window.confirm("Do u want to ban?");
            if (answer) {
                let idAccEmpl = '${accEmpl}';
                let idAccShop = '${idAcc}';
                fetch('http://localhost:8080/thuongmaidientu/api/update-stt-account', {
                    method: 'post',
                    body: JSON.stringify({
                        "id_Role": idAccEmpl.toString(),
                        "id_Update": idAccShop.toString(),
                        "Stt": "banned"
                    }),
                    headers: {
                        "Content-Type": "application/json"
                    }
                }).then(function (res) {
                    if (res.status === 200) {
                        alert('Cấm thành công');
                    } else
                        alert('Cấm không thành công');
                })
            } else {
                //some code
            }
        } else {
            alert('Hiện tại tài khoản của bạn đang trong tình trạng bị khoá, vui lòng thử lại sau!!');
        }
    }
</script>