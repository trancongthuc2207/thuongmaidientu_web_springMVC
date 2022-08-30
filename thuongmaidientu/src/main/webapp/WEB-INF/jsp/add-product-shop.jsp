<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 30/08/2022
  Time: 1:23 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div style="margin-top: 30px">
    <h1>THÊM SẢN PHẨM MỚI</h1>
    <div style="width: 70%">
        <form class="form-edit-pro" style="margin-top: 10px; font-size: 20px; margin-right: 0px">
            <div class="item name" style="align-items: center; display: inline-flex; width: 70%;">
                <label style="width: 50%; text-align: right; margin-right: 15px">Tên sản phẩm:</label>
                <input type="text" class="form-control" id="name_pro"">
            </div>
            <div class="item price" style="align-items: center; display: inline-flex; width: 70%;">
                <label style="width: 50%; text-align: right; margin-right: 15px">Giá:</label>
                <input type="text" class="form-control" id="price_pro">
            </div>
            <div class="item descr" style="align-items: center; display: inline-flex; width: 70%;">
                <label style="width: 50%; text-align: right; margin-right: 15px;">Mô tả:</label>
                <textarea style="height: 150px" type="text" class="form-control"
                          id="descr_pro"></textarea>
            </div>
            <div class="item type_pro" style="align-items: center; display: inline-flex; width: 70%;">
                <label style="width: 50%; text-align: right; margin-right: 15px">Loại sản phẩm:</label>
                <select id="type" class="form-select">
                    <c:forEach items="${type_products}" var="c">
                        <option value="${c.idTypeProduct}">${c.typeName}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="item manufac" style="align-items: center; display: inline-flex; width: 70%;">
                <label style="width: 50%; text-align: right; margin-right: 15px">Nhà sản xuất:</label>
                <input type="text" class="form-control" id="manufacturer_pro">
            </div>

            <div class="item stt" style="align-items: center; display: inline-flex; width: 70%;">
                <label style="width: 50%; text-align: right; margin-right: 15px">Trạng thái:</label>
                <input type="text" class="form-control" id="stt_pro">
            </div>
            <div class="item image" style="align-items: center; display: inline-flex; width: 70%" ;>
                <label style="width: 50%; text-align: right; margin-right: 15px" for="formFile"
                       class="form-label">
                    Thêm hình ảnh</label>
                <input class="form-control" type="file" id="formFile">
            </div>
        </form>
    </div>

    <div style="display: flex;">
        <a href="#" onclick="clickReset()" style="margin-left: 25px;margin-top: 25px; width: 120px" type="button" class="btn btn-primary">Reset</a>
        <a href="#" onclick="clickSave(${idPro})" type="button" style="margin-left: 25px;margin-top: 25px; width: 120px"
           class="btn btn-primary btn-save">Lưu</a>
        <a href="#" onclick="clickDelete(${idPro})" type="button" style="margin-left: 25px;margin-top: 25px; width: 120px"
           class="btn btn-primary btn-delete">Xoá</a>
    </div>
</div>
