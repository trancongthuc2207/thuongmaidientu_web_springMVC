<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<div class="container">
    <h1>Danh sách sản phẩm đã đặt cho đơn hàng</h1>
    <div class="row">
        <c:if test="${listOrder!= null}">
            <c:forEach items="${listOrder}" var="ord">
                <div class="col-md-3 col-xs-12" style="padding: 5px; <c:if test="${ord.dateShopaccept != null}">background-color: #00FF99 </c:if>">
                    <div class="card">
                        <c:if test="${ord.product.image.startsWith('https') == false}">
                            <img style="width: 300px;height: 250px" class="card-img-top" class="img-fluid"
                                 src="https://res.cloudinary.com/dxxwcby8l/image/upload/v1647248722/r8sjly3st7estapvj19u.jpg"
                                 alt="Card image">
                        </c:if>
                        <c:if test="${ord.product.image.startsWith('https') == true}">
                            <img style="width: 300px;height: 250px" class="card-img-top" class="img-fluid"
                                 src="${ord.product.image}"
                                 alt="Card image">
                        </c:if>
                        <div class="card-body">
                            <h4 class="card-title">Mã sản phẩm: ${ord.product.idProduct}</h4>
                            <h4>Tên sản phẩm: ${ord.product.nameProduct}</h4>
                            <p class="card-text">Số lượng: ${ord.amount}</p>
                            <p class="card-text">
                                <fmt:formatNumber type="number" maxFractionDigits="3" value="${ord.product.unitPrice}"/>
                                VND
                            </p>
                            <p class="card-text">Tổng giá món: <fmt:formatNumber type="number" maxFractionDigits="3"
                                                                                 value="${ord.product.unitPrice * ord.amount}"/>
                                VND</p>
                            <p class="card-text">Ngày đặt: ${ord.dateCreated}</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:if>
        <c:if test="${listOrderS != null}">
            <c:forEach items="${listOrderS}" var="ord">
                <div class="col-md-3 col-xs-12" style="padding: 5px;">
                    <div class="card">
                        <c:if test="${ord.product.image.startsWith('https') == false}">
                            <img style="width: 300px;height: 250px" class="card-img-top" class="img-fluid"
                                 src="https://res.cloudinary.com/dxxwcby8l/image/upload/v1647248722/r8sjly3st7estapvj19u.jpg"
                                 alt="Card image">
                        </c:if>
                        <c:if test="${ord.product.image.startsWith('https') == true}">
                            <img style="width: 300px;height: 250px" class="card-img-top" class="img-fluid"
                                 src="${ord.product.image}"
                                 alt="Card image">
                        </c:if>
                        <div class="card-body">
                            <h4 class="card-title">Mã sản phẩm: ${ord.product.idProduct}</h4>
                            <p class="card-text">Số lượng: ${ord.amount}</p>
                            <p class="card-text">
                                <fmt:formatNumber type="number" maxFractionDigits="3" value="${ord.product.unitPrice}"/>
                                VND
                            </p>
                            <p class="card-text">Tổng giá món: <fmt:formatNumber type="number" maxFractionDigits="3"
                                                                                 value="${ord.product.unitPrice * ord.amount}"/>
                                VND</p>
                            <p class="card-text">Ngày đặt: ${ord.dateCreated}</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:if>
    </div>
</div>