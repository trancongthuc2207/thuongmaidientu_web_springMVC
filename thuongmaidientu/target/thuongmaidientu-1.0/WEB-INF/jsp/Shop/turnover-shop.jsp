<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 04/09/2022
  Time: 10:15 CH
  To change this template use File | Settings | File Templates.
--%>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<div style="margin-top: 50px">
    <sec:authorize access="hasAnyRole('ROLE_EMPLOYEE')">
        <c:url value="/employee" var="back"></c:url>
    </sec:authorize>
    <sec:authorize access="hasAnyRole('ROLE_SHOP')">
        <c:url value="/shop-manager" var="back"></c:url>
    </sec:authorize>
    <sec:authorize access="hasAnyRole('ROLE_ADMIN')">
        <c:url value="/admin" var="back"></c:url>
    </sec:authorize>
    <a class="btn btn-primary" href="${back}">Quay về</a>
</div>
<div class="row" style="padding: 50px">
    <h1>DOANH THU SHOP</h1>
    <div class="row content-turnOv" style="border-style: dashed;">
        <h3>* Lọc theo ngày chọn</h3>
        <c:if test="${idS != ''}">
            <c:url value="/shop-manager/turnover-shop" var="turn">
                <c:param value="${idS}" name="idS"/>
                <c:param name="daySelect"/>
            </c:url>
        </c:if>
        <c:if test="${idS.equals('')}">
            <c:url value="/shop-manager/turnover-shop" var="turn"/>
        </c:if>
        <form action="${turn}" style="display: flex; font-size: 20px">
            <label>
                Mời bạn nhập ngày cần kiểm tra:
                <input id="input_Date" type="date" name="daySelect">
            </label>
            <p style="margin-left: 10px;<c:if test="${idS != '0'}">display:none</c:if>">
                <button class="btn btn-primary">Xem</button>
            </p>

            <c:if test="${idS != '0'}">
                <a id="seeDay_employee" href="${turn}" class="btn btn-primary"
                   style="margin-left: 10px">XEM</a>
            </c:if>

        </form>

        <c:if test="${dateS != ''}">
            <div style="display: flex;justify-content: space-between">
                <h4 style="color: red">Ngày hiện tại: ${dateS}</h4>
                <h4 style="color: red">Tổng tiền thu được: <fmt:formatNumber type="number"
                                                                             maxFractionDigits="3"
                                                                             value="${sumDateEnd}"/>&nbsp;VNĐ</h4>
            </div>
        </c:if>

        <div class="row filterDay">
            <c:forEach items="${listTurnOver}" var="turnOv">
                <div class="col-md-3 col-xs-12" style="padding: 5px;">
                    <c:url value="/order-details" var="details">
                        <c:param name="idOderFromShop" value="${turnOv[0]}"></c:param>
                        <c:param name="idShop" value="${idS}"></c:param>
                    </c:url>
                    <form action="#">
                        <div class="card" style="border-color: black">
                            <div class="card-body">
                                <h4 class="card-title">Mã đơn hàng: ${turnOv[0]}</h4>
                                <h5 class="card-text">Tổng đơn hàng: <fmt:formatNumber type="number"
                                                                                       maxFractionDigits="3"
                                                                                       value="${turnOv[1]}"/>&nbsp;
                                    VNĐ</h5>
                                <sec:authorize access="hasRole('ROLE_SHOP')">
                                    <a href="${details}" class="btn btn-primary"> Xem </a>
                                </sec:authorize>
                            </div>
                        </div>
                    </form>
                </div>
            </c:forEach>
        </div>
        <div style="display: flex;margin-top: 30px">
            <div style="width: 60%">
                <table class="table">
                    <thead class="table-success">
                    <tr style="text-align: center">
                        <th>Mã Sản Phẩm</th>
                        <th>Tên</th>
                        <th>Số lượng</th>
                        <th>Tổng giá trị</th>
                    </tr>
                    </thead>
                    <tbody style="text-align: center">
                    <c:forEach items="${productChDate}" var="p">
                        <tr>
                            <td>${p[0]}</td>
                            <td>${p[1]}</td>
                            <td>${p[2]}</td>
                            <td><fmt:formatNumber type="number"
                                                  maxFractionDigits="3"
                                                  value="${p[3]}"/>&nbsp;VNĐ
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div style="width: 40%;height: 40%;margin-top: 50px">
                <div>
                    <canvas id="productChartDate"></canvas>
                </div>
            </div>
        </div>

    </div>

    <div class="row content-turnOv" style="margin-top: 50px;border-style: dashed;">
        <select onchange="selectFil()" id="filterSort" class="form-select form-select-lg mb-3"
                aria-label=".form-select-lg example">
            <option value="0" selected>Open this select menu</option>
            <option value="1">* Lọc theo tháng</option>
            <option value="2">* Lọc theo năm</option>
        </select>


        <div class="ctt_hideM">
            <h3>* Lọc theo tháng</h3>

            <c:if test="${idS != '0'}">
                <c:url value="/shop-manager/turnover-shop/month" var="turnMonth">
                    <c:param value="${idS}" name="idS"/>
                    <c:param name="monthSelect"/>
                </c:url>
            </c:if>
            <c:if test="${idS == '0'}">
                <c:url value="/shop-manager/turnover-shop/month" var="turnMonth"/>
            </c:if>

            <form action="${turnMonth}" style="display: flex; font-size: 20px">
                <label>
                    Mời bạn nhập tháng cần kiểm tra:
                    <input id="input_Month" type="month" name="monthSelect">
                </label>
                <p style="margin-left: 10px;<c:if test="${idS != '0'}">display:none</c:if>">
                    <button class="btn btn-primary">Xem</button>
                </p>

                <c:if test="${idS != '0'}">
                    <a id="seeMonth_employee" href="${turnMonth}" class="btn btn-primary"
                       style="margin-left: 10px">XEM</a>
                </c:if>
            </form>

            <c:if test="${monthS != ''}">
                <div style="display: flex;justify-content: space-between">
                    <h4 style="color: red">Tháng hiện tại: ${monthS}</h4>
                    <h4 style="color: red">Tổng tiền thu được: <fmt:formatNumber type="number"
                                                                                 maxFractionDigits="3"
                                                                                 value="${sumEnd}"/>&nbsp; VNĐ</h4>
                </div>
            </c:if>

            <div class="row filterMonth">
                <c:forEach items="${listTurnOverMonth}" var="turnOv">
                    <div class="col-md-3 col-xs-12" style="padding: 5px;">
                        <c:url value="/order-details" var="detailsM">
                            <c:param name="idOderFromShop" value="${turnOv[0]}"></c:param>
                            <c:param name="idShop" value="${idS}"></c:param>
                        </c:url>
                        <form action="#">
                            <div class="card" style="border-color: black">
                                <div class="card-body">
                                    <h4 class="card-title">Mã đơn hàng: ${turnOv[0]}</h4>
                                    <h5 class="card-text">Tổng đơn hàng: <fmt:formatNumber type="number"
                                                                                           maxFractionDigits="3"
                                                                                           value="${turnOv[1]}"/>&nbsp;VNĐ</h5>
                                    <sec:authorize access="hasRole('ROLE_SHOP')">
                                        <a href="${detailsM}" class="btn btn-primary"> Xem </a>
                                    </sec:authorize>
                                </div>
                            </div>
                        </form>
                    </div>
                </c:forEach>
            </div>

            <div style="display: flex;margin-top: 30px">
                <div style="width: 60%">
                    <table class="table" id="tbOrder">
                        <thead class="table-success">
                        <tr style="text-align: center">
                            <th>Mã Sản Phẩm</th>
                            <th>Tên</th>
                            <th>Số lượng</th>
                            <th>Tổng giá trị</th>
                        </tr>
                        </thead>
                        <tbody style="text-align: center">
                        <c:forEach items="${productCh}" var="p">
                            <tr>
                                <td>${p[0]}</td>
                                <td>${p[1]}</td>
                                <td>${p[2]}</td>
                                <td><fmt:formatNumber type="number"
                                                      maxFractionDigits="3"
                                                      value="${p[3]}"/>&nbsp;VNĐ
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div style="width: 40%;height: 40%;margin-top: 50px">
                    <div>
                        <canvas id="productChart"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <div class="ctt_hideY">
            <h3>* Lọc theo năm</h3>

            <c:if test="${idS != '0'}">
                <c:url value="/shop-manager/turnover-shop/year" var="turnYear">
                    <c:param value="${idS}" name="idS"/>
                    <c:param name="yearSelect"/>
                </c:url>
            </c:if>
            <c:if test="${idS == '0'}">
                <c:url value="/shop-manager/turnover-shop/year" var="turnYear"/>
            </c:if>

