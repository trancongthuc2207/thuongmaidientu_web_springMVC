<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 30/08/2022
  Time: 1:23 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<div style="margin-top: 50px">
    <c:url value="/shop-manager" var="back"></c:url>
    <a class="btn btn-primary" href="${back}">Quay về</a>
</div>
<%-- THÊM SẢN PHẨM --%>
<div class="row" style="padding: 50px">
    <h1 type="button" id="btnOpenF" style="text-align: center">Thêm sản phẩm mới</h1>
    <div id="content">
        <div class="">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row product-adding">
                            <div class="col-xl-4" style="border: 1px solid black">
                                <div class="add-product">
                                    <div class="row">
                                        <div class="col-xl-9 xl-50 col-sm-6 col-9">
                                            <img id="img_temp" src="" alt=""
                                                 class="img-fluid image_zoom_1 blur-up lazyloaded">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-7">
                                <form:form action="${action}" method="POST" modelAttribute="product"
                                           enctype="multipart/form-data"
                                           class="needs-validation add-product-form was-validated">
                                    <%--                                <form class="needs-validation add-product-form" novalidate="">--%>
                                    <div class="form">
                                        <div class="form-group mb-3 row">
                                            <label for="name_pro" class="col-xl-3 col-sm-4 mb-0">Tên
                                                sản phẩm:</label>
                                            <div class="col-xl-8 col-sm-7">
                                                <form:input type="text" class="form-control is-invalid"
                                                            path="nameProduct"
                                                            id="name_pro" required="required"/>
                                            </div>
                                            <div class="valid-feedback">Looks good!</div>
                                        </div>
                                        <div class="form-group mb-3 row">
                                            <label class="col-xl-3 col-sm-4 mb-0">Giá:</label>
                                            <div class="col-xl-8 col-sm-7">
                                                <form:input type="text" class="form-control is-invalid"
                                                            path="unitPrice"
                                                            id="price_pro" required="required"/>
                                            </div>
                                            <div class="valid-feedback">Looks good!</div>
                                        </div>
                                        <div class="form-group mb-3 row">
                                            <label class="col-xl-3 col-sm-4 mb-0">Mô tả:</label>
                                            <div class="col-xl-8 col-sm-7">
                                                <form:textarea cssStyle="margin-left: 0px" type="text"
                                                               class="form-control is-invalid"
                                                               path="productDescription"
                                                               id="descr_pro" required="required"></form:textarea>
                                            </div>
                                            <div class="valid-feedback">Looks good!</div>
                                        </div>
                                        <div class="form-group mb-3 row">
                                            <label class="col-xl-3 col-sm-4 mb-0">Loại sản phẩm:</label>
                                            <div class="col-xl-8 col-sm-7">
                                                <form:select id="type" path="typeOfProduct"
                                                             class="form-select is-invalid"
                                                             required="required">
                                                    <c:forEach items="${type_products}" var="c">
                                                        <option value="${c.idTypeProduct}">${c.typeName}</option>
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
                                                            id="manufacturer_pro" required="required"/>
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
                                            <button <c:if test="${active != 'actived'}"> disabled </c:if> type="submit"
                                                                                                          class="btn btn-primary">
                                                Add <c:if test="${active != 'actived'}"> (Banned) </c:if></button>
                                            <button onclick="clickReset()" type="button" class="btn btn-light">
                                                Discard
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
</div>
<%-- DANH SÁCH CHỜ DUYỆT --%>
<div class="row" style="padding: 50px">
    <h1 type="button" id="btnOpenWaitting" style="text-align: center">Danh sách chờ duyệt</h1>
    <div class="row" id="contentWaitting">
        <div class="row">
            <c:forEach items="${listProductWaitting}" var="list">
                <div class="col-md-3 col-xs-12" style="padding: 5px;">
                    <form action="#">
                        <div class="card" <c:if test="${list.status == 100}">style="background-color: #e8db29" </c:if>>
                            <c:if test="${list.image.startsWith('https') == false}">
                                <img class="card-img-top" class="img-fluid"
                                     src="https://res.cloudinary.com/dxxwcby8l/image/upload/v1647248722/r8sjly3st7estapvj19u.jpg"
                                     alt="Card image">
                            </c:if>
                            <c:if test="${list.image.startsWith('https') == true}">
                                <img class="card-img-top" class="img-fluid"
                                     src="${list.image}"
                                     alt="Card image">
                            </c:if>
                            <div class="card-body">
                                <h4 class="card-title id_pro">Mã sản phẩm: ${list.idProduct}</h4>
                                <h5 class="card-text">Tên sản phẩm: ${list.nameProduct}</h5>
                                <h5 class="card-text">Thời gian tạo: ${list.dateCreated}</h5>
                                <a href="#" onclick="clickDelete(${list.idProduct})"
                                   style="margin-top: 10px; width: 60%"
                                   type="button" class="btn btn-primary">Xoá</a>
                            </div>
                        </div>
                    </form>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<%-- DANH SÁCH ĐÃ XOÁ --%>
