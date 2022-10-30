<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 14/08/2022
  Time: 10:31 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<%--<ul class="pagination">--%>
<%--    <c:forEach begin="1" end="${Math.ceil(orders_count/8)}" var="i">--%>
<%--        <c:url value="/user/customer-orders/" var="c">--%>
<%--            <c:param value="${i}" name="pageOrder"/>--%>
<%--        </c:url>--%>
<%--        <li class="page-item"><a class="page-link" href="${c}">${i}</a></li>--%>
<%--    </c:forEach>--%>
<%--</ul>--%>

<%-------------- URL----------------%>
<c:url value="/user/customer-orders/update_prod_amount/" var="update"/>
<c:url value="/user/customer-orders/payment" var="payment"/>
<c:url value="/user/customer-orders/delete/" var="delete"/>
<%-------------- URL----------------%>

<div class="container">
    <h1>GIỎ HÀNG HIỆN TẠI</h1>
    <ul class="pagination">
        <c:forEach begin="1" end="${Math.ceil(countPro_Order/8)}" var="i">
            <c:url value="/user/customer-orders/" var="c">
                <c:param value="${i}" name="page"/>
            </c:url>
            <li class="page-item"><a class="page-link" href="${c}">${i}</a></li>
        </c:forEach>
    </ul>
    <table class="table" id="tbOrder">
        <thead class="table-success">
        <tr style="text-align: center">
            <th>Image</th>
            <th>Mã Sản Phẩm</th>
            <th>Tên</th>
            <th>Số lượng</th>
            <th>Đơn giá</th>
            <th>Phiếu giảm giá</th>
            <th>Thành Tiền</th>
        </tr>
        </thead>
        <tbody style="text-align: center">
        <c:forEach items="${orderWaitting}" var="p">
            <tr>
                <td>
                    <c:if test="${p.product.image.startsWith('https') == false}">
                        <img style="width: 60px;height: 80px" class="card-img-top" class="img-fluid"
                             src="https://res.cloudinary.com/dxxwcby8l/image/upload/v1647248722/r8sjly3st7estapvj19u.jpg"
                             alt="Card image">
                    </c:if>
                    <c:if test="${p.product.image.startsWith('https') == true}">
                        <img style="width: 60px;height: 80px" class="card-img-top" class="img-fluid"
                             src="${p.product.image}"
                             alt="Card image">
                    </c:if>
                </td>
                <td class="id_pro">${p.orderDetailsPK.idProduct}</td>
                <td class="name_pro">${p.product.nameProduct}</td>
                <td>
                    <input onchange="clickSave()" style="width: 20%; text-align: center" type="number"
                           name="quantity" class="sl" value="${p.amount}" min="1">
                    <a onclick="clickSave()" class="btn btn-success btn-save" type="button">Lưu</a>
                </td>
                <td class="price" style="text-align: right">${p.unitPrice}</td>
                <td class="discount">${p.idDiscount}</td>
                <td style="margin-left: 5px;"><span class="sub-total"><fmt:formatNumber type="number"
                                                                                        maxFractionDigits="3"
                                                                                        value="${p.amount * p.unitPrice}"/></span>
                    <a onclick="clickDelete()" style="float: right" class="btn btn-danger btn-delete"
                       type="button">Xóa</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="cart-total">
        <strong class="cart-total-title">Tổng Cộng:</strong>
        <span class="cart-total-price"><fmt:formatNumber type="number" maxFractionDigits="3"
                                                         value="${sumOrder}"/> VNĐ</span>
    </div>

    <c:forEach items="${sizeShop}" var="orderShop">
        <div style="margin-top: 50px">
            <h3>${orderShop}</h3>
            <table class="table">
                <thead class="table-success">
                <tr style="text-align: center">
                    <th>Image</th>
                    <th>Mã Sản Phẩm</th>
                    <th>Tên</th>
                    <th>Số lượng</th>
                    <th>Đơn giá</th>
                    <th>Phiếu giảm giá</th>
                    <th>Thành Tiền</th>
                </tr>
                </thead>
                <tbody style="text-align: center">
                <c:forEach items="${orderWaitting}" var="p">
                    <c:if test="${p.product.idShop.idShopStore.equals(orderShop) == true}">
                        <tr>
                            <td>
                                <c:if test="${p.product.image.startsWith('https') == false}">
                                    <img style="width: 60px;height: 80px" class="card-img-top" class="img-fluid"
                                         src="https://res.cloudinary.com/dxxwcby8l/image/upload/v1647248722/r8sjly3st7estapvj19u.jpg"
                                         alt="Card image">
                                </c:if>
                                <c:if test="${p.product.image.startsWith('https') == true}">
                                    <img style="width: 60px;height: 80px" class="card-img-top" class="img-fluid"
                                         src="${p.product.image}"
                                         alt="Card image">
                                </c:if>
                            </td>
                            <td class="id_pro">${p.orderDetailsPK.idProduct}</td>
                            <td class="name_pro">${p.product.nameProduct}</td>
                            <td>
                                <input onchange="clickSave()" style="width: 20%; text-align: center" type="number"
                                       name="quantity" class="sl" value="${p.amount}" min="1">
                                <a onclick="clickSave()" class="btn btn-success btn-save" type="button">Lưu</a>
                            </td>
                            <td class="price" style="text-align: right">${p.unitPrice}</td>

                            <c:forEach items="${shop_product}" var="s_item">
                                <c:if test="${s_item.product.idProduct == p.orderDetailsPK.idProduct && s_item.idDiscount.idDiscount != 1}">
                                    <c:if test="${s_item.idDiscount.percentDiscount != null}">
                                        <td class="discount">
                                            <fmt:formatNumber type="number" maxFractionDigits="3" value="${- p.product.unitPrice * (s_item.idDiscount.percentDiscount/100)}"/>
                                            VND
                                        </td>
                                        <td style="margin-left: 5px;"><span class="sub-total"><fmt:formatNumber type="number"
                                                                                                                maxFractionDigits="3"
                                                                                                                value="${p.amount * p.unitPrice - (p.amount * (p.product.unitPrice * s_item.idDiscount.percentDiscount/100))}"/></span>
                                            <a onclick="clickDelete()" style="float: right" class="btn btn-danger btn-delete"
                                               type="button">Xóa</a>
                                        </td>
                                    </c:if>
                                    <c:if test="${s_item.idDiscount.valueDiscount != null}">
                                        <td class="discount">
                                            <fmt:formatNumber type="number" maxFractionDigits="3" value="${- s_item.idDiscount.valueDiscount}"/>
                                            VND
                                        </td>
                                        <td style="margin-left: 5px;"><span class="sub-total"><fmt:formatNumber type="number"
                                                                                                                maxFractionDigits="3"
                                                                                                                value="${p.amount * p.unitPrice - (p.amount * s_item.idDiscount.valueDiscount)}"/></span>
                                            <a onclick="clickDelete()" style="float: right" class="btn btn-danger btn-delete"
                                               type="button">Xóa</a>
                                        </td>
                                    </c:if>
                                </c:if>
                                <c:if test="${s_item.product.idProduct == p.orderDetailsPK.idProduct && s_item.idDiscount.idDiscount == 1}">
                                    <td class="discount">${p.idDiscount}</td>
                                    <td style="margin-left: 5px;"><span class="sub-total"><fmt:formatNumber type="number"
                                                                                                            maxFractionDigits="3"
                                                                                                            value="${p.amount * p.unitPrice}"/></span>
                                        <a onclick="clickDelete()" style="float: right" class="btn btn-danger btn-delete"
                                           type="button">Xóa</a>
                                    </td>
                                </c:if>
                            </c:forEach>
                        </tr>
                    </c:if>
                </c:forEach>
                </tbody>
            </table>

            <div class="cart-total">
                <strong class="cart-total-title">Tổng Cộng:</strong>
                <span class="cart-total-shop-price"></span>
            </div>

            <div style="margin-bottom: 30px;margin-top: 15px">
                <a onclick="clickPay('${orderShop}')" class="btn btn-success btn-pay"
                   style="float: right; font-size: 30px"> THANH TOÁN </a>
            </div>
        </div>
    </c:forEach>

