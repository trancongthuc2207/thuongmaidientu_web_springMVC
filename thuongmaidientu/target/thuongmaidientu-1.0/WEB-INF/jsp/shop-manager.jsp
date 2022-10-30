<%--
    Document   : index
    Created on : Jul 10, 2022, 1:27:12 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="https://kit.fontawesome.com/6f26e389c8.js" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>

<%@page contentType="text/html" pageEncoding="UTF-8" %>


<c:url value="/shop-manager/amount/" var="updateAm"/>
<c:url value="/shop-manager/add-product" var="addProduct"/>
<div class="container shop">
    <div>
        <ul class="nav nav-pills navTask">
            <%--        QUẢNG CÁO  --%>
            <div id="mySidenav" class="sidenav" style="background-image: linear-gradient(#7C0D0D, #DC0404);">
                <div class="dropdown">
                    <button class="dropbtn"
                            [ngStyle]="{'color': 'white','font-style': 'bold', 'font-size': '20.01px', 'font-family':'sans-serif'}">
                        Screening
                    </button>
                    <div class="dropdown-content">
                        <a href="#">Link 1</a>
                        <a href="#">Link 2</a>
                        <a href="#">Link 3</a>
                    </div>
                </div>
            </div>
            <%--     ------------       --%>
            <%--     NAV HEADER PAGE INDEX      --%>
            <li class="nav-item dropdown">
                <div class="dropdown-right">
                    <a type="submit"
                       class="btn btn-sm btn-secondary dropdown-toggle dropdown-toggle-split dropbtn-right-side"
                       href="#"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <span
                            class="fas fa-user-circle"></span> Kênh Buôn Bán </a>
                    <div class="dropdown-content-right">
                        <div class="speech-bubble"><i> </i>Bạn muốn trở thành người bán hàng ?</div>
                    </div>
                </div>
            </li>
        </ul>
    </div>
    <c:forEach items="${shopAcc}" var="shop">
        <c:if test="${msgEr != null}">
            <div class="danger" style="color: #DC0404;background-color: lightslategray">
                <p style="font-size: 30px;text-align: center">${msgEr}</p>
            </div>
        </c:if>
        <%------------------  HEADER CONTENT  ----------------------%>
        <div class="col-md-3 col-xs-12" style="padding: 5px;width: 100%">
            <div style="display: inline-flex">
                <c:url value="/shop-manager/update-shopstore" var="action"/>
                <form:form action="${action}" method="POST" modelAttribute="shopstore" enctype="multipart/form-data"
                           style="display: flex">
                    <div style="display: inline-flex;width: 450px;height: 400px" class="card">
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
                        <div class="form-group edit image"
                             style="align-items: center; display: inline-flex; width: 100%; display: none">
                            <form:input id="file" path="file" type="file" cssClass="form-control"/>
                        </div>
                    </div>
                    <div class="form-group" style="margin-left: 30px; width: 600px">
                            <%--        TIEU DE                --%>
                        <h1 class="card-title">Mã shop: ${shop.idShopStore}</h1>
                        <form:input path="idShopStore" class="form-group card-text editS"
                                    cssStyle="font-size: 30px;border-color: transparent;display: none"
                                    value="${shop.idShopStore}"/>
                            <%--  EDIT BUTTON  --%>
                        <i onclick="editClick()" style="float: right;margin-left: 30px;font-size: 20px"
                           class="btn fa-solid fa-pen-to-square"></i>
                            <%--  /EDIT BUTTON  --%>
                        <div style="display: flex;font-size: 18px">
                            <h5 class="card-text">Tên shop:&ensp;&ensp;</h5>
                            <form:input path="nameStore" class="form-group card-text editS"
                                        style="font-size: 30px;border-color: transparent"
                                        value="${shop.nameStore}"/>
                        </div>
                        <div class="form-group card-text" style="display: flex; font-size: 20px">
                            <h5 class="card-text">Ngày tham gia:&ensp;</h5>
                            <input path="dateBegin" class="form-group card-text editS"
                                   style="width: 180px;height: 30px;border-color: transparent"
                                   value="${shop.dateBegin}"/>
                        </div>
                        <div style="display: flex; font-size: 20px">
                            <h5 class="card-text">Buôn bán sản phẩm chính:&ensp;</h5>
                                <%--                            <form:input path="mainType" class="form-group card-text editS"--%>
                                <%--                                        style="width: 180px;height: 30px;border-color: transparent"--%>
                                <%--                                        value="${shop.mainType.typeName}"/>--%>

                            <form:select
                                    cssStyle="text-align: center;width: 180px;height: 50px;border-color: transparent"
                                    path="mainType" class="form-select">
                                <c:forEach items="${type_products}" var="c">
                                    <option value="${c.idTypeProduct}"
                                            <c:if test="${c.idTypeProduct == shop.mainType.idTypeProduct}"> selected</c:if>
                                    >${c.typeName}</option>
                                </c:forEach>
                            </form:select>
                        </div>
                        <div style="height: 20px;display: flex; font-size: 20px">
                            <h5 class="card-text" style="margin-top: 10px">Sản phẩm phụ:&ensp;</h5>
                                <%--                            <form:input path="ortherType1" class="form-group card-text editS"--%>
                                <%--                                        style="text-align: center;width: 180px;height: 30px;border-color: transparent"--%>
                                <%--                                        value="${shop.ortherType1.typeName}"/>--%>

                            <form:select cssStyle="text-align: center;width: 180px;height: 50px;border-color: transparent"
                                    path="ortherType1" class="form-select">
                                <c:forEach items="${type_products}" var="c">
                                    <option <c:if
                                            test="${c.idTypeProduct == shop.ortherType1.idTypeProduct}"> selected</c:if>
                                            value="${c.idTypeProduct}">${c.typeName}</option>
                                </c:forEach>
                            </form:select>

                            <i>,&ensp;</i>
                                <%--                            <form:input path="ortherType2" class="form-group card-text editS"--%>
                                <%--                                        style="text-align: center;width: 180px;height: 30px;border-color: transparent"--%>
                                <%--                                        value="${shop.ortherType2.typeName}"/>--%>

                            <form:select
                                    cssStyle="text-align: center;width: 180px;height: 50px;border-color: transparent"
                                    path="ortherType2" class="form-select">
                                <c:forEach items="${type_products}" var="c">
                                    <option <c:if
                                            test="${c.idTypeProduct == shop.ortherType2.idTypeProduct}"> selected</c:if>
                                            value="${c.idTypeProduct}">${c.typeName}</option>
                                </c:forEach>
                            </form:select>
                        </div>
                        <div style="margin-top: 50px">
                                <%--  SAVE BUTTON  --%>
                            <button type="submit" style="color: red;margin-left: 30px;font-size: 20px;display: none"
                                    class="btn fa-solid fa-pen-to-square edit save">save
                            </button>
                                <%--  SAVE BUTTON  --%>
                                <%--  CANCLE BUTTON  --%>
                            <button type="button" onclick="cancleEdit()" style="color: red;margin-left: 30px;font-size: 20px; display: none"
                               class="btn fa-solid fa-xmark edit cancle"></button>
                                <%--  CANCLE BUTTON  --%>
                        </div>
                        <div style="margin-top: 120px">
                            <a href="${addProduct}" class="btn btn-primary"
                               style="margin-top: 15px"> Thêm sản phẩm
                            </a>
                            <a href="${addProduct}" class="btn btn-primary"
                               style="margin-top: 15px"> Sản phẩm chờ duyệt
                            </a>
                        </div>
                    </div>
                </form:form>
                <div>
                        <%--            MY SHOP            --%>
                    <ul class="nav nav-pills navTask">
                            <%--        <c:url value="/user/customer-orders" var="cus_bag"/>--%>
                        <li class="nav-item dropdown">
                            <div class="dropdown" style="width: 130px">
                                <a type="submit" class="dropbtn" href="#"><i
                                        class='fas fa-shopping-cart'></i> My Shop
                                </a>

                                <c:url value="/shop-manager/orders" var="orders"></c:url>
                                <c:url value="/shop-manager/orders-accepted" var="ordersAcc"></c:url>
                                <c:url value="/shop-manager/reports" var="reports"/>
                                <c:url value="/shop-manager/turnover-shop" var="turnover"/>
                                <div class="dropdown-content">
                                    <a href="${orders}">Đơn Hàng Của Tôi &nbsp; <c:if test="${amountOrder > 0}"><i
                                            class='fas fa-exclamation-circle'
                                            style="color: #DC0404;font-size:18px"> ${amountOrder}</i></c:if></a>
                                    <a href="${ordersAcc}">Đơn Hàng Đã Kiểm Duyệt</a>
                                    <a href="${reports}">Phản Hồi Của Tôi &nbsp; <c:if test="${amountReport > 0}"><i
                                            class='fas fa-exclamation-circle'
                                            style="color: #DC0404;font-size:18px"> ${amountReport}</i></c:if></a>
                                    <a href="${turnover}">Doanh thu</a>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </c:forEach>
    <%--------------------------------------------%>
    <div class="row shop-items" style="margin-top: 50px;display: inline-flex">
        <%--        LIST PRODUCT     --%>
        <c:forEach items="${listProduct}" var="p">
            <c:url value="/shop-manager/edit/" var="cUrl">
                <c:param name="ID_Product" value="${p.shopProductsPK.idProduct}"/>
            </c:url>
            <div class="row" style="padding: 5px;width: 330px">
                <form action="#">
                    <div class="card" <c:if test="${p.amount <= 1}"> style="background-color: dimgrey"</c:if>>
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
                                <input min="1" style="width: 50%" type="number" class="card-text amount" id="amount_pro"
                                       value="${p.amount}">
                                <a onclick="clickSave()" type="button" class="btn btn-primary btn-save-amount">Lưu</a>
                            </p>
                            <p class="card-text">Thời gian bắt đầu bán: ${p.timeBegin}</p>
                            <p class="card-text">Thời gian kết thúc bán: ${p.timeFinish}</p>
                            <p class="card-text" <c:if test="${p.idDiscount.idDiscount != '1'}">style="background-color: red;color: white" </c:if>>Mã Discount: ${p.idDiscount.nameDiscount} - Active</p>

                            <p class="card-text" style="display: flex">Chọn mã mới:
                                <select onchange="saveDiscount(${p.product.idProduct})" style="width: 50%" class="form-select-discount">
                                    <option value="1">Không</option>
                                    <c:forEach items="${lst_discount}" var="dis">
                                        <option value="'${dis.idDiscount}'" <c:if test="${p.idDiscount.idDiscount == dis.idDiscount}">selected</c:if>>${dis.nameDiscount}</option>
                                    </c:forEach>
                                </select>
                                <a type="button" class="btn btn-primary save-discount">Lưu</a>
                            </p>

                            <a href="${cUrl}" class="btn btn-primary">Chỉnh sửa thông tin chi tiết</a>
                        </div>
                    </div>
                </form>
            </div>
        </c:forEach>
    </div>
    <div>
        <%--        PHÂN TRANG     --%>
        <ul class="pagination" style="align-items: center">
            <c:forEach begin="1" end="${Math.ceil(countPro/8)}" var="i">
                <c:url value="/shop-manager/" var="c">
                    <c:param value="${i}" name="page"/>
                </c:url>
                <li class="page-item"><a class="page-link" href="${c}">${i}</a></li>
            </c:forEach>
        </ul>
    </div>
