<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<c:url value="/shop-manager/" var="back"/>
<c:url value="/shop-manager/edit/save/" var="save"/>
<div class="container">
    <c:forEach items="${productByID}" var="p" begin="0" end="2">
        <div class="card" style="width:400px">
            <div class="card-body">
                <h4 class="card-title">${p.nameProduct}</h4>
                <p class="card-text">Some example text.</p>
                <a href="#" class="btn btn-primary">See Profile</a>
            </div>
        </div>
        <h1 style="text-align: center">Chi tiết sản phẩm</h1>
        <%-- --------------------  FORM EDIT    ------------------ --%>
        <div style="display: flex; width: 100%">
            <c:forEach items="${shop_product_detail}" var="pr_detail">
                <div style="width: 70%">
                    <form class="form-edit-pro" style="margin-top: 10px; font-size: 20px; margin-right: 0px">
                        <div class="item name" style="align-items: center; display: inline-flex; width: 70%;">
                            <label style="width: 50%; text-align: right; margin-right: 15px">Tên sản phẩm:</label>
                            <input type="text" class="form-control" id="name_pro" value="${p.nameProduct}">
                        </div>
                        <div class="item price" style="align-items: center; display: inline-flex; width: 70%;">
                            <label style="width: 50%; text-align: right; margin-right: 15px">Giá:</label>
                            <input type="text" class="form-control" id="price_pro"
                                   value="<fmt:formatNumber type="number" maxFractionDigits="3" value="${p.unitPrice}"/>">
                        </div>
                        <div class="item descr" style="align-items: center; display: inline-flex; width: 70%;">
                            <label style="width: 50%; text-align: right; margin-right: 15px;">Mô tả:</label>
                            <textarea style="height: 150px" type="text" class="form-control"
                                      id="descr_pro">${p.productDescription}</textarea>
                        </div>
                        <div class="item type_pro" style="align-items: center; display: inline-flex; width: 70%;">
                            <label style="width: 50%; text-align: right; margin-right: 15px">Loại sản phẩm:</label>
                            <select class="form-select">
                                <c:forEach items="${type_products}" var="c">
                                    <option value="${c.idTypeProduct}">${c.typeName}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="item manufac" style="align-items: center; display: inline-flex; width: 70%;">
                            <label style="width: 50%; text-align: right; margin-right: 15px">Nhà sản xuất:</label>
                            <input type="text" class="form-control" id="manufacturer_pro" value="${p.manufacturer}">
                        </div>

                        <div class="item stt" style="align-items: center; display: inline-flex; width: 70%;">
                            <label style="width: 50%; text-align: right; margin-right: 15px">Trạng thái:</label>
                            <input type="text" class="form-control" id="stt_pro" value="${p.status}">
                        </div>
                        <div class="item image" style="align-items: center; display: inline-flex; width: 70%" ;>
                            <label style="width: 50%; text-align: right; margin-right: 15px" for="formFile"
                                class="form-label">
                                Thêm hình ảnh</label>
                            <input class="form-control" type="file" id="formFile" value="${p.image}">
                        </div>
                    </form>
                </div>

                <div>
                    <button style="margin-top: 10px; width: 60%" class="btn btn-primary">Reset</button>
                    <a href="#" onclick="clickSave()" type="button" style="margin-top: 25px; width: 60%"
                       class="btn btn-primary btn-save">Lưu</a>
                    <a href="#" onclick="clickSave()" type="button" style="margin-top: 25px; width: 60%"
                       class="btn btn-primary btn-delete">Xoá</a>
                </div>
            </c:forEach>
        </div>
    </c:forEach>
</div>

<script>
    var btn_s = document.getElementsByClassName("btn-save")
    var input_amount = document.getElementsByClassName("amount")
    function clickSave() {
        var answer = window.confirm("Save data?");
        if (answer) {
            <%--btn_s[0].setAttribute("href", "${save}" + input_amount[0].value)--%>
        } else {
            //some code
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