<div class="row" style="padding: 50px">
    <h1 type="button" id="btnOpenDeleted" style="text-align: center">Danh sách đã xoá</h1>
    <div class="row" id="contentDelete">
        <div class="row">
            <c:forEach items="${listProductDeleted}" var="listD">
                <div class="col-md-3 col-xs-12" style="padding: 5px;">
                    <form action="#">
                        <div class="card" <c:if test="${listD.status == 999}">style="background-color: #656561" </c:if>>
                            <c:if test="${listD.image.startsWith('https') == false}">
                                <img class="card-img-top" class="img-fluid"
                                     src="https://res.cloudinary.com/dxxwcby8l/image/upload/v1647248722/r8sjly3st7estapvj19u.jpg"
                                     alt="Card image">
                            </c:if>
                            <c:if test="${listD.image.startsWith('https') == true}">
                                <img class="card-img-top" class="img-fluid"
                                     src="${listD.image}"
                                     alt="Card image">
                            </c:if>
                            <div class="card-body">
                                <h4 class="card-title id_pro">Mã sản phẩm: ${listD.idProduct}</h4>
                                <h5 class="card-text">Tên sản phẩm: ${listD.nameProduct}</h5>
                                <h5 class="card-text">Thời gian tạo: ${listD.dateCreated}</h5>
                                <a href="#" onclick="clickRestore(${listD.idProduct})"
                                   style="margin-top: 10px; width: 60%"
                                   type="button" class="btn btn-primary">Khôi phục</a>
                            </div>
                        </div>
                    </form>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<%-- DANH SÁCH DISCOUNT --%>
