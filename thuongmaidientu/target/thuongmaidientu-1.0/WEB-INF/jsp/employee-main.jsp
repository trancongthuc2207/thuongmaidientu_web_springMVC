<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 31/08/2022
  Time: 11:33 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8" %>

<div class="row" style="margin-top: 50px">
    <h1 style="text-align: center"> TRANG NHÂN VIÊN </h1>
    <div>
        <h4> Kiểm tra đơn hàng của khách hàng </h4>
        <ul class="pagination">
            <c:forEach begin="1" end="${Math.ceil(orders_count/8)}" var="i">
                <c:url value="/employee/" var="c">
                    <c:param value="${i}" name="pageOrder"/>
                </c:url>
                <li class="page-item"><a class="page-link" href="${c}">${i}</a></li>
            </c:forEach>
        </ul>
        <div style="display: flex;position: relative;height: 700px;overflow-y: scroll;justify-content: space-around;">
            <c:forEach items="${listOrder}" var="order">
                <div style="margin-top: 10px">
                    <h3 style="margin-left: 10px" class="btn btn-primary btnOpenOrder"
                        type="button">${order.idOrders}</h3>
                    <div>
                        <div class="content-order" style="margin-top: 50px; display: flex; position: absolute;left: 0;">
                            <c:set var="isFullFinsihed" scope="session" value="${0}"/>
                            <c:forEach items="${listOrderDetails}" var="detail">
                                <c:if test="${order.idOrders == detail.orderDetailsPK.idOrderDetails}">
                                    <div class="row"
                                         style="margin-top: 15px;margin-left: 15px;display: inline-block; border-style: solid;
                                         <c:if test="${detail.stt == '1'}">background-color: goldenrod</c:if>
                                         <c:if test="${detail.stt == '2'}">background-color: #04AA6D</c:if>">
                                        <h5>Shop: ${detail.product.idShop.idShopStore}</h5>
                                        <h6>Mã sản phẩm: ${detail.orderDetailsPK.idProduct}</h6>
                                        <p>Tổng giá: ${detail.amount * detail.unitPrice}</p>
                                        <p>Ngày khách tạo: ${detail.dateCreated}</p>
                                        <p>Ngày shop duyệt: ${detail.dateShopaccept}</p>
                                        <c:if test="${detail.stt == '1'}">
                                            <c:set var="isFullFinsihed" scope="session" value="${1}"/>
                                            <p>Tình trạng: Shop chưa duyệt</p>
                                            <a href="#"
                                               onclick="clickSendRp('${detail.product.idShop.idShopStore}', '${idEmployee}', ${detail.orderDetailsPK.idProduct})"
                                               id="rpShop" type="button" style="background-color: #DC0404"
                                               class="btn btn-primary"> Báo
                                                cáo
                                                Shop</a>
                                        </c:if>
                                        <c:if test="${detail.stt == '2'}">
                                            <p>Tình trạng: Shop đã duyệt</p>
                                            <a style="background-color: blue" type="button" class="btn btn-primary">
                                                Hoàn
                                                Thành</a>
                                        </c:if>
                                    </div>
                                </c:if>
                            </c:forEach>
                            <c:if test="${isFullFinsihed == 0}">
                                <a style="margin-top: 15px;margin-left: 15px;background-color: blue" type="button" onclick="clickConfirmOrder_Full(${order.idOrders})"
                                   class="btn btn-primary"> Đơn hàng thành công</a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <div style="margin-top: 50px">
        <h4>QUẢN LÝ CÁC SẢN PHẨM</h4>
        <div style="display: flex;position: relative;height: 700px;overflow-y: scroll;justify-content: space-around;">
            <c:forEach items="${listTypeProduct}" var="type">
                <div style="margin-top: 10px">
                    <h3 style="margin-left: 10px" class="btn btn-primary btnOpenOrder"
                        type="button">${type.typeName}</h3>
                    <div>
                        <div class="content-order" style="margin-top: 50px; display: flex; position: absolute;left: 0;">
                            <c:forEach items="${listProduct}" var="pro">
                                <c:if test="${type.idTypeProduct == pro.typeOfProduct.idTypeProduct}">
                                    <div class="row"
                                         style="margin-top: 15px;margin-left: 15px;display: inline-block; border-style: solid;">
                                        <h3>Shop: ${pro.idShop.idShopStore}</h3>
                                        <h5>Mã sản phẩm: ${pro.idProduct}</h5>
                                        <h6>Tên sản phẩm: ${pro.nameProduct}</h6>
                                        <p>Giá: ${pro.unitPrice}</p>
                                        <p>Mô tả: ${pro.productDescription}</p>
                                        <p>Ngày shop tạo: ${pro.dateCreated}</p>
                                        <a href="#" onclick="clickConfirmPro(${pro.idProduct})"
                                           id="confirmPro" type="button" style="background-color: #DC0404"
                                           class="btn btn-primary"> Duyệt </a>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

    </div>
