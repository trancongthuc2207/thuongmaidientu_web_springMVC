<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 06/09/2022
  Time: 9:30 CH
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<div class="container">
    <h1 style="text-align: center">THÔNG TIN CÁ NHÂN</h1>
    <c:forEach items="${cusCur}" var="in4">
        <!-- profile custtomer -->
        <div class="main-body">
            <c:url value="/user/infor-customer/update" var="action"/>
            <form:form action="${action}" method="POST" modelAttribute="customers" enctype="multipart/form-data"
                       class="form-edit-pro was-validated"
                       style="margin-top: 10px; font-size: 20px; margin-right: 0px">
                <div class="row gutters-sm">
                    <div class="col-md-4 mb-3">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex flex-column align-items-center text-center">
                                        <%--                                    <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Admin"--%>
                                        <%--                                         class="rounded-circle" width="150">--%>

                                    <c:if test="${in4.image.startsWith('https') == false}">
                                        <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Admin"
                                             class="rounded-circle" width="150">
                                    </c:if>
                                    <c:if test="${in4.image.startsWith('https') == true}">
                                        <img style="width: 300px;height: 250px" class="rounded-circle"
                                             src="${in4.image}"
                                             alt="Admin">
                                    </c:if>

                                    <div class="mt-3">
                                        <h4>Vo Hung</h4>
                                        <p class="text-secondary mb-1">Người dùng</p>
                                        <p class="text-muted font-size-sm">52 Trần Văn Dư</p>
                                        <button class="btn btn-outline-primary">Nhắn Tin</button>
                                    </div>
                                    <form:input cssStyle="width: 40%; display: none" type="text"
                                                class="col-sm-9 text-secondary form-control"
                                                path="idCustomer"
                                                value="${in4.idCustomer}"/>
                                    <form:input id="file" path="file" type="file"
                                                cssClass="form-control editCusImg" cssStyle="display: none"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="card mb-3">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Họ và tên</h6>
                                    </div>
                                    <form:input style="width: 40%;" type="text"
                                                class="col-sm-9 text-secondary form-control editCus"
                                                path="nameC"
                                                value="${in4.nameC}"/>
                                        <%--                                <div class="col-sm-9 text-secondary">--%>
                                        <%--                                    Vo Hung--%>
                                        <%--                                </div>--%>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Giới tính</h6>
                                    </div>
                                    <h6 style="width: 40%;" class="in4Sex">${in4.sex}</h6>
                                    <form:select
                                            cssStyle="text-align: center;width: 180px;height: 50px;border-color: transparent"
                                            path="sex" class="form-selec editCusSex">
                                        <option value="Nam">Nam</option>
                                        <option value="Nữ">Nữ</option>
                                        <option value="Khác">Khác</option>
                                    </form:select>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">CMND</h6>
                                    </div>
                                    <form:input style="width: 40%;" type="text"
                                                class="col-sm-9 text-secondary form-control editCus"
                                                path="serialNumberC"
                                                value="${in4.serialNumberC}"/>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Số điện thoại</h6>
                                    </div>
                                    <form:input style="width: 40%;" type="text"
                                                class="col-sm-9 text-secondary form-control editCus"
                                                path="phoneNumber"
                                                value="${in4.phoneNumber}"/>
                                        <%--                                <div class="col-sm-9 text-secondary">--%>
                                        <%--                                    +84344564075--%>
                                        <%--                                </div>--%>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Địa chỉ</h6>
                                    </div>
                                    <form:input style="width: 40%;" type="text"
                                                class="col-sm-9 text-secondary form-control editCus"
                                                path="address"
                                                value="${in4.address}"/>
                                        <%--                                <div class="col-sm-9 text-secondary">--%>
                                        <%--                                    52 Trần Văn Dư--%>
                                        <%--                                </div>--%>
                                </div>
                                <div>
                                        <%--  EDIT BUTTON  --%>
                                    <i onclick="editCusClick()" style="float: right;margin-left: 30px;font-size: 20px"
                                       class="btn fa-solid fa-pen-to-square"> Chỉnh sửa</i>
                                        <%--  /EDOT BUTTON  --%>
                                        <%--  SAVE BUTTON  --%>
                                    <button type="submit"
                                            style="color: red;margin-left: 30px;font-size: 20px;display: none"
                                            class="btn fa-solid fa-pen-to-square edit save">save
                                    </button>
                                        <%--  SAVE BUTTON  --%>
                                        <%--  CANCLE BUTTON  --%>
                                    <button type="button" onclick="cancleCusEdit()"
                                            style="color: red;margin-left: 30px;font-size: 20px; display: none"
                                            class="btn fa-solid fa-xmark edit cancle"> Huỷ </button>
                                        <%--  CANCLE BUTTON  --%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form:form>
        </div>
    </c:forEach>
