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

<%--<ul class="pagination">--%>
<%--    <c:forEach begin="1" end="${Math.ceil(orders_count/8)}" var="i">--%>
<%--        <c:url value="/user/customer-orders/" var="c">--%>
<%--            <c:param value="${i}" name="pageOrder"/>--%>
<%--        </c:url>--%>
<%--        <li class="page-item"><a class="page-link" href="${c}">${i}</a></li>--%>
<%--    </c:forEach>--%>
<%--</ul>--%>

<c:url value="/user/customer-orders" var="url"/>
<div class="content">
    <h1>GIỎ HÀNG HIỆN TẠI</h1>
<%--        <c:forEach items="${order_details_waitting}" var="p" begin="0" end="${Math.ceil(order_details_waitting/2)}">--%>
<%--            <div class="col-md-3 col-xs-12" style="padding: 5px;">--%>
<%--                <div class="card">--%>
<%--                    <img class="card-img-top" class="img-fluid"--%>
<%--                         src="https://res.cloudinary.com/dxxwcby8l/image/upload/v1647248722/r8sjly3st7estapvj19u.jpg"--%>
<%--                         alt="Card image">--%>
<%--                    <div class="card-body">--%>
<%--&lt;%&ndash;                        <h4 class="card-title">${p.orderDetailsPK[0]}</h4>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <p class="card-text">Số lượng: ${p.orderDetailsPK[1]}</p>&ndash;%&gt;--%>
<%--                        <p class="card-text">Số lượng: ${p.amount}</p>--%>
<%--                        <p class="card-text">--%>
<%--                            <fmt:formatNumber type="number" maxFractionDigits="3" value="${p.unitPrice}"/> VND--%>
<%--                        </p>--%>
<%--                        <a href="${cUrl}" class="btn btn-primary">Xem chi tiet</a>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </c:forEach>--%>

</div>

