<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@page contentType="text/html" pageEncoding="UTF-8" %>

<c:url value="/shop-manager/" var="back"/>
<c:url value="/shop-manager/edit/save/" var="save"/>
<div class="container">
    <c:forEach items="${productByID}" var="p" begin="0" end="2">
        <h1 style="text-align: center">Chi tiết sản phẩm</h1>
        <%-- --------------------  FORM EDIT    ------------------ --%>
        <div style="display: flex; align-items: center">
            <div class="card" style="width:400px">
                <div class="card-body">
                    <h2 class="card-title">${p.nameProduct}</h2>
                    <h4 class="card-text">Hình ảnh</h4>
                </div>

                <c:if test="${p.image.startsWith('https') == false}">
                    <img class="card-img-top" class="img-fluid"
                         src="https://res.cloudinary.com/dxxwcby8l/image/upload/v1647248722/r8sjly3st7estapvj19u.jpg"
                         alt="Card image">
                </c:if>
                <c:if test="${p.image.startsWith('https') == true}">
                    <img class="card-img-top" class="img-fluid"
                         src="${p.image}"
                         alt="Card image">
                </c:if>

            </div>


            <div style="display: flex; width: 100%">
                <div style="width: 70%">
                    <c:url value="/shop-manager/edit/update" var="action"/>
                    <form:form action="${action}" method="POST" modelAttribute="product" enctype="multipart/form-data"
                               class="form-edit-pro was-validated"
                               style="width: 120%;margin-top: 10px; font-size: 20px; margin-right: 0px">
                        <div class="form-group idPro"
                             style="align-items: center; display: inline-flex; width: 70%;display: none">
                            <label style="width: 50%; text-align: right; margin-right: 15px">Mã sản phẩm:</label>
                            <form:input path="idProduct" type="text" class="form-control" id="nameProduct"
                                        value="${p.idProduct}"/>
                        </div>
                        <div class="form-group name" style="align-items: center; display: inline-flex; width: 70%;">
                            <label style="width: 50%; text-align: right; margin-right: 15px">Tên sản phẩm:</label>
                            <form:input path="nameProduct" type="text" class="form-control" id="nameProduct"
                                        value="${p.nameProduct}"/>
                        </div>
                        <div class="form-group price" style="align-items: center; display: inline-flex; width: 70%;">
                            <label style="width: 50%; text-align: right; margin-right: 15px">Giá:</label>
                            <form:input path="unitPrice" type="text" class="form-control" id="unitPrice"
                                        value="${p.unitPrice}"/>
                        </div>
                        <div class="form-group descr" style="align-items: center; display: inline-flex; width: 70%;">
                            <label style="width: 50%; text-align: right; margin-right: 15px;">Mô tả:</label>
                            <form:input style="height: 150px" type="text" class="form-control" path="productDescription"
                                        id="productDescription" value="${p.productDescription}"></form:input>
                        </div>

                        <div class="form-group type_pro" style="align-items: center; display: inline-flex; width: 70%;">
                            <label style="width: 50%; text-align: right; margin-right: 15px">Loại sản phẩm:</label>
                            <form:select id="type" path="typeOfProduct" class="form-select">
                                <c:forEach items="${type_products}" var="c">
                                    <option <c:if
                                            test="${c.idTypeProduct == p.typeOfProduct.idTypeProduct}"> selected</c:if>
                                            value="${c.idTypeProduct}">${c.typeName}</option>
                                </c:forEach>
                            </form:select>
                        </div>

                        <div class="form-group manufac" style="align-items: center; display: inline-flex; width: 70%;">
                            <label style="width: 50%; text-align: right; margin-right: 15px">Nhà sản xuất:</label>
                            <form:input path="manufacturer" type="text" class="form-control" id="manufacturer"
                                        value="${p.manufacturer}"/>
                        </div>

                        <div class="form-group image" style="align-items: center; display: inline-flex; width: 70%;">
                            <label style="width: 50%; text-align: right; margin-right: 15px">Chọn ảnh:</label>
                            <form:input id="file" path="file" type="file" cssClass="form-control is-invalid"/>
                        </div>

                        <div class="form-group sb"
                             style="justify-content: center;align-items: center; display: inline-flex; width: 70%">
                            <button type="submit" style="margin-top: 25px;margin-left: 15px"
                                    class="btn btn-primary btn-save">Lưu
                            </button>
                            <a href="#" onclick="clickReset()" style="margin-top: 25px;margin-left: 15px" type="button"
                               class="btn btn-primary">Reset</a>
                            <a href="#" onclick="clickDelete(${idPro})" style="margin-top: 25px;margin-left: 15px"
                               type="button"
                               class="btn btn-primary btn-delete">Xoá</a>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

<script>

    var btn_s = document.getElementsByClassName("btn-save")
    var input_amount = document.getElementsByClassName("amount")

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