</div>
<style>
    .cart-header {
        font-weight: bold;
        font-size: 1.25em;
        color: #333;
    }

    .cart-column {
        display: flex;
        align-items: center;
        border-bottom: 1px solid black;
        margin-right: 1.5em;
        padding-bottom: 10px;
        margin-top: 10px;
    }

    .cart-row {
        display: flex;
    }

    .cart-item {
        width: 45%;
    }

    .cart-price {
        width: 20%;
        font-size: 1.2em;
        color: #333;
    }

    .cart-quantity {
        width: 35%;
    }

    .cart-item-title {
        color: #333;
        margin-left: .5em;
        font-size: 1.2em;
    }

    .cart-item-image {
        width: 75px;
        height: auto;
        border-radius: 10px;
    }

    .btn-danger {
        color: white;
        background-color: #EB5757;
        border: none;
        border-radius: .3em;
        font-weight: bold;
    }

    .btn-danger:hover {
        background-color: #CC4C4C;
    }

    .cart-quantity-input {
        height: 34px;
        width: 50px;
        border-radius: 5px;
        border: 1px solid #56CCF2;
        background-color: #eee;
        color: #333;
        padding: 0;
        text-align: center;
        font-size: 1.2em;
        margin-right: 25px;
    }

    .cart-row:last-child {
        border-bottom: 1px solid black;
    }

    .cart-row:last-child .cart-column {
        border: none;
    }

    .cart-total {
        text-align: end;
        margin-top: 10px;
        margin-right: 10px;
    }

    .cart-total-title {
        font-weight: bold;
        font-size: 1.5em;
        color: black;
        margin-right: 20px;
    }

    .cart-total-price {
        color: #333;
        font-size: 1.1em;
    }