<div class="row" style="padding: 50px">
    <h1 type="button" id="btnOpenDiscount" style="text-align: center">Danh sách discount</h1>
    <div class="row" id="contentDiscount">
        <h1>* Thêm discount</h1>
        <div>
            <c:url value="/shop-manager/add-discount" var="action_discount"/>
            <form:form action="${action_discount}" method="POST" modelAttribute="discount"
                       class="form-edit-discount was-validated"
                       accept-charset="UTF-8">
                <div class="form-group form-check mb-3"
                     style="align-items: center; display: inline-flex; width: 100%;">
                    <label for="id_discount" class="form-label"
                           style="width: 30%; text-align: right; margin-right: 15px">Mã
                        discount: </label>
                    <form:input style="width: 40%;" type="text" class="form-control is-invalid" path="idDiscount"
                                id="id_discount" min="1" required="required" maxlength="9"/>
                    <div style="width: 30%;margin-left: 10px;" class="invalid-feedback">
                        Không khoảng trắng
                    </div>
                </div>
                <div class="form-group form-check mb-3"
                     style="align-items: center; display: inline-flex; width: 100%;">
                    <label for="name_discount" class="form-label"
                           style="width: 30%; text-align: right; margin-right: 15px">Tên
                        discount: </label>
                    <form:input style="width: 40%;" type="text" class="form-control is-invalid" path="nameDiscount"
                                id="name_discount" required="required"/>
                    <div style="width: 30%;margin-left: 10px;" class="invalid-feedback">
                        Nhập tên discount
                    </div>
                </div>
                <div class="form-group name form-check mb-3"
                     style="align-items: center; display: inline-flex; width: 100%;">
                    <label for="percent_discount" class="form-label"
                           style="width: 30%; text-align: right; margin-right: 15px">Giảm %: </label>
                    <form:input onchange="onchange_percentDiscount()" min="0" max="100" style="width: 40%;"
                                type="number"
                                class="form-control is-invalid" path="percentDiscount"
                                id="percent_discount" required="required" value="0"/>
                    <div style="width: 30%;margin-left: 10px;" class="invalid-feedback">
                        Nhập số % giảm
                    </div>
                </div>
                <div class="form-group name form-check mb-3"
                     style="align-items: center; display: inline-flex; width: 100%;">
                    <label for="value_discount" class="form-label"
                           style="width: 30%; text-align: right; margin-right: 15px">Giảm giá trị: </label>
                    <form:input onchange="onchange_valueDiscount()" min="0" style="width: 40%;" type="number"
                                class="form-control is-invalid" path="valueDiscount"
                                id="value_discount" required="required" value="0"/>
                    <div style="width: 30%;margin-left: 10px;" class="invalid-feedback">
                        Nhập giá trị giảm
                    </div>
                </div>
                <div class="form-group name form-check mb-3"
                     style="align-items: center; display: inline-flex; width: 100%;">
                    <label for="datebegin_discount" class="form-label"
                           style="width: 30%; text-align: right; margin-right: 15px">Ngày bắt đầu discount: </label>
                    <form:input style="width: 40%;" type="date" class="form-control is-invalid" path="dateBeginDis"
                                id="datebegin_discount" required="required"/>
                    <div style="width: 30%;margin-left: 10px;" class="invalid-feedback">
                        Nhập ngày bắt đầu
                    </div>
                </div>
                <div class="form-group name form-check mb-3"
                     style="align-items: center; display: inline-flex; width: 100%;">
                    <label for="datefinish_discount" class="form-label"
                           style="width: 30%; text-align: right; margin-right: 15px">Ngày kết thúc discount: </label>
                    <form:input style="width: 40%;" type="date" class="form-control is-invalid" path="dateFinishDis"
                                id="datefinish_discount" required="required"/>
                    <div style="width: 30%;margin-left: 10px;" class="invalid-feedback">
                        Nhập kết thúc
                    </div>
                </div>

                <div style="display: flex;">
                    <a href="#" onclick="clickReset()" style="margin-left: 40%;margin-top: 25px; width: 120px"
                       type="button"
                       class="btn btn-primary">Reset</a>
                    <button <c:if test="${active != 'actived'}"> disabled </c:if> onclick="this.form.submit()" class="btn btn-primary"
                            style="margin-left: 10px;margin-top: 25px; width: 120px">upload <c:if test="${active != 'actived'}"> (BANNED) </c:if>
                    </button>
                </div>
            </form:form>
        </div>

        <h1>* Quản lý discount</h1>
        <h3 style="padding: 50px;color: orange">* Đang hoạt động</h3>
        <div>
            <table class="table">
                <thead class="table-success">
                <tr style="text-align: center">
                    <th>Mã Discount</th>
                    <th>Tên</th>
                    <th>% Giảm</th>
                    <th>Giá trị giảm</th>
                    <th>Ngày bắt đầu</th>
                    <th>Ngày kết thúc</th>
                    <th>Trạng thái</th>
                    <th>Edit</th>
                </tr>
                </thead>
                <tbody style="text-align: center">
                <c:forEach items="${listDiscount}" var="dis">
                    <tr class="tr_tbl_discount">
                        <td class="idDiscount-tbl">${dis.idDiscount}</td>
                        <td>${dis.nameDiscount}</td>
                        <c:if test="${dis.percentDiscount != null}">
                            <td>${dis.percentDiscount}</td>
                        </c:if>
                        <c:if test="${dis.percentDiscount == null}">
                            <td>---</td>
                        </c:if>
                        <c:if test="${dis.valueDiscount != null}">
                            <td><fmt:formatNumber type="number"
                                                  maxFractionDigits="3"
                                                  value="${dis.valueDiscount}"/></td>
                        </c:if>
                        <c:if test="${dis.valueDiscount == null}">
                            <td>---</td>
                        </c:if>

                        <c:if test="${dis.dateBeginDis == null}">
                            <td>---</td>
                        </c:if>
                        <c:if test="${dis.dateBeginDis != null}">
                            <td>${dis.dateBeginDis}</td>
                        </c:if>

                        <c:if test="${dis.dateFinishDis == null}">
                            <td>---</td>
                        </c:if>
                        <c:if test="${dis.dateFinishDis != null}">
                            <td>${dis.dateFinishDis}</td>
                        </c:if>

                        <c:if test="${dis.status == 1}">
                            <td>Đang hoạt động</td>
                        </c:if>
                        <c:if test="${dis.status != 1}">
                            <td>Chưa áp dụng</td>
                        </c:if>
                        <td>
                            <button class="btn_delete_discount">Xoá</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <h3 style="padding: 50px;color: orange">* Đã xoá</h3>
        <div>
            <table class="table">
                <thead class="table-success">
                <tr style="text-align: center">
                    <th>Mã Discount</th>
                    <th>Tên</th>
                    <th>% Giảm</th>
                    <th>Giá trị giảm</th>
                    <th>Ngày bắt đầu</th>
                    <th>Ngày kết thúc</th>
                    <th>Trạng thái</th>
                    <th>Edit</th>
                </tr>
                </thead>
                <tbody style="text-align: center">
                <c:forEach items="${listDiscount_Remove}" var="dis">
                    <tr class="tr_tbl_discount_restore">
                        <td class="idDiscount-tbl-restore">${dis.idDiscount}</td>
                        <td>${dis.nameDiscount}</td>
                        <c:if test="${dis.percentDiscount != null}">
                            <td>${dis.percentDiscount}</td>
                        </c:if>
                        <c:if test="${dis.percentDiscount == null}">
                            <td>---</td>
                        </c:if>
                        <c:if test="${dis.valueDiscount != null}">
                            <td><fmt:formatNumber type="number"
                                                  maxFractionDigits="3"
                                                  value="${dis.valueDiscount}"/></td>
                        </c:if>
                        <c:if test="${dis.valueDiscount == null}">
                            <td>---</td>
                        </c:if>

                        <c:if test="${dis.dateBeginDis == null}">
                            <td>---</td>
                        </c:if>
                        <c:if test="${dis.dateBeginDis != null}">
                            <td>${dis.dateBeginDis}</td>
                        </c:if>

                        <c:if test="${dis.dateFinishDis == null}">
                            <td>---</td>
                        </c:if>
                        <c:if test="${dis.dateFinishDis != null}">
                            <td>${dis.dateFinishDis}</td>
                        </c:if>

                        <c:if test="${dis.status == 1}">
                            <td>Đang hoạt động</td>
                        </c:if>
                        <c:if test="${dis.status != 1}">
                            <td>Chưa áp dụng</td>
                        </c:if>
                        <td>
                            <button class="btn_restore_discount">Khôi phục</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<style>
    #btnOpenF:hover, #btnOpenWaitting:hover, #btnOpenDeleted:hover, #btnOpenDiscount:hover {
        background-color: #ff4c3b;
        color: white;
    }
