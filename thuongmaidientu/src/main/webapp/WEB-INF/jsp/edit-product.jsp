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
                                   value="${p.unitPrice}">
                        </div>
                        <div class="item descr" style="align-items: center; display: inline-flex; width: 70%;">
                            <label style="width: 50%; text-align: right; margin-right: 15px;">Mô tả:</label>
                            <textarea style="height: 150px" type="text" class="form-control"
                                      id="descr_pro">${p.productDescription}</textarea>
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
                    <a href="#" onclick="clickReset()" style="margin-top: 10px; width: 60%" type="button" class="btn btn-primary">Reset</a>
                    <a href="#" onclick="clickSave(${idPro})" type="button" style="margin-top: 25px; width: 60%"
                       class="btn btn-primary btn-save">Lưu</a>
                    <a href="#" onclick="clickDelete(${idPro})" type="button" style="margin-top: 25px; width: 60%"
                       class="btn btn-primary btn-delete">Xoá</a>
                </div>
            </c:forEach>
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

            fetch('http://localhost:8080/thuongmaidientu/api/update-pro',{
                method: 'post',
                body: JSON.stringify({
                    "idPro":id.toString(),
                    "name_pro":inputName,
                    "price":inputPrice,
                    "descr":inputDesc,
                    "manufa":inputManu,
                    "type":type,
                    "img":inputImg
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
                    window.location.href = "${back}";
                }
                else
                    alert('Xoá không thành công');
            })
        } else {
            //some code
        }
    }

    function clickReset(){
        window.location.reload()
    }


    window.onload = function (){
        var type = document.getElementById("type");
        for(var i = 0; i < type.length - 1; i++){
            var ty = type.options[i].value;
            var pro = ${productByID[0].typeOfProduct.idTypeProduct}
            if(ty == pro)
                type.options[i].setAttribute("selected","selected");
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