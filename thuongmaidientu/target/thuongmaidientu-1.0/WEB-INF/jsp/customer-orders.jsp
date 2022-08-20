<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 14/08/2022
  Time: 10:31 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link rel="stylesheet" href="src/main/webapp/resources/css/style.css"/>

<ul class="pagination">
    <c:forEach begin="1" end="${Math.ceil(orders_count/8)}" var="i">
        <c:url value="/" var="c">
            <c:param value="${i}" name="pageOrder"  />
        </c:url>
        <li class="page-item"><a class="page-link" href="${c}">${i}</a></li>
    </c:forEach>
</ul>


<nav class="nav nav-pills nav-justified">
    <div class="nav-item">
        <button type="button" class="btn btn-outline-success me-2">Giở Hàng Hiện Tại</button>
    </div>
    <div class="nav-item">
        <c:url value="/user/customer-orders/" var="cUrl_1"></c:url>
        <form action="${cUrl}">
            <button name="idStatus" value="${cUrl_1}1" type="submit" type="button" class="btn btn-outline-success me-2">
                Đơn Hàng Đã Đặt
            </button>
        </form>
    </div>
    <div class="nav-item">
        <c:url value="/user/customer-orders/" var="cUrl_2"></c:url>
        <form action="${cUrl}">
            <button name="idStatus" value="${cUr_2l}2" type="submit" class="btn btn-outline-success me-2">Đơn Hàng Đang Xử Lý</button>
        </form>
    </div>
    <div class="nav-item">
        <a class="nav-link disabled" href="#">Disabled</a>
    </div>
</nav>

<%----%>
<div class="content">


</div>
<%----%>
<c:choose>
    <c:when test="${param.idStatus=='1'}">
        <c:forEach items="${orders_cus}" var="p">
            <div class="col-md-3 col-xs-12" style="padding: 5px;">
                <div class="card">
                    <img class="card-img-top" class="img-fluid"
                         src="https://res.cloudinary.com/dxxwcby8l/image/upload/v1647248722/r8sjly3st7estapvj19u.jpg"
                         alt="Card image">
                    <div class="card-body">
                        <h4 class="card-title">${p.idOrders}</h4>
                        <p class="card-text">
                            <fmt:formatNumber type="number" maxFractionDigits="3" value="${p.totalMoney}"/> VND
                        </p>
                        <p class="card-text">${p.timeBooked}</p>
                        <a href="${cUrl}" class="btn btn-primary">Xem chi tiet</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </c:when>
    <c:otherwise>
        /../
    </c:otherwise>
</c:choose>
<%----%>

<script src="<c:url value="/js/product.js" />"></script>
<script>
    <c:url value="/api/products" var="u" />
    window.onload = function () {
        loadAdminProduct("${u}")
    }
</script>


</html>