<%--            <c:url value="/shop-manager/turnover-shop/year" var="turnYear"/>--%>
            <form action="${turnYear}" style="display: flex; font-size: 20px">
                <label>
                    Mời bạn nhập năm cần kiểm tra:
                    <input id="input_Year" type="year" name="yearSelect">
                </label>
                <p style="margin-left: 10px;<c:if test="${idS != '0'}">display:none</c:if>">
                    <button class="btn btn-primary">Xem</button>
                </p>

                <c:if test="${idS != '0'}">
                    <a id="seeYear_employee" href="${turnYear}" class="btn btn-primary"
                       style="margin-left: 10px">XEM</a>
                </c:if>
            </form>

            <c:if test="${yearS != ''}">
                <div style="display: flex;justify-content: space-between">
                    <h4 style="color: red">Năm hiện tại: ${yearS}</h4>
                    <h4 style="color: red">Tổng tiền thu được: <fmt:formatNumber type="number"
                                                                                 maxFractionDigits="3"
                                                                                 value="${sumEnd}"/>&nbsp; VNĐ</h4>
                </div>
            </c:if>

            <div style="display: flex;margin-top: 30px">
                <div style="width: 60%">
                    <table class="table">
                        <thead class="table-success">
                        <tr style="text-align: center">
                            <th>Mã Sản Phẩm</th>
                            <th>Tên</th>
                            <th>Số lượng</th>
                            <th>Tổng giá trị</th>
                        </tr>
                        </thead>
                        <tbody style="text-align: center">
                        <c:forEach items="${productChY}" var="p">
                            <tr>
                                <td>${p[0]}</td>
                                <td>${p[1]}</td>
                                <td>${p[2]}</td>
                                <td><fmt:formatNumber type="number"
                                                      maxFractionDigits="3"
                                                      value="${p[3]}"/>&nbsp;VNĐ
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div style="width: 40%;height: 40%;margin-top: 50px">
                    <div>
                        <canvas id="productChartY"></canvas>
                    </div>
                </div>
            </div>
        </div>

    </div>

