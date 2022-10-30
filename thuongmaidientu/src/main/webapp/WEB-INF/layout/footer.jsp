<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%--
    Document   : footer
    Created on : Jul 24, 2022, 1:10:15 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%--<div class="mt-4 p-5 bg-nav-header text-white rounded">--%>
<%--    <h1>THƯƠNG MẠI ĐIỆN TỬ</h1>--%>
<%--    <p>TCT - VVH &copy; 2022</p>--%>
<%--</div>--%>
<!-- footer -->
<c:url value="/resources/assets/" var="ass"></c:url>
<footer class="footer-light">
    <div class="light-layout">
        <div class="" style="padding: 50px">
            <section class="small-section border-section border-top-0">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="subscribe">
                            <div>
                                <h4>KNOW IT ALL FIRST!</h4>
                                <p>Never Miss Anything From Website By Signing Up To Our Newsletter.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <form
                                action="https://pixelstrap.us19.list-manage.com/subscribe/post?u=5a128856334b598b395f1fc9b&amp;id=082f74cbda"
                                class="form-inline subscribe-form auth-form needs-validation" method="post"
                                id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" target="_blank">
                            <div class="form-group mx-sm-3">
                                <input type="text" class="form-control" name="EMAIL" id="mce-EMAIL"
                                       placeholder="Enter your email" required="required">
                            </div>
                            <button type="submit" class="btn btn-solid" id="mc-submit">subscribe</button>
                        </form>
                    </div>
                </div>
            </section>
        </div>
    </div>
    <section class="section-b-space light-layout">
        <div class="container">
            <div class="row footer-theme partition-f">
                <div class="col-lg-4 col-md-6">
                    <div class="footer-title footer-mobile-title">
                        <h4>about</h4>
                    </div>
                    <div class="footer-contant">
                        <div class="footer-logo"><img src="https://www.oucommunity.dev/assets/lib/loader-page/ou-logo-scroll.svg" alt=""></div>
                        <p>Content Content Content Content Content Content Content Content Content Content</p>
                        <div class="footer-social">
                            <ul>
                                <li><a href="#"><i class="fa fa-facebook-f"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                                <li><a href="#"><i class="fa fa-rss" aria-hidden="true"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col offset-xl-1">
                    <div class="sub-title">
                        <div class="footer-title">
                            <h4>my account</h4>
                        </div>
                        <div class="footer-contant">
                            <ul>
                                <li><a href="#">mens</a></li>
                                <li><a href="#">womens</a></li>
                                <li><a href="#">clothing</a></li>
                                <li><a href="#">accessories</a></li>
                                <li><a href="#">featured</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="sub-title">
                        <div class="footer-title">
                            <h4>store information</h4>
                        </div>
                        <div class="footer-contant">
                            <ul class="contact-list">
                                <li><i class="fa fa-map-marker"></i>52 Tran Van Du</li>
                                <li><i class="fa fa-phone"></i>Call Us: 123-456-789</li>
                                <li><i class="fa fa-envelope"></i>Email Us: <a href="#">vhung6252@gmail.com</a></li>
                                <li><i class="fa fa-fax"></i>Fax: 123456</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="sub-footer">
        <div class="container">
            <div class="row">
                <div class="col-xl-6 col-md-6 col-sm-12">
                    <div class="footer-end">
                        <p><i class="fa fa-copyright" aria-hidden="true"></i> 2022 powered by
                            TCT - VVH</p>
                    </div>
                </div>
                <div class="col-xl-6 col-md-6 col-sm-12">
                    <div class="payment-card-bottom">
                        <ul>
                            <li>
                                <a href="#"><img src="${ass}images/icon/visa.png" alt=""></a>
                            </li>
                            <li>
                                <a href="#"><img src="${ass}images/icon/mastercard.png" alt=""></a>
                            </li>
                            <li>
                                <a href="#"><img src="${ass}images/icon/paypal.png" alt=""></a>
                            </li>
                            <li>
                                <a href="#"><img src="${ass}images/icon/discover.png" alt=""></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- footer end -->