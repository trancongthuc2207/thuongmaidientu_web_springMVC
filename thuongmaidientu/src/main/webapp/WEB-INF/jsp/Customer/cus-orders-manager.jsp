<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 18/08/2022
  Time: 10:24 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:url value="/user/cus-orders-manager" var="url"/>

<%----%>
<div style="padding: 50px">
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
                            <th colspan="4">
                                <input id="searchWait-cus" type="text" placeholder="Tìm kiếm...">
                                <a id="searchOrd-waitting-cus" onclick="api_searchOrd()"
                                   class="btn btn-primary">Tìm
                                </a>
                                <select id="slt_order_waitting-cus">
                                    <option value="des" selected>Ngày gần đây</option>
                                    <option value="incre">Ngày xa nhất</option>
                                </select>
                            </th>
                            <tr class="table-head">
                                <th scope="col">Order Id</th>
                                <th scope="col">Status</th>
                                <th scope="col">Price</th>
                                <th scope="col">Time Booked</th>
                                <th scope="col">View</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${list_OrderWaitting}" var="o" begin="0">
                                <tr>
                                    <td>
                                        <span class="mt-0">${o.idOrders}</span>
                                    </td>
                                    <td>
                                        <span class="badge rounded-pill bg-color2 custom-badge">Waitting</span>
                                    </td>
                                    <td><span class="theme-color fs-6">
                                            <fmt:formatNumber type="number" maxFractionDigits="3" value="${o.totalMoney}"/>
                                            </span>
                                    </td>
                                    <td>${o.timeBooked}</td>
                                    <td>
                                        <c:url value="/order-details" var="details">
                                            <c:param name="idOder" value="${o.idOrders}"></c:param>
                                        </c:url>
                                        <a href="${details}">
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
                                                <c:forEach begin="1" end="${Math.ceil(sizeOrdWaiting/20)}"
                                                           var="i">
                                                    <c:url value="/user/cus-orders-manager" var="c">
                                                        <c:param value="${i}" name="pageOr_W"/>

                                                        <c:param value="${kwOr_w}" name="kwOrd_kw"/>

                                                        <c:param value="${inc_desW}" name="filDate"/>
                                                        <sec:authorize access="hasRole('ROLE_EMPLOYEE')">
                                                            <c:param value="${cusID}" name="idCus"/>
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
<%----%>
<%----%>
<div style="padding: 50px">
    <div class="row">
        <div class="col-12">
            <div class="card dashboard-table mt-0">
                <div class="card-body table-responsive-sm">
                    <div class="top-sec">
                        <h3>My Accepted Orders</h3>
                    </div>
                    <div class="table-responsive-xl">
                        <table class="table cart-table order-table">
                            <thead>
                            <th colspan="4">
                                <input id="searchAccept-cus" type="text" placeholder="Tìm kiếm...">
                                <a id="searchOrd-accept-cus" onclick="api_searchOrd_accept()"
                                   class="btn btn-primary">Tìm
                                </a>
                                <select id="slt_order_accept-cus">
                                    <option value="des" selected>Ngày gần đây</option>
                                    <option value="incre">Ngày xa nhất</option>
                                </select>
                            </th>
                            <tr class="table-head">
                                <th scope="col">Order Id</th>
                                <th scope="col">Status</th>
                                <th scope="col">Price</th>
                                <th scope="col">Time Booked</th>
                                <th scope="col">View</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${list_OrderAccept}" var="o" begin="0">
                                <tr>
                                    <td>
                                        <span class="mt-0">${o.idOrders}</span>
                                    </td>
                                    <td>
                                        <span class="badge rounded-pill bg-success custom-badge">Accepted</span>
                                    </td>
                                    <td><span class="theme-color fs-6">
                                            <fmt:formatNumber type="number" maxFractionDigits="3" value="${o.totalMoney}"/>
                                            </span>
                                    </td>
                                    <td>${o.timeBooked}</td>
                                    <td>
                                        <c:url value="/order-details" var="detailsAc">
                                            <c:param name="idOder" value="${o.idOrders}"></c:param>
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
                                                    <c:forEach begin="1" end="${Math.ceil(sizeOrdAccept/20)}"
                                                               var="i">
                                                        <c:url value="/user/cus-orders-manager" var="c">
                                                            <c:param value="${i}" name="pageOrAc_W"/>

                                                            <c:param value="${kwOrdAc_kw}" name="kwOrdAc_kw"/>

                                                            <c:param value="${inc_desAc}" name="filDateAc"/>
                                                            <sec:authorize access="hasRole('ROLE_EMPLOYEE')">
                                                                <c:param value="${cusID}" name="idCus"/>
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

