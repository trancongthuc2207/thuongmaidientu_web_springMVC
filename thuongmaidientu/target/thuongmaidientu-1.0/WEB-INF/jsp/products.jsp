<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<div class="container">
    <c:forEach items="${productByID}" var="p" begin="0" end="2">
        <!-- product -->
        <div class="product-content product-wrap clearfix product-deatil">
            <div class="row">
                <div class="col-md-5 col-sm-12 col-xs-12">
                    <div class="product-image">
                        <div id="myCarousel-2" class="carousel slide">
                            <div class="carousel-inner">
                                <img class="card-img-top" class="img-fluid"
                                     src="https://res.cloudinary.com/dxxwcby8l/image/upload/v1647248722/r8sjly3st7estapvj19u.jpg"
                                     alt="Card image">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-md-offset-1 col-sm-12 col-xs-12">
                    <h1 class="name">${p.nameProduct}
                        <c:url value="/shop-view" var="sView">
                            <c:param name="id_Shop" value="${p.idShop.idShopStore}"/>
                        </c:url>
                        <small>Đăng bởi <a href="${sView}">${p.idShop.nameStore}</a></small>
                    </h1>
                    <hr/>
                    <h3 class="price-container">
                        <fmt:formatNumber type="number" maxFractionDigits="3" value="${p.unitPrice}"/> VND
                    </h3>
                    <c:forEach items="${shop_product}" var="s_item">
                        <c:if test="${s_item.product.idProduct == p.idProduct && s_item.idDiscount.idDiscount != 1}">
                            <c:if test="${s_item.idDiscount.percentDiscount != null}">
                                <p class="card-text" style="background-color: red">${s_item.idDiscount.nameDiscount}</p>
                                <h3 class="price-container-discount" style="color: red"> Chỉ còn:
                                    <fmt:formatNumber type="number" maxFractionDigits="3"
                                                      value="${p.unitPrice - p.unitPrice * (s_item.idDiscount.percentDiscount/100)}"/>
                                    VND
                                </h3>
                            </c:if>
                            <c:if test="${s_item.idDiscount.valueDiscount != null}">
                                <p class="card-text" style="background-color: red">${s_item.idDiscount.nameDiscount}</p>
                                <h3 class="price-container-discount" style="color: red"> Chỉ còn:
                                    <fmt:formatNumber type="number" maxFractionDigits="3"
                                                      value="${p.unitPrice - s_item.idDiscount.valueDiscount}"/>
                                    VND
                                </h3>
                            </c:if>
                        </c:if>
                    </c:forEach>

                    <hr/>
                    <div class="description description-tabs">
                        <div id="myTabContent" class="tab-content">
                            <h3><strong>Thông Tin Sản Phẩm</strong></h3>
                            <p style="font-size: 20px">${p.productDescription}</p>
                        </div>
                    </div>
                    <hr/>
                    <div class="row">
                        <div class="col-sm-12 col-md-6 col-lg-6">
                            <a onclick="clickAddCartPro(${idOr},${p.idProduct},'${idCust}')" href="javascript:void(0);"
                               class="btn btn-success btn-lg">Thêm vào giỏ hàng</a>
                        </div>
                        <div class="col-sm-12 col-md-6 col-lg-6">
                            <div class="btn-group pull-right">
                                <button class="btn btn-white btn-default"><i class="fa fa-envelope"></i>Liên Hệ Shop
                                </button>
                            </div>
                            <div class="btn-group pull-right">
                                <button onclick="clickBtnRp()" class="btn btn-white btn-default btnRP"><i
                                        class="fa-solid fa-flag"></i>Report
                                </button>
                            </div>

                            <div class="slRP" style="display: none;">
                                <select id="slRP" style="margin-top: 15px" class="form-select form-select-sm mb-3"
                                        aria-label=".form-select-lg example">
                                    <c:forEach items="${listReportCus}" var="rpCus">
                                        <option value="${rpCus.idTypeRp}">${rpCus.nameRp}</option>
                                    </c:forEach>
                                </select>
                                <button onclick="clickSendRpProduct('${p.idShop.idShopStore}','${idCust}',${p.idProduct})"
                                        class="btn btn-primary">Gửi
                                </button>
                                <button onclick="clickBtnExRp()" class="btn btn-primary btnExitRP">Huỷ</button>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!-- end product -->
    </c:forEach>

