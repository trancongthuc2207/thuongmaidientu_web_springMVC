<%-- 
    Document   : footer
    Created on : Jul 24, 2022, 1:10:15 PM
    Author     : admin
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<footer class="section footer-classic context-dark bg-image" style="background: #2d3246;">
    <div class="container margin-layout">
        <div class="row row-30">
            <div class="col-md-4 col-xl-5">
                <div class="pr-xl-4">
                    <a class="brand" href="index.html"><img class="brand-logo-light" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_8FkWoBDZE_N-lQiFs3BMhf2LXOoWBHV_2tZdX9uBdAvpXTWMbUqeiDzl_WdHXIQ4Nw8&usqp=CAU" alt="" width="140" height="37"></a>
                    <p>TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST</p>
                    <!-- Rights-->
                    <p class="rights"><span>© </span><span class="copyright-year">2022</span><span> </span><span>Hung Thuc</span><span>. </span><span>All Rights Reserved.</span></p>
                </div>
            </div>
            <div class="col-md-4">
                <h5>Contacts</h5>
                <dl class="contact-list">
                    <dt>Address:</dt>
                    <dd>371 Nguyen Kiem, Go Vap District, Ho Chi Minh City</dd>
                </dl>
                <dl class="contact-list">
                    <dt>Email:</dt>
                    <dd><a href="mailto:#">1951012044hung@ou.edu.vn</a></dd>
                    <dd><a href="mailto:#">1951012135thuc@ou.edu.vn</a></dd>
                </dl>
                <dl class="contact-list">
                    <dt>Phones:</dt>
                    <dd>
                        <a href="tel:#">0344564075</a>
                        <span>or</span>
                        <a href="tel:#">0344564075</a>
                    </dd>
                </dl>
            </div>
            <div class="col-md-4 col-xl-3">
                <h5>Links</h5>
                <ul class="nav-list">
                    <li><a href="#">About</a></li>
                    <li><a href="#">Projects</a></li>
                    <li><a href="#">Blog</a></li>
                    <li><a href="#">Contacts</a></li>
                    <li><a href="#">Pricing</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="row no-gutters social-container">
        <div class="col"><a class="social-inner" href="#"><span class="icon mdi mdi-facebook"></span><span>Facebook</span></a></div>
        <div class="col"><a class="social-inner" href="#"><span class="icon mdi mdi-instagram"></span><span>Instagram</span></a></div>
        <div class="col"><a class="social-inner" href="#"><span class="icon mdi mdi-twitter"></span><span>Twitter</span></a></div>
        <div class="col"><a class="social-inner" href="#"><span class="icon mdi mdi-youtube-play"></span><span>Google</span></a></div>
    </div>
</footer>

<style>
    .margin-layout {
        margin-top: 30px;
    }

    .context-dark, .bg-gray-dark, .bg-primary {
        color: rgba(255, 255, 255, 0.8);
    }

    .footer-classic a, .footer-classic a:focus, .footer-classic a:active {
        color: #ffffff;
    }
    .nav-list li {
        padding-top: 5px;
        padding-bottom: 5px;
    }

    .nav-list li a:hover:before {
        margin-left: 0;
        opacity: 1;
        visibility: visible;
    }

    ul, ol {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .social-inner {
        display: flex;
        flex-direction: column;
        align-items: center;
        width: 100%;
        padding: 23px;
        font: 900 13px/1 "Lato", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
        text-transform: uppercase;
        color: rgba(255, 255, 255, 0.5);
    }
    .social-container .col {
        border: 1px solid rgba(255, 255, 255, 0.1);
    }
    .nav-list li a:before {
        content: "\f14f";
        font: 400 21px/1 "Material Design Icons";
        color: #4d6de6;
        display: inline-block;
        vertical-align: baseline;
        margin-left: -28px;
        margin-right: 7px;
        opacity: 0;
        visibility: hidden;
        transition: .22s ease;
    }
</style>