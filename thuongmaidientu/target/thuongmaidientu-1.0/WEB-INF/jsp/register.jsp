<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 02/09/2022
  Time: 12:48 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@page contentType="text/html" pageEncoding="UTF-8" %>


<div style="margin-top: 50px">
    <h1 style="text-align: center">ĐĂNG KÝ</h1>

    <c:url value="/register" var="action"/>
    <c:if test="${msgEr != null}">
        <div class="danger" style="color: #DC0404;background-color: lightslategray">
            <p style="font-size: 30px;text-align: center">${msgEr}</p>
        </div>
    </c:if>
    <form:form cssStyle="border-color: black;border: black;border-style: double;" action="${action}" method="POST" modelAttribute="account"
               class="form-edit-pro was-validated"
               style="width: 120%;margin-top: 10px; font-size: 20px; margin-right: 0px">
        <div class="form-group name form-check mb-3"
             style="margin-top: 30px;align-items: center; display: inline-flex; width: 100%;">
            <label for="usernameC" class="form-label" style="width: 30%; text-align: right; margin-right: 15px">Tên tài khoản:</label>
            <form:input style="width: 40%;" type="text" class="form-control is-invalid" path="usernameC"
                        id="usernameC" />
            <div style="width: 30%;margin-left: 10px;" class="invalid-feedback">
                Nhập tên tài khoản
            </div>
        </div>
        <div class="form-group price mb-3" style="align-items: center; display: inline-flex; width: 100%;">
            <label style="width: 30%; text-align: right; margin-right: 15px">Mật khẩu:</label>
            <form:input style="width: 40%;" type="password" class="form-control is-invalid" path="passwordC"
                        id="passwordC"/>
            <div style="width: 30%;margin-left: 10px" class="invalid-feedback">
                Nhập mật khẩu
            </div>
        </div>
        <div class="form-group price mb-3" style="align-items: center; display: inline-flex; width: 100%;">
            <label style="width: 30%; text-align: right; margin-right: 15px">Nhập lại mật khẩu:</label>
            <form:input style="width: 40%;" type="password" class="form-control is-invalid" path="confirmPassword"
                        id="passwordC"/>
            <div style="width: 30%;margin-left: 10px" class="invalid-feedback">
                Nhập lại mật khẩu
            </div>
        </div>
        <div class="form-group type_pro mb-3" style="align-items: center; display: inline-flex; width: 100%;">
            <label style="width: 30%; text-align: right; margin-right: 15px">Loại tài khoản:</label>
            <form:select style="width: 40%;" id="idPos" path="idPos" class="form-select is-invalid">
                <option value="1">Admin</option>
                <option value="2" selected>Khách hàng</option>
                <option value="3">Cửa hàng</option>
                <option value="4">Nhân viên App</option>
            </form:select>
            <div style="width: 30%;margin-left: 10px" class="invalid-feedback">
                Chọn loại
            </div>
        </div>

        <div style="display: flex;margin-bottom: 30px">
            <a href="#" onclick="refresh()" style="margin-left: 40%;margin-top: 25px; width: 120px" type="button"
               class="btn btn-primary">Reset</a>
            <input type="submit" value="Đăng Ký" class="btn btn-primary"
                   style="margin-left: 10px;margin-top: 25px; width: 120px"/>
        </div>
    </form:form>
</div>
<script>
    function refresh(){
        window.location.reload();
    }
</script>
