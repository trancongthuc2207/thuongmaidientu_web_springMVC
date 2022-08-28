<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 18/08/2022
  Time: 10:24 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:url value="/user/cus-orders-manager" var="url"/>
<div class="container">
    <ul class="pagination">
        <c:forEach begin="1" end="${Math.ceil(orders_count/8)}" var="i">
            <c:url value="/user/cus-orders-manager/" var="c">
                <c:param value="${i}" name="pageOrder"/>
            </c:url>
            <li class="page-item"><a class="page-link" href="${c}">${i}</a></li>
        </c:forEach>
    </ul>
    <nav class="nav nav-pills nav-justified">
        <div class="nav-item">
            <form action="${url}">
                <button name="idStatus" value="1" type="submit" class="btn btn-outline-success me-2">Đơn Hàng Đã Đặt</button>
            </form>
        </div>
        <div class="nav-item">
            <form action="${url}">
                <button name="idStatus" value="2" type="submit" class="btn btn-outline-success me-2">Đơn Hàng Đang Xử Lý</button>
            </form>
        </div>
    </nav>
    <div class="container-fluid" style="margin-top: 10px">
        <c:forEach items="${orders_cus}" var="order" begin="0" >
            <div class="col-md-3 col-xs-12" style="padding: 5px;">
                <div class="card">
                    <img class="card-img-top" class="img-fluid"
                         src="https://res.cloudinary.com/dxxwcby8l/image/upload/v1647248722/r8sjly3st7estapvj19u.jpg"
                         alt="Card image">
                    <div class="card-body">
                        <h4 class="card-title">${order[0]}</h4>
                        <p class="card-text">
                            <fmt:formatNumber type="number" maxFractionDigits="3" value="${order[1]}"/> VND
                        </p>
                        <p class="card-text">${order[2]}</p>
                        <p class="card-text">${order[3]}</p>
                        <a href="${cUrl}" class="btn btn-primary">Xem chi tiet</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
