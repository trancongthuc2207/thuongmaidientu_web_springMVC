<%--
    Document   : index
    Created on : Jul 10, 2022, 1:27:12 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<div class="container">
  <ul class="nav nav-pills navTask">
    <%--    QUẢNG CÁO  --%>
    <div id="mySidenav" class="sidenav" style="background-image: linear-gradient(#7C0D0D, #DC0404);">
      <div class="dropdown">
        <button class="dropbtn"
                [ngStyle]="{'color': 'white','font-style': 'bold', 'font-size': '20.01px', 'font-family':'sans-serif'}">
          <img src="assets/icon-overview-white.png" style="padding-right:14px; ">Screening
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
        <a type="submit" class="btn btn-sm btn-secondary dropdown-toggle dropdown-toggle-split dropbtn-right-side"
           href="#"
           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <span
                class="fas fa-user-circle"></span> Kênh Buôn Bán </a>
        <div class="dropdown-content-right">
          <div class="speech-bubble"><i> </i>Bạn muốn trở thành người bán hàng ?</div>
        </div>
      </div>
    </li>
  </ul>

  <div class="row">
    <%--    PHAN TRANG   --%>
    <ul class="pagination">
      <c:forEach begin="1" end="${Math.ceil(productCounter/8)}" var="i">
        <c:url value="/" var="c">
          <c:param value="${i}" name="page"/>
        </c:url>
        <li class="page-item"><a class="page-link" href="${c}">${i}</a></li>
      </c:forEach>
    </ul>
    <%--    SAN PHAM    --%>
    <c:forEach items="${products}" var="p">
      <c:url value="/products/" var="cUrl">
        <c:param name="ID_Product" value="${p.idProduct}"/>
      </c:url>
      <div class="col-md-3 col-xs-12" style="padding: 5px;">
        <form action="${book_pro}">
          <div class="card">
            <img class="card-img-top" class="img-fluid"
                 src="https://res.cloudinary.com/dxxwcby8l/image/upload/v1647248722/r8sjly3st7estapvj19u.jpg"
                 alt="Card image">
            <div class="card-body">
              <h4 class="card-title">${p.nameProduct}</h4>
              <p class="card-text">
                <fmt:formatNumber type="number" maxFractionDigits="3" value="${p.unitPrice}"/> VND
              </p>
              <a href="${cUrl}" class="btn btn-primary">Xem chi tiet</a>
              <button name="idPro" value="${p.idProduct}" class="btn btn-primary"
                      type="submit">Đặt Hàng
              </button>
            </div>
          </div>
        </form>
      </div>
    </c:forEach>
  </div>
</div>