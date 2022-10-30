<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<%--<div class="">--%>
<%--    <h1>Danh sách sản phẩm đã đặt cho đơn hàng</h1>--%>
<%--    <div class="row">--%>
<%--        <c:if test="${listOrder != null}">--%>
<%--            <c:forEach items="${listOrder}" var="ord" begin="0">--%>
<%--                <div class="col-md-3 col-xs-12"--%>
<%--                     style="padding: 5px; <c:if test="${ord.dateShopaccept != null}">background-color: #00FF99 </c:if>">--%>
<%--                    <div class="card">--%>
<%--                        <c:if test="${ord.product.image.startsWith('https') == false}">--%>
<%--                            <img style="width: 300px;height: 250px" class="card-img-top" class="img-fluid"--%>
<%--                                 src="https://res.cloudinary.com/dxxwcby8l/image/upload/v1647248722/r8sjly3st7estapvj19u.jpg"--%>
<%--                                 alt="Card image">--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${ord.product.image.startsWith('https') == true}">--%>
<%--                            <img style="width: 300px;height: 250px" class="card-img-top" class="img-fluid"--%>
<%--                                 src="${ord.product.image}"--%>
<%--                                 alt="Card image">--%>
<%--                        </c:if>--%>
<%--                        <div class="card-body">--%>
<%--                            <h4 class="card-title">Mã sản phẩm: ${ord.product.idProduct}</h4>--%>
<%--                            <h4>Tên sản phẩm: ${ord.product.nameProduct}</h4>--%>
<%--                            <p class="card-text">Số lượng: ${ord.amount}</p>--%>
<%--                            <p class="card-text">--%>
<%--                                <fmt:formatNumber type="number" maxFractionDigits="3" value="${ord.product.unitPrice}"/>--%>
<%--                                VND--%>
<%--                            </p>--%>
<%--                            <p class="card-text">Tổng giá món: <fmt:formatNumber type="number" maxFractionDigits="3"--%>
<%--                                                                                 value="${ord.product.unitPrice * ord.amount}"/>--%>
<%--                                VND</p>--%>
<%--                            <p class="card-text">Ngày đặt: ${ord.dateCreated}</p>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </c:forEach>--%>
<%--        </c:if>--%>
<%--        <c:if test="${listOrderS != null}">--%>
<%--            <c:forEach items="${listOrderS}" var="ord" begin="0">--%>
<%--                <div class="col-md-3 col-xs-12" style="padding: 5px;">--%>
<%--                    <div class="card">--%>
<%--                        <c:if test="${ord.product.image.startsWith('https') == false}">--%>
<%--                            <img style="width: 300px;height: 250px" class="card-img-top" class="img-fluid"--%>
<%--                                 src="https://res.cloudinary.com/dxxwcby8l/image/upload/v1647248722/r8sjly3st7estapvj19u.jpg"--%>
<%--                                 alt="Card image">--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${ord.product.image.startsWith('https') == true}">--%>
<%--                            <img style="width: 300px;height: 250px" class="card-img-top" class="img-fluid"--%>
<%--                                 src="${ord.product.image}"--%>
<%--                                 alt="Card image">--%>
<%--                        </c:if>--%>
<%--                        <div class="card-body">--%>
<%--                            <h4 class="card-title">Mã sản phẩm: ${ord.product.idProduct}</h4>--%>
<%--                            <p class="card-text">Số lượng: ${ord.amount}</p>--%>
<%--                            <p class="card-text">--%>
<%--                                <fmt:formatNumber type="number" maxFractionDigits="3" value="${ord.product.unitPrice}"/>--%>
<%--                                VND--%>
<%--                            </p>--%>
<%--                            <p class="card-text">Tổng giá món: <fmt:formatNumber type="number" maxFractionDigits="3"--%>
<%--                                                                                 value="${ord.product.unitPrice * ord.amount}"/>--%>
<%--                                VND</p>--%>
<%--                            <p class="card-text">Ngày đặt: ${ord.dateCreated}</p>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </c:forEach>--%>
<%--        </c:if>--%>
<%--    </div>--%>
<%--</div>--%>
<sec:authorize access="hasAnyRole('ROLE_EMPLOYEE')">
    <c:url value="/employee" var="back"></c:url>
