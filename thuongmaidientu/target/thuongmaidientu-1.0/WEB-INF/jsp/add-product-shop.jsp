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

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%-- THÊM SẢN PHẨM --%>
<h1 type="button" id="btnOpenF" style="margin-top: 50px;text-align: center">Thêm sản phẩm mới</h1>
<div class="row" style="margin-top: 20px">
    <div id="content" style="border-style: dashed;margin-left: 10px;width: 90%">
        <form:form action="${action}"
                   method="POST" modelAttribute="product"
                   enctype="multipart/form-data" onsubmit="clickSavePro()" class="form-edit-pro was-validated"
              style="width: 120%;margin-top: 10px; font-size: 20px; margin-right: 0px">
            <div class="item name form-check mb-3" style="align-items: center; display: inline-flex; width: 100%;">
                <label for="name_pro" class="form-label" style="width: 30%; text-align: right; margin-right: 15px">Tên
                    sản phẩm:</label>
                <input style="width: 40%;" type="text" class="form-control is-invalid" id="name_pro" required>
                <div style="width: 30%;margin-left: 10px;" class="invalid-feedback">
                    Nhập tên sản phẩm
                </div>
            </div>
            <div class="item price mb-3" style="align-items: center; display: inline-flex; width: 100%;">
                <label style="width: 30%; text-align: right; margin-right: 15px">Giá:</label>
                <input style="width: 40%;" type="text" class="form-control is-invalid" id="price_pro" required>
                <div style="width: 30%;margin-left: 10px" class="invalid-feedback">
                    Nhập giá
                </div>
            </div>
            <div class="item descr mb-3" style="align-items: center; display: inline-flex; width: 100%;">
                <label style="width: 30%; text-align: right; margin-right: 15px;">Mô tả:</label>
                <textarea style="width: 40%;height: 150px" type="text" class="form-control is-invalid"
                          id="descr_pro" required></textarea>
                <div style="width: 30%;margin-left: 10px" class="invalid-feedback">
                    Nhập mô tả sản phẩm
                </div>
            </div>
            <div class="item type_pro mb-3" style="align-items: center; display: inline-flex; width: 100%;">
                <label style="width: 30%; text-align: right; margin-right: 15px">Loại sản phẩm:</label>
                <select style="width: 40%;" id="type" class="form-select is-invalid" required>
                    <c:forEach items="${type_products}" var="c">
                        <option value="${c.idTypeProduct}">${c.typeName}</option>
                    </c:forEach>
                </select>
                <div style="width: 30%;margin-left: 10px" class="invalid-feedback">
                    Chọn loại
                </div>
            </div>

            <div class="item manufac mb-3" style="align-items: center; display: inline-flex; width: 100%;">
                <label style="width: 30%; text-align: right; margin-right: 15px">Nhà sản xuất:</label>
                <input style="width: 40%;" type="text" class="form-control is-invalid" id="manufacturer_pro" required>
                <div style="width: 30%;margin-left: 10px" class="invalid-feedback">
                    Nhập tên nhà sản xuất
                </div>
            </div>

            <div class="item image mb-3" style="align-items: center; display: inline-flex; width: 100%" ;>
<%--                <label style="width: 30%; text-align: right; margin-right: 15px" for="formFile"--%>
<%--                       class="form-label">--%>
<%--                    Thêm hình ảnh</label>--%>
<%--                <input style="width: 40%;" class="form-control" type="file" id="formFile" required>--%>
<%--                <div style="width: 30%;margin-left: 10px" class="invalid-feedback">--%>
<%--                    Chọn ảnh--%>
<%--                </div>--%>

                <c:url value="/shop-manager/add-product" var="action" />
                <form:form action="${action}"
                           method="POST" modelAttribute="product"
                           enctype="multipart/form-data">
                    <form:input id="file" path="file" type="file" />
                    <input type="submit" value="upload" />
                </form:form>


            </div>
            <div style="display: flex;">
                <a href="#" onclick="clickReset()" style="margin-left: 40%;margin-top: 25px; width: 120px" type="button"
                   class="btn btn-primary">Reset</a>
                <button href="#" type="submit" style="margin-left: 25px;margin-top: 25px; width: 120px"
                        class="btn btn-primary btn-save">Lưu Sản Phẩm
                </button>
            </div>
        </form:form>
    </div>
    <%--    <div style="display: flex;">--%>
    <%--        <a href="#" onclick="clickReset()" style="margin-left: 25px;margin-top: 25px; width: 120px" type="button" class="btn btn-primary">Reset</a>--%>
    <%--        <a href="#" onclick="clickSavePro()" type="button" style="margin-left: 25px;margin-top: 25px; width: 120px"--%>
    <%--           class="btn btn-primary btn-save">Lưu Sản Phẩm</a>--%>
    <%--    </div>--%>