</div>

<script>
    var luu_cart = document.getElementsByClassName("btn-save-amount");
    var input_amount = document.getElementsByClassName("amount");
    var id_prod = document.getElementsByClassName("id_pro");
    var fSelect = document.getElementsByClassName("form-select");

    var save_discount = document.getElementsByClassName("save-discount");
    var fSelect_discount = document.getElementsByClassName("form-select-discount");

    function clickSave() {
        var answer = window.confirm("Save data?");
        if (answer) {
            for (var i = 0; i < luu_cart.length; i++) {
                var button = luu_cart[i]
                var amount = input_amount[i].value;
                var id = id_prod[i].innerHTML.substring(13, id_prod[i].innerHTML.length);

                button.setAttribute("href", "${updateAm}" + id + "/" + amount)
            }
        } else {
            //some code
        }
    }

    // /add-discount-product
    function saveDiscount(idPro){
        for (var i = 0; i < save_discount.length; i++) {
            var fs = fSelect_discount[i]
            var idDiscount = fs.value;
            save_discount[i].setAttribute("onclick", "api_dis(" + idPro + "," + idDiscount + ")")
        }
    }

    function api_dis(idPro, idDis){
        var answer = window.confirm("Do you want to confirm this Discount?");
        if (answer) {
            fetch("http://localhost:8080/thuongmaidientu/api/add-discount-product", {
                method: 'post',
                body: JSON.stringify({
                    "idPro": idPro.toString(),
                    "idDis": idDis.toString()
                }),
                headers: {
                    "Content-Type": "application/json"
                }
            }).then(function (res) {
                if (res.status === 200) {
                    alert('Xác nhận discount thành công');
                } else
                    alert('Xác nhận thất bại');
            })
        } else {
            //some code
        }
    }

    var inputCan = document.getElementsByClassName("editS");
    var editNone = document.getElementsByClassName("edit");
    var clickEdit = 0;

    window.onload = function (){
        for (var i = 0; i < inputCan.length; i++) {
            var inp = inputCan[i];
            inp.setAttribute("readonly", true);
        }

        for (var i = 0; i < fSelect.length;i++){
            var f = fSelect[i];
            f.setAttribute("disabled", true);
            f.style.backgroundColor = "transparent";
        }
    }

    function editClick() {
        for (var i = 0; i < inputCan.length; i++) {
            var inp = inputCan[i];
            inp.removeAttribute("readonly");
        }

        for (var i = 0; i < editNone.length; i++) {
            var ed = editNone[i];
            ed.style.display = "block";
        }

        for (var i = 0; i < fSelect.length;i++){
            var f = fSelect[i];
            f.removeAttribute("disabled");
            f.style.backgroundColor = "transparent";
        }
    }

    function cancleEdit() {
        for (var i = 0; i < inputCan.length; i++) {
            var inp = inputCan[i];
            inp.setAttribute("readonly", true);
        }

        for (var i = 0; i < editNone.length; i++) {
            var ed = editNone[i];
            ed.style.display = "none";
        }
    }