</div>
<div class="product-content product-wrap clearfix product-deatil">
    <div class="bar-vote-cus">
        <span id="cus_vote_1" class="fa fa-star checked"></span>
        <span id="cus_vote_2" class="fa fa-star checked"></span>
        <span id="cus_vote_3" class="fa fa-star checked"></span>
        <span id="cus_vote_4" class="fa fa-star checked"></span>
        <span id="cus_vote_5" class="fa fa-star checked"></span>
    </div>
    <h4 style="font-style: italic">Thêm bình luận:</h4>
    <div class="cmt" style="border: 1px solid black; padding: 20px; margin-top: 10px">
        <div class="cmt-in4" style="display: flex">
            <c:if test="${cus.image.startsWith('https') == false}">
                <img style="width: 100px;height: 100px"
                     src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Admin"
                     class="rounded-circle" width="150">
            </c:if>
            <c:if test="${cus.image.startsWith('https') == true}">
                <img style="width: 100px;height: 100px" class="rounded-circle"
                     src="${cus.image}"
                     alt="Admin">
            </c:if>
            <div class="name_cmt" style="margin-left: 15px">
                <p>${cus.nameC}</p>
            </div>
        </div>
        <div class="cmt-cnt" style="display: flex;padding: 15px">
            <textarea style="width: 100%" type="text" id="content-cmt"></textarea>
            <button onclick="clickAddComment()" class="btn btn-primary">Thêm</button>
        </div>
    </div>

    <h1>Bình luận:</h1>
    <div id="areaCmt">
        <c:if test="${list_cmt.size() > 0}">
            <c:forEach items="${list_cmt}" var="lst_cmt">
                <div class="cmt" style="border: 1px solid black; padding: 20px; margin-top: 10px">
                    <div class="cmt-in4" style="display: flex">
                        <c:if test="${lst_cmt.idCusCmt.image.startsWith('https') == false}">
                            <img style="width: 100px;height: 100px"
                                 src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Admin"
                                 class="rounded-circle" width="150">
                        </c:if>
                        <c:if test="${lst_cmt.idCusCmt.image.startsWith('https') == true}">
                            <img style="width: 100px;height: 100px" class="rounded-circle"
                                 src="${lst_cmt.idCusCmt.image}"
                                 alt="Admin">
                        </c:if>
                        <div class="name_cmt" style="margin-left: 15px">
                            <p>${lst_cmt.idCusCmt.nameC} </p>
                            <i>${lst_cmt.dateCreate}</i>
                        </div>
                    </div>
                    <div class="cmt-cnt" style="border: 1px solid black;padding: 15px">
                        <p>${lst_cmt.content}</p>
                    </div>
                </div>
            </c:forEach>
        </c:if>
    </div>