</div>
<%-- DANH SÁCH CHỜ DUYỆT --%>
<h1 type="button" id="btnOpenWaitting" style="text-align: center">Danh sách chờ duyệt</h1>
<div class="row" id="contentWaitting" style="border-style: dashed; width: 100%;margin-top: 50px">
    <div class="row">
        <c:forEach items="${listProductWaitting}" var="list">
            <div class="col-md-3 col-xs-12" style="padding: 5px;">
                <form action="#">
                    <div class="card" <c:if test="${list.status == 100}">style="background-color: #e8db29" </c:if>>
                        <img class="card-img-top" class="img-fluid"
                             src="https://res.cloudinary.com/dxxwcby8l/image/upload/v1647248722/r8sjly3st7estapvj19u.jpg"
                             alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title id_pro">Mã sản phẩm: ${list.idProduct}</h4>
                            <h5 class="card-text">Tên sản phẩm: ${list.nameProduct}</h5>
                            <h5 class="card-text">Thời gian tạo: ${list.dateCreated}</h5>
                            <a href="#" onclick="clickDelete(${list.idProduct})" style="margin-top: 10px; width: 60%" type="button" class="btn btn-primary">Xoá</a>
                        </div>
                    </div>
                </form>
            </div>
        </c:forEach>
    </div>
</div>
<%-- DANH SÁCH ĐÃ XOÁ --%>
<h1 type="button" id="btnOpenDeleted" style="margin-top: 40px;text-align: center">Danh sách đã xoá</h1>
<div class="row" id="contentDelete" style="border-style: dashed; width: 100%;margin-top: 50px">
    <div class="row">
        <c:forEach items="${listProductDeleted}" var="listD">
            <div class="col-md-3 col-xs-12" style="padding: 5px;">
                <form action="#">
                    <div class="card" <c:if test="${listD.status == 999}">style="background-color: #656561" </c:if>>
                        <img class="card-img-top" class="img-fluid"
                             src="https://res.cloudinary.com/dxxwcby8l/image/upload/v1647248722/r8sjly3st7estapvj19u.jpg"
                             alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title id_pro">Mã sản phẩm: ${listD.idProduct}</h4>
                            <h5 class="card-text">Tên sản phẩm: ${listD.nameProduct}</h5>
                            <h5 class="card-text">Thời gian tạo: ${listD.dateCreated}</h5>
                            <a href="#" onclick="clickRestore(${listD.idProduct})" style="margin-top: 10px; width: 60%" type="button" class="btn btn-primary">Khôi phục</a>
                        </div>
                    </div>
                </form>
            </div>
        </c:forEach>
    </div>
</div>
<style>
    #btnOpenF:hover, #btnOpenWaitting:hover, #btnOpenDeleted:hover {
        background-color: blue;
        color: #eeeeee;
    }
</style>
<script>
    window.onload = function () {
        document.getElementById("content").style.display = 'none';
        document.getElementById("contentWaitting").style.display = 'none';
        document.getElementById("contentDelete").style.display = 'none';
    }

    function clickReset() {
        window.location.reload()
    }

    function clickSavePro() {
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

    function clickDelete(id){
        var answer = window.confirm("Delete data?");
        if (answer) {
            fetch('http://localhost:8080/thuongmaidientu/api/update-delete-pro',{
                method: 'post',
                body: JSON.stringify({
                    "idPro":id.toString()
                }),
                headers: {
                    "Content-Type": "application/json"
                }
            }).then(function (res) {
                if (res.status === 200) {
                    alert('Xoá thành công');
                    window.location.reload();
                }
                else
                    alert('Xoá không thành công');
            })
        } else {
            //some code
        }
    }

    function clickRestore(id){
        var answer = window.confirm("Restore data?");
        if (answer) {
            fetch('http://localhost:8080/thuongmaidientu/api/update-restore-pro',{
                method: 'post',
                body: JSON.stringify({
                    "idPro":id.toString()
                }),
                headers: {
                    "Content-Type": "application/json"
                }
            }).then(function (res) {
                if (res.status === 200) {
                    alert('Khôi phục thành công');
                    window.location.reload();
                }
                else
                    alert('Khôi phục không thành công');
            })
        } else {
            //some code
        }
    }
</script>