</script>


<style>

    .header {
        overflow: hidden;
        background-color: #333;
        position: absolute;
        top: 0;
        width: 100%;
        padding: 16px;
    }

    .navTask {
        margin-right: 2%;
    }

    /* Dropdown Button */
    .dropbtn {
        background-color: #04AA6D;
        color: white;
        padding: 10px;
        font-size: 16px;
        border: none;
        border-radius: 20px 20px;
    }

    /* The container <div> - needed to position the dropdown content */
    .dropdown {
        position: relative;
        display: inline-block;
    }

    /* Dropdown Content (Hidden by Default) */
    .dropdown-content {
        display: none;
        position: fixed;
        background-color: #f1f1f1;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
        z-index: 1;
    }

    /* Links inside the dropdown */
    .dropdown-content a {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: flex;
    }

    /* Change color of dropdown links on hover */
    .dropdown-content a:hover {
        background-color: #ddd;
    }

    /* Show the dropdown menu on hover */
    .dropdown:hover .dropdown-content {
        display: block;
    }

    /* Change the background color of the dropdown button when the dropdown content is shown */
    .dropdown:hover .dropbtn {
        background-color: #3e8e41;
    }

    /*  ------------------ INDEX ---------------------------  */
    .row {
        padding-top: 10px;
    }

    .container {
        padding: 16px;
        margin-top: 30px;
    }

    .shop {
        margin-top: 90px;
    }

    <%--  BOX  --%>
    .speech-bubble {
        width: 150px;
        /*height: 80px;*/
        position: absolute;
        background: #2997e8;
        border-radius: 10px;
        text-align: center;
        color: white;
    }

    .speech-bubble::before {
        width: 0;
        height: 0;
        margin: 13px 0 0 -25px;
        position: absolute;
        content: "";
        border-top: 13px solid transparent;
        border-bottom: 13px solid transparent;
        border-right: 26px solid #2997e8;
    }

    .dropbtn-right-side {
        background-color: #04AA6D;
        color: white;
        padding: 10px;
        font-size: 16px;
        border: none;
        border-radius: 20px 20px;
    }

    /* The container <div> - needed to position the dropdown content */
    .dropdown-right {
        position: relative;
        display: flex;
    }

    /* Dropdown Content (Hidden by Default) */
    .dropdown-content-right {
        margin-left: 115%;
        display: none;
        position: absolute;
        background-color: #f1f1f1;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
        z-index: 1;
    }

    /* Links inside the dropdown */
    .dropdown-content-right a {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }

    /* Change color of dropdown links on hover */
    .dropdown-content-right a:hover {
        background-color: #ddd;
    }

    /* Show the dropdown menu on hover */
    .dropdown-right:hover .dropdown-content-right {
        display: block;
    }

    /* Change the background color of the dropdown button when the dropdown content is shown */
    .dropdown-right:hover .dropbtn-right-side {
        background-color: #3e8e41;
    }

    /*  ------------------ĐỘNG NGANG------------------ */
    .sidenav {
        height: 70%;
        width: 10%;
        position: fixed;
        z-index: 0;
        top: 120px;
        left: 0px;
        right: 50px;
        background-color: #ff0000;
        overflow-x: hidden;
        padding-top: 0px;
        transition: 0.5s;
        margin-bottom: 20%;
    }

    /* ON HOVER */
    .sidenav:hover {
        width: 250px;
    }

    .sidenav normalb:hover {
        background-color: #4F0909;
    }

    .buttonGroup {
        align-content: baseline;
    }

    /* Darker background on mouse-over */
    .btn:hover {
        background-color: #4F0909;
    }

    .sidenav h1 {
        background-color: #850101; /* Blue background */
        border: thin; /* Remove borders */
        color: white; /* White text */
        font-size: 16px; /* Set a font size */
        cursor: pointer; /* Mouse pointer on hover */
        overflow: hidden;
    }

    .sidenav h1:hover {
        background-color: #4F0909;
    }

    /* The navigation menu links */
    .sidenav a {
        padding-left: 10px;
        text-decoration: none;
        font-size: 18px;
        color: #f1f1f1;
        display: block;
        transition: 0.3s
    }

    .sidenav a:hover, .offcanvas a:focus {
        color: #f1f1f1;
    }
</style>
