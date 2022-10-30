<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@page contentType="text/html" pageEncoding="UTF-8" %>

<c:url value="/shop-manager/" var="back"/>
<c:url value="/shop-manager/edit/save/" var="save"/>
<div style="margin-top: 50px">
    <sec:authorize access="hasAnyRole('ROLE_EMPLOYEE')">
        <c:url value="/employee" var="back"></c:url>
    </sec:authorize>
    <sec:authorize access="hasAnyRole('ROLE_SHOP')">
        <c:url value="/shop-manager" var="back"></c:url>
    </sec:authorize>
    <sec:authorize access="hasAnyRole('ROLE_ADMIN')">
        <c:url value="/admin" var="back"></c:url>
    </sec:authorize>
    <a class="btn btn-primary" href="${back}">Quay về</a>
</div>
<div>
<c:forEach items="${productByID}" var="p" begin="0" end="2">
    <div class="" style="padding: 50px">
        <h1 style="text-align: center">Chi tiết sản phẩm</h1>
        <div class="col-sm-12">
            <div class="card">
                <div class="card-body">
                    <div class="row product-adding">
                        <div class="col-xl-4" style="border: 1px solid black">
                            <div class="add-product">
                                <div class="row">
                                    <div class="col-xl-9 xl-50 col-sm-6 col-9">
                                        <c:if test="${p.image.startsWith('https') == false}">
                                            <img id="img_temp" class="img-fluid image_zoom_1 blur-up lazyloaded"
                                                 src="https://res.cloudinary.com/dxxwcby8l/image/upload/v1647248722/r8sjly3st7estapvj19u.jpg"
                                                 alt="Card image">
                                        </c:if>
                                        <c:if test="${p.image.startsWith('https') == true}">
                                            <img id="img_temp" class="img-fluid image_zoom_1 blur-up lazyloaded"
                                                 src="${p.image}"
                                                 alt="Card image">
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-7">
                            <sec:authorize access="hasRole('ROLE_SHOP')">
                                <c:url value="/shop-manager/edit/update" var="action"/>
                            </sec:authorize>
                            <sec:authorize access="hasRole('ROLE_EMPLOYEE')">
                                <c:url value="/shop-manager/edit/update" var="action">
                                    <c:param name="idShop_FrEpl" value="${idS_FrEmpl}"></c:param>
                                </c:url>
                            </sec:authorize>
                            <form:form action="${action}" method="POST" modelAttribute="product"
                                       enctype="multipart/form-data"
                                       class="needs-validation add-product-form was-validated">
                                <%--                                <form class="needs-validation add-product-form" novalidate="">--%>
                                <div class="form-group idPro"
                                     style="display: none">
                                    <label style="width: 50%; text-align: right; margin-right: 15px">Mã sản
                                        phẩm:</label>
                                    <form:input path="idProduct" type="text" class="form-control" id="nameProduct"
                                                value="${p.idProduct}"/>
                                </div>
                                <div class="form">
                                    <div class="form-group mb-3 row">
                                        <label for="name_pro" class="col-xl-3 col-sm-4 mb-0">Tên
                                            sản phẩm:</label>
                                        <div class="col-xl-8 col-sm-7">
                                            <form:input type="text" class="form-control is-invalid"
                                                        path="nameProduct"
                                                        id="name_pro" required="required" value="${p.nameProduct}"/>
                                        </div>
                                        <div class="valid-feedback">Looks good!</div>
                                    </div>
                                    <div class="form-group mb-3 row">
                                        <label class="col-xl-3 col-sm-4 mb-0">Giá:</label>
                                        <div class="col-xl-8 col-sm-7">
                                            <form:input type="text" class="form-control is-invalid"
                                                        path="unitPrice"
                                                        id="price_pro" required="required" value="${p.unitPrice}"/>
                                        </div>
                                        <div class="valid-feedback">Looks good!</div>
                                    </div>
                                    <div class="form-group mb-3 row">
                                        <label class="col-xl-3 col-sm-4 mb-0">Mô tả:</label>
                                        <div class="col-xl-8 col-sm-7">
                                            <form:input cssStyle="margin-left: 0px" type="text"
                                                        class="form-control is-invalid"
                                                        path="productDescription"
                                                        id="descr_pro" required="required"
                                                        value="${p.productDescription}"></form:input>
                                        </div>
                                        <div class="valid-feedback">Looks good!</div>
                                    </div>
                                    <div class="form-group mb-3 row">
                                        <label class="col-xl-3 col-sm-4 mb-0">Loại sản phẩm:</label>
                                        <div class="col-xl-8 col-sm-7">
                                            <form:select id="type" path="typeOfProduct"
                                                         class="form-select was-validated" required="required">
                                                <c:forEach items="${type_products}" var="c">
                                                    <option <c:if
                                                            test="${c.idTypeProduct == p.typeOfProduct.idTypeProduct}"> selected</c:if>
                                                            value="${c.idTypeProduct}">${c.typeName}</option>
                                                </c:forEach>
                                            </form:select>
                                        </div>
                                        <div class="invalid-feedback offset-sm-4 offset-xl-3">Please choose type
                                            of
                                            product
                                        </div>
                                    </div>
                                    <div class="form-group mb-3 row">
                                        <label class="col-xl-3 col-sm-4 mb-0">Nhà sản xuất:</label>
                                        <div class="col-xl-8 col-sm-7">
                                            <form:input type="text" class="form-control is-invalid"
                                                        path="manufacturer"
                                                        id="manufacturer_pro" required="required"
                                                        value="${p.manufacturer}"/>
                                        </div>
                                        <div class="invalid-feedback offset-sm-4 offset-xl-3">Please choose type
                                            of
                                            product
                                        </div>
                                    </div>
                                    <div class="form-group mb-3 row">
                                        <label class="col-xl-3 col-sm-4 mb-0">Chọn ảnh:</label>
                                        <div class="col-xl-8 col-sm-7">
                                            <form:input id="file" path="file" type="file"
                                                        cssClass="form-control is-invalid"
                                                        required="required"/>
                                        </div>
                                        <div class="invalid-feedback offset-sm-4 offset-xl-3">Please choose type
                                            of
                                            product
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="offset-xl-3 offset-sm-4 mt-4">
                                        <button type="submit" class="btn btn-primary">Add</button>
                                        <button onclick="clickDelete(${idPro})" type="button" class="btn btn-light">
                                            Delete
                                        </button>
                                    </div>
                                </div>
                                <%--                                </form>--%>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    </div>