</div>

<script>
    <%-- GET   --%>
    var cttFil = document.getElementsByClassName("ctt_hideM");
    var cttFilY = document.getElementsByClassName("ctt_hideY");
    <%------------%>

    function selectFil() {
        var slFil = document.getElementById("filterSort").selectedIndex;
        var opFil = document.getElementById("filterSort").options[slFil].value;

        if (opFil == 0) {
            cttFil[0].style.display = 'none';
            cttFilY[0].style.display = 'none';
        }
        if (opFil == 1) {
            cttFilY[0].focus({preventScroll: true});
            cttFil[0].style.display = 'block';
            cttFilY[0].style.display = 'none';
        }
        if (opFil == 2) {
            cttFilY[0].focus({preventScroll: true});
            cttFilY[0].style.display = 'block';
            cttFil[0].style.display = 'none';
        }
    }

    <c:if test="${idS != '0'}">
    var submitDay_Employee = document.getElementById("seeDay_employee");
    var submitMonth_Employee = document.getElementById("seeMonth_employee");
    var submitYear_Employee = document.getElementById("seeYear_employee");

    var input_DateChange = document.getElementById("input_Date");
    var input_MonthChange = document.getElementById("input_Month");
    var input_YearChange = document.getElementById("input_Year");

    input_DateChange.onchange = function () {
        var hreff = '${turn}' + input_DateChange.value;
        submitDay_Employee.setAttribute('href', hreff)
    }

    input_MonthChange.onchange = function () {
        var hreff = '${turnMonth}' + input_MonthChange.value;
        submitMonth_Employee.setAttribute('href', hreff)
    }

    input_YearChange.onchange = function () {
        var hreff = '${turnYear}' + input_YearChange.value;
        submitYear_Employee.setAttribute('href', hreff)
    }
    </c:if>

    window.onload = function () {
        productC("productChart", proLabels, proIn4);
        productC_date("productChartDate", proLabels_D, proIn4_D);
        productC_Year("productChartY", proLabels_Y, proIn4_Y);

        cttFil[0].style.display = 'none';
        cttFilY[0].style.display = 'none';

        if (window.location.toString().includes("turnover-shop/year")) {
            cttFilY[0].style.display = 'block';
            cttFilY[0].focus({preventScroll: true});
        }
        if (window.location.toString().includes("turnover-shop/month")) {
            cttFil[0].style.display = 'block';
            cttFil[0].focus({preventScroll: true});
        }

    }

    let proLabels = [], proIn4 = []
    <c:forEach items="${productCh}" var="c">
    proLabels.push('${c[1]}');
    proIn4.push(${c[2]});
    </c:forEach>

    function generateColor() {
        let r = parseInt(Math.random() * 255);
        let g = parseInt(Math.random() * 255);
        let b = parseInt(Math.random() * 255);
        return 'rgb(' + r + ',' + g + ',' + b + ')'
    }

    function productC(id, productLabels = [], productInfo = []) {
        let colors = []
        for (let i = 0; i < productLabels.length; i++)
            colors.push(generateColor())

        const data = {
            labels: productLabels,
            datasets: [{
                label: 'THONG KE',
                data: productInfo,
                backgroundColor: colors,
                hoverOffset: 4
            }]
        };

        const config = {
            type: 'doughnut',
            data: data,
        };

        let ctx = document.getElementById(id).getContext("2d")
        new Chart(ctx, config)
    }


    let proLabels_D = [], proIn4_D = []
    <c:forEach items="${productChDate}" var="c">
    proLabels_D.push('${c[1]}');
    proIn4_D.push(${c[2]});
    </c:forEach>

    function productC_date(id, productLabels = [], productInfo = []) {
        let colors = []
        for (let i = 0; i < productLabels.length; i++)
            colors.push(generateColor())

        const data = {
            labels: productLabels,
            datasets: [{
                label: 'THONG KE',
                data: productInfo,
                backgroundColor: colors,
                hoverOffset: 4
            }]
        };

        const config = {
            type: 'doughnut',
            data: data,
        };

        let ctx = document.getElementById(id).getContext("2d")
        new Chart(ctx, config)
    }

    let proLabels_Y = [], proIn4_Y = []
    <c:forEach items="${productChY}" var="c">
    proLabels_Y.push('${c[1]}');
    proIn4_Y.push(${c[2]});
    </c:forEach>

    function productC_Year(id, productLabels = [], productInfo = []) {
        let colors = []
        for (let i = 0; i < productLabels.length; i++)
            colors.push(generateColor())

        const data = {
            labels: productLabels,
            datasets: [{
                label: 'THONG KE',
                data: productInfo,
                backgroundColor: colors,
                hoverOffset: 4
            }]
        };

        const config = {
            type: 'doughnut',
            data: data,
        };

        let ctx = document.getElementById(id).getContext("2d")
        new Chart(ctx, config)
    }
</script>