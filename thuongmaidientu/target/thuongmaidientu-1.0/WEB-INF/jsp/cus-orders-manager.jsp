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
    <nav class="nav nav-pills nav-justified">
        <div class="nav-item">
            <form action="${url}">
                <button type="submit" class="btn btn-outline-success me-2">Đơn Hàng Đã Đặt</button>
            </form>
        </div>
        <div class="nav-item">
            <c:url value="/user/cus-orders-manager/wait" var="stt2"/>
            <form action="${stt2}">
                <button type="submit" class="btn btn-outline-success me-2">Đơn Hàng Đang Xử Lý</button>
            </form>
        </div>
    </nav>
    <ul class="pagination page1">
        <c:forEach begin="1" end="${Math.ceil(orders_count/8)}" var="i">
            <c:url value="/user/cus-orders-manager/" var="c">
                <c:param value="${i}" name="pageOrder"/>
            </c:url>
            <li class="page-item"><a class="page-link" href="${c}">${i}</a></li>
        </c:forEach>
    </ul>
    <ul class="pagination page2">
        <c:forEach begin="1" end="${Math.ceil(orders_count/8)}" var="i">
            <c:url value="/user/cus-orders-manager/wait" var="c">
                <c:param value="${i}" name="pageOrder"/>
            </c:url>
            <li class="page-item"><a class="page-link" href="${c}">${i}</a></li>
        </c:forEach>
    </ul>
    <div class="container-fluid row" style="margin-top: 10px">
        <c:forEach items="${orders_cus}" var="order" begin="0" >
            <div class="col-md-3 col-xs-12" style="padding: 5px;">
                <div class="card" <c:if test="${order[3] == 1}"> style="background-color: goldenrod" </c:if>
                        <c:if test="${order[3] == 2}"> style="background-color: greenyellow" </c:if>>
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

                        <c:url value="/order-details" var="details">
                            <c:param name="idOder" value="${order[0]}"></c:param>
                        </c:url>
                        <a href="${details}" class="btn btn-primary">Xem chi tiet</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<script>
    var type = "";
    var page1 = document.getElementsByClassName("page1");
    var page2 = document.getElementsByClassName("page2");
    window.onload = function (){
        if (window.location == "http://localhost:8080/thuongmaidientu/user/cus-orders-manager?"
            || window.location.href.includes("cus-orders-manager") == true)
        {
            type = 1;
        }
        if (window.location == "http://localhost:8080/thuongmaidientu/user/cus-orders-manager/wait?"
            || window.location.href.includes("cus-orders-manager/wait") == true)
        {
            type = 2;
        }

        if(type == 1)
        {
            page2[0].style.display = "none";
        }
        if(type == 2){
            page1[0].style.display = "none";
        }
    }

</script>