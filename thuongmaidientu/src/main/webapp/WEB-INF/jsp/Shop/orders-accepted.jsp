<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 29/08/2022
  Time: 1:01 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<div style="margin-top: 50px">
    <c:url value="/shop-manager" var="back"></c:url>
    <a class="btn btn-primary" href="${back}">Quay về</a>
</div>
<div class="row" style="margin-top: 10px">
    <h1>ĐƠN HÀNG ĐÃ KIỂM DUYỆT</h1>
    <c:url value="/shop-manager/orders-accepted" var="fil"/>
    <form class="form-select-filter" action="${fil}">
        <div class="form-check">
            <input onchange="clickRest()" class="form-check-input" type="radio" id="flexRadioDefault">
            <label class="form-check-label" for="flexRadioDefault">
                Tất cả
            </label>
        </div>
    </form>
    <c:url value="/shop-manager/orders-accepted/today" var="filToday"/>
    <form class="form-select-filter" action="${filToday}">
        <div class="form-check">
            <input onchange="this.form.submit()" class="form-check-input" type="radio"
                   id="flexRadioDefault1">
            <label class="form-check-label" for="flexRadioDefault1">
                Hôm nay
            </label>
        </div>
    </form>
    <c:url value="/shop-manager/orders-accepted/yesterday" var="filYesterday"/>
    <form class="form-select-filter" action="${filYesterday}">
        <div class="form-check">
            <input onchange="this.form.submit()" class="form-check-input" type="radio"
                   id="flexRadioDefault2">
            <label class="form-check-label" for="flexRadioDefault2">
                Hôm qua
            </label>
        </div>
    </form>
    <c:url value="/shop-manager/orders-accepted/moreday" var="filMoreday"/>
    <form class="form-select-filter" action="${filMoreday}">
        <div class="form-check">
            <input onchange="this.form.submit()" class="form-check-input" type="radio"
                   id="flexRadioDefault3">
            <label class="form-check-label" for="flexRadioDefault3">
                Nhiều ngày qua
            </label>
        </div>
    </form>


    <div class="row height d-flex justify-content-center align-items-center">
        <div class="col-md-8">
            <div class="search">
                <i class="fa fa-search"></i>
                <input id="searchKW" type="text" class="form-control" placeholder="Have a question? Ask Now">
                <a onclick="clickSearch()" type="button" id="search" class="btn btn-primary">Search</a>
            </div>
        </div>
    </div>


    <%--  ĐƠN  --%>
    <div class="row">
        <h1 id="header-dh">Đơn Hàng</h1>
        <div style="padding: 20px;background-color: gray;display: flex;position: relative;overflow-x: scroll;justify-content: space-between;">
            <c:forEach items="${lst_IDOrder}" var="order">
                <c:if test="${listOrdFilter.size() > 0}">
                    <div style="padding: 15px; margin-left: 20px">
                        <c:if test="${listOrdFilter != null}">
                            <h3>Mã đơn: ${order}</h3>
                        </c:if>
                        <div style="display: flex; width: 100%">
                            <c:forEach items="${listOrdFilter}" var="p">
                                <c:if test="${order == p.orderDetailsPK.idOrderDetails}">
                                    <div class="card"
                                         <c:if test="${p.stt == '2'}">style="position: relative;background-color: #00FF99; margin-left: 5px" </c:if>>
                                        <c:if test="${p.product.image.startsWith('https') == false}">
                                            <img style="width: 300px;height: 250px" class="card-img-top"
                                                 class="img-fluid"
                                                 src="https://res.cloudinary.com/dxxwcby8l/image/upload/v1647248722/r8sjly3st7estapvj19u.jpg"
                                                 alt="Card image">
                                        </c:if>
                                        <c:if test="${p.product.image.startsWith('https') == true}">
                                            <img style="width: 300px;height: 250px" class="card-img-top"
                                                 class="img-fluid"
                                                 src="${p.product.image}"
                                                 alt="Card image">
                                        </c:if>
                                        <div class="card-body">
                                            <h4 class="card-title id_ord">Từ đơn
                                                hàng: ${p.orderDetailsPK.idOrderDetails}</h4>
                                            <h4 class="card-title id_pro">Mã sản
                                                phẩm: ${p.orderDetailsPK.idProduct}</h4>
                                            <h5 class="card-text">Tên sản phẩm: ${p.product.nameProduct}</h5>
                                            <p class="card-text">Đơn giá: <fmt:formatNumber type="number"
                                                                                            maxFractionDigits="3"
                                                                                            value="${p.product.unitPrice}"/></p>
                                            <p class="card-text">Mã Discount: ${p.idDiscount.nameDiscount} - Active</p>
                                            <p class="card-text">Tổng giá trị: <fmt:formatNumber type="number"
                                                                                                 maxFractionDigits="3"
                                                                                                 value="${p.product.unitPrice * p.amount}"/></p>
                                            <p class="card-text">Ngày khách đặt: ${p.dateCreated}</p>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>

        <div>
            <%--        PHÂN TRANG     --%>
            <ul class="pagination defa" style="align-items: center">
                <c:forEach begin="1" end="${Math.ceil(countOrd/20)}" var="i">
                    <c:url value="/shop-manager/orders-accepted/" var="c">
                        <c:param value="${i}" name="page"/>
                    </c:url>
                    <li class="page-item"><a class="page-link" href="${c}">${i}</a></li>
                </c:forEach>
            </ul>

            <ul class="pagination pageToday" style="align-items: center">
                <c:forEach begin="1" end="${Math.ceil(countOrd/20)}" var="i">
                    <c:url value="/shop-manager/orders-accepted/today" var="c">
                        <c:param value="${i}" name="page"/>
                    </c:url>
                    <li class="page-item"><a class="page-link" href="${c}">${i}</a></li>
                </c:forEach>
            </ul>

            <ul class="pagination pageYesterday" style="align-items: center">
                <c:forEach begin="1" end="${Math.ceil(countOrd/20)}" var="i">
                    <c:url value="/shop-manager/orders-accepted/yesterday" var="c">
                        <c:param value="${i}" name="page"/>
                    </c:url>
                    <li class="page-item"><a class="page-link" href="${c}">${i}</a></li>
                </c:forEach>
            </ul>

            <ul class="pagination pageMoreDay" style="align-items: center">
                <c:forEach begin="1" end="${Math.ceil(countOrd/20)}" var="i">
                    <c:url value="/shop-manager/orders-accepted/moreday" var="c">
                        <c:param value="${i}" name="page"/>
                    </c:url>
                    <li class="page-item"><a class="page-link" href="${c}">${i}</a></li>
                </c:forEach>
            </ul>

        </div>
    </div>
