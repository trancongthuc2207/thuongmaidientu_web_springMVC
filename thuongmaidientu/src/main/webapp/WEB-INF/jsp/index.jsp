<%-- 
    Document   : index
    Created on : Jul 10, 2022, 1:27:12 PM
    Author     : admin
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>


<c:set var="gitRepo" value="https://cdn.jsdelivr.net/gh/huqedgar/ecommerceCDNRepository@" />
<c:set var="verRepo" value="ecf39d623b86b25246d92ad1974b85b345e9f594" />
<c:set var="urlRepo" value="${gitRepo}${verRepo}/" />


<!-- Carousel Start -->
<div class="container-fluid mb-3">
    <div id="header-carousel" class="carousel slide carousel-fade mb-30 mb-lg-0" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#header-carousel" data-slide-to="0" class="active"></li>
            <li data-target="#header-carousel" data-slide-to="1"></li>
            <li data-target="#header-carousel" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item position-relative active" style="height: 430px;">
                <img class="position-absolute w-100 h-100" src="${urlRepo}img/carousel-1.jpg"
                     style="object-fit: cover;">
                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                    <div class="p-3" style="max-width: 700px;">
                        <h1 class="display-4 text-white mb-3 animate__animated animate__fadeInDown">Thời Trang Nam</h1>
                        <p class="mx-md-5 px-5 animate__animated animate__bounceIn">Thiết kế tinh tế, mang đến sự lịch lãm và mạnh mẽ.</p>
                        <a class="btn btn-outline-light py-2 px-4 mt-3 animate__animated animate__fadeInUp" href="#">Mua Ngay</a>
                    </div>
                </div>
            </div>
            <div class="carousel-item position-relative" style="height: 430px;">
                <img class="position-absolute w-100 h-100" src="${urlRepo}img/carousel-2.jpg"
                     style="object-fit: cover;">
                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                    <div class="p-3" style="max-width: 700px;">
                        <h1 class="display-4 text-white mb-3 animate__animated animate__fadeInDown">Thời Trang Nữ</h1>
                        <p class="mx-md-5 px-5 animate__animated animate__bounceIn">Thiết kế tinh tế, mang đến sự quý phái và quyến rũ.</p>
                        <a class="btn btn-outline-light py-2 px-4 mt-3 animate__animated animate__fadeInUp" href="#">Mua Ngay</a>
                    </div>
                </div>
            </div>
            <div class="carousel-item position-relative" style="height: 430px;">
                <img class="position-absolute w-100 h-100" src="${urlRepo}img/carousel-3.jpg"
                     style="object-fit: cover;">
                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                    <div class="p-3" style="max-width: 700px;">
                        <h1 class="display-4 text-white mb-3 animate__animated animate__fadeInDown">Thời Trang Trẻ Em</h1>
                        <p class="mx-md-5 px-5 animate__animated animate__bounceIn">Thiết kế tinh tế, mang đến sự đáng yêu.</p>
                        <a class="btn btn-outline-light py-2 px-4 mt-3 animate__animated animate__fadeInUp" href="#">Mua Ngay</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Carousel End -->


<!-- Featured Start -->
<div class="container-fluid pt-5">
    <div class="row px-xl-5 pb-3">
        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
            <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                <h1 class="fa fa-check text-primary m-0 mr-3"></h1>
                <h5 class="font-weight-semi-bold m-0">Sản Phẩm Chất Lượng</h5>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
            <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                <h1 class="fa fa-shipping-fast text-primary m-0 mr-2"></h1>
                <h5 class="font-weight-semi-bold m-0">Miễn Phí Giao Hàng</h5>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
            <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                <h1 class="fas fa-exchange-alt text-primary m-0 mr-3"></h1>
                <h5 class="font-weight-semi-bold m-0">14 Ngày Đổi Trả</h5>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
            <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                <h1 class="fa fa-phone-volume text-primary m-0 mr-3"></h1>
                <h5 class="font-weight-semi-bold m-0">Hỗ Trợ 24/7</h5>
            </div>
        </div>
    </div>
</div>
<!-- Featured End -->