</c:forEach>
</div>

<script>

    var btn_s = document.getElementsByClassName("btn-save")
    var input_amount = document.getElementsByClassName("amount")


    let imgInp = document.getElementById("file");
    let img_Temp = document.getElementById("img_temp");
    imgInp.onchange = evt => {
        const [file] = imgInp.files
        if (file) {
            img_Temp.src = URL.createObjectURL(file)
        }
    }

    function clickSave(id) {
        var answer = window.confirm("Save data?");
        if (answer) {
            var inputName = document.getElementById("name_pro").value;
            var inputPrice = document.getElementById("price_pro").value;
            var inputDesc = document.getElementById("descr_pro").value;

            var inputType = document.getElementById("type").selectedIndex;
            var type = document.getElementById("type").options[inputType].value;

            var inputManu = document.getElementById("manufacturer_pro").value;
            var inputImg = '/images/uploads/samsung-galaxy-tab-s6.png';

            fetch('http://localhost:8080/thuongmaidientu/api/update-pro', {
                method: 'post',
                body: JSON.stringify({
                    "idPro": id.toString(),
                    "name_pro": inputName,
                    "price": inputPrice,
                    "descr": inputDesc,
                    "manufa": inputManu,
                    "type": type,
                    "img": inputImg
                }),
                headers: {
                    "Content-Type": "application/json"
                }
            }).then(function (res) {
                if (res.status === 200)
                    window.location.reload();
                else
                    alert('Cập nhật không thành công');
            })
        } else {
            //some code
        }
    }

    function clickDelete(id) {
        var answer = window.confirm("Delete data?");
        if (answer) {
            fetch('http://localhost:8080/thuongmaidientu/api/update-delete-pro', {
                method: 'post',
                body: JSON.stringify({
                    "idPro": id.toString()
                }),
                headers: {
                    "Content-Type": "application/json"
                }
            }).then(function (res) {
                if (res.status === 200) {
                    alert('Xoá thành công');
                    window.location.href = "${back}";
                } else
                    alert('Xoá không thành công');
            })
        } else {
            //some code
        }
    }

    function clickReset() {
        window.location.reload()
    }


    window.onload = function () {
        var type = document.getElementById("type");
        for (var i = 0; i < type.length - 1; i++) {
            var ty = type.options[i].value;
            var pro =
            ${productByID[0].typeOfProduct.idTypeProduct}
            if (ty == pro)
                type.options[i].setAttribute("selected", "selected");
        }
    }
</script>

<style>
    div.card {
        margin-top: 20px;
    }

    .item {
        margin-left: 25%;
    }
</style>