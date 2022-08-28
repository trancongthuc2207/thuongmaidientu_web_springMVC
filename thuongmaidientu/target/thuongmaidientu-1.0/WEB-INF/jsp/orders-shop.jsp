<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 27/08/2022
  Time: 7:00 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row" style="margin-top: 30px">
    <h1>TRANG ORDERS</h1>
    <%--  ----------------------- ĐƠN HÀNG ----------------------------  --%>
    <c:forEach items="${listOrd}" var="p">
        <div class="col-md-3 col-xs-12" style="padding: 5px;">
            <form action="#">
                <div class="card">
                    <img class="card-img-top" class="img-fluid"
                         src="https://res.cloudinary.com/dxxwcby8l/image/upload/v1647248722/r8sjly3st7estapvj19u.jpg"
                         alt="Card image">
                    <div class="card-body">
                        <h4 class="card-title id_ord">Từ đơn hàng: ${p.orderDetailsPK.idOrderDetails}</h4>
                        <h4 class="card-title id_pro">Mã sản phẩm: ${p.orderDetailsPK.idProduct}</h4>
                        <h5 class="card-text">Tên sản phẩm: ${p.product.nameProduct}</h5>
                        <p class="card-text">Đơn giá: <fmt:formatNumber type="number" maxFractionDigits="3"
                                                                        value="${p.product.unitPrice}"/></p>
                        <p class="card-text">Mã Discount: ${p.idDiscount.nameDiscount} - Active</p>
                        <p class="card-text">Tổng giá trị: <fmt:formatNumber type="number" maxFractionDigits="3"
                                                                             value="${p.product.unitPrice * p.amount}"/></p>
                        <p>
                            <a href="#" class="btn btn-primary"> Duyệt </a>
                            <a href="#" class="btn btn-primary"> Hết hàng </a>
                        </p>
                    </div>
                </div>
            </form>
        </div>
    </c:forEach>

    <div>
        <%--        PHÂN TRANG     --%>
        <ul class="pagination" style="align-items: center">
            <c:forEach begin="1" end="${Math.ceil(countOrd/8)}" var="i">
                <c:url value="/shop-manager/orders/" var="c">
                    <c:param value="${i}" name="page"/>
                </c:url>
                <li class="page-item"><a class="page-link" href="${c}">${i}</a></li>
            </c:forEach>
        </ul>
    </div>
</div>
