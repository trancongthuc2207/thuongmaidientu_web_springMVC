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
    <c:url value="/shop-manager/orders" var="fil"/>
    <form class="form-select-filter" action="${fil}">
        <div class="form-check">
            <input onchange="clickRest()" class="form-check-input" type="radio" name="filter" id="flexRadioDefault">
            <label class="form-check-label" for="flexRadioDefault">
                Tất cả
            </label>
        </div>
        <div class="form-check">
            <input onchange="this.form.submit()" value="today" class="form-check-input" type="radio" name="filter" id="flexRadioDefault1">
            <label class="form-check-label" for="flexRadioDefault1">
                Hôm nay
            </label>
        </div>
        <div class="form-check">
            <input onchange="this.form.submit()" value="yesterday" class="form-check-input" type="radio" name="filter" id="flexRadioDefault2">
            <label class="form-check-label" for="flexRadioDefault2">
                Hôm qua
            </label>
        </div>
        <div class="form-check">
            <input onchange="this.form.submit()" value="moreday" class="form-check-input" type="radio" name="filter" id="flexRadioDefault3">
            <label class="form-check-label" for="flexRadioDefault3">
                Nhiều ngày qua
            </label>
        </div>
    </form>
    <div class="row">
        <h1 id="header-dh">Đơn Hàng</h1>
        <c:forEach items="${listOrdFilter}" var="p">
            <div class="col-md-3 col-xs-12" style="padding: 5px;">
                <form action="#">
                    <div class="card" <c:if test="${p.stt == '1'}">style="background-color: #FF0066" </c:if>>
                        <img class="card-img-top" class="img-fluid"
                             src="https://res.cloudinary.com/dxxwcby8l/image/upload/v1647248722/r8sjly3st7estapvj19u.jpg"
                             alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title id_ord" id="id_ord">Từ đơn hàng: ${p.orderDetailsPK.idOrderDetails}</h4>
                            <h4 class="card-title id_pro" id="id_pro">Mã sản phẩm: ${p.orderDetailsPK.idProduct}</h4>
                            <h5 class="card-text">Tên sản phẩm: ${p.product.nameProduct}</h5>
                            <p class="card-text">Đơn giá: <fmt:formatNumber type="number" maxFractionDigits="3"
                                                                            value="${p.product.unitPrice}"/></p>
                            <p class="card-text">Mã Discount: ${p.idDiscount.nameDiscount} - Active</p>
                            <p class="card-text">Tổng giá trị: <fmt:formatNumber type="number" maxFractionDigits="3"
                                                                                 value="${p.product.unitPrice * p.amount}"/></p>
                            <p class="card-text">Ngày khách đặt: ${p.dateCreated}</p>
                            <p>
                                <a onclick="clickAccept(${p.orderDetailsPK.idOrderDetails},${p.orderDetailsPK.idProduct})" href="#" class="btn btn-primary"> Duyệt </a>
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
</div>

<script>
    window.onload = function (){
        event.preventDefault();
        var flexRadioDefault1 = document.getElementById("flexRadioDefault1");
        var flexRadioDefault2 = document.getElementById("flexRadioDefault2");
        var flexRadioDefault3 = document.getElementById("flexRadioDefault3");
        var head = document.getElementById("header-dh");

        document.getElementById("flexRadioDefault").checked = true;
        head.innerText = 'Tất cả đơn hàng.';

        if(window.location == "http://localhost:8080/thuongmaidientu/shop-manager/orders?filter=today"){
            document.getElementById("flexRadioDefault1").checked = true;
            head.innerText = 'Đơn hàng ngày hôm nay.';
        }
        if(window.location == "http://localhost:8080/thuongmaidientu/shop-manager/orders?filter=yesterday")
        {
            document.getElementById("flexRadioDefault2").checked = true;
            head.innerText = 'Đơn hàng ngày hôm qua.';
        }
        if(window.location == "http://localhost:8080/thuongmaidientu/shop-manager/orders?filter=moreday")
        {
            document.getElementById("flexRadioDefault3").checked = true;
            head.innerText = 'Đơn hàng quá 2 ngày.';
        }
    }
    function clickRest(){
        window.location.href = "http://localhost:8080/thuongmaidientu/shop-manager/orders";
    }

    function clickAccept(idOrd,idPro){
        var answer = window.confirm("Accept data?");
        if (answer) {
            fetch('http://localhost:8080/thuongmaidientu/api/accept-order',{
                method: 'post',
                body: JSON.stringify({
                    "idPro":idPro.toString(),
                    "idOrd":idOrd.toString()
                }),
                headers: {
                    "Content-Type": "application/json"
                }
            }).then(function (res) {
                if (res.status === 200) {
                    alert('Duyệt đơn thành công');
                    window.location.reload();
                }
                else
                    alert('Duyện đơn không thành công');
            })
        } else {
            //some code
        }
    }
</script>
