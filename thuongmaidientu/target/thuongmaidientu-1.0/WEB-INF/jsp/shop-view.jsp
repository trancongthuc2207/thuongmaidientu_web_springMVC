<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 05/09/2022
  Time: 9:36 CH
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<div class="container">
    <c:forEach items="${shopAcc}" var="shop">
        <%------------------  HEADER CONTENT  ----------------------%>
        <div class="col-md-3 col-xs-12" style="padding: 5px;width: 100%">
            <div style="display: inline-flex">
                <form
                        style="display: flex">
                    <div style="display: inline-flex;width: 350px;height: 400px" class="card">
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
                    </div>
                    <div class="form-group" style="margin-left: 30px; width: 600px">
                            <%--        TIEU DE                --%>
                        <h1 class="card-title">Mã shop: ${shop.idShopStore}</h1>

                        <div style="display: flex;font-size: 18px">
                            <h5 class="card-text">Tên shop:&ensp;&ensp;</h5>
                            <h5>${shop.nameStore}</h5>
                        </div>
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
                </form>
            </div>
        </div>
    </c:forEach>
</div>
<div class="row shop-items" style="margin-top: 50px;">
    <%--        LIST PRODUCT     --%>
    <c:forEach items="${listProduct}" var="p">
        <c:url value="/shop-manager/edit/" var="cUrl">
            <c:param name="ID_Product" value="${p.shopProductsPK.idProduct}"/>
        </c:url>
        <div class="row" style="padding: 5px; width: 330px">
            <form action="#">
                <div class="card" <c:if test="${p.amount <= 1}"> style="background-color: dimgrey;position: absolute; left: -999px;"</c:if>>
                    <c:if test="${p.product.image.startsWith('https') == false}">
                        <img style="width: 150px;height: 150px;" class="card-img-top" class="img-fluid"
                             src="https://res.cloudinary.com/dxxwcby8l/image/upload/v1647248722/r8sjly3st7estapvj19u.jpg"
                             alt="Card image">
                    </c:if>
                    <c:if test="${p.product.image.startsWith('https') == true}">
                        <img style="width: 150px;height: 150px;" class="card-img-top" class="img-fluid"
                             src="${p.product.image}"
                             alt="Card image">
                    </c:if>
                    <div class="card-body">
                        <h4 class="card-title id_pro">Mã sản phẩm: ${p.product.idProduct}</h4>
                        <h5 class="card-text">Tên sản phẩm: ${p.product.nameProduct}</h5>
                        <p class="card-text">Số lượng:
                            <i>${p.amount}</i>
                        </p>
                        <p class="card-text">Thời gian bắt đầu bán: ${p.timeBegin}</p>
                        <p class="card-text">Thời gian bắt đầu bán: ${p.timeBegin}</p>
                        <c:url value="/products/" var="cUrl">
                            <c:param name="ID_Product" value="${p.product.idProduct}"/>
                        </c:url>
                        <a style="background-color: transparent; color: darkblue; border-color: transparent" href="${cUrl}" class="btn btn-success btn-lg">Xem chi tiet</a>

                        <c:if test="${idCust != null}">
                            <a onclick="clickAddCart(${idOr},${p.product.idProduct},'${idCust}')" href="javascript:void(0);" class="btn btn-success btn-lg">Thêm vào giỏ hàng</a>
                        </c:if>
                        <c:if test="${idCust == null}">
                            <a href="javascript:void(0);" class="btn btn-success btn-lg">Thêm vào giỏ hàng</a>
                        </c:if>

                        </p>
                    </div>
                </div>
            </form>
        </div>
    </c:forEach>
</div>
<div>
    <%--        PHÂN TRANG     --%>
    <ul class="pagination" style="align-items: center">
        <c:forEach begin="1" end="${Math.ceil(countP/8)}" var="i">
            <c:url value="/shop-view?${linkCur}" var="c">
                <c:param value="${i}" name="page"/>
            </c:url>
            <li class="page-item"><a class="page-link" href="${c}">${i}</a></li>
        </c:forEach>
    </ul>
</div>

<script>

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
                alert('Thêm thành công');
                window.location.reload();
            } else
                alert('Thêm không thành công');
        })

    }

</script>