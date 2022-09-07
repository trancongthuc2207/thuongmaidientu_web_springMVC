<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 05/09/2022
  Time: 9:36 CH
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<div class="container">
    <c:forEach items="${shopAcc}" var="shop">
        <%------------------  HEADER CONTENT  ----------------------%>
        <div class="col-md-3 col-xs-12" style="padding: 5px;width: 100%">
            <div style="display: inline-flex">
                <form
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
                    </div>
                    <div class="form-group" style="margin-left: 30px; width: 600px">
                            <%--        TIEU DE                --%>
                        <h1 class="card-title">Mã shop: ${shop.idShopStore}</h1>

                        <div style="display: flex;font-size: 18px">
                            <h5 class="card-text">Tên shop:&ensp;&ensp;</h5>
                            <input class="form-group card-text editS"
                                   style="font-size: 30px;border-color: transparent"
                                   value="${shop.nameStore}"/>
                        </div>
                        <div class="form-group card-text" style="display: flex; font-size: 20px">
                            <h5 class="card-text">Ngày tham gia:&ensp;</h5>
                            <input class="form-group card-text editS"
                                   style="width: 180px;height: 30px;border-color: transparent"
                                   value="${shop.dateBegin}"/>
                        </div>
                        <div style="display: flex; font-size: 20px">
                            <h5 class="card-text">Buôn bán sản phẩm chính:&ensp;</h5>
                            <input class="form-group card-text editS"
                                   style="width: 180px;height: 30px;border-color: transparent"
                                   value="${shop.mainType.typeName}"/>
                        </div>
                        <div style="height: 20px;display: flex; font-size: 20px">
                            <h5 class="card-text" style="margin-top: 10px">Sản phẩm phụ:&ensp;</h5>
                            <input class="form-group card-text editS"
                                   style="width: 180px;height: 30px;border-color: transparent"
                                   value="${shop.ortherType1.typeName}"/>
                            <i>,&ensp;</i>
                            <input class="form-group card-text editS"
                                   style="width: 180px;height: 30px;border-color: transparent"
                                   value="${shop.ortherType2.typeName}"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </c:forEach>
</div>