<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 02/09/2022
  Time: 5:40 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
<div class="row" style="padding: 50px">
    <h1> CÁC PHẢN HỒI TỪ CÁC BÊN</h1>

    <div>
        <h1>* BÊN ỨNG DỤNG</h1>
        <div class="row content-app">
            <c:forEach items="${listReportApp}" var="rpApp">
                <div class="col-md-3 col-xs-12" style="padding: 5px;">
                    <c:url value="/shop-manager/orders" var="linkPro">
                        <c:param name="kw"></c:param>
                    </c:url>
                    <form action="#">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Mã báo cáo: ${rpApp.idRp}</h4>
                                <h5 class="card-text">Mô tả: ${rpApp.descriptionRp}</h5>
                                <p class="card-text">Ngày tạo: ${rpApp.dateRp}</p>
                                <p class="card-text">Loại báo cáo: ${rpApp.idTypeReport.nameRp}</p>
                                <a href="${linkPro}${rpApp.idProduct.nameProduct}" class="btn btn-primary"> Xử lý </a>
                            </div>
                        </div>
                    </form>
                </div>
            </c:forEach>
        </div>
    </div>
    <div>
        <h1>* BÊN KHÁCH HÀNG</h1>
        <div class="row content-customer">
            <c:forEach items="${listReportCus}" var="rpCus">
                <div class="col-md-3 col-xs-12" style="padding: 5px;">
                    <sec:authorize access="hasRole('ROLE_SHOP')">
                        <c:url value="/shop-manager/edit/" var="linkEditPro">
                            <c:param name="ID_Product" value="${rpCus.idProduct.idProduct}"></c:param>
                        </c:url>
                    </sec:authorize>
                    <sec:authorize access="hasRole('ROLE_EMPLOYEE')">
                        <c:url value="/shop-manager/edit/" var="linkEditPro">
                            <c:param name="ID_Product" value="${rpCus.idProduct.idProduct}"></c:param>
                            <c:param name="idShop_FrEpl" value="${idS_FrEmpl}"></c:param>
                        </c:url>
                    </sec:authorize>
                    <c:url value="/products/" var="linkPro">
                        <c:param name="ID_Product" value="${rpCus.idProduct.idProduct}"></c:param>
                    </c:url>
                    <form action="#">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title" style="font-weight: bold">Mã báo cáo: ${rpCus.idRp}</h4>
                                <h5 class="card-text">Từ: ${rpCus.idCus.nameC}</h5>
                                <h5 class="card-text">Đến: ${rpCus.idProduct.nameProduct}</h5>
                                <h5 class="card-text">Mô tả: ${rpCus.descriptionRp}</h5>
                                <p class="card-text">Ngày tạo: ${rpCus.dateRp}</p>
                                <p class="card-text">Loại báo cáo: ${rpCus.idTypeReport.nameRp}</p>
                                <a href="${linkEditPro}" class="btn btn-primary"> Xử lý </a>
                                <a href="${linkPro}" class="btn btn-primary"> Xem </a>
                            </div>
                        </div>
                    </form>
                </div>
            </c:forEach>
        </div>
    </div>
</div>