</style>
<script>
    var luu_cart = document.getElementsByClassName("btn-save");
    var input_amount = document.getElementsByClassName("sl");
    var id_prod = document.getElementsByClassName("id_pro");
    var sub_tol = document.getElementsByClassName("sub-total");
    var price = document.getElementsByClassName("price");
    var total = document.getElementsByClassName("cart-total-price");
    var total_per_shop = document.getElementsByClassName("cart-total-shop-price");

    function clickSave() {
        var sum = 0;
        for (var i = 0; i < luu_cart.length; i++) {
            var button = luu_cart[i]
            var amount = input_amount[i].value;
            var id = id_prod[i].innerHTML;
            var pric = price[i].innerHTML
            var sub_total = parseInt(amount) * parseFloat(pric)
            button.setAttribute("value", id + "/" + amount)
            sub_tol[i].setAttribute("value", sub_total)
            sub_tol[i].innerHTML = sub_total
            sum += sub_total

            button.setAttribute("href", "${update}" + id_prod[i].innerHTML + "/" + (input_amount[i].value))
        }
        total[0].setAttribute("value", sum)
        total[0].innerHTML = sum
    }


    var btn_pay = document.getElementsByClassName("btn-pay");

    function clickPay(idS) {
        var answer = window.confirm("Save data?");

        if(${checkCus == true}){
            if (answer) {
                if ("${countPro_Order}" >= 1) {
                    for (var i = 0; i < btn_pay.length; i++) {
                        btn_pay[i].setAttribute("href", "${payment}" + "/" + idS + "/" + "${sumOrder}");
                    }
                } else {
                    alert("Hiện tại bạn chưa có món đồ nào!")
                }
            } else {
                //some code
            }
        } else if(${checkCus == false}) {
            var checkCust = window.confirm("Thông tin địa chỉ chưa chính xác!!");
            if (checkCust) {
                alert("Yêu cầu phải nhập thông tin địa chỉ chính xác!")
            } else {
                //some code
            }
        }

    }

    var xoa_cart = document.getElementsByClassName("btn-delete")

    function clickDelete() {
        var answer = window.confirm("Delete data?");
        if (answer) {
            for (var i = 0; i < xoa_cart.length; i++) {
                var btnXoa = xoa_cart[i]
                var id = id_prod[i].innerHTML;
                btnXoa.setAttribute("href", "${delete}" + id)
            }
        } else {
            //some code
        }
    }

    window.onload = function () {
        var i = 0;
        <c:forEach items="${totalPerShop}" var="totals">
            total_per_shop[i].innerText = "<fmt:formatNumber type="number" maxFractionDigits="3" value="${totals}"/>" + " VNĐ";
            i++;
        </c:forEach>
    }

</script>