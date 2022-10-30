<%-- 
    Document   : index
    Created on : Jul 10, 2022, 1:27:12 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<div class="container">
    <ul class="nav nav-pills navTask">
        <%--    QUẢNG CÁO  --%>
        <div id="mySidenav" class="sidenav" style="background-image: linear-gradient(#7C0D0D, #DC0404);">
            <div class="dropdown">
                <button class="dropbtn"
                        [ngStyle]="{'color': 'white','font-style': 'bold', 'font-size': '20.01px', 'font-family':'sans-serif'}">
                    Screening
                </button>
                <div class="dropdown-content">
                    <a href="#">Link 1</a>
                    <a href="#">Link 2</a>
                    <a href="#">Link 3</a>
                </div>
            </div>
        </div>
        <%--     ------------       --%>
        <%--     NAV HEADER PAGE INDEX      --%>
        <sec:authorize access="!isAuthenticated()">
            <li class="nav-item dropdown">
                <div class="dropdown-right">
                    <c:url value="#" var="urlShop"></c:url> <%-- Chuyển đến form đăng ký Shop --%>
                    <a type="submit"
                       class="btn btn-sm btn-secondary dropdown-toggle dropdown-toggle-split dropbtn-right-side"
                       href="${urlShop}"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <span
                            class="fas fa-user-circle"></span> Kênh Buôn Bán </a>
                    <div class="dropdown-content-right">
                        <div class="speech-bubble"><i> </i>Bạn muốn trở thành người bán hàng ? Đăng ký ngay!</div>
                    </div>
                </div>
            </li>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_SHOP')">
            <li class="nav-item dropdown">
                <div class="dropdown-right">
                    <c:url value="/shop-manager" var="urlShop"></c:url>
                    <a type="submit"
                       class="btn btn-sm btn-secondary dropdown-toggle dropdown-toggle-split dropbtn-right-side"
                       href="${urlShop}"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <span
                            class="fas fa-user-circle"></span> Quản Lý Cửa Hàng </a>
                    <div class="dropdown-content-right">

                    </div>
                </div>
            </li>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_USER')">
            <li class="nav-item dropdown">
                <div class="dropdown-right">
                    <c:url value="#" var="urlShop"></c:url>
                    <a type="submit"
                       class="btn btn-sm btn-secondary dropdown-toggle dropdown-toggle-split dropbtn-right-side"
                       href="${urlShop}"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <span
                            class="fas fa-user-circle"></span> Kênh Buôn Bán </a>
                    <div class="dropdown-content-right">
                        <div class="speech-bubble"><i> </i>Bạn muốn trở thành người bán hàng ?</div>
                    </div>
                </div>
            </li>
        </sec:authorize>
    </ul>

    <div class="row">
        <h1 style="height: 100px;font-size: 60px;padding: 15px;text-align: center; background-color: #56CCF2">TẤT CẢ CÁC
            SẢN PHẨM</h1>
        <%--    PHAN TRANG   --%>
        <ul class="pagination">
            <c:forEach begin="1" end="${Math.ceil(productCounter/8)}" var="i">
                <c:url value="/" var="c">
                    <c:param value="${i}" name="page"/>
                </c:url>
                <li class="page-item"><a class="page-link" href="${c}">${i}</a></li>
            </c:forEach>
        </ul>
        <%--    SAN PHAM    --%>
        <c:forEach items="${products}" var="p">
            <c:url value="/products/" var="cUrl">
                <c:param name="ID_Product" value="${p.idProduct}"/>
            </c:url>
            <c:url value="/add_pro/" var="prodID"></c:url>
            <div class="col-md-3 col-xs-12" style="padding: 5px;">
                <form action="${prodID}${p.idProduct}">
                    <div class="card">
                        <c:if test="${p.image.startsWith('https') == false}">
                            <img style="width: 300px;height: 250px" class="card-img-top" class="img-fluid"
                                 src="https://res.cloudinary.com/dxxwcby8l/image/upload/v1647248722/r8sjly3st7estapvj19u.jpg"
                                 alt="Card image">
                        </c:if>
                        <c:if test="${p.image.startsWith('https') == true}">
                            <img style="width: 300px;height: 250px" class="card-img-top" class="img-fluid"
                                 src="${p.image}"
                                 alt="Card image">
                        </c:if>
                        <div class="card-body">
                            <h4 class="card-title">${p.nameProduct}</h4>
                            <p class="card-text">
                                <fmt:formatNumber type="number" maxFractionDigits="3" value="${p.unitPrice}"/> VND
                            </p>

                            <c:forEach items="${shop_product}" var="s_item">
                                <c:if test="${s_item.product.idProduct == p.idProduct && s_item.idDiscount.idDiscount != 1}">
                                    <c:if test="${s_item.idDiscount.percentDiscount != null}">
                                        <p class="card-text" style="background-color: red">${s_item.idDiscount.nameDiscount}</p>
                                        <p class="card-text">
                                            <fmt:formatNumber type="number" maxFractionDigits="3" value="${p.unitPrice - p.unitPrice * (s_item.idDiscount.percentDiscount/100)}"/>
                                            VND
                                        </p>
                                    </c:if>
                                    <c:if test="${s_item.idDiscount.valueDiscount != null}">
                                        <p class="card-text" style="background-color: red">${s_item.idDiscount.nameDiscount}</p>
                                        <p class="card-text">
                                            <fmt:formatNumber type="number" maxFractionDigits="3" value="${p.unitPrice - s_item.idDiscount.valueDiscount}"/>
                                            VND
                                        </p>
                                    </c:if>
                                </c:if>
                            </c:forEach>

                            <sec:authorize access="hasAnyRole('ROLE_USER')">
                                <a href="${cUrl}" class="btn btn-primary">Xem chi tiet</a>
                                <button class="btn btn-primary" onclick="clickAddCartPro(${idOr},${p.idProduct},'${idCust}')">Đặt Hàng
                                </button>
                            </sec:authorize>
                        </div>
                    </div>
                </form>
            </div>
        </c:forEach>
    </div>

    <div>
        <sec:authorize access="hasRole('ROLE_USER')">
            <div class="row">
                <h1 style="height: 100px;font-size: 60px;padding: 15px;text-align: center; background-color: #56CCF2">CÓ
                    THỂ BẠN SẼ THÍCH</h1>
                <c:forEach items="${lstProductFavor}" var="pV">
                    <c:url value="/products/" var="cUrl">
                        <c:param name="ID_Product" value="${pV.idProduct}"/>
                    </c:url>
                    <c:url value="/add_pro/" var="prodID"></c:url>
                    <div class="col-md-3 col-xs-12" style="padding: 5px;">
                        <form action="${prodID}${pV.idProduct}">
                            <div class="card" >
                                <c:if test="${pV.image.startsWith('https') == false}">
                                    <img style="width: 300px;height: 250px" class="card-img-top" class="img-fluid"
                                         src="https://res.cloudinary.com/dxxwcby8l/image/upload/v1647248722/r8sjly3st7estapvj19u.jpg"
                                         alt="Card image">
                                </c:if>
                                <c:if test="${pV.image.startsWith('https') == true}">
                                    <img style="width: 300px;height: 250px" class="card-img-top" class="img-fluid"
                                         src="${pV.image}"
                                         alt="Card image">
                                </c:if>
                                <div class="card-body">
                                    <h4 class="card-title">${pV.nameProduct}</h4>
                                    <p class="card-text">
                                        <fmt:formatNumber type="number" maxFractionDigits="3" value="${pV.unitPrice}"/>
                                        VND
                                    </p>

                                    <c:forEach items="${shop_product}" var="s_item">
                                        <c:if test="${s_item.product.idProduct == pV.idProduct && s_item.idDiscount.idDiscount != 1}">
                                            <c:if test="${s_item.idDiscount.percentDiscount != null}">
                                                <p class="card-text" style="background-color: red">${s_item.idDiscount.nameDiscount}</p>
                                                <p class="card-text">
                                                    <fmt:formatNumber type="number" maxFractionDigits="3" value="${pV.unitPrice - pV.unitPrice * (s_item.idDiscount.percentDiscount/100)}"/>
                                                    VND
                                                </p>
                                            </c:if>
                                            <c:if test="${s_item.idDiscount.valueDiscount != null}">
                                                <p class="card-text" style="background-color: red">${s_item.idDiscount.nameDiscount}</p>
                                                <p class="card-text">
                                                    <fmt:formatNumber type="number" maxFractionDigits="3" value="${pV.unitPrice - s_item.idDiscount.valueDiscount}"/>
                                                    VND
                                                </p>
                                            </c:if>
                                        </c:if>
                                    </c:forEach>

                                    <sec:authorize access="hasAnyRole('ROLE_USER')">
                                        <a href="${cUrl}" class="btn btn-primary">Xem chi tiet</a>
                                        <button class="btn btn-primary" onclick="clickAddCartPro(${idOr},${pV.idProduct},'${idCust}')">Đặt Hàng
                                        </button>
                                    </sec:authorize>
                                </div>
                            </div>
                        </form>
                    </div>
                </c:forEach>
            </div>
        </sec:authorize>
    </div>
</div>

<script>
    function clickAddCartPro(idOrd, idPro, idCus) {
        fetch('http://localhost:8080/thuongmaidientu/api/add-product2cart', {
            method: 'post',
            body: JSON.stringify({
                "idPro": idPro.toString(),
                "idOrd": idOrd.toString(),
                "idCus": idCus.toString()
            }),
            headers: {
                "Content-Type": "application/json"
            }
        }).then(function (res) {
            if (res.status === 200) {
                alert('Thêm thành công');
                window.location.reload();
            } else
                alert('Thêm không thành công');
        })

    }
</script>