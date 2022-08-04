<%-- 
    Document   : header
    Created on : Jul 24, 2022, 1:10:04 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="javascript:void(0)">SaleWeb Online</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="mynavbar">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/thuongmaidientu">&#9969; Trang chu</a>
                </li>
                <c:forEach items="${type_products}" var="c">
                    <c:url value="/" var="cUrl">
                        <c:param name="type_Id" value="${c.idTypeProduct}" />
                    </c:url>
                    <li class="nav-item">
                        <a class="nav-link" href="${cUrl}">${c.typeName}</a>
                    </li>
                </c:forEach>

            </ul>
            
            <button class="btn btn-primary" href="/thuongmaidientu/login" type="button">Dang Nhap</button>
            
            <c:url value="/" var="action" />
            <form class="d-flex">
                <input class="form-control me-2" type="text" name="kw" placeholder="Nhap tu khoa...">
                <button type="submit" class="btn btn-primary" type="button">Tim</button>
            </form>
        </div>
    </div>
</nav>