</div>
<script>
    var idCMT = ${idCmt_max};
    var rate_Cus = 5;

    var btnRp = document.getElementsByClassName("btnRP");
    var slRp = document.getElementsByClassName("slRP");
    var btnExRp = document.getElementsByClassName("btnExitRP");
    var slReport = document.getElementById("slRP").selectedIndex;
    var valSLReport = document.getElementById("slRP").options[slReport].value;


    function clickBtnRp() {
        slRp[0].style.display = "block"
    }

    function clickBtnExRp() {
        slRp[0].style.display = "none"
    }

    window.onload = function () {
        let dates = document.querySelectorAll(".cmt-in4 > .name_cmt > i");
        for (let i = 0; i < dates.length; i++) {
            let d = dates[i]
            d.innerText = moment(d.innerText).fromNow();
        }

        <c:if test="${myCmt != null}">
            if(${myCmt.rate == 1}){
                vote_1S.click();
            }
            if(${myCmt.rate == 2}){
                vote_2S.click();
            }
            if(${myCmt.rate == 3}){
                vote_3S.click();
            }
            if(${myCmt.rate == 4}){
                vote_4S.click();
            }
            if(${myCmt.rate == 5}){
                vote_5S.click();
            }
        </c:if>
    }

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

    function clickSendRpProduct(idShop, idCus, idPro) {
        var slReport = document.getElementById("slRP").selectedIndex;
        var valSLReport = document.getElementById("slRP").options[slReport].value;

        var answer = window.confirm("Do you want to sent Report to Shop?");
        if (answer) {
            var descrips = document.getElementById("slRP").options[slReport].text;

            fetch("http://localhost:8080/thuongmaidientu/api/send-rp-pro-customer", {
                method: 'post',
                body: JSON.stringify({
                    "typeRp": valSLReport.toString(),
                    "idShop": idShop.toString(),
                    "descrip": descrips.toString(),
                    "idCus": idCus.toString(),
                    "idPro": idPro.toString()
                }),
                headers: {
                    "Content-Type": "application/json"
                }
            }).then(function (res) {
                if (res.status === 200) {
                    alert('Báo cáo mặt hàng thành công');
                } else
                    alert('Báo cáo mặt hàng không thành công');
            })
        } else {
            //some code
        }
    }

    function clickAddComment() {
        idCMT += 1;
        let area = document.getElementById("areaCmt")
        let ctn_cmt = document.getElementById("content-cmt");
        var today = new Date()
        var str_cmt = moment(today).fromNow()

        fetch("http://localhost:8080/thuongmaidientu/api/add-comment", {
            method: 'post',
            body: JSON.stringify({
                "id_cmt": idCMT,
                "id_pro": ${productByID.get(0).idProduct},
                "id_cus": '${cus.idCustomer}',
                "content": ctn_cmt.value.toString(),
                "rate": rate_Cus.toString(),
            }),
            headers: {
                "Content-Type": "application/json"
            }
        }).then(function (res) {
            if (res.status === 200) {
                alert('Bình luận thành công');
            } else
                alert('Bình luận không thành công');
        })


        area.innerHTML = `
        <div class="cmt" style="border: 1px solid black; padding: 20px; margin-top: 10px">
                    <div class="cmt-in4" style="display: flex">
                        <c:if test="${cus.image.startsWith('https') == false}">
                            <img style="width: 100px;height: 100px"
                                 src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Admin"
                                 class="rounded-circle" width="150">
                        </c:if>
                        <c:if test="${cus.image.startsWith('https') == true}">
                            <img style="width: 100px;height: 100px" class="rounded-circle"
                                 src="${cus.image}"
                                 alt="Admin">
                        </c:if>
                        <div class="name_cmt" style="margin-left: 15px">
                            <p>${cus.nameC}</p>
                            <i>` + str_cmt + `</i>
                        </div>
                    </div>
                    <div class="cmt-cnt" style="border: 1px solid black;padding: 15px">
                        <p>` + ctn_cmt.value + `</p>
                    </div>
                </div>
        ` + area.innerHTML

        ctn_cmt.value = '';
    }

    var vote_1S = document.getElementById("cus_vote_1");
    var vote_2S = document.getElementById("cus_vote_2");
    var vote_3S = document.getElementById("cus_vote_3");
    var vote_4S = document.getElementById("cus_vote_4");
    var vote_5S = document.getElementById("cus_vote_5");

    vote_1S.addEventListener('click',function () {
        rate_Cus = 1;
        vote_1S.style.color = 'orange';
        vote_2S.style.color = 'black';
        vote_3S.style.color = 'black';
        vote_4S.style.color = 'black';
        vote_5S.style.color = 'black';
    })
    vote_2S.addEventListener('click',function () {
        rate_Cus = 2;
        vote_1S.style.color = 'orange';
        vote_2S.style.color = 'orange';
        vote_3S.style.color = 'black';
        vote_4S.style.color = 'black';
        vote_5S.style.color = 'black';
    })
    vote_3S.addEventListener('click',function () {
        rate_Cus = 3;
        vote_1S.style.color = 'orange';
        vote_2S.style.color = 'orange';
        vote_3S.style.color = 'orange';
        vote_4S.style.color = 'black';
        vote_5S.style.color = 'black';
    })
    vote_4S.addEventListener('click',function () {
        rate_Cus = 4;
        vote_1S.style.color = 'orange';
        vote_2S.style.color = 'orange';
        vote_3S.style.color = 'orange';
        vote_4S.style.color = 'orange';
        vote_5S.style.color = 'black';
    })
    vote_5S.addEventListener('click',function () {
        rate_Cus = 5;
        vote_1S.style.color = 'orange';
        vote_2S.style.color = 'orange';
        vote_3S.style.color = 'orange';
        vote_4S.style.color = 'orange';
        vote_5S.style.color = 'orange';
    })
