<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 05/09/2022
  Time: 9:36 CH
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!-- section start -->
<section class="vendor-profile pt-0" style="margin-top: 25px; margin-bottom: 25px;">
    <div class="" style="padding: 50px">
        <div class="row">
            <div class="">
                <c:forEach items="${shopAcc}" var="shop">
                <div class="profile-left">
                    <div class="profile-image">
                        <div>
                            <c:if test="${shop.imageS.startsWith('https') == false}">
                                <img class="card-img-top" class="img-fluid"
                                     src="https://res.cloudinary.com/dxxwcby8l/image/upload/v1647248722/r8sjly3st7estapvj19u.jpg"
                                     alt="Card image">
                            </c:if>
                            <c:if test="${shop.imageS.startsWith('https') == true}">
                                <img class="card-img-top" class="img-fluid"
                                     src="${shop.imageS}"
                                     alt="Card image">
                            </c:if>
                            <h3>${shop.nameStore}</h3>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <h6>750 followers | 10 review</h6>
                        </div>
                    </div>
                    <div class="profile-detail">
                        <div>
                            <div class="form-group card-text" style="display: flex; font-size: 20px">
                                <h5 class="card-text">Ngày tham gia:&ensp;</h5>
                                <h5>${shop.dateBegin}</h5>
                            </div>

                            <c:url value="/" var="cUrl1">
                                <c:param name="type_Id" value="${shop.mainType.idTypeProduct}"/>
                            </c:url>
                            <c:url value="/" var="cUrl2">
                                <c:param name="type_Id" value="${shop.ortherType1.idTypeProduct}"/>
                            </c:url>
                            <c:url value="/" var="cUrl3">
                                <c:param name="type_Id" value="${shop.ortherType2.idTypeProduct}"/>
                            </c:url>
                            <div style="display: flex; font-size: 20px">
                                <h5 class="card-text">Buôn bán sản phẩm chính:&ensp;</h5>
                                <a href="${cUrl1}">${shop.mainType.typeName}</a>
                            </div>
                            <div style="height: 20px;display: flex; font-size: 20px">
                                <h5 class="card-text">Sản phẩm phụ:&ensp;</h5>
                                <a href="${cUrl2}">${shop.ortherType1.typeName}</a>
                                    <%--                            <h5 hre>${shop.ortherType1.typeName}</h5 hre>--%>
                                <i>,&ensp;</i>
                                <a href="${cUrl3}">${shop.ortherType2.typeName}</a>
                                    <%--                            <h5>${shop.ortherType2.typeName}</h5>--%>
                            </div>
                        </div>
                    </div>
                    <div class="vendor-contact">
                        <div>
                            <h6>follow us:</h6>
                            <div class="footer-social">
                                <ul>
                                    <li><a href="#"><i class="fa fa-facebook-f"></i></a></li>
                                    <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                                </ul>
                            </div>
                            <h6>if you have any query:</h6>
                            <a href="#" class="btn btn-solid btn-sm">contact seller</a>
                        </div>
                    </div>
                </div>
                </c:forEach>
                <%--     SEARCH           --%>
                <section class="search-block" style="margin-top: 25px;">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6 offset-lg-3">
                                <div class="form-header">
                                    <div class="input-group">
                                        <input id="search_pro_shop" style="width: 100%" type="text" class="form-control"
                                               aria-label="Amount (to the nearest dollar)"
                                               placeholder="Search Products......">
                                        <select id="slt_pro_shop_isDiscount">
                                            <option value="DISCOUNT" selected>Có mã giảm giá.</option>
                                            <option value="NO">Không mã giảm giá.</option>
                                            <option value="NO">Tất cả.</option>
                                        </select>
                                        <select id="slt_pro_shop_unit_price">
                                            <option value="DES" selected>Giá giảm dần.</option>
                                            <option value="INCRE">Giá tăng dần.</option>
                                            <option value="NO">Tất cả.</option>
                                        </select>
                                        <div class="input-group-append">
                                            <a id="btn_search_pro_shop" onclick="api_searchPro_Shop()"
                                               class="btn btn-solid"><i class="fa fa-search"></i>Search</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <%--                --%>
                <section class="section-b-space pt-0 ratio_asos">
                    <div class="">
                        <div class="row">
                            <div class="col">
                                <div class="theme-tab">
                                    <div class="tab-content-cls">
                                        <div class="tab-content active default">
                                            <div class="no-slider row">
                                                <c:forEach items="${prods_Shop}" var="p">
                                                    <c:url value="/products/" var="cUrl">
                                                        <c:param name="ID_Product" value="${p.idProduct}"/>
                                                    </c:url>
                                                    <div class="product-box">
                                                        <div class="img-wrapper">
                                                            <div class="lable-block">
                                                                <c:forEach items="${shop_product}" var="s_item">
                                                                    <c:if test="${s_item.product.idProduct == p.idProduct && s_item.idDiscount.idDiscount != '1'}">
                                                                        <c:if test="${s_item.idDiscount.percentDiscount != null}">
                                                                            <span class="lable3">${s_item.idDiscount.nameDiscount}</span>
                                                                        </c:if>
                                                                        <c:if test="${s_item.idDiscount.valueDiscount != null}">
                                                                            <span class="lable3">${s_item.idDiscount.nameDiscount}</span>
                                                                        </c:if>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </div>
                                                            <div class="front">
                                                                <c:if test="${p.image.startsWith('https') == false}">
                                                                    <img class="img-fluid blur-up lazyload bg-img"
                                                                         src="https://res.cloudinary.com/dxxwcby8l/image/upload/v1647248722/r8sjly3st7estapvj19u.jpg"
                                                                         alt="Card image">
                                                                </c:if>
                                                                <c:if test="${p.image.startsWith('https') == true}">
                                                                    <img class="img-fluid blur-up lazyload bg-img"
                                                                         src="${p.image}"
                                                                         alt="Card image">
                                                                </c:if>
                                                            </div>
                                                            <div class="back">
                                                                <a href="${cUrl}"><img
                                                                        src="${ass}images/pro3/2.jpg"
                                                                        class="img-fluid blur-up lazyload bg-img"
                                                                        alt=""></a>
                                                            </div>
                                                            <div class="cart-info cart-wrap">
                                                                <sec:authorize access="hasAnyRole('ROLE_USER')">
                                                                    <button onclick="clickAddCart(${idOr},${p.idProduct},'${idCust}')"
                                                                            data-bs-toggle="modal"
                                                                            data-bs-target="#addtocart"
                                                                            title="Add to cart"><i
                                                                            class="ti-shopping-cart"></i>
                                                                    </button>
                                                                    <a href="javascript:void(0)"
                                                                       title="Add to Wishlist"><i
                                                                            class="ti-heart" aria-hidden="true"></i></a>
                                                                    <a href="#" data-bs-toggle="modal"
                                                                       data-bs-target="#quick-view"
                                                                       title="Quick View"><i
                                                                            class="ti-search"
                                                                            aria-hidden="true"></i></a>
                                                                    <a href="#" title="Compare"><i class="ti-reload"
                                                                                                   aria-hidden="true"></i></a>
                                                                </sec:authorize>
                                                            </div>
                                                        </div>

                                                        <div class="product-detail">
                                                                <%--SAO--%>
                                                            <div class="rating"><i class="fa fa-star"></i> <i
                                                                    class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
                                                                        class="fa fa-star"></i>
                                                            </div>
                                                            <a href="${cUrl}">
                                                                <h6>${p.nameProduct}</h6>
                                                            </a>
                                                            <h4><fmt:formatNumber type="number" maxFractionDigits="3"
                                                                                  value="${p.unitPrice}"/> VND</h4>
                                                            <c:forEach items="${shop_product}" var="s_item">
                                                                <c:if test="${s_item.product.idProduct == p.idProduct && s_item.idDiscount.idDiscount != '1'}">
                                                                    <c:if test="${s_item.idDiscount.percentDiscount != null}">
                                                                        <h4 class="lable4" style="color: red"> Chỉ còn:
                                                                            <fmt:formatNumber type="number"
                                                                                              maxFractionDigits="3"
                                                                                              value="${p.unitPrice - p.unitPrice * (s_item.idDiscount.percentDiscount/100)}"/>
                                                                            VND</h4>
                                                                    </c:if>
                                                                    <c:if test="${s_item.idDiscount.valueDiscount != null}">
                                                                        <h4 class="lable4" style="color: red">Chỉ còn:
                                                                            <fmt:formatNumber type="number"
                                                                                              maxFractionDigits="3"
                                                                                              value="${p.unitPrice - s_item.idDiscount.valueDiscount}"/>
                                                                            VND</h4>
                                                                    </c:if>
                                                                </c:if>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <div class="product-pagination mb-0">
                <div class="theme-paggination-block">
                    <div class="row">
                        <div class="col-xl-6 col-md-6 col-sm-12">
                            <nav aria-label="Page navigation">
                                <ul class="pagination">
                                    <c:forEach begin="1" end="${Math.ceil(countPro/20)}" var="i">
                                        <c:url value="/shop-view?${linkCur}" var="c">
                                            <c:param value="${i}" name="page"/>
                                            <c:param value="${isDis}"
                                                     name="isDis"/>
                                            <c:param value="${fil}"
                                                     name="fil"/>
                                            <c:param value="${kw}"
                                                     name="kw"/>
                                            <c:param value="${shopID}"
                                                     name="id_Shop"/>
                                        </c:url>
                                        <li class="page-item"><a class="page-link" href="${c}">${i}</a></li>
                                    </c:forEach>
                                </ul>
                            </nav>
                        </div>
                        <div class="col-xl-6 col-md-6 col-sm-12">
                            <div class="product-search-count-bottom">
                                <h5>Showing Products 1-20</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Section ends -->
<script>
    function api_searchPro_Shop() {
        let kw = document.getElementById("search_pro_shop").value;
        let sltFil_isDiscount = document.getElementById("slt_pro_shop_isDiscount").value;
        let btnSearch = document.getElementById("btn_search_pro_shop");
        let sltFil_price = document.getElementById("slt_pro_shop_unit_price").value;
        <c:url value="/shop-view" var="shopView">
        </c:url>
        btnSearch.setAttribute("href", '${shopView}' + `?id_Shop=` + '${shopID}' + `&page=1` + `&kw=` + kw + `&isDis=` + sltFil_isDiscount + `&fil=` + sltFil_price);
    }


    function clickAddCart(idOrd, idPro, idCus) {

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
                document.getElementById("cart_amount_cus").innerText = parseInt(document.getElementById("cart_amount_cus").innerText) + 1;
            } else
                alert('Thêm không thành công');
        })

    }

</script>