<%----%>
<div style="padding: 50px">
    <div class="row">
        <div class="col-12">
            <div class="card dashboard-table mt-0">
                <div class="card-body table-responsive-sm">
                    <div class="top-sec">
                        <h3>My Canceled Orders</h3>
                    </div>
                    <div class="table-responsive-xl">
                        <table class="table cart-table order-table">
                            <thead>
                            <th colspan="4">
                                <input id="searchCancle-cus" type="text" placeholder="Tìm kiếm...">
                                <a id="searchOrd-cancle-cus" onclick="api_searchOrd_cancle()"
                                   class="btn btn-primary">Tìm
                                </a>
                                <select id="slt_order_cancle-cus">
                                    <option value="des" selected>Ngày gần đây</option>
                                    <option value="incre">Ngày xa nhất</option>
                                </select>
                            </th>
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
                            <c:forEach items="${list_OrderCancle}" var="o" begin="0">
                                <tr>
                                    <td>
                                        <span class="mt-0">${o.idOrders}</span>
                                    </td>
                                    <td>
                                        <span class="badge rounded-pill bg-secondary-10 text-secondary custom-badge">Canceled</span>
                                    </td>
                                    <td><span class="theme-color fs-6">
                                            <fmt:formatNumber type="number" maxFractionDigits="3" value="${o.totalMoney}"/>
                                            </span>
                                    </td>
                                    <td>${o.timeBooked}</td>
                                    <td>${o.reasonCancle}</td>
                                    <td>
                                        <c:url value="/order-details" var="detailsCa">
                                            <c:param name="idOder" value="${o.idOrders}"></c:param>
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
                                                    <c:forEach begin="1" end="${Math.ceil(sizeOrdCancle/20)}"
                                                               var="i">
                                                        <c:url value="/user/cus-orders-manager" var="c">
                                                            <c:param value="${i}" name="pageOrCa_W"/>

                                                            <c:param value="${kwOrdAc_kw}" name="kwOrdCa_kw"/>

                                                            <c:param value="${inc_desAc}" name="filDateCa"/>
                                                            <sec:authorize access="hasRole('ROLE_EMPLOYEE')">
                                                                <c:param value="${cusID}" name="idCus"/>
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

<script>

    window.onload = function () {

    }


    function api_searchOrd() {
        let kw_waitting = document.getElementById("searchWait-cus").value;
        let btnSearch = document.getElementById("searchOrd-waitting-cus");
        let sltFil = document.getElementById("slt_order_waitting-cus").value;
        <c:url value="/user/cus-orders-manager" var="Order_waiting">
        </c:url>
        let url = '${Order_waiting}' + `?pageOr_W=` + '1' + `&kwOrd_kw=` + kw_waitting + `&filDate=` + sltFil;
        <sec:authorize access="hasRole('ROLE_EMPLOYEE')">
            url += `&idCus=` + '${idCus}';
        </sec:authorize>
        btnSearch.setAttribute("href", url);
    }

    function api_searchOrd_accept() {
        let kw_accept = document.getElementById("searchAccept-cus").value;
        let btnSearch = document.getElementById("searchOrd-accept-cus");
        let sltFil_accept = document.getElementById("slt_order_accept-cus").value;
        <c:url value="/user/cus-orders-manager" var="Order_accept">
        </c:url>
        let url = '${Order_accept}' + `?pageOrAc_W=` + '1' + `&kwOrdAc_kw=` + kw_accept + `&filDateAc=` + sltFil_accept;
        <sec:authorize access="hasRole('ROLE_EMPLOYEE')">
        url += `&idCus=` + '${idCus}';
        </sec:authorize>
        btnSearch.setAttribute("href", url);
    }

    function api_searchOrd_cancle() {
        let kw_accept = document.getElementById("searchCancle-cus").value;
        let btnSearch = document.getElementById("searchOrd-cancle-cus");
        let sltFil_accept = document.getElementById("slt_order_cancle-cus").value;
        <c:url value="/user/cus-orders-manager" var="Order_cancle">
        </c:url>
        let url = '${Order_cancle}' + `?pageOrCa_W=` + '1' + `&kwOrdCa_kw=` + kw_accept + `&filDateCa=` + sltFil_accept;
        <sec:authorize access="hasRole('ROLE_EMPLOYEE')">
        url += `&idCus=` + '${idCus}';
        </sec:authorize>
        btnSearch.setAttribute("href", url);
    }
</script>