
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container" >
    <c:forEach items="${productByID}" var="p" begin="0" end="2">
        <div class="card" style="width:400px">
            <div class="card-body">
                <h4 class="card-title">${p.nameProduct}</h4>
                <p class="card-text">Some example text.</p>
                <a href="#" class="btn btn-primary">See Profile</a>
            </div>
        </div>
    </c:forEach>
</div>

<style>
    div.card{
        margin-top: 20px;
    }
</style>