</script>


<!-- Style for product -->
<style>
    .fa {
        font-size: 25px;
    }

    .checked {
        color: orange;
    }

    body {
        margin-top: 20px;
        background: #eee;
    }


    .product-content {
        border: 1px solid #dfe5e9;
        margin-bottom: 20px;
        margin-top: 12px;
        background: #fff
    }

    .product-content .carousel-control.left {
        margin-left: 0
    }

    .product-content .product-image {
        background-color: #fff;
        display: block;
        min-height: 238px;
        overflow: hidden;
        position: relative
    }

    .product-content .product-deatil {
        border-bottom: 1px solid #dfe5e9;
        padding-bottom: 17px;
        padding-left: 16px;
        padding-top: 16px;
        position: relative;
        background: #fff
    }

    .product-content .product-deatil h5 a {
        color: #2f383d;
        font-size: 15px;
        line-height: 19px;
        text-decoration: none;
        padding-left: 0;
        margin-left: 0
    }

    .product-content .product-deatil h5 a span {
        color: #9aa7af;
        display: block;
        font-size: 13px
    }

    .product-content .product-deatil span.tag1 {
        border-radius: 50%;
        color: #fff;
        font-size: 15px;
        height: 50px;
        padding: 13px 0;
        position: absolute;
        right: 10px;
        text-align: center;
        top: 10px;
        width: 50px
    }

    .product-content .product-deatil span.sale {
        background-color: #21c2f8
    }

    .product-content .product-deatil span.discount {
        background-color: #71e134
    }

    .product-content .product-deatil span.hot {
        background-color: #fa9442
    }

    .product-content .description {
        font-size: 12.5px;
        line-height: 20px;
        padding: 10px 14px 16px 19px;
        background: #fff
    }

    .product-content .product-info {
        padding: 11px 19px 10px 20px
    }

    .product-content .product-info a.add-to-cart {
        color: #2f383d;
        font-size: 13px;
        padding-left: 16px
    }

    .product-content name.a {
        padding: 5px 10px;
        margin-left: 16px
    }

    .product-info.smart-form .btn {
        padding: 6px 12px;
        margin-left: 12px;
        margin-top: -10px
    }

    .product-entry .product-deatil {
        border-bottom: 1px solid #dfe5e9;
        padding-bottom: 17px;
        padding-left: 16px;
        padding-top: 16px;
        position: relative
    }

    .product-entry .product-deatil h5 a {
        color: #2f383d;
        font-size: 15px;
        line-height: 19px;
        text-decoration: none
    }

    .product-entry .product-deatil h5 a span {
        color: #9aa7af;
        display: block;
        font-size: 13px
    }

    .load-more-btn {
        background-color: #21c2f8;
        border-bottom: 2px solid #037ca5;
        border-radius: 2px;
        border-top: 2px solid #0cf;
        margin-top: 20px;
        padding: 9px 0;
        width: 100%
    }

    .product-block .product-deatil p.price-container span,
    .product-content .product-deatil p.price-container span,
    .product-entry .product-deatil p.price-container span,
    .shipping table tbody tr td p.price-container span,
    .shopping-items table tbody tr td p.price-container span {
        color: #21c2f8;
        font-family: Lato, sans-serif;
        font-size: 24px;
        line-height: 20px
    }

    .product-info.smart-form .rating label {
        margin-top: 0
    }

    .product-wrap .product-image span.tag2 {
        position: absolute;
        top: 10px;
        right: 10px;
        width: 36px;
        height: 36px;
        border-radius: 50%;
        padding: 10px 0;
        color: #fff;
        font-size: 11px;
        text-align: center
    }

    .product-wrap .product-image span.sale {
        background-color: #57889c
    }

    .product-wrap .product-image span.hot {
        background-color: #a90329
    }

    .shop-btn {
        position: relative
    }

    .shop-btn > span {
        background: #a90329;
        display: inline-block;
        font-size: 10px;
        box-shadow: inset 1px 1px 0 rgba(0, 0, 0, .1), inset 0 -1px 0 rgba(0, 0, 0, .07);
        font-weight: 700;
        border-radius: 50%;
        padding: 2px 4px 3px !important;
        text-align: center;
        line-height: normal;
        width: 19px;
        top: -7px;
        left: -7px
    }

    .description-tabs {
        padding: 30px 0 5px !important
    }

    .description-tabs .tab-content {
        padding: 10px 0
    }

    .product-deatil {
        padding: 30px 30px 50px
    }

    .product-deatil hr + .description-tabs {
        padding: 0 0 5px !important
    }

    .product-deatil .carousel-control.left,
    .product-deatil .carousel-control.right {
        background: none !important
    }

    .product-deatil .glyphicon {
        color: #3276b1
    }

    .product-deatil .product-image {
        border-right: none !important
    }

    .product-deatil .name {
        margin-top: 0;
        margin-bottom: 0
    }

    .product-deatil .name small {
        display: block
    }

    .product-deatil .name a {
        margin-left: 0
    }

    .product-deatil .price-container {
        font-size: 24px;
        margin: 0;
        font-weight: 300
    }

    .product-deatil .price-container small {
        font-size: 12px
    }

    .product-deatil .fa-2x {
        font-size: 16px !important
    }

    .product-deatil .fa-2x > h5 {
        font-size: 12px;
        margin: 0
    }

    .product-deatil .fa-2x + a,
    .product-deatil .fa-2x + a + a {
        font-size: 13px
    }

    .profile-message ul {
        list-style: none;
    }

    .product-deatil .certified {
        margin-top: 10px
    }

    .product-deatil .certified ul {
        padding-left: 0
    }

    .product-deatil .certified ul li:not(first-child) {
        margin-left: -3px
    }

    .product-deatil .certified ul li {
        display: inline-block;
        background-color: #f9f9f9;
        border: 1px solid #ccc;
        padding: 13px 19px
    }

    .product-deatil .certified ul li:first-child {
        border-right: none
    }

    .product-deatil .certified ul li a {
        text-align: left;
        font-size: 12px;
        color: #6d7a83;
        line-height: 16px;
        text-decoration: none
    }

    .product-deatil .certified ul li a span {
        display: block;
        color: #21c2f8;
        font-size: 13px;
        font-weight: 700;
        text-align: center
    }

    .product-deatil .message-text {
        width: calc(100% - 70px)
    }

    @media only screen and (min-width: 1024px) {
        .product-content div[class*=col-md-4] {
            padding-right: 0
        }

        .product-content div[class*=col-md-8] {
            padding: 0 13px 0 0
        }

        .product-wrap div[class*=col-md-5] {
            padding-right: 0
        }

        .product-wrap div[class*=col-md-7] {
            padding: 0 13px 0 0
        }

        .product-content .product-image {
            border-right: 1px solid #dfe5e9
        }

        .product-content .product-info {
            position: relative
        }
    }

    .message img.online {
        width: 40px;
        height: 40px;
    }
</style>