</div>


<div style="width: 100%">
    <h3 type="button" onclick="clickChangePass()">* Đổi mật khẩu</h3>
    <c:if test="${errMsgPass != null}">
        <div>
            <h3 style="color: red">${errMsgPass}</h3>
        </div>
    </c:if>
    <c:url value="/user/infor-customer/update-account" var="upPas"/>
    <form:form action="${upPas}" method="POST" modelAttribute="account" enctype="multipart/form-data"
               cssClass="editPass">
        <div style="width: 450px;padding: 10px;border-style: dashed">
            <form:input path="idAccount" style="width: 200px;height: 25px" type="text" cssStyle="display: none" value="${idAcc}"/>
            <div style="display: flex">
                <h6 class="mb-0" style="width: 200px">Nhập mật khẩu mới:</h6>
                <form:input path="passwordC" style="width: 200px;height: 25px" type="password"
                            class="col-sm-9 text-secondary form-control"/>
            </div>
            <div style="display: flex; margin-top: 10px">
                <h6 class="mb-0" style="width: 200px">Xác nhận mật khẩu mới:</h6>
                <form:input path="confirmPassword" style="width: 200px;height: 25px" type="password"
                            class="col-sm-9 text-secondary form-control"/>
            </div>
            <button type="submit"
                    style="color: red;margin-left: 30px;font-size: 20px;"
                    class="btn fa-solid fa-pen-to-square saveP">save
            </button>
        </div>
    </form:form>
</div>
<script>

    var inputCan = document.getElementsByClassName("editCus");
    var editNone = document.getElementsByClassName("editCusImg");
    var btnE = document.getElementsByClassName("edit");
    var fSelect = document.getElementsByClassName("editCusSex");
    var in4S = document.getElementsByClassName("in4Sex");
    var fEditPass = document.getElementsByClassName("editPass")

    var clickChangeP = 0;
    window.onload = function () {
        for (var i = 0; i < inputCan.length; i++) {
            var inp = inputCan[i];
            inp.setAttribute("readonly", true);
            inp.style.backgroundColor = "transparent";
            inp.style.borderColor = "transparent";

            fSelect[0].setAttribute("disabled", true);
            fSelect[0].style.display = "none";
            fEditPass[0].style.display = "none";
        }
    }

    function editCusClick() {
        for (var i = 0; i < inputCan.length; i++) {
            var inp = inputCan[i];
            inp.removeAttribute("readonly");
        }

        editNone[0].style.display = "block";
        fSelect[0].removeAttribute("disabled");
        fSelect[0].style.display = "block";
        in4S[0].style.display = "none";
        for (var i = 0; i < btnE.length; i++) {
            var ed = btnE[i];
            ed.style.display = "block";
        }

    }

    function cancleCusEdit() {
        for (var i = 0; i < inputCan.length; i++) {
            var inp = inputCan[i];
            inp.setAttribute("readonly", true);
        }

        editNone[0].style.display = "none";
        fSelect[0].setAttribute("disabled", true);
        fSelect[0].style.display = "none";
        in4S[0].style.display = "block";
        for (var i = 0; i < btnE.length; i++) {
            var ed = btnE[i];
            ed.style.display = "none";
        }
    }

    function clickChangePass(){
        if(clickChangeP == 0){
            clickChangeP = 1;
            fEditPass[0].style.display = "block";
        } else {
            clickChangeP = 0;
            fEditPass[0].style.display = "none";
        }
    }

</script>
<!-- Style for profile customer -->
<style>
    body {
        margin-top: 20px;
        color: #1a202c;
        text-align: left;
        background-color: #e2e8f0;
    }

    .main-body {
        padding: 15px;
    }

    .card {
        box-shadow: 0 1px 3px 0 rgba(0, 0, 0, .1), 0 1px 2px 0 rgba(0, 0, 0, .06);
    }

    .card {
        position: relative;
        display: flex;
        flex-direction: column;
        min-width: 0;
        word-wrap: break-word;
        background-color: #fff;
        background-clip: border-box;
        border: 0 solid rgba(0, 0, 0, .125);
        border-radius: .25rem;
    }

    .card-body {
        flex: 1 1 auto;
        min-height: 1px;
        padding: 1rem;
    }

    .gutters-sm {
        margin-right: -8px;
        margin-left: -8px;
    }

    .gutters-sm > .col, .gutters-sm > [class*=col-] {
        padding-right: 8px;
        padding-left: 8px;
    }

    .mb-3, .my-3 {
        margin-bottom: 1rem !important;
    }

    .bg-gray-300 {
        background-color: #e2e8f0;
    }

    .h-100 {
        height: 100% !important;
    }

    .shadow-none {
        box-shadow: none !important;
    }
</style>