</div>
<script>

    var content = document.getElementsByClassName("content-order");
    var btnOpenOr = document.getElementsByClassName("btnOpenOrder");

    window.onload = function () {
        for (var i = 0; i < content.length; i++) {
            content[i].style.display = 'none';
            content[0].style.display = 'block';
            btnOpenOr[0].style.background = '#00FFFF';
            btnOpenOr[i].setAttribute("onclick", "changeBackgroundBtn(" + i + ");");
            // btnCloseOr[i].setAttribute("onclick", "content[" + i + "].style.display = 'none'");

        }
    }

    function changeBackgroundBtn(i) {
        for (var y = 0; y < content.length; y++) {
            content[y].style.display = 'none';
            btnOpenOr[y].style.background = '#0d6efd';
        }
        content[i].style.display = 'block';
        btnOpenOr[i].style.background = '#00FFFF';
    }

    function clickSendRp(idShop, idEmploy, idPro) {
        var answer = window.confirm("Do you want to sent Report to Shop?");
        if (answer) {
            var typeRp = "5";
            var descript = "Yêu cầu shop duyệt đối với Sản phẩm " + idPro.toString();

            fetch("http://localhost:8080/thuongmaidientu/api/send-rp-employee-shop", {
                method: 'post',
                body: JSON.stringify({
                    "typeRp": typeRp.toString(),
                    "idShop": idShop.toString(),
                    "descrip": descript.toString(),
                    "idEmp": idEmploy.toString(),
                    "idPro": idPro.toString()
                }),
                headers: {
                    "Content-Type": "application/json"
                }
            }).then(function (res) {
                if (res.status === 200) {
                    alert('Báo cáo shop thành công');
                } else
                    alert('Báo cáo không thành công');
            })
        } else {
            //some code
        }
    }

    function clickConfirmPro(idPro) {
        var answer = window.confirm("Do you want to sent Report to Shop?");
        if (answer) {
            fetch("http://localhost:8080/thuongmaidientu/api/add-shop-product", {
                method: 'post',
                body: JSON.stringify({
                    "idPro": idPro.toString()
                }),
                headers: {
                    "Content-Type": "application/json"
                }
            }).then(function (res) {
                if (res.status === 200) {
                    alert('Duyệt sản phẩm vào shop thành công');
                    window.location.reload();
                } else
                    alert('Duyệt thất bại không thành công');
            })
        } else {
            //some code
        }
    }

    function clickConfirmOrder_Full(idOrder) {
        var answer = window.confirm("Do you want to confirm this order's full?");
        if (answer) {
            fetch("http://localhost:8080/thuongmaidientu/api/confirm-order-full", {
                method: 'post',
                body: JSON.stringify({
                    "idOrd": idOrder.toString()
                }),
                headers: {
                    "Content-Type": "application/json"
                }
            }).then(function (res) {
                if (res.status === 200) {
                    alert('Xác nhận đơn hàng đã đầy thành công');
                    window.location.reload();
                } else
                    alert('Xác nhận thất bại');
            })
        } else {
            //some code
        }
    }

</script>