</style>
<script>
    let imgInp = document.getElementById("file");
    let img_Temp = document.getElementById("img_temp");
    imgInp.onchange = evt => {
        const [file] = imgInp.files
        if (file) {
            img_Temp.src = URL.createObjectURL(file)
        }
    }

    window.onload = function () {
        document.getElementById("content").style.display = 'none';
        document.getElementById("contentWaitting").style.display = 'none';
        document.getElementById("contentDelete").style.display = 'none';
        document.getElementById("contentDiscount").style.display = 'none';

        var tr_discount = document.getElementsByClassName("tr_tbl_discount");
        var btn_delete_discount = document.getElementsByClassName("btn_delete_discount");
        var id_Discount_from_tr = document.getElementsByClassName("idDiscount-tbl");
        for (let i = 0; i < tr_discount.length; i++){
            btn_delete_discount[i].setAttribute("onclick", 'clickDeleteDiscount('+ i + ',' + '\'' + id_Discount_from_tr[i].innerText + '\'' + ')');
        }

        var tr_discount_restore = document.getElementsByClassName("tr_tbl_discount_restore");
        var btn_restore_discount = document.getElementsByClassName("btn_restore_discount");
        var id_Discount_from_tr_restore = document.getElementsByClassName("idDiscount-tbl-restore");
        for (let i = 0; i < tr_discount_restore.length; i++){
            btn_restore_discount[i].setAttribute("onclick", 'clickRestoreDiscount('+ i + ',' + '\'' + id_Discount_from_tr_restore[i].innerText + '\'' + ')');
        }
    }

    function clickReset() {
        window.location.reload()
    }

    function clickSavePro() {
        if ('${active}' == 'actived') {
            var answer = window.confirm("Save data?");
            if (answer) {
                var inputName = document.getElementById("name_pro").value;
                var inputPrice = document.getElementById("price_pro").value;
                var inputDesc = document.getElementById("descr_pro").value;

                var inputType = document.getElementById("type").selectedIndex;
                var type = document.getElementById("type").options[inputType].value;

                var inputManu = document.getElementById("manufacturer_pro").value;
                var inputImg = "${linkImg}";

                var idShopStore = "${idShop_Store.getIdShopStore()}";

                fetch('http://localhost:8080/thuongmaidientu/api/add-pro', {
                    method: 'post',
                    body: JSON.stringify({
                        "idShop": idShopStore,
                        "name_pro": inputName,
                        "price": inputPrice,
                        "descr": inputDesc,
                        "manufa": inputManu,
                        "type": type,
                        "img": inputImg.toString()
                    }),
                    headers: {
                        "Content-Type": "application/json"
                    }
                }).then(function (res) {
                    if (res.status === 200) {
                        alert('Thêm sản phẩm thành công');
                        window.location.reload();
                    } else
                        alert('Cập nhật không thành công');
                })
            } else {
                //some code
            }
        } else {
            alert('Hiện tại shop của bạn đang trong tình trạng bị khoá, vui lòng thử lại sau!!');
        }
    }

    var clickBtnFormDK = 0;
    document.getElementById("btnOpenF").onclick = function () {
        if (clickBtnFormDK == 0) {
            document.getElementById("content").style.display = 'block';
            clickBtnFormDK = 1;
        } else {
            clickBtnFormDK = 0;
            document.getElementById("content").style.display = 'none';
        }
    };
    var clickBtnWaitting = 0;
    document.getElementById("btnOpenWaitting").onclick = function () {
        if (clickBtnWaitting == 0) {
            document.getElementById("contentWaitting").style.display = 'block';
            clickBtnWaitting = 1;
        } else {
            clickBtnWaitting = 0;
            document.getElementById("contentWaitting").style.display = 'none';
        }
    };
    var clickBtnDeleted = 0;
    document.getElementById("btnOpenDeleted").onclick = function () {
        if (clickBtnDeleted == 0) {
            document.getElementById("contentDelete").style.display = 'block';
            clickBtnDeleted = 1;
        } else {
            clickBtnDeleted = 0;
            document.getElementById("contentDelete").style.display = 'none';
        }
    };
    var clickBtnDiscount = 0;
    document.getElementById("btnOpenDiscount").onclick = function () {
        if (clickBtnDiscount == 0) {
            document.getElementById("contentDiscount").style.display = 'block';
            clickBtnDiscount = 1;
        } else {
            clickBtnDiscount = 0;
            document.getElementById("contentDiscount").style.display = 'none';
        }
    };

    var ip_percent_dis = document.getElementById("percent_discount");
    var ip_value_dis = document.getElementById("value_discount");

    function onchange_percentDiscount() {
        ip_value_dis.style.display = 'none';
        if (ip_percent_dis.length = 0)
            ip_value_dis.style.display = 'block';
        if (ip_percent_dis.length > 0)
            ip_value_dis.style.display = 'none';
    }

    function onchange_valueDiscount() {
        ip_percent_dis.style.display = 'none';
        if (ip_value_dis.length = 0)
            ip_percent_dis.style.display = 'block';
        if (ip_value_dis.length > 0)
            ip_percent_dis.style.display = 'none';
    }

    function clickDelete(id) {
        if ('${active}' == 'actived') {
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
                        window.location.reload();
                    } else
                        alert('Xoá không thành công');
                })
            } else {
                //some code
            }
        } else {
            alert('Hiện tại shop của bạn đang trong tình trạng bị khoá, vui lòng thử lại sau!!');
        }
    }

    function clickRestore(id) {
        if ('${active}' == 'actived') {
            var answer = window.confirm("Restore data?");
            if (answer) {
                fetch('http://localhost:8080/thuongmaidientu/api/update-restore-pro', {
                    method: 'post',
                    body: JSON.stringify({
                        "idPro": id.toString()
                    }),
                    headers: {
                        "Content-Type": "application/json"
                    }
                }).then(function (res) {
                    if (res.status === 200) {
                        alert('Khôi phục thành công');
                        window.location.reload();
                    } else
                        alert('Khôi phục không thành công');
                })
            } else {
                //some code
            }
        } else {
            alert('Hiện tại shop của bạn đang trong tình trạng bị khoá, vui lòng thử lại sau!!');
        }
    }


    function clickDeleteDiscount(i,idDis) {
        if ('${active}' == 'actived') {
            var answer = window.confirm("Delete data?");
            if (answer) {
                fetch('http://localhost:8080/thuongmaidientu/api/update-stt-discount', {
                    method: 'post',
                    body: JSON.stringify({
                        "idDis": idDis.toString(),
                        "sttDis": "0"
                    }),
                    headers: {
                        "Content-Type": "application/json"
                    }
                }).then(function (res) {
                    if (res.status === 200) {
                        alert('Xoá thành công');
                        document.getElementsByClassName("tr_tbl_discount")[i].style.display = 'none';
                    } else
                        alert('Xoá không thành công');
                })
            } else {
                //some code
            }
        } else {
            alert('Hiện tại shop của bạn đang trong tình trạng bị khoá, vui lòng thử lại sau!!');
        }
    }

    function clickRestoreDiscount(i,idDis) {
        if ('${active}' == 'actived') {
            var answer = window.confirm("Delete data?");
            if (answer) {
                fetch('http://localhost:8080/thuongmaidientu/api/update-stt-discount', {
                    method: 'post',
                    body: JSON.stringify({
                        "idDis": idDis.toString(),
                        "sttDis": "1"
                    }),
                    headers: {
                        "Content-Type": "application/json"
                    }
                }).then(function (res) {
                    if (res.status === 200) {
                        alert('Phục hồi thành công');
                        document.getElementsByClassName("tr_tbl_discount_restore")[i].style.display = 'none';
                    } else
                        alert('Xoá không thành công');
                })
            } else {
                //some code
            }
        } else {
            alert('Hiện tại shop của bạn đang trong tình trạng bị khoá, vui lòng thử lại sau!!');
        }
    }
</script>