</div>

<script>
    var day = "";
    var search = document.getElementById("search");
    var inputKW = document.getElementById("searchKW");
    var pageToday = document.getElementsByClassName("pageToday");
    var pageYesterday = document.getElementsByClassName("pageYesterday");
    var pageMoreday = document.getElementsByClassName("pageMoreDay");
    var pageDefa = document.getElementsByClassName("defa");

    window.onload = function () {
        event.preventDefault();
        var flexRadioDefault1 = document.getElementById("flexRadioDefault1");
        var flexRadioDefault2 = document.getElementById("flexRadioDefault2");
        var flexRadioDefault3 = document.getElementById("flexRadioDefault3");
        var head = document.getElementById("header-dh");
        document.getElementById("flexRadioDefault").checked = true;


        if (window.location.toString().includes("${fil}")) {
            document.getElementById("flexRadioDefault").checked = true;
            head.innerText = 'Tất cả đơn hàng.';
            day = "";
        }

        if (window.location.toString().includes("${filToday}")) {
            document.getElementById("flexRadioDefault").checked = false;
            document.getElementById("flexRadioDefault1").checked = true;
            head.innerText = 'Đơn hàng duyệt ngày hôm nay.';
            day = 1;
        }
        if (window.location.toString().includes("${filYesterday}")) {
            document.getElementById("flexRadioDefault").checked = false;
            document.getElementById("flexRadioDefault2").checked = true;
            head.innerText = 'Đơn hàng duyệt ngày hôm qua.';
            day = 2;
        }
        if (window.location.toString().includes("${filMoreday}")) {
            document.getElementById("flexRadioDefault").checked = false;
            document.getElementById("flexRadioDefault3").checked = true;
            head.innerText = 'Đơn hàng duyệt quá 2 ngày.';
            day = 3;
        }

        if (day == "") {
            pageToday[0].style.display = "none";
            pageYesterday[0].style.display = "none";
            pageMoreday[0].style.display = "none";
        }

        if (day == 1) {
            pageYesterday[0].style.display = "none";
            pageMoreday[0].style.display = "none";
            pageDefa[0].style.display = "none";
        }
        if (day == 2) {
            pageToday[0].style.display = "none";
            pageMoreday[0].style.display = "none";
            pageDefa[0].style.display = "none";
        }
        if (day == 3) {
            pageToday[0].style.display = "none";
            pageYesterday[0].style.display = "none";
            pageDefa[0].style.display = "none";
        }

    }

    function clickSearch() {
        if (day == "") {
            var kw = inputKW.value
            <c:url value="/shop-manager/orders-accepted" var="allKW">
            <c:param name="kw"></c:param>
            </c:url>
            search.setAttribute("href", "${allKW}" + kw);
        }
        if (day == 1) {
            var kw = inputKW.value
            <c:url value="/shop-manager/orders-accepted/today" var="todayKW">
            <c:param name="kw"></c:param>
            </c:url>
            search.setAttribute("href", "${todayKW}" + kw);
        }
        if (day == 2) {
            var kw = inputKW.value
            <c:url value="/shop-manager/orders-accepted/yesterday" var="yesterdayKW">
            <c:param name="kw"></c:param>
            </c:url>
            search.setAttribute("href", "${yesterdayKW}" + kw);
        }
        if (day == 3) {
            var kw = inputKW.value
            <c:url value="/shop-manager/orders-accepted/moreday" var="moredayKW">
            <c:param name="kw"></c:param>
            </c:url>
            search.setAttribute("href", "${moredayKW}" + kw);
        }
    }

    function clickRest() {
        window.location.href = "http://localhost:8080/thuongmaidientu/shop-manager/orders-accepted";
    }
</script>
<style>
    .search {
        position: relative;
        box-shadow: 0 0 40px rgba(51, 51, 51, .1);

    }

    .search input {

        height: 60px;
        text-indent: 25px;
        border: 2px solid #d6d4d4;


    }


    .search input:focus {

        box-shadow: none;
        border: 2px solid blue;


    }

    .search .fa-search {

        position: absolute;
        top: 20px;
        left: 16px;

    }

    .search a {

        position: absolute;
        top: 5px;
        right: 5px;
        height: 50px;
        width: 110px;
        background: blue;

    }
</style>