<!-- Categories Start -->
<div class="container-fluid pt-5">
    <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Danh Mục Tổng Hợp</span></h2>
    <div class="row px-xl-5 pb-3">
        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
            <a class="text-decoration-none" href="">
                <div class="cat-item d-flex align-items-center mb-4">
                    <div class="overflow-hidden" style="width: 100px; height: 100px;">
                        <img class="img-fluid" src="${urlRepo}img/cat-1.jpg" alt="">
                    </div>
                    <div class="flex-fill pl-3">
                        <h6>Tên Danh Mục</h6>
                        <small class="text-body">100 Sản Phẩm</small>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
            <a class="text-decoration-none" href="">
                <div class="cat-item d-flex align-items-center mb-4">
                    <div class="overflow-hidden" style="width: 100px; height: 100px;">
                        <img class="img-fluid" src="${urlRepo}img/cat-1.jpg" alt="">
                    </div>
                    <div class="flex-fill pl-3">
                        <h6>Tên Danh Mục</h6>
                        <small class="text-body">100 Sản Phẩm</small>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
            <a class="text-decoration-none" href="">
                <div class="cat-item d-flex align-items-center mb-4">
                    <div class="overflow-hidden" style="width: 100px; height: 100px;">
                        <img class="img-fluid" src="${urlRepo}img/cat-1.jpg" alt="">
                    </div>
                    <div class="flex-fill pl-3">
                        <h6>Tên Danh Mục</h6>
                        <small class="text-body">100 Sản Phẩm</small>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
            <a class="text-decoration-none" href="">
                <div class="cat-item d-flex align-items-center mb-4">
                    <div class="overflow-hidden" style="width: 100px; height: 100px;">
                        <img class="img-fluid" src="${urlRepo}img/cat-1.jpg" alt="">
                    </div>
                    <div class="flex-fill pl-3">
                        <h6>Tên Danh Mục</h6>
                        <small class="text-body">100 Sản Phẩm</small>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
            <a class="text-decoration-none" href="">
                <div class="cat-item d-flex align-items-center mb-4">
                    <div class="overflow-hidden" style="width: 100px; height: 100px;">
                        <img class="img-fluid" src="${urlRepo}img/cat-1.jpg" alt="">
                    </div>
                    <div class="flex-fill pl-3">
                        <h6>Tên Danh Mục</h6>
                        <small class="text-body">100 Sản Phẩm</small>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
            <a class="text-decoration-none" href="">
                <div class="cat-item d-flex align-items-center mb-4">
                    <div class="overflow-hidden" style="width: 100px; height: 100px;">
                        <img class="img-fluid" src="${urlRepo}img/cat-1.jpg" alt="">
                    </div>
                    <div class="flex-fill pl-3">
                        <h6>Tên Danh Mục</h6>
                        <small class="text-body">100 Sản Phẩm</small>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
            <a class="text-decoration-none" href="">
                <div class="cat-item d-flex align-items-center mb-4">
                    <div class="overflow-hidden" style="width: 100px; height: 100px;">
                        <img class="img-fluid" src="${urlRepo}img/cat-1.jpg" alt="">
                    </div>
                    <div class="flex-fill pl-3">
                        <h6>Tên Danh Mục</h6>
                        <small class="text-body">100 Sản Phẩm</small>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
            <a class="text-decoration-none" href="">
                <div class="cat-item d-flex align-items-center mb-4">
                    <div class="overflow-hidden" style="width: 100px; height: 100px;">
                        <img class="img-fluid" src="${urlRepo}img/cat-1.jpg" alt="">
                    </div>
                    <div class="flex-fill pl-3">
                        <h6>Tên Danh Mục</h6>
                        <small class="text-body">100 Sản Phẩm</small>
                    </div>
                </div>
            </a>
        </div>
    </div>
</div>
<!-- Categories End -->


<!-- Products Start -->
<div class="container-fluid pt-5 pb-3">
    <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4">
        <span class="bg-secondary pr-3">Tất Cả Sản Phẩm</span>
    </h2>
    <div class="row px-xl-5">
        <c:forEach items="${products}" var="p">
            <c:url value="/products/" var="cUrl">
                <c:param name="ID_Product" value="${p.idProduct}"/>
            </c:url>
            <c:url value="/add_pro/" var="prodID"></c:url>
            <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                <form action="${prodID}${p.idProduct}">
                    <div class="product-item bg-light mb-4">
                        <div class="product-img position-relative overflow-hidden">
                            <img class="img-fluid w-100" src="${urlRepo}img/product-1.jpg" alt="">
                            <div class="product-action">
                                <a class="btn btn-outline-dark btn-square" href=""><i
                                        class="fa fa-shopping-cart"></i></a>
                                <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a>
                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a>
                                <a class="btn btn-outline-dark btn-square" href="${cUrl}"><i
                                        class="fa fa-search"></i></a>
                            </div>
                        </div>
                        <div class="text-center py-4">
                            <a class="h6 text-decoration-none text-truncate" href="">${p.nameProduct}</a>
                            <div class="d-flex align-items-center justify-content-center mt-2">
                                <h5>
                                    <fmt:formatNumber type="number" maxFractionDigits="3" value="${p.unitPrice}"/> VND
                                </h5>
                            </div>
                            <div class="d-flex align-items-center justify-content-center mb-1">
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small>(99)</small>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </c:forEach>
    </div>
</div>
<!-- Products End -->






<!-- Vendor Start -->
<div class="container-fluid py-5">
    <div class="row px-xl-5">
        <div class="col">
            <div class="owl-carousel vendor-carousel">
                <div class="bg-light p-4">
                    <img src="${urlRepo}img/vendor-1.jpg" alt="">
                </div>
                <div class="bg-light p-4">
                    <img src="${urlRepo}img/vendor-2.jpg" alt="">
                </div>
                <div class="bg-light p-4">
                    <img src="${urlRepo}img/vendor-3.jpg" alt="">
                </div>
                <div class="bg-light p-4">
                    <img src="${urlRepo}img/vendor-4.jpg" alt="">
                </div>
                <div class="bg-light p-4">
                    <img src="${urlRepo}img/vendor-5.jpg" alt="">
                </div>
                <div class="bg-light p-4">
                    <img src="${urlRepo}img/vendor-6.jpg" alt="">
                </div>
                <div class="bg-light p-4">
                    <img src="${urlRepo}img/vendor-7.jpg" alt="">
                </div>
                <div class="bg-light p-4">
                    <img src="${urlRepo}img/vendor-8.jpg" alt="">
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Vendor End -->