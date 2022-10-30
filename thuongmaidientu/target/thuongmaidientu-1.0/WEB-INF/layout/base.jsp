<%-- 
    Document   : base
    Created on : Jul 24, 2022, 1:05:52 PM
    Author     : admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>
        <tiles:insertAttribute name="title"/>
    </title>
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

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>

    <%--   CSS     --%>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">

    <c:url value="/css/" var="cs"></c:url>
    <link rel="stylesheet" href="${cs}cus-order-manager.css"/>
    <link rel="stylesheet" href="${cs}advertise.css"/>
    <link rel="stylesheet" href="${cs}main.css"/>

    <c:url value="/resources/assets/" var="ass"></c:url>
    <!--Google font-->
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">

    <link rel="icon" href="" type="image/x-icon">
    <link rel="shortcut icon" href="" type="image/x-icon">
    <!-- Icons -->
    <link rel="stylesheet" type="text/css" href="${ass}css/vendors/font-awesome.css"/>

    <!--Slick slider css-->
    <link rel="stylesheet" type="text/css" href="${ass}css/vendors/slick.css">
    <link rel="stylesheet" type="text/css" href="${ass}css/vendors/slick-theme.css">

    <!-- Animate icon -->
    <link rel="stylesheet" type="text/css" href="${ass}css/vendors/animate.css">

    <!-- Themify icon -->
    <link rel="stylesheet" type="text/css" href="${ass}css/vendors/themify-icons.css">

    <!-- Bootstrap css -->
    <link rel="stylesheet" type="text/css" href="${ass}css/vendors/bootstrap.css">

    <!-- Price range icon -->
    <link rel="stylesheet" type="text/css" href="${ass}css/vendors/price-range.css">

    <!-- Theme css -->
    <link rel="stylesheet" type="text/css" href="${ass}css/style.css">

    <!-- date picker -->
    <link rel="stylesheet" type="text/css" href="${ass}css/vendors/date-picker.css">

    <!-- Google font-->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Work+Sans:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,500;1,600;1,700;1,800;1,900&display=swap">

    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap">

    <c:url value="/resources/assets1/" var="ass1"></c:url>
    <!-- Font Awesome-->
    <link rel="stylesheet" type="text/css" href="${ass1}css/vendors/font-awesome.css">

    <!-- Flag icon-->
    <link rel="stylesheet" type="text/css" href="${ass1}css/vendors/themify-icons.css">

    <!-- slick icon-->
    <link rel="stylesheet" type="text/css" href="${ass1}css/vendors/slick.css">
    <link rel="stylesheet" type="text/css" href="${ass1}css/vendors/slick-theme.css">

    <!-- Bootstrap css-->
    <link rel="stylesheet" type="text/css" href="${ass1}css/vendors/bootstrap.css">

    <!-- App css-->
    <link rel="stylesheet" type="text/css" href="${ass1}css/style.css">
</head>
<body class="theme-color-1">
<tiles:insertAttribute name="header"/>

<tiles:insertAttribute name="content"/>

<tiles:insertAttribute name="footer"/>


<!-- tap to top -->
<div class="tap-top top-cls">
    <div>
        <i class="fa fa-angle-double-up"></i>
    </div>
</div>
<!-- tap to top end -->
<div class="modal fade bd-example-modal-lg theme-modal" id="quick-view" tabindex="-1" role="dialog"
     aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content quick-view-modal">
            <div class="modal-body">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <div class="row">
                    <div class="col-lg-6 col-xs-12">
                        <div class="quick-view-img"><img src="../assets/images/pro3/1.jpg" alt=""
                                                         class="img-fluid blur-up lazyload"></div>
                    </div>
                    <div class="col-lg-6 rtl-text">
                        <div class="product-right">
                            <h2>Women Pink Shirt</h2>
                            <h3>$32.96</h3>
                            <div class="border-product">
                                <h6 class="product-title">product details</h6>
                                <p>Content Content Content Content Content Content Content Content Content Content</p>
                            </div>
                            <div class="product-description border-product">
                                <h6 class="product-title">quantity</h6>
                                <div class="qty-box">
                                    <div class="input-group"><span class="input-group-prepend"><button type="button"
                                                                                                       class="btn quantity-left-minus" data-type="minus" data-field=""><i
                                            class="ti-angle-left"></i></button> </span>
                                        <input type="text" name="quantity" class="form-control input-number"
                                               value="1"> <span class="input-group-prepend"><button type="button"
                                                                                                    class="btn quantity-right-plus" data-type="plus" data-field=""><i
                                                class="ti-angle-right"></i></button></span>
                                    </div>
                                </div>
                            </div>
                            <div class="product-buttons"><a href="#" class="btn btn-solid">add to cart</a> <a
                                    href="#" class="btn btn-solid">view detail</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- dare picker js -->

<script src="${ass}js/date-picker.js"></script>

<!-- chart js -->
<script src="${ass}js/chart/apex/apexcharts.js"></script>
<script src="${ass}js/chart/apex/custom-chart.js"></script>

<!-- latest jquery-->
<script src="${ass}js/jquery-3.3.1.min.js"></script>

<!-- fly cart ui jquery-->
<script src="${ass}js/jquery-ui.min.js"></script>

<!-- exitintent jquery-->
<script src="${ass}js/jquery.exitintent.js"></script>
<script src="${ass}js/exit.js"></script>

<!-- slick js-->
<script src="${ass}js/slick.js"></script>

<!-- menu js-->
<script src="${ass}js/menu.js"></script>

<!-- lazyload js-->
<script src="${ass}js/lazysizes.min.js"></script>

<!-- Bootstrap js-->
<script src="${ass}js/bootstrap.bundle.min.js"></script>

<!-- Bootstrap Notification js-->
<script src="${ass}js/bootstrap-notify.min.js"></script>

<!-- Fly cart js-->
<script src="${ass}js/fly-cart.js"></script>

<!-- Theme js-->
<script src="${ass}js/theme-setting.js"></script>
<script src="${ass}js/script.js"></script>

<script>
    $(window).on('load', function () {
        setTimeout(function () {
            $('#exampleModal').modal('show');
        }, 2500);
    });

    function openSearch() {
        document.getElementById("search-overlay").style.display = "block";
    }

    function closeSearch() {
        document.getElementById("search-overlay").style.display = "none";
    }

    $('#datepicker').datepicker({
        uiLibrary: 'bootstrap4'
    });
    $('#datepicker1').datepicker({
        uiLibrary: 'bootstrap4'
    });
</script>
</body>
</html>