</sec:authorize>
<sec:authorize access="hasAnyRole('ROLE_SHOP')">
    <c:url value="/shop-manager" var="back"></c:url>
</sec:authorize>
<sec:authorize access="hasAnyRole('ROLE_USER')">
    <c:url value="/user/cus-orders-manager" var="back"></c:url>
</sec:authorize>
<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
    <c:url value="/admin" var="back"></c:url>
</sec:authorize>


<section class="section-b-space">
    <div class="" style="padding: 0px 50px">
        <a href="${back}" class="btn btn-primary back-btn"><i data-feather="arrow-left"></i>back</a>
        <h1>ORDER DETAILS</h1>
        <div class="row">
            <div class="col-lg-6">
                <div class="product-order">
                    <c:if test="${listOrderS != null}">
                        <c:forEach items="${listOrderS}" var="ord" begin="0">
                            <div class="row product-order-detail">
                                <div class="col-2">
                                    <c:if test="${ord.product.image.startsWith('https') == false}">
                                        <img class="img-fluid blur-up lazyload"
                                             src="https://res.cloudinary.com/dxxwcby8l/image/upload/v1647248722/r8sjly3st7estapvj19u.jpg"
                                             alt="Card image">
                                    </c:if>
                                    <c:if test="${ord.product.image.startsWith('https') == true}">
                                        <img class="img-fluid blur-up lazyload"
                                             src="${ord.product.image}"
                                             alt="Card image">
                                    </c:if>
                                </div>
                                <div class="col-2 order_detail">
                                    <div>
                                        <h4>product name</h4>
                                        <h5>${ord.product.nameProduct}</h5>
                                    </div>
                                </div>
                                <div class="col-2 order_detail">
                                    <div>
                                        <h4>quantity</h4>
                                        <h5>${ord.amount}</h5>
                                    </div>
                                </div>
                                <div class="col-2 order_detail">
                                    <div>
                                        <h4>unit price</h4>
                                        <h5><fmt:formatNumber type="number" maxFractionDigits="3"
                                                              value="${ord.product.unitPrice}"/></h5>
                                    </div>
                                </div>
                                <c:forEach items="${shop_product}" var="s_item">
                                    <c:if test="${s_item.product.idProduct == ord.orderDetailsPK.idProduct && s_item.idDiscount.idDiscount != '1'}">
                                        <c:if test="${s_item.idDiscount.percentDiscount != null}">
                                            <div class="col-2 order_detail">
                                                <div>
                                                    <h4>discount</h4>
                                                    <h5><fmt:formatNumber type="number" maxFractionDigits="3"
                                                                          value="${- ord.product.unitPrice * (s_item.idDiscount.percentDiscount/100)}"/></h5>
                                                </div>
                                            </div>
                                            <div class="col-2 order_detail">
                                                <div>
                                                    <h4>per total</h4>
                                                    <h5><fmt:formatNumber
                                                            type="number"
                                                            maxFractionDigits="3"
                                                            value="${ord.amount * ord.unitPrice - (ord.amount * (ord.product.unitPrice * s_item.idDiscount.percentDiscount/100))}"/></h5>
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${s_item.idDiscount.valueDiscount != null}">
                                            <div class="col-2 order_detail">
                                                <div>
                                                    <h4>discount</h4>
                                                    <h5><fmt:formatNumber type="number" maxFractionDigits="3"
                                                                          value="${- s_item.idDiscount.valueDiscount}"/></h5>
                                                </div>
                                            </div>
                                            <div class="col-2 order_detail">
                                                <div>
                                                    <h4>per total</h4>
                                                    <h5><fmt:formatNumber
                                                            type="number"
                                                            maxFractionDigits="3"
                                                            value="${ord.amount * ord.unitPrice - (ord.amount * s_item.idDiscount.valueDiscount)}"/></h5>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${s_item.product.idProduct == ord.orderDetailsPK.idProduct && s_item.idDiscount.idDiscount == '1'}">
                                        <div class="col-2 order_detail">
                                            <div>
                                                <h4>discount</h4>
                                                <h5>---</h5>
                                            </div>
                                        </div>
                                        <div class="col-2 order_detail">
                                            <div>
                                                <h4>per total</h4>
                                                <h5><fmt:formatNumber
                                                        type="number"
                                                        maxFractionDigits="3"
                                                        value="${ord.amount * ord.unitPrice}"/></h5>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${listOrder != null}">
                        <c:forEach items="${listOrder}" var="ord" begin="0">
                            <div class="row product-order-detail">
                                <div class="col-2">
                                    <c:if test="${ord.product.image.startsWith('https') == false}">
                                        <img class="img-fluid blur-up lazyload"
                                             src="https://res.cloudinary.com/dxxwcby8l/image/upload/v1647248722/r8sjly3st7estapvj19u.jpg"
                                             alt="Card image">
                                    </c:if>
                                    <c:if test="${ord.product.image.startsWith('https') == true}">
                                        <img class="img-fluid blur-up lazyload"
                                             src="${ord.product.image}"
                                             alt="Card image">
                                    </c:if>
                                </div>
                                <div class="col-2 order_detail">
                                    <div>
                                        <h4>product name</h4>
                                        <h5>${ord.product.nameProduct}</h5>
                                    </div>
                                </div>
                                <div class="col-2 order_detail">
                                    <div>
                                        <h4>quantity</h4>
                                        <h5>${ord.amount}</h5>
                                    </div>
                                </div>
                                <div class="col-2 order_detail">
                                    <div>
                                        <h4>unit price</h4>
                                        <h5><fmt:formatNumber type="number" maxFractionDigits="3"
                                                              value="${ord.product.unitPrice}"/></h5>
                                    </div>
                                </div>
                                <c:forEach items="${shop_product}" var="s_item">
                                    <c:if test="${s_item.product.idProduct == ord.orderDetailsPK.idProduct && s_item.idDiscount.idDiscount != '1'}">
                                        <c:if test="${s_item.idDiscount.percentDiscount != null}">
                                            <div class="col-2 order_detail">
                                                <div>
                                                    <h4>discount</h4>
                                                    <h5><fmt:formatNumber type="number" maxFractionDigits="3"
                                                                          value="${- ord.product.unitPrice * (s_item.idDiscount.percentDiscount/100)}"/></h5>
                                                </div>
                                            </div>
                                            <div class="col-2 order_detail">
                                                <div>
                                                    <h4>per total</h4>
                                                    <h5><fmt:formatNumber
                                                            type="number"
                                                            maxFractionDigits="3"
                                                            value="${ord.amount * ord.unitPrice - (ord.amount * (ord.product.unitPrice * s_item.idDiscount.percentDiscount/100))}"/></h5>
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${s_item.idDiscount.valueDiscount != null}">
                                            <div class="col-2 order_detail">
                                                <div>
                                                    <h4>discount</h4>
                                                    <h5><fmt:formatNumber type="number" maxFractionDigits="3"
                                                                          value="${- s_item.idDiscount.valueDiscount}"/></h5>
                                                </div>
                                            </div>
                                            <div class="col-2 order_detail">
                                                <div>
                                                    <h4>per total</h4>
                                                    <h5><fmt:formatNumber
                                                            type="number"
                                                            maxFractionDigits="3"
                                                            value="${ord.amount * ord.unitPrice - (ord.amount * s_item.idDiscount.valueDiscount)}"/></h5>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${s_item.product.idProduct == ord.orderDetailsPK.idProduct && s_item.idDiscount.idDiscount == '1'}">
                                        <div class="col-2 order_detail">
                                            <div>
                                                <h4>discount</h4>
                                                <h5>---</h5>
                                            </div>
                                        </div>
                                        <div class="col-2 order_detail">
                                            <div>
                                                <h4>per total</h4>
                                                <h5><fmt:formatNumber
                                                        type="number"
                                                        maxFractionDigits="3"
                                                        value="${ord.amount * ord.unitPrice}"/></h5>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </c:forEach>
                    </c:if>
                    <div class="total-sec">
                        <ul>
                            <li>Total none discount <span><fmt:formatNumber
                                    type="number"
                                    maxFractionDigits="3"
                                    value="${totals_non_discount}"/></span></li>
                            <li>Total minus <span><fmt:formatNumber
                                    type="number"
                                    maxFractionDigits="3"
                                    value="${-totals_minus}"/></span></li>
                            <li>tax(GST) <span>---</span></li>
                        </ul>
                    </div>
                    <div class="final-total">
                        <h3>total <span><fmt:formatNumber
                                type="number"
                                maxFractionDigits="3"
                                value="${totals}"/></span></h3>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="order-success-sec">
                    <div class="row">
                        <div class="col-sm-6">
                            <h4>summery</h4>
                            <ul class="order-detail">
                                <sec:authorize access="hasAnyRole('ROLE_USER')">
                                    <li>order ID: ${listOrder.get(0).getOrders().getIdOrders()}</li>
                                    <li>Order Date: ${listOrder.get(0).getOrders().getTimeBooked()}</li>
                                    <li>Order Total: <fmt:formatNumber
                                            type="number"
                                            maxFractionDigits="3"
                                            value="${totals}"/></li>
                                </sec:authorize>
                                <sec:authorize access="hasAnyRole('ROLE_SHOP')">
                                    <li>order ID: ${listOrderS.get(0).getOrders().getIdOrders()}</li>
                                    <li>Order Date: ${listOrderS.get(0).getOrders().getTimeBooked()}</li>
                                    <li>Order Total: <fmt:formatNumber
                                            type="number"
                                            maxFractionDigits="3"
                                            value="${totals}"/></li>
                                </sec:authorize>
                            </ul>
                        </div>
                        <div class="col-sm-6">
                            <h4>shipping address</h4>
                            <ul class="order-detail">
                                <li>${cus.nameC}</li>
                                <li>${cus.address}</li>
                                <li>Contact: ${cus.phoneNumber}</li>
                            </ul>
                        </div>
                        <div class="col-sm-12 payment-mode">
                            <h4>payment method</h4>
                            <p>Pay on Delivery (Cash/Card). Cash on delivery (COD) available. Card/Net banking
                                acceptance subject to device availability.</p>
                        </div>
                        <div class="col-md-12">
                            <div class="delivery-sec">
                                <h3>expected date of delivery: <span>14 July 2022</span></h3>
                                <a href="#">track order</a>
                            </div>

                            <sec:authorize access="hasAnyRole('ROLE_USER')">
                                <c:if test="${listOrder.get(0).getOrders().getStatus() == '1'}">
                                    <div class="delivery-sec">
                                        <h3>Do you want to cancle this order?: <span> CHOOSE </span></h3>
                                        <select id="slt-reason-user" class="btn btn-primary">
                                            <option class="options" value="CUS: Tôi nhận thấy rằng có sản phẩm rẻ hơn">Tôi nhận thấy rằng có sản phẩm rẻ hơn</option>
                                            <option value="CUS: Thời gian giao hàng quá lâu">Thời gian giao hàng lâu.</option>
                                        </select>
                                        <a class="btn btn-primary btn-accept-per-order"
                                           onclick="clickCancleOrderCus(${listOrder.get(0).getOrders().getIdOrders()})"
                                           style="background-color: #04dc21"> Cancle this order</a>
                                    </div>
                                </c:if>
                                <c:if test="${listOrder.get(0).getOrders().getStatus() == '2'}">
                                    <div class="delivery-sec">
                                        <h3>This order will be soon: <span> Thanks for purchasing </span></h3>
                                        <a class="btn btn-primary bg-danger-10 btn-accept-per-order"
                                           style="background-color: #04dc21"> This order was coming</a>
                                    </div>
                                </c:if>
                                <c:if test="${listOrder.get(0).getOrders().getStatus() == 'CANCLE'}">
                                    <div class="delivery-sec">
                                        <h3>Sorry about that: <span> This order was disable! </span></h3>
                                        <a class="btn btn-primary bg-danger-10 btn-accept-per-order"
                                           style="background-color: #04dc21"> This order was cancled</a>
                                    </div>
                                </c:if>
                            </sec:authorize>
                            <sec:authorize access="hasAnyRole('ROLE_SHOP')">
                                <c:if test="${listOrderS.get(0).getOrders().getStatus() == '1'}">
                                    <div class="delivery-sec">
                                        <h3>1. Do you want to cancle this order?: <span> CHOOSE </span></h3>
                                        <a class="btn btn-primary btn-accept-per-order"
                                           onclick="clickConfirmOrder(${listOrderS.get(0).getOrders().getIdOrders()})"
                                           style="background-color: #04dc21"> Confirm this order</a>
                                    </div>
                                    <div class="delivery-sec">
                                        <h3>2. You must choose the reason to cancle: <span> CHOOSE </span></h3>
                                        <select id="slt-reason-shop" class="btn btn-primary">
                                            <option class="options" value="SHOP: Hết Hàng">Hết hàng</option>
                                            <option value="SHOP: Hàng đã vỡ">Hàng đã vỡ</option>
                                        </select>
                                        <a class="btn btn-primary"
                                           onclick="clickCancleOrder(${listOrderS.get(0).getOrders().getIdOrders()})"
                                           style="background-color: #04dc21"> Cancle this order</a>
                                    </div>
                                </c:if>
                                <c:if test="${listOrderS.get(0).getOrders().getStatus() == '2'}">
                                    <div class="delivery-sec">
                                        <h3>Sorry about that: <span> You can't remove this order! </span></h3>
                                        <a class="btn btn-primary bg-danger-10 btn-accept-per-order"
                                           style="background-color: #04dc21"> This order was accepted</a>
                                    </div>
                                </c:if>
                                <c:if test="${listOrderS.get(0).getOrders().getStatus() == 'CANCLE'}">
                                    <div class="delivery-sec">
                                        <h3>Sorry about that: <span> This order was disable! </span></h3>
                                        <a class="btn btn-primary bg-danger-10 btn-accept-per-order"
                                           style="background-color: #04dc21"> This order was cancled</a>
                                    </div>
                                </c:if>
                            </sec:authorize>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
    function clickConfirmOrder(idOrder) {
        var answer = window.confirm("Do you want to Accept ALL ?");
        if (answer) {
            fetch("http://localhost:8080/thuongmaidientu/api/update-per-order-details-accepted", {
                method: 'post',
                body: JSON.stringify({
                    "idOrd": idOrder.toString()
                }),
                headers: {
                    "Content-Type": "application/json"
                }
            }).then(function (res) {
                if (res.status === 200) {
                    alert('Duyệt đơn thành công');
                    window.location.reload();
                } else
                    alert('Duyệt thất bại');
            })
        } else {
            //some code
        }
    }

    function clickCancleOrder(idOrder) {
        let rs = document.getElementById("slt-reason-shop");
        var answer = window.confirm("Do you want to Cancle ALL ?");
        if (answer) {
            fetch("http://localhost:8080/thuongmaidientu/api/update-per-order-details-cancle", {
                method: 'post',
                body: JSON.stringify({
                    "idOrd": idOrder.toString(),
                    "reason": rs.value,
                    "from": '${shopID}'
                }),
                headers: {
                    "Content-Type": "application/json"
                }
            }).then(function (res) {
                if (res.status === 200) {
                    alert('Huỷ đơn thành công');
                    window.location.reload();
                } else
                    alert('Huỷ đơn thất bại');
            })
        } else {
            //some code
        }
    }

    function clickCancleOrderCus(idOrder) {
        let rs = document.getElementById("slt-reason-user");
        var answer = window.confirm("Do you want to Cancle ALL ?");
        if (answer) {
            fetch("http://localhost:8080/thuongmaidientu/api/update-per-order-details-cancle", {
                method: 'post',
                body: JSON.stringify({
                    "idOrd": idOrder.toString(),
                    "reason": rs.value,
                    "from": '${cusID}'
                }),
                headers: {
                    "Content-Type": "application/json"
                }
            }).then(function (res) {
                if (res.status === 200) {
                    alert('Huỷ đơn thành công');
                    window.location.reload();
                } else
                    alert('Huỷ đơn thất bại');
            })
        } else {
            //some code
        }
    }
</script>