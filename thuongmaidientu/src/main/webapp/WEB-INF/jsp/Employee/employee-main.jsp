<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 31/08/2022
  Time: 11:33 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:url value="/resources/assets1/" var="ass"></c:url>

<div class="page-wrapper">
    <!-- Page Header Start-->
    <div class="page-main-header">
        <div class="main-header-right row">
            <div class="main-header-left d-lg-none w-auto">
            </div>
            <div class="mobile-sidebar w-auto">
                <div class="media-body text-end switch-sm">
                    <label class="switch">
                        <a href="javascript:void(0)">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                 fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                 stroke-linejoin="round" class="feather feather-align-left" id="sidebar-toggle">
                                <line x1="17" y1="10" x2="3" y2="10"></line>
                                <line x1="21" y1="6" x2="3" y2="6"></line>
                                <line x1="21" y1="14" x2="3" y2="14"></line>
                                <line x1="17" y1="18" x2="3" y2="18"></line>
                            </svg>
                        </a>
                    </label>
                </div>
            </div>
            <div class="nav-right col">
                <ul class="nav-menus">
                    <li>
                        <form class="form-inline search-form">
                            <div class="form-group">
                                <input class="form-control-plaintext" type="search" placeholder="Search..">
                                <span class="d-sm-none mobile-search">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                             viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                             stroke-linecap="round" stroke-linejoin="round"
                                             class="feather feather-search">
                                            <circle cx="11" cy="11" r="8"></circle>
                                            <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                                        </svg>
                                    </span>
                            </div>
                        </form>
                    </li>
                    <li class="onhover-dropdown">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                             fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                             stroke-linejoin="round" class="feather feather-bell">
                            <path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path>
                            <path d="M13.73 21a2 2 0 0 1-3.46 0"></path>
                        </svg>
                        <span class="badge badge-pill badge-primary pull-right notification-badge">3</span>
                        <span class="dot"></span>
                        <ul class="notification-dropdown onhover-show-div p-0">
                        </ul>
                    </li>

                    <li class="onhover-dropdown">
                        <div class="media align-items-center">
                            <img class="align-self-center pull-right img-50 blur-up lazyloaded"
                                 src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="header-user">
                            <div class="dotted-animation">
                                <span class="animate-circle"></span>
                                <span class="main-circle"></span>
                            </div>
                        </div>
                        <ul class="profile-dropdown onhover-show-div p-20 profile-dropdown-hover">
                            <li>
                                <c:url value="/user/infor-customer" var="in4"></c:url>
                                <a href="${in4}">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                         viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                         stroke-linecap="round" stroke-linejoin="round" class="feather feather-user">
                                        <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                        <circle cx="12" cy="7" r="4"></circle>
                                    </svg>
                                    Edit Profile
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0)">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                         viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                         stroke-linecap="round" stroke-linejoin="round" class="feather feather-mail">
                                        <path
                                                d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z">
                                        </path>
                                        <polyline points="22,6 12,13 2,6"></polyline>
                                    </svg>
                                    Inbox
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0)">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                         viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                         stroke-linecap="round" stroke-linejoin="round" class="feather feather-lock">
                                        <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                                        <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                                    </svg>
                                    Lock Screen
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0)">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                         viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                         stroke-linecap="round" stroke-linejoin="round"
                                         class="feather feather-settings">
                                        <circle cx="12" cy="12" r="3"></circle>
                                        <path
                                                d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z">
                                        </path>
                                    </svg>
                                    Settings
                                </a>
                            </li>
                            <li>
                                <sec:authorize access="isAuthenticated()">
                                    <c:url value="/logout" var="logout"></c:url>
                                    <a href="${logout}">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                             viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                             stroke-linecap="round" stroke-linejoin="round"
                                             class="feather feather-log-out">
                                            <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
                                            <polyline points="16 17 21 12 16 7"></polyline>
                                            <line x1="21" y1="12" x2="9" y2="12"></line>
                                        </svg>
                                        Logout
                                    </a>
                                </sec:authorize>
                                <sec:authorize access="!isAuthenticated()">
                                    <c:url value="/login" var="login"></c:url>
                                    <a href="${login}">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                             viewBox="0 0 24 24"
                                             fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                             stroke-linejoin="round" class="feather feather-log-in">
                                            <path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4"></path>
                                            <polyline points="10 17 15 12 10 7"></polyline>
                                            <line x1="15" y1="12" x2="3" y2="12"></line>
                                        </svg>
                                        Login
                                    </a>
                                    </a>
                                </sec:authorize>
                            </li>
                        </ul>
                    </li>
                </ul>
                <div class="d-lg-none mobile-toggle pull-right">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                         stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                         class="feather feather-more-horizontal">
                        <circle cx="12" cy="12" r="1"></circle>
                        <circle cx="19" cy="12" r="1"></circle>
                        <circle cx="5" cy="12" r="1"></circle>
                    </svg>
                </div>
            </div>
        </div>
    </div>
    <!-- Page Header Ends -->

    <!-- Page Body Start-->
    <div class="page-body-wrapper">
        <!-- Page Sidebar Start-->
        <div class="page-sidebar">
            <div class="main-header-left d-none d-lg-block">
                <div class="logo-wrapper">
                    <a href="index.html">
                        <img class="d-none d-lg-block blur-up lazyloaded" src="" alt="">
                    </a>
                </div>
            </div>
            <div class="sidebar custom-scrollbar" id="navbarDiv">
                <a href="javascript:void(0)" class="sidebar-back d-lg-none d-block"><i class="fa fa-times"
                                                                                       aria-hidden="true"></i></a>
                <div class="sidebar-user">
                    <img class="img-60" src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="#">
                    <div>
                        <h6 class="f-14"><c:out value="${sessionScope.nameCus}"/></h6>
                        <p><c:out value="${sessionScope.roleAccess}"/></p>
                    </div>
                </div>
                <ul class="sidebar-menu">
                    <li class="active">
                        <a class="sidebar-header" href="#dashboard">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                 fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                 stroke-linejoin="round" class="feather feather-home">
                                <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                                <polyline points="9 22 9 12 15 12 15 22"></polyline>
                            </svg>
                            <span>Dashboard</span>
                        </a>
                    </li>
                    <li>
                        <a class="sidebar-header" href="javascript:void(0)">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                 fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                 stroke-linejoin="round" class="feather feather-box">
                                <path
                                        d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z">
                                </path>
                                <polyline points="3.27 6.96 12 12.01 20.73 6.96"></polyline>
                                <line x1="12" y1="22.08" x2="12" y2="12"></line>
                            </svg>
                            <span>Products</span>
                            <i class="fa fa-angle-right pull-right"></i>
                        </a>
                        <ul class="sidebar-submenu" style="display: none;">
                            <li>
                                <a href="javascript:void(0)">
                                    <i class="fa fa-circle"></i>
                                    <span>Physical</span>
                                    <i class="fa fa-angle-right pull-right"></i>
                                </a>
                                <ul class="sidebar-submenu" style="display: none;">
                                    <li>
                                        <a href="#category">
                                            <i class="fa fa-circle"></i>Category</a>
                                    </li>
                                    <li>
                                        <a href="#product-list">
                                            <i class="fa fa-circle"></i>Product List</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#product-review">
                                    <i class="fa fa-circle"></i>
                                    <span>product Review</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a class="sidebar-header" href="javascript:void(0)">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                 fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                 stroke-linejoin="round" class="feather feather-archive">
                                <polyline points="21 8 21 21 3 21 3 8"></polyline>
                                <rect x="1" y="3" width="22" height="5"></rect>
                                <line x1="10" y1="12" x2="14" y2="12"></line>
                            </svg>
                            <span>Orders</span>
                            <i class="fa fa-angle-right pull-right"></i>
                        </a>
                        <ul class="sidebar-submenu" style="display: none;">
                            <li>
                                <a href="#order-list">
                                    <i class="fa fa-circle"></i>
                                    <span>Order List</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a class="sidebar-header" href="javascript:void(0)">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                 fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                 stroke-linejoin="round" class="feather feather-dollar-sign">
                                <line x1="12" y1="1" x2="12" y2="23"></line>
                                <path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"></path>
                            </svg>
                            <span>Sales</span>
                            <i class="fa fa-angle-right pull-right"></i>
                        </a>
                        <ul class="sidebar-submenu">
                            <li>
                                <a href="#order">
                                    <i class="fa fa-circle"></i>Orders
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a class="sidebar-header" href="javascript:void(0)">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                 fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                 stroke-linejoin="round" class="feather feather-tag">
                                <path
                                        d="M20.59 13.41l-7.17 7.17a2 2 0 0 1-2.83 0L2 12V2h10l8.59 8.59a2 2 0 0 1 0 2.82z">
                                </path>
                                <line x1="7" y1="7" x2="7.01" y2="7"></line>
                            </svg>
                            <span>Coupons</span>
                            <i class="fa fa-angle-right pull-right"></i>
                        </a>
                        <ul class="sidebar-submenu">
                            <li>
                                <a href="#coupon-list">
                                    <i class="fa fa-circle"></i>List Coupons
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a class="sidebar-header" href="javascript:void(0)">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                 fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                 stroke-linejoin="round" class="feather feather-user-plus">
                                <path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                                <circle cx="8.5" cy="7" r="4"></circle>
                                <line x1="20" y1="8" x2="20" y2="14"></line>
                                <line x1="23" y1="11" x2="17" y2="11"></line>
                            </svg>
                            <span>Users</span>
                            <i class="fa fa-angle-right pull-right"></i>
                        </a>
                        <ul class="sidebar-submenu">
                            <li>
                                <a href="#user-list">
                                    <i class="fa fa-circle"></i>User List
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a class="sidebar-header" href="javascript:void(0)">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                 fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                 stroke-linejoin="round" class="feather feather-users">
                                <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                                <circle cx="9" cy="7" r="4"></circle>
                                <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                                <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                            </svg>
                            <span>Shops</span>
                            <i class="fa fa-angle-right pull-right"></i>
                        </a>
                        <ul class="sidebar-submenu">
                            <li>
                                <a href="#list-vendor">
                                    <i class="fa fa-circle"></i>Shop List
                                </a>
                            </li>
                        </ul>
                    </li>

                </ul>
            </div>
        </div>
        <!-- Page Sidebar Ends-->

        <div class="page-body">

            <!-- Container-fluid starts-->
            <div class="container-fluid">
                <div class="page-header">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="page-header-left">
                                <h3>Dashboard</h3>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <ol class="breadcrumb pull-right">
                                <li class="breadcrumb-item">
                                    <a href="index.html">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                             viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                             stroke-linecap="round" stroke-linejoin="round"
                                             class="feather feather-home">
                                            <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                                            <polyline points="9 22 9 12 15 12 15 22"></polyline>
                                        </svg>
                                    </a>
                                </li>
                                <li class="breadcrumb-item active">Dashboard</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Container-fluid Ends-->
            <c:if test="${active == 'actived'}">
                <!-- Container-fluid starts-->
                <div class="container-fluid" id="dashboard">
                    <div class="row">
                        <div class="col-xxl-3 col-md-6 xl-50">
                            <div class="card o-hidden widget-cards">
                                <div class="warning-box card-body">
                                    <div class="media static-top-widget align-items-center">
                                        <div class="icons-widgets">
                                            <div class="align-self-center text-center">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                     viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                     stroke-width="2"
                                                     stroke-linecap="round" stroke-linejoin="round"
                                                     class="feather feather-navigation font-warning">
                                                    <polygon points="3 11 22 2 13 21 11 13 3 11"></polygon>
                                                </svg>
                                            </div>
                                        </div>
                                        <div class="media-body media-doller">
                                            <span class="m-0">Earnings</span>
                                            <h3 class="mb-0">$ <span class="counter">6659</span><small> This
                                                Month</small>
                                            </h3>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xxl-3 col-md-6 xl-50">
                            <div class="card o-hidden widget-cards">
                                <div class="secondary-box card-body">
                                    <div class="media static-top-widget align-items-center">
                                        <div class="icons-widgets">
                                            <div class="align-self-center text-center">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                     viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                     stroke-width="2"
                                                     stroke-linecap="round" stroke-linejoin="round"
                                                     class="feather feather-box font-secondary">
                                                    <path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z">
                                                    </path>
                                                    <polyline points="3.27 6.96 12 12.01 20.73 6.96"></polyline>
                                                    <line x1="12" y1="22.08" x2="12" y2="12"></line>
                                                </svg>
                                            </div>
                                        </div>
                                        <div class="media-body media-doller">
                                            <span class="m-0">Products</span>
                                            <h3 class="mb-0">$ <span class="counter">9856</span><small> This
                                                Month</small>
                                            </h3>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xxl-3 col-md-6 xl-50">
                            <div class="card o-hidden widget-cards">
                                <div class="primary-box card-body">
                                    <div class="media static-top-widget align-items-center">
                                        <div class="icons-widgets">
                                            <div class="align-self-center text-center">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                     viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                     stroke-width="2"
                                                     stroke-linecap="round" stroke-linejoin="round"
                                                     class="feather feather-message-square font-primary">
                                                    <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z">
                                                    </path>
                                                </svg>
                                            </div>
                                        </div>
                                        <div class="media-body media-doller"><span class="m-0">Messages</span>
                                            <h3 class="mb-0">$ <span class="counter">893</span><small> This
                                                Month</small></h3>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xxl-3 col-md-6 xl-50">
                            <div class="card o-hidden widget-cards">
                                <div class="danger-box card-body">
                                    <div class="media static-top-widget align-items-center">
                                        <div class="icons-widgets">
                                            <div class="align-self-center text-center">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                     viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                     stroke-width="2"
                                                     stroke-linecap="round" stroke-linejoin="round"
                                                     class="feather feather-users font-danger">
                                                    <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                                                    <circle cx="9" cy="7" r="4"></circle>
                                                    <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                                                    <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                                                </svg>
                                            </div>
                                        </div>
                                        <div class="media-body media-doller"><span class="m-0">New Vendors</span>
                                            <h3 class="mb-0">$ <span class="counter">5631</span><small> This
                                                Month</small></h3>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="col-xl-3 col-md-6 xl-50">
                            <div class="card order-graph sales-carousel">
                                <div class="card-header b-header">
                                    <h6>Total Sales</h6>
                                    <div class="row">
                                        <div class="col-6">
                                            <div class="small-chartjs">
                                                <div class="flot-chart-placeholder" id="simple-line-chart-sparkline-3">
                                                    <canvas width="100" height="60"
                                                            style="display: inline-block; width: 100px; height: 60px; vertical-align: top;"></canvas>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="value-graph">
                                                <h3>42% <span><i class="fa fa-angle-up font-primary"></i></span></h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="media">
                                        <div class="media-body">
                                            <span>Sales Last Month</span>
                                            <h2 class="mb-0">9054</h2>
                                            <p>0.25% <span><i class="fa fa-angle-up"></i></span></p>
                                        </div>

                                        <div class="bg-primary b-r-8">
                                            <div class="small-box">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                     viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                     stroke-width="2"
                                                     stroke-linecap="round" stroke-linejoin="round"
                                                     class="feather feather-briefcase">
                                                    <rect x="2" y="7" width="20" height="14" rx="2" ry="2"></rect>
                                                    <path d="M16 21V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"></path>
                                                </svg>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="sales-contain">
                                        <h5 class="f-w-600">Gross sales of August</h5>
                                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6 xl-50">
                            <div class="card order-graph sales-carousel">
                                <div class="card-header b-header">
                                    <h6>Total purchase</h6>
                                    <div class="row">
                                        <div class="col-6">
                                            <div class="small-chartjs">
                                                <div class="flot-chart-placeholder" id="simple-line-chart-sparkline">
                                                    <canvas width="100" height="60"
                                                            style="display: inline-block; width: 100px; height: 60px; vertical-align: top;"></canvas>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="value-graph">
                                                <h3>20% <span><i class="fa fa-angle-up font-secondary"></i></span></h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="media">
                                        <div class="media-body">
                                            <span>Monthly purchase</span>
                                            <h2 class="mb-0">2154</h2>
                                            <p>0.13% <span><i class="fa fa-angle-up"></i></span></p>
                                        </div>
                                        <div class="bg-secondary b-r-8">
                                            <div class="small-box">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                     viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                     stroke-width="2"
                                                     stroke-linecap="round" stroke-linejoin="round"
                                                     class="feather feather-credit-card">
                                                    <rect x="1" y="4" width="22" height="16" rx="2" ry="2"></rect>
                                                    <line x1="1" y1="10" x2="23" y2="10"></line>
                                                </svg>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="sales-contain">
                                        <h5 class="f-w-600">Avg Gross purchase</h5>
                                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6 xl-50">
                            <div class="card order-graph sales-carousel">
                                <div class="card-header b-header">
                                    <h6>Total cash transaction</h6>
                                    <div class="row">
                                        <div class="col-6">
                                            <div class="small-chartjs">
                                                <div class="flot-chart-placeholder" id="simple-line-chart-sparkline-2">
                                                    <canvas width="100" height="60"
                                                            style="display: inline-block; width: 100px; height: 60px; vertical-align: top;"></canvas>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="value-graph">
                                                <h3>28% <span><i class="fa fa-angle-up font-warning"></i></span></h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="media">
                                        <div class="media-body">
                                            <span>Cash on hand</span>
                                            <h2 class="mb-0">4672</h2>
                                            <p>0.8% <span><i class="fa fa-angle-up"></i></span></p>
                                        </div>
                                        <div class="bg-warning b-r-8">
                                            <div class="small-box">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                     viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                     stroke-width="2"
                                                     stroke-linecap="round" stroke-linejoin="round"
                                                     class="feather feather-shopping-cart">
                                                    <circle cx="9" cy="21" r="1"></circle>
                                                    <circle cx="20" cy="21" r="1"></circle>
                                                    <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6">
                                                    </path>
                                                </svg>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="sales-contain">
                                        <h5 class="f-w-600">Details about cash</h5>
                                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6 xl-50">
                            <div class="card order-graph sales-carousel">
                                <div class="card-header b-header">
                                    <h6>Daily Deposits</h6>
                                    <div class="row">
                                        <div class="col-6">
                                            <div class="small-chartjs">
                                                <div class="flot-chart-placeholder" id="simple-line-chart-sparkline-1">
                                                    <canvas width="100" height="60"
                                                            style="display: inline-block; width: 100px; height: 60px; vertical-align: top;"></canvas>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="value-graph">
                                                <h3>75% <span><i class="fa fa-angle-up font-danger"></i></span></h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="media">
                                        <div class="media-body">
                                            <span>Security Deposits</span>
                                            <h2 class="mb-0">0782</h2>
                                            <p>0.25% <span><i class="fa fa-angle-up"></i></span></p>
                                        </div>
                                        <div class="bg-danger b-r-8">
                                            <div class="small-box">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                     viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                     stroke-width="2"
                                                     stroke-linecap="round" stroke-linejoin="round"
                                                     class="feather feather-calendar">
                                                    <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                                    <line x1="16" y1="2" x2="16" y2="6"></line>
                                                    <line x1="8" y1="2" x2="8" y2="6"></line>
                                                    <line x1="3" y1="10" x2="21" y2="10"></line>
                                                </svg>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="sales-contain">
                                        <h5 class="f-w-600">Gross sales of June</h5>
                                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 xl-100">
                            <div class="card height-equal" style="min-height: 535px;">
                                <div class="card-header">
                                    <h5>Goods return</h5>
                                    <div class="card-header-right">
                                        <ul class="list-unstyled card-option">
                                            <li><i class="icofont icofont-simple-left"></i></li>
                                            <li><i class="view-html fa fa-code"></i></li>
                                            <li><i class="icofont icofont-maximize full-card"></i></li>
                                            <li><i class="icofont icofont-minus minimize-card"></i></li>
                                            <li><i class="icofont icofont-refresh reload-card"></i></li>
                                            <li><i class="icofont icofont-error close-card"></i></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="user-status table-responsive products-table">
                                        <table class="table table-bordernone mb-0">
                                            <thead>
                                            <tr>
                                                <th scope="col">Details</th>
                                                <th scope="col">Quantity</th>
                                                <th scope="col">Status</th>
                                                <th scope="col">Price</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>Simply dummy text of the printing</td>
                                                <td class="digits">1</td>
                                                <td class="font-primary">Pending</td>
                                                <td class="digits">$6523</td>
                                            </tr>
                                            <tr>
                                                <td>Long established</td>
                                                <td class="digits">5</td>
                                                <td class="font-secondary">Cancle</td>
                                                <td class="digits">$6523</td>
                                            </tr>
                                            <tr>
                                                <td>sometimes by accident</td>
                                                <td class="digits">10</td>
                                                <td class="font-secondary">Cancle</td>
                                                <td class="digits">$6523</td>
                                            </tr>
                                            <tr>
                                                <td>Classical Latin literature</td>
                                                <td class="digits">9</td>
                                                <td class="font-primary">Return</td>
                                                <td class="digits">$6523</td>
                                            </tr>
                                            <tr>
                                                <td>keep the site on the Internet</td>
                                                <td class="digits">8</td>
                                                <td class="font-primary">Pending</td>
                                                <td class="digits">$6523</td>
                                            </tr>
                                            <tr>
                                                <td>Molestiae consequatur</td>
                                                <td class="digits">3</td>
                                                <td class="font-secondary">Cancle</td>
                                                <td class="digits">$6523</td>
                                            </tr>
                                            <tr>
                                                <td>Pain can procure</td>
                                                <td class="digits">8</td>
                                                <td class="font-primary">Return</td>
                                                <td class="digits">$6523</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 xl-100">
                            <div class="card height-equal" style="min-height: 535px;">
                                <div class="card-header">
                                    <h5>Empolyee Status</h5>
                                    <div class="card-header-right">
                                        <ul class="list-unstyled card-option">
                                            <li><i class="icofont icofont-simple-left"></i></li>
                                            <li><i class="view-html fa fa-code"></i></li>
                                            <li><i class="icofont icofont-maximize full-card"></i></li>
                                            <li><i class="icofont icofont-minus minimize-card"></i></li>
                                            <li><i class="icofont icofont-refresh reload-card"></i></li>
                                            <li><i class="icofont icofont-error close-card"></i></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="user-status table-responsive products-table">
                                        <table class="table table-bordernone mb-0">
                                            <thead>
                                            <tr>
                                                <th scope="col">Name</th>
                                                <th scope="col">Designation</th>
                                                <th scope="col">Skill Level</th>
                                                <th scope="col">Experience</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td class="bd-t-none u-s-tb">
                                                    <div class="align-middle image-sm-size"><img
                                                            class="img-radius align-top m-r-15 rounded-circle blur-up lazyloaded"
                                                            src="assets/images/dashboard/user2.jpg" alt=""
                                                            data-original-title="" title="">
                                                        <div class="d-inline-block">
                                                            <h6 class="mb-0">John Deo <span class="text-muted digits">(14+
                                                                        Online)</span></h6>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>Designer</td>
                                                <td>
                                                    <div class="progress-showcase">
                                                        <div class="progress" style="height: 8px;">
                                                            <div class="progress-bar bg-primary" role="progressbar"
                                                                 style="width: 30%" aria-valuenow="50" aria-valuemin="0"
                                                                 aria-valuemax="100"></div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="digits">2 Year</td>
                                            </tr>
                                            <tr>
                                                <td class="bd-t-none u-s-tb">
                                                    <div class="align-middle image-sm-size"><img
                                                            class="img-radius align-top m-r-15 rounded-circle blur-up lazyloaded"
                                                            src="assets/images/dashboard/user1.jpg" alt=""
                                                            data-original-title="" title="">
                                                        <div class="d-inline-block">
                                                            <h6 class="mb-0">Holio Mako <span class="text-muted digits">(250+ Online)</span>
                                                            </h6>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>Developer</td>
                                                <td>
                                                    <div class="progress-showcase">
                                                        <div class="progress" style="height: 8px;">
                                                            <div class="progress-bar bg-secondary" role="progressbar"
                                                                 style="width: 70%" aria-valuenow="50" aria-valuemin="0"
                                                                 aria-valuemax="100"></div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="digits">3 Year</td>
                                            </tr>
                                            <tr>
                                                <td class="bd-t-none u-s-tb">
                                                    <div class="align-middle image-sm-size"><img
                                                            class="img-radius align-top m-r-15 rounded-circle blur-up lazyloaded"
                                                            src="assets/images/dashboard/user3.jpg" alt=""
                                                            data-original-title="" title="">
                                                        <div class="d-inline-block">
                                                            <h6 class="mb-0">Mohsib lara<span class="text-muted digits">(99+ Online)</span>
                                                            </h6>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>Tester</td>
                                                <td>
                                                    <div class="progress-showcase">
                                                        <div class="progress" style="height: 8px;">
                                                            <div class="progress-bar bg-primary" role="progressbar"
                                                                 style="width: 60%" aria-valuenow="50" aria-valuemin="0"
                                                                 aria-valuemax="100"></div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="digits">5 Month</td>
                                            </tr>
                                            <tr>
                                                <td class="bd-t-none u-s-tb">
                                                    <div class="align-middle image-sm-size"><img
                                                            class="img-radius align-top m-r-15 rounded-circle blur-up lazyloaded"
                                                            src="assets/images/dashboard/user.jpg" alt=""
                                                            data-original-title="" title="">
                                                        <div class="d-inline-block">
                                                            <h6 class="mb-0">Hileri Soli <span
                                                                    class="text-muted digits">(150+ Online)</span>
                                                            </h6>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>Designer</td>
                                                <td>
                                                    <div class="progress-showcase">
                                                        <div class="progress" style="height: 8px;">
                                                            <div class="progress-bar bg-secondary" role="progressbar"
                                                                 style="width: 30%" aria-valuenow="50" aria-valuemin="0"
                                                                 aria-valuemax="100"></div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="digits">3 Month</td>
                                            </tr>
                                            <tr>
                                                <td class="bd-t-none u-s-tb">
                                                    <div class="align-middle image-sm-size"><img
                                                            class="img-radius align-top m-r-15 rounded-circle blur-up lazyloaded"
                                                            src="assets/images/dashboard/designer.jpg" alt=""
                                                            data-original-title="" title="">
                                                        <div class="d-inline-block">
                                                            <h6 class="mb-0">Pusiz bia <span class="text-muted digits">(14+ Online)</span>
                                                            </h6>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>Designer</td>
                                                <td>
                                                    <div class="progress-showcase">
                                                        <div class="progress" style="height: 8px;">
                                                            <div class="progress-bar bg-primary" role="progressbar"
                                                                 style="width: 90%" aria-valuenow="50" aria-valuemin="0"
                                                                 aria-valuemax="100"></div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="digits">5 Year</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
                <!-- Container-fluid Ends-->

                <!-- Container-fluid starts-->
                <div class="container-fluid" id="category" style="display: none;">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                    <form class="form-inline search-form search-box">
                                        <div class="form-group">
                                            <input class="form-control-plaintext" type="search" placeholder="Search..">
                                        </div>
                                    </form>

                                    <button type="button" class="btn btn-primary add-row mt-md-0 mt-2">Add
                                        Category
                                    </button>
                                </div>

                                <div class="card-body">
                                    <div class="table-responsive table-desi">
                                        <table class="table all-package table-category " id="editableTable">
                                            <thead>
                                            <tr>
                                                <th>ID Type</th>
                                                <th>Name Category</th>
                                                <th>Description</th>
                                                <th>Status</th>
                                                <th>Option</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            <c:forEach items="${listTypeProduct}" var="type">
                                                <tr>
                                                    <td data-field="name">${type.idTypeProduct}</td>

                                                    <td data-field="price">${type.typeName}</td>

                                                    <td data-field="name">${type.description}</td>

                                                    <td class="order-success" data-field="status">
                                                        <span>Success</span>
                                                    </td>

                                                    <td>
                                                        <a href="javascript:void(0)">
                                                            <i class="fa fa-edit" title="Edit"></i>
                                                        </a>

                                                        <a href="javascript:void(0)">
                                                            <i class="fa fa-trash" title="Delete"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Container-fluid Ends-->

                <!-- Container-fluid starts-->
                <div class="container-fluid" id="product-list" style="display: none;">
                    <div class="row products-admin ratio_asos">
                        <c:forEach items="${listProduct}" var="pro">
                            <div class="col-xl-3 col-sm-6">
                                <div class="card">
                                    <div class="card-body product-box">
                                        <div class="img-wrapper">
                                            <div class="front">
                                                <a href="javascript:void(0)" class="bg-size"
                                                   style="background-image: url(&quot;${ass}images/pro3/34.jpg&quot;); background-size: cover; background-position: center center; display: block;"><img
                                                        src="${pro.image}" class="img-fluid blur-up lazyload bg-img"
                                                        alt=""
                                                        style="display: none;"></a>
                                                <div class="product-hover">
                                                    <ul>
                                                        <li>
                                                            <button onclick="clickConfirmPro(${pro.idProduct})"
                                                                    class="btn"
                                                                    type="button" data-original-title="" title="Duyệt">
                                                                <i
                                                                        class="ti-pencil-alt"></i></button>
                                                        </li>
                                                        <li>
                                                            <button class="btn"><i class="ti-trash"></i></button>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="product-detail">
                                            <a href="javascript:void(0)">
                                                <h6>${pro.nameProduct}</h6>
                                            </a>
                                            <h4>From ID Shop: ${pro.idShop.idShopStore}</h4>
                                            <h4>${pro.unitPrice} VNĐ</h4>
                                            <h4>${pro.dateCreated} VNĐ</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <!-- Container-fluid Ends-->

                <!-- Container-fluid starts-->
                <div class="container-fluid" id="product-review" style="display: none;">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                    <form class="form-inline search-form search-box">
                                        <div class="form-group">
                                            <input class="form-control-plaintext" type="search" placeholder="Search..">
                                        </div>
                                    </form>
                                </div>
                                <div class="card-body">
                                    <div>
                                        <div class="table-responsive table-desi">
                                            <table class="review-table table all-package">
                                                <thead>
                                                <tr>
                                                    <th>ID Report</th>
                                                    <th>Customer Name</th>
                                                    <th>Product Name</th>
                                                    <th>Rating</th>
                                                    <th>Comment</th>
                                                    <th>Published</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${lst_rp_fromCus}" var="rpCus2Pro">
                                                    <c:url value="/products/" var="Url_ProductRp">
                                                        <c:param name="ID_Product"
                                                                 value="${rpCus2Pro.idProduct.idProduct}"/>
                                                    </c:url>
                                                    <tr>
                                                        <td>${rpCus2Pro.idRp}</td>
                                                        <td>${rpCus2Pro.idCus.nameC}</td>
                                                        <td>
                                                            <a href="${Url_ProductRp}">${rpCus2Pro.idProduct.nameProduct}</a>
                                                        </td>
                                                        <td>
                                                            <ul class="rating">
                                                                <li>
                                                                    <i class="fa fa-star theme-color"></i>
                                                                </li>
                                                                <li>
                                                                    <i class="fa fa-star theme-color"></i>
                                                                </li>
                                                                <li>
                                                                    <i class="fa fa-star"></i>
                                                                </li>
                                                                <li>
                                                                    <i class="fa fa-star"></i>
                                                                </li>
                                                                <li>
                                                                    <i class="fa fa-star"></i>
                                                                </li>
                                                            </ul>
                                                        </td>
                                                        <td>${rpCus2Pro.descriptionRp}</td>
                                                        <c:if test="${rpCus2Pro.dateSolve != null}">
                                                            <td class="td-check">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="24"
                                                                     height="24"
                                                                     viewBox="0 0 24 24" fill="none"
                                                                     stroke="currentColor"
                                                                     stroke-width="2" stroke-linecap="round"
                                                                     stroke-linejoin="round"
                                                                     class="feather feather-check-circle">
                                                                    <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path>
                                                                    <polyline points="22 4 12 14.01 9 11.01"></polyline>
                                                                </svg>
                                                            </td>
                                                        </c:if>
                                                        <c:if test="${rpCus2Pro.dateSolve == null}">
                                                            <td class="td-cross">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="24"
                                                                     height="24"
                                                                     viewBox="0 0 24 24" fill="none"
                                                                     stroke="currentColor"
                                                                     stroke-width="2" stroke-linecap="round"
                                                                     stroke-linejoin="round"
                                                                     class="feather feather-x-circle">
                                                                    <circle cx="12" cy="12" r="10"></circle>
                                                                    <line x1="15" y1="9" x2="9" y2="15"></line>
                                                                    <line x1="9" y1="9" x2="15" y2="15"></line>
                                                                </svg>
                                                            </td>
                                                        </c:if>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Container-fluid Ends-->

                <!-- Container-fluid starts-->
                <div class="container-fluid" id="order-list" style="display: none;">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                    <form class="form-inline search-form search-box">
                                        <div class="form-group">
                                            <input class="form-control-plaintext" type="search" placeholder="Search..">
                                        </div>
                                    </form>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive table-desi">
                                        <table class="table all-package" id="editableTable">
                                            <thead>
                                            <tr>
                                                <th>Order Code</th>
                                                <th>Date</th>
                                                <th>Payment Method</th>
                                                <th>Delivery Status</th>
                                                <th>Amount</th>
                                                <th>Option</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            <c:forEach items="${listOrder}" var="order">
                                                <tr>
                                                    <td data-field="text">${order.idOrders}</td>


                                                    <td data-field="date">${order.timeBooked}</td>

                                                    <td data-field="text">${order.paymentMethod}</td>

                                                    <c:if test="${order.status == '1'}">
                                                        <td class="order-warning">
                                                            <span>Waitting</span>
                                                        </td>
                                                    </c:if>
                                                    <c:if test="${order.status == '2'}">
                                                        <td class="order-success">
                                                            <span>Accepted</span>
                                                        </td>
                                                    </c:if>
                                                    <c:if test="${order.status == 'CANCLE'}">
                                                        <td class="order-pending">
                                                            <span>Cancle</span>
                                                        </td>
                                                    </c:if>
                                                    <td data-field="number"><fmt:formatNumber type="number"
                                                                                              maxFractionDigits="3"
                                                                                              value="${order.totalMoney}"/></td>

                                                    <td>
                                                        <c:url value="/order-details" var="url_order_details">
                                                            <c:param value="${order.idOrders}" name="idOder"></c:param>
                                                        </c:url>
                                                        <a href="${url_order_details}">
                                                            <i class="fa fa-eye text-theme" title="See"></i>
                                                        </a>

                                                        <a href="${url_order_details}">
                                                            <i class="fa fa-edit" title="Edit"></i>
                                                        </a>

                                                        <a href="${url_order_details}">
                                                            <i class="ti-trash" title="Delete"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                        <ul class="pagination" style="display: flex; justify-content: center">
                                            <c:forEach begin="1" end="${Math.ceil(countOrderFull/16)}" var="i">
                                                <c:url value="/employee" var="c">
                                                    <c:param value="${i}" name="pageOrder"/>
                                                </c:url>
                                                <li class="page-item"><a class="page-link" href="${c}">${i}</a></li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Container-fluid Ends-->


                <!-- Container-fluid starts-->
                <div class="container-fluid" id="order" style="display: none;">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <!-- <div class="card-header">
                                        <h5>Manage Order</h5>
                                    </div> -->
                                <div class="card-body order-datatable">
                                    <div id="basic-1_wrapper" class="dataTables_wrapper no-footer">
                                        <div id="basic-1_filter" class="dataTables_filter"><label>Search:<input
                                                type="search" class="" placeholder="" aria-controls="basic-1"></label>
                                        </div>
                                        <table class="display dataTable no-footer" id="basic-1" role="grid"
                                               aria-describedby="basic-1_info">
                                            <thead>
                                            <tr role="row">
                                                <th class="sorting_asc" tabindex="0" aria-controls="basic-1" rowspan="1"
                                                    colspan="1" aria-sort="ascending"
                                                    aria-label="Order Id: activate to sort column descending"
                                                >Order Id
                                                </th>
                                                <th class="sorting" tabindex="0" aria-controls="basic-1" rowspan="1"
                                                    colspan="1" aria-label="Date: activate to sort column ascending"
                                                >Date
                                                </th>
                                                <th class="sorting" tabindex="0" aria-controls="basic-1" rowspan="1"
                                                    colspan="1"
                                                    aria-label="Payment Method: activate to sort column ascending"
                                                >Payment Method
                                                </th>
                                                <th class="sorting" tabindex="0" aria-controls="basic-1" rowspan="1"
                                                    colspan="1"
                                                    aria-label="Order Status: activate to sort column ascending"
                                                >Order Status
                                                </th>
                                                <th class="sorting" tabindex="0" aria-controls="basic-1" rowspan="1"
                                                    colspan="1" aria-label="Total: activate to sort column ascending"
                                                >Total
                                                </th>
                                                <th class="sorting" aria-controls="basic-1" rowspan="1"
                                                    colspan="1">Option
                                                </th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${listOrderSales}" var="order">
                                                <tr role="row" class="odd">
                                                    <td data-field="text">${order.idOrders}</td>

                                                    <td data-field="date">${order.timeBooked}</td>

                                                    <td data-field="text">${order.paymentMethod}</td>
                                                    <c:if test="${order.status == '2'}">
                                                        <td class="order-success">
                                                            <span class="badge badge-success">Accepted</span>
                                                        </td>
                                                    </c:if>
                                                    <td data-field="number"><fmt:formatNumber type="number"
                                                                                              maxFractionDigits="3"
                                                                                              value="${order.totalMoney}"/></td>

                                                    <td>
                                                        <c:url value="/order-details" var="url_order_details">
                                                            <c:param value="${order.idOrders}" name="idOder"></c:param>
                                                        </c:url>
                                                        <a href="${url_order_details}">
                                                            <i class="fa fa-eye text-theme" title="See"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>

                                        <ul class="pagination" style="display: flex; justify-content: center">
                                            <c:forEach begin="1" end="${Math.ceil(countOrderSales/16)}" var="i">
                                                <c:url value="/employee" var="c">
                                                    <c:param value="${i}" name="pageSales"/>
                                                </c:url>
                                                <li class="page-item"><a class="page-link" href="${c}">${i}</a></li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Container-fluid Ends-->


                <!-- Container-fluid starts-->
                <div class="container-fluid" id="coupon-list" style="display: none;">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                    <form class="form-inline search-form search-box">
                                        <div class="form-group">
                                            <input class="form-control-plaintext" type="search" placeholder="Search..">
                                        </div>
                                    </form>

                                </div>

                                <div class="card-body">
                                    <div>
                                        <div class="table-responsive table-desi">
                                            <table class="all-package coupon-table table table-striped">
                                                <thead>
                                                <tr>
                                                    <th>
                                                        <button type="button"
                                                                class="btn btn-primary add-row delete_all">
                                                            Delete
                                                        </button>
                                                    </th>
                                                    <th>Title</th>
                                                    <th>Code</th>
                                                    <th>Discount</th>
                                                    <th>Status</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${listDiscount}" var="dis">
                                                    <tr role="row" class="odd tr_tbl_discount">
                                                        <td>
                                                            <button class="btn btn_delete_discount"><i class="ti-trash"
                                                                                                       title="Delete"></i>
                                                                Xoá
                                                            </button>
                                                        </td>

                                                        <td>${dis.nameDiscount}</td>

                                                        <td class="idDiscount-tbl">${dis.idDiscount}</td>

                                                        <c:if test="${dis.percentDiscount != null}">
                                                            <td>${dis.percentDiscount}%</td>
                                                        </c:if>
                                                        <c:if test="${dis.valueDiscount != null}">
                                                            <td>-<fmt:formatNumber type="number"
                                                                                   maxFractionDigits="3"
                                                                                   value="${dis.valueDiscount}"/></td>
                                                        </c:if>

                                                        <c:if test="${dis.status == 1}">
                                                            <td class="order-success">
                                                                <span>Đang hoạt động</span>
                                                            </td>
                                                        </c:if>
                                                        <c:if test="${dis.status == 0}">
                                                            <td class="order-warning">
                                                                <span>Không được áp dụng</span>
                                                            </td>
                                                        </c:if>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                            <ul class="pagination" style="display: flex; justify-content: center">
                                                <c:forEach begin="1" end="${Math.ceil(countDiscount/16)}" var="i">
                                                    <c:url value="/employee" var="c">
                                                        <c:param value="${i}" name="pageDiscount"/>
                                                    </c:url>
                                                    <li class="page-item"><a class="page-link" href="${c}">${i}</a></li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Container-fluid Ends-->


                <!-- Container-fluid starts-->
                <div class="container-fluid" id="user-list" style="display: none;">
                    <div class="card">
                        <div class="card-header">
                            <form class="form-inline search-form search-box">
                                <div class="form-group">
                                    <input class="form-control-plaintext" type="search" placeholder="Search.."><span
                                        class="d-sm-none mobile-search"><svg xmlns="http://www.w3.org/2000/svg"
                                                                             width="24"
                                                                             height="24" viewBox="0 0 24 24" fill="none"
                                                                             stroke="currentColor" stroke-width="2"
                                                                             stroke-linecap="round"
                                                                             stroke-linejoin="round"
                                                                             class="feather feather-search"><circle
                                        cx="11"
                                        cy="11"
                                        r="8"></circle><line
                                        x1="21" y1="21" x2="16.65" y2="16.65"></line></svg></span>
                                </div>
                            </form>
                        </div>

                        <div class="card-body">
                            <div class="table-responsive table-desi">
                                <table class="all-package coupon-table table table-striped">
                                    <thead>
                                    <tr>
                                        <th>Avatar</th>
                                        <th>Name</th>
                                        <th>Orders</th>
                                        <th>Email</th>
                                        <th>Account</th>
                                        <th>Role</th>
                                        <th>
                                            <button type="button" class="btn btn-primary add-row delete_all">Cấm
                                            </button>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listCustomer}" var="cus">
                                        <tr role="row" class="odd tr_tbl_discount"
                                            <c:if test="${cus.idAcc == accEmpl}">style="display: none" </c:if>>
                                            <c:if test="${cus.image.startsWith('https') == false}">
                                                <td><img src="https://bootdey.com/img/Content/avatar/avatar7.png"
                                                         alt="Admin"
                                                         class="img-fluid"></td>
                                            </c:if>
                                            <c:if test="${cus.image.startsWith('https') == true}">
                                                <td><img class="img-fluid"
                                                         src="${cus.image}"
                                                         alt="Admin"></td>
                                            </c:if>

                                            <td>${cus.nameC}</td>

                                            <c:url value="/user/cus-orders-manager" var="orderCus">
                                                <c:param name="idCus" value="${cus.idCustomer}"></c:param>
                                            </c:url>
                                            <td style="color: orange"><a style="font-weight: bold" href="${orderCus}">Xem</a>
                                            </td>

                                            <td>${cus.email}</td>
                                            <c:forEach items="${lstAccount}" var="lstAc">
                                                <c:if test="${lstAc.idAccount == cus.idAcc}">
                                                    <td>${lstAc.usernameC}</td>
                                                    <td>${lstAc.idPos.descriptions}</td>
                                                    <c:if test="${lstAc.idPos.idPosition == 2}">
                                                        <td>
                                                            <button onclick="clickBanAccount(${lstAc.idAccount})"
                                                                    class="btn btn_delete_discount" <c:if
                                                                    test="${lstAc.stt == 'banned'}">
                                                                disabled
                                                            </c:if>><i class="fa-solid fa-lock"></i> Cấm
                                                                <c:if test="${lstAc.stt == 'banned'}">
                                                                    (Đang khoá)
                                                                </c:if></button>
                                                            <c:if test="${lstAc.stt == 'banned'}">
                                                                <button onclick="clickOpenAccount(${lstAc.idAccount})"
                                                                        class="btn btn_delete_discount">
                                                                    <i class="fa-solid fa-lock-open"></i> Mở khoá
                                                                </button>
                                                            </c:if>
                                                        </td>
                                                    </c:if>
                                                    <c:if test="${lstAc.idPos.idPosition == 4}">
                                                        <td>
                                                            <button class="btn btn_delete_discount" disabled><i
                                                                    class="fa-solid fa-lock"></i> Cấm (No)
                                                            </button>
                                                        </td>
                                                    </c:if>
                                                </c:if>
                                            </c:forEach>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <ul class="pagination" style="display: flex; justify-content: center">
                                    <c:forEach begin="1" end="${Math.ceil(countCustomer/16)}" var="i">
                                        <c:url value="/employee" var="c">
                                            <c:param value="${i}" name="pageCus"/>
                                        </c:url>
                                        <li class="page-item"><a class="page-link" href="${c}">${i}</a></li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Container-fluid Ends-->

                <!-- Container-fluid starts-->
                <div class="container-fluid" id="list-vendor" style="display: none;">
                    <div class="card">
                        <div class="card-header">
                            <form class="form-inline search-form search-box">
                                <div class="form-group">
                                    <input class="form-control-plaintext" type="search" placeholder="Search.."><span
                                        class="d-sm-none mobile-search"><svg xmlns="http://www.w3.org/2000/svg"
                                                                             width="24"
                                                                             height="24" viewBox="0 0 24 24" fill="none"
                                                                             stroke="currentColor" stroke-width="2"
                                                                             stroke-linecap="round"
                                                                             stroke-linejoin="round"
                                                                             class="feather feather-search"><circle
                                        cx="11"
                                        cy="11"
                                        r="8"></circle><line
                                        x1="21" y1="21" x2="16.65" y2="16.65"></line></svg></span>
                                </div>
                            </form>
                        </div>
                        <div class="card-body vendor-table">
                            <div id="basic-1_wrapper" class="dataTables_wrapper no-footer">
                                <table class="display dataTable no-footer" id="basic-1" role="grid"
                                       aria-describedby="basic-1_info">
                                    <thead>
                                    <tr role="row">
                                        <th class="sorting_asc" tabindex="0" aria-controls="basic-1" rowspan="1"
                                            colspan="1"
                                            aria-sort="ascending"
                                            aria-label="Vendor: activate to sort column descending"
                                            style="width: 150px;">ID Shop
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="basic-1" rowspan="1" colspan="1"
                                            aria-label="Products: activate to sort column ascending"
                                            style="width: 150px;">
                                            Name Shop
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="basic-1" rowspan="1" colspan="1"
                                            aria-label="Store Name: activate to sort column ascending"
                                            style="width: 150px;">Create Date
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="basic-1" rowspan="1" colspan="1"
                                            aria-label="Create Date: activate to sort column ascending"
                                            style="width: 150px;">Orders
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="basic-1" rowspan="1" colspan="1"
                                            aria-label="Wallet Balance: activate to sort column ascending"
                                            style="width: 150px;">Product
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="basic-1" rowspan="1" colspan="1"
                                            aria-label="Action: activate to sort column ascending"
                                            style="width: 150px;">
                                            Product Waitting
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="basic-1" rowspan="1" colspan="1"
                                            aria-label="Products: activate to sort column ascending"
                                            style="width: 150px;">
                                            Report
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="basic-1" rowspan="1" colspan="1"
                                            aria-label="Action: activate to sort column ascending"
                                            style="width: 150px;">
                                            TurnOver
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${list_in4Shop}" var="s">
                                        <c:url value="/shop-manager/turnover-shop" var="turnOv">
                                            <c:param value="${s[0]}" name="idS"/>
                                        </c:url>
                                        <c:url value="/shop-manager" var="ord">
                                            <c:param value="${s[0]}" name="idShop_FrEpl"/>
                                            <c:param name="idAcc" value="${s[6]}"></c:param>
                                        </c:url>
                                        <tr role="row" class="odd">
                                            <td>${s[0]}</td>
                                            <td>${s[1]}</td>
                                            <td>${s[2]}</td>
                                            <td><a class="showOrders" href="${ord}">Xem</a></td>
                                            <td>${s[3]}</td>
                                            <td>${s[4]}</td>
                                            <td>${s[5]}</td>
                                            <td><a class="showTurnOvers" href="${turnOv}">Xem</a></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <ul class="pagination" style="display: flex; justify-content: center">
                                    <c:forEach begin="1" end="${Math.ceil(sl_shop/8)}" var="i">
                                        <c:url value="/employee" var="c">
                                            <c:param value="${i}" name="pageShop"/>
                                        </c:url>
                                        <li class="page-item"><a class="page-link" href="${c}">${i}</a></li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Container-fluid Ends-->
            </c:if>

        </div>

        <!-- footer start-->
        <footer class="footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6 footer-copyright text-start">
                        <p class="mb-0">Copyright 2022</p>
                    </div>
                    <div class="col-md-6 pull-right text-end">
                        <p class=" mb-0">OU<i class="fa fa-heart"></i></p>
                    </div>
                </div>
            </div>
        </footer>
        <!-- footer end-->
    </div>
</div>
<script>
    var content = document.getElementsByClassName("content-order");
    var btnOpenOr = document.getElementsByClassName("btnOpenOrder");
    var show_orders = document.getElementsByClassName("show-orders");

    var content_sp = document.getElementsByClassName("content-sp");
    var btnOpen_sp = document.getElementsByClassName("btnOpen-sp");
    var show_sp = document.getElementsByClassName("show-sp");
    var base_sp = document.getElementsByClassName("base-sp");


    window.onload = function () {
        base_sp[0].style.display = 'none';

        for (var i = 0; i < show_orders.length; i++) {
            show_orders[i].style.display = 'none';
        }

        for (var i = 0; i < show_sp.length; i++) {
            show_sp[i].style.display = 'none';
            btnOpen_sp[i].setAttribute("onclick", "changeBackgroundBtn_sp(" + i + ");");
        }

        for (var i = 0; i < content.length; i++) {
            content[i].style.display = 'none';
            btnOpenOr[i].setAttribute("onclick", "changeBackgroundBtn(" + i + ");");
        }


        ////DELETE DISCOUNT
        var tr_discount = document.getElementsByClassName("tr_tbl_discount");
        var btn_delete_discount = document.getElementsByClassName("btn_delete_discount");
        var id_Discount_from_tr = document.getElementsByClassName("idDiscount-tbl");
        for (let i = 0; i < tr_discount.length; i++) {
            btn_delete_discount[i].setAttribute("onclick", 'clickDeleteDiscount(' + i + ',' + '\'' + id_Discount_from_tr[i].innerText + '\'' + ')');
        }
    }

    function clickOpenAccount(idAcc) {
        if ('${active}' == 'actived') {
            var answer = window.confirm("Do u want to open?");
            if (answer) {
                let idAccEmpl = '${accEmpl}';
                fetch('http://localhost:8080/thuongmaidientu/api/update-stt-account', {
                    method: 'post',
                    body: JSON.stringify({
                        "id_Role": idAccEmpl.toString(),
                        "id_Update": idAcc.toString(),
                        "Stt": "actived"
                    }),
                    headers: {
                        "Content-Type": "application/json"
                    }
                }).then(function (res) {
                    if (res.status === 200) {
                        alert('Mờ khoá thành công');
                    } else
                        alert('Mờ khoá không thành công');
                })
            } else {
                //some code
            }
        } else {
            alert('Hiện tại tài khoản của bạn đang trong tình trạng bị khoá, vui lòng thử lại sau!!');
        }
    }

    function clickBanAccount(idAcc) {
        if ('${active}' == 'actived') {
            var answer = window.confirm("Do u want to ban?");
            if (answer) {
                let idAccEmpl = '${accEmpl}';
                fetch('http://localhost:8080/thuongmaidientu/api/update-stt-account', {
                    method: 'post',
                    body: JSON.stringify({
                        "id_Role": idAccEmpl.toString(),
                        "id_Update": idAcc.toString(),
                        "Stt": "banned"
                    }),
                    headers: {
                        "Content-Type": "application/json"
                    }
                }).then(function (res) {
                    if (res.status === 200) {
                        alert('Cấm thành công');
                    } else
                        alert('Cấm không thành công');
                })
            } else {
                //some code
            }
        } else {
            alert('Hiện tại tài khoản của bạn đang trong tình trạng bị khoá, vui lòng thử lại sau!!');
        }
    }

    function clickDeleteDiscount(i, idDis) {
        if ('${active}' == 'actived') {
            var answer = window.confirm("Delete data?");
            if (answer) {
                fetch('http://localhost:8080/thuongmaidientu/api/update-stt-discount', {
                    method: 'post',
                    body: JSON.stringify({
                        "idDis": idDis.toString(),
                        "sttDis": "0"
                    }),
                    headers: {
                        "Content-Type": "application/json"
                    }
                }).then(function (res) {
                    if (res.status === 200) {
                        alert('Xoá thành công');
                        document.getElementsByClassName("tr_tbl_discount")[i].style.display = 'none';
                    } else
                        alert('Xoá không thành công');
                })
            } else {
                //some code
            }
        } else {
            alert('Hiện tại tài khoản của bạn đang trong tình trạng bị khoá, vui lòng thử lại sau!!');
        }
    }


    function changeBackgroundBtn(i) {
        for (var h = 0; h < show_orders.length; h++) {
            show_orders[h].style.display = 'none';
        }
        for (var y = 0; y < content.length; y++) {
            content[y].style.display = 'none';
            btnOpenOr[y].style.background = '#0d6efd';
        }
        content[i].style.display = 'block';
        show_orders[i].style.display = 'block';
        btnOpenOr[i].style.background = '#00FFFF';
    }


    function changeBackgroundBtn_sp(i) {
        base_sp[0].style.display = 'block';

        for (var h = 0; h < show_sp.length; h++) {
            show_sp[h].style.display = 'none';
            btnOpen_sp[h].style.background = '#0d6efd';
        }

        show_sp[i].style.display = 'block';
        btnOpen_sp[i].style.background = '#00FFFF';
    }


    function clickSendRp(idShop, idEmploy, idPro) {
        var answer = window.confirm("Do you want to sent Report to Shop?");
        if (answer) {
            var typeRp = "5";
            var descript = "Yêu cầu shop duyệt đối với Sản phẩm " + idPro.toString();

            fetch("http://localhost:8080/thuongmaidientu/api/send-rp-employee-shop", {
                method: 'post',
                body: JSON.stringify({
                    "typeRp": typeRp.toString(),
                    "idShop": idShop.toString(),
                    "descrip": descript.toString(),
                    "idEmp": idEmploy.toString(),
                    "idPro": idPro.toString()
                }),
                headers: {
                    "Content-Type": "application/json"
                }
            }).then(function (res) {
                if (res.status === 200) {
                    alert('Báo cáo shop thành công');
                } else
                    alert('Báo cáo không thành công');
            })
        } else {
            //some code
        }
    }

    function clickConfirmPro(idPro) {
        var answer = window.confirm("Do you want to sent Confirm to Shop?");
        if (answer) {
            fetch("http://localhost:8080/thuongmaidientu/api/add-shop-product", {
                method: 'post',
                body: JSON.stringify({
                    "idPro": idPro.toString()
                }),
                headers: {
                    "Content-Type": "application/json"
                }
            }).then(function (res) {
                if (res.status === 200) {
                    alert('Duyệt sản phẩm vào shop thành công');
                    window.location.reload();
                } else
                    alert('Duyệt thất bại không thành công');
            })
        } else {
            //some code
        }
    }

    function clickConfirmOrder_Full(idOrder) {
        var answer = window.confirm("Do you want to confirm this order's full?");
        if (answer) {
            fetch("http://localhost:8080/thuongmaidientu/api/confirm-order-full", {
                method: 'post',
                body: JSON.stringify({
                    "idOrd": idOrder.toString()
                }),
                headers: {
                    "Content-Type": "application/json"
                }
            }).then(function (res) {
                if (res.status === 200) {
                    alert('Xác nhận đơn hàng đã đầy thành công');
                    window.location.reload();
                } else
                    alert('Xác nhận thất bại');
            })
        } else {
            //some code
        }
    }

</script>

<!-- latest jquery-->
<script src="${ass}js/jquery-3.3.1.min.js"></script>

<!-- Bootstrap js-->
<script src="${ass}js/bootstrap.bundle.min.js"></script>

<!-- feather icon js-->
<script src="${ass}js/icons/feather-icon/feather.min.js"></script>
<script src="${ass}js/icons/feather-icon/feather-icon.js"></script>

<!-- Sidebar jquery-->
<script src="${ass}js/sidebar-menu.js"></script>

<!--chartist js-->
<script src="${ass}js/chart/chartist/chartist.js"></script>

<!--chartjs js-->
<script src="${ass}js/chart/chartjs/chart.min.js"></script>

<!-- lazyload js-->
<script src="${ass}js/lazysizes.min.js"></script>

<!--copycode js-->
<script src="${ass}js/prism/prism.min.js"></script>
<script src="${ass}js/clipboard/clipboard.min.js"></script>
<script src="${ass}js/custom-card/custom-card.js"></script>

<!--counter js-->
<script src="${ass}js/counter/jquery.waypoints.min.js"></script>
<script src="${ass}js/counter/jquery.counterup.min.js"></script>
<script src="${ass}js/counter/counter-custom.js"></script>

<!--peity chart js-->
<script src="${ass}js/chart/peity-chart/peity.jquery.js"></script>

<!-- Apex Chart Js -->
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>

<!--sparkline chart js-->
<script src="${ass}js/chart/sparkline/sparkline.js"></script>


<!--dashboard custom js-->
<script src="${ass}js/dashboard/default.js"></script>

<!--right sidebar js-->
<script src="${ass}js/chat-menu.js"></script>

<!--height equal js-->
<script src="${ass}js/height-equal.js"></script>

<!-- lazyload js-->
<script src="${ass}js/lazysizes.min.js"></script>

<!--script admin-->
<script src="${ass}js/admin-script.js"></script>
<!-- Code injected by live-server -->
<script>
    $('#navbarDiv a').click(function (e) {
        $('.page-body > div').hide();
        $(this.hash).show();
        e.preventDefault(); //to prevent scrolling
    });
</script>
<!--menu click-->

<!-- Code injected by live-server -->
<script>
    // <![CDATA[  <-- For SVG support
    if ('WebSocket' in window) {
        (function () {
            function refreshCSS() {
                var sheets = [].slice.call(document.getElementsByTagName("link"));
                var head = document.getElementsByTagName("head")[0];
                for (var i = 0; i < sheets.length; ++i) {
                    var elem = sheets[i];
                    var parent = elem.parentElement || head;
                    parent.removeChild(elem);
                    var rel = elem.rel;
                    if (elem.href && typeof rel != "string" || rel.length == 0 || rel.toLowerCase() == "stylesheet") {
                        var url = elem.href.replace(/(&|\?)_cacheOverride=\d+/, '');
                        elem.href = url + (url.indexOf('?') >= 0 ? '&' : '?') + '_cacheOverride=' + (new Date().valueOf());
                    }
                    parent.appendChild(elem);
                }
            }

            var protocol = window.location.protocol === 'http:' ? 'ws://' : 'wss://';
            var address = protocol + window.location.host + window.location.pathname + '/ws';
            var socket = new WebSocket(address);
            socket.onmessage = function (msg) {
                if (msg.data == 'reload') window.location.reload();
                else if (msg.data == 'refreshcss') refreshCSS();
            };
            if (sessionStorage && !sessionStorage.getItem('IsThisFirstTime_Log_From_LiveServer')) {
                console.log('Live reload enabled.');
                sessionStorage.setItem('IsThisFirstTime_Log_From_LiveServer', true);
            }
        })();
    } else {
        console.error('Upgrade your browser. This Browser is NOT supported WebSocket for Live-Reloading.');
    }
    // ]]>
</script>
<svg id="SvgjsSvg1001" width="2" height="0" xmlns="http://www.w3.org/2000/svg" version="1.1"
     xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.dev"
     style="overflow: hidden; top: -100%; left: -100%; position: absolute; opacity: 0;">
    <defs id="SvgjsDefs1002"></defs>
    <polyline id="SvgjsPolyline1003" points="0,0"></polyline>
    <path id="SvgjsPath1004" d="M0 0 "></path>
</svg>

<!-- Code injected by live-server -->
<script>
    // <![CDATA[  <-- For SVG support
    if ('WebSocket' in window) {
        (function () {
            function refreshCSS() {
                var sheets = [].slice.call(document.getElementsByTagName("link"));
                var head = document.getElementsByTagName("head")[0];
                for (var i = 0; i < sheets.length; ++i) {
                    var elem = sheets[i];
                    var parent = elem.parentElement || head;
                    parent.removeChild(elem);
                    var rel = elem.rel;
                    if (elem.href && typeof rel != "string" || rel.length == 0 || rel.toLowerCase() == "stylesheet") {
                        var url = elem.href.replace(/(&|\?)_cacheOverride=\d+/, '');
                        elem.href = url + (url.indexOf('?') >= 0 ? '&' : '?') + '_cacheOverride=' + (new Date().valueOf());
                    }
                    parent.appendChild(elem);
                }
            }

            var protocol = window.location.protocol === 'http:' ? 'ws://' : 'wss://';
            var address = protocol + window.location.host + window.location.pathname + '/ws';
            var socket = new WebSocket(address);
            socket.onmessage = function (msg) {
                if (msg.data == 'reload') window.location.reload();
                else if (msg.data == 'refreshcss') refreshCSS();
            };
            if (sessionStorage && !sessionStorage.getItem('IsThisFirstTime_Log_From_LiveServer')) {
                console.log('Live reload enabled.');
                sessionStorage.setItem('IsThisFirstTime_Log_From_LiveServer', true);
            }
        })();
    } else {
        console.error('Upgrade your browser. This Browser is NOT supported WebSocket for Live-Reloading.');
    }
    // ]]>
</script>
<svg id="SvgjsSvg1001" width="2" height="0" xmlns="http://www.w3.org/2000/svg" version="1.1"
     xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.dev"
     style="overflow: hidden; top: -100%; left: -100%; position: absolute; opacity: 0;">
    <defs id="SvgjsDefs1002"></defs>
    <polyline id="SvgjsPolyline1003" points="0,0"></polyline>
    <path id="SvgjsPath1004" d="M0 0 "></path>
</svg>

<!-- Code injected by live-server -->
<script>
    // <![CDATA[  <-- For SVG support
    if ('WebSocket' in window) {
        (function () {
            function refreshCSS() {
                var sheets = [].slice.call(document.getElementsByTagName("link"));
                var head = document.getElementsByTagName("head")[0];
                for (var i = 0; i < sheets.length; ++i) {
                    var elem = sheets[i];
                    var parent = elem.parentElement || head;
                    parent.removeChild(elem);
                    var rel = elem.rel;
                    if (elem.href && typeof rel != "string" || rel.length == 0 || rel.toLowerCase() == "stylesheet") {
                        var url = elem.href.replace(/(&|\?)_cacheOverride=\d+/, '');
                        elem.href = url + (url.indexOf('?') >= 0 ? '&' : '?') + '_cacheOverride=' + (new Date().valueOf());
                    }
                    parent.appendChild(elem);
                }
            }

            var protocol = window.location.protocol === 'http:' ? 'ws://' : 'wss://';
            var address = protocol + window.location.host + window.location.pathname + '/ws';
            var socket = new WebSocket(address);
            socket.onmessage = function (msg) {
                if (msg.data == 'reload') window.location.reload();
                else if (msg.data == 'refreshcss') refreshCSS();
            };
            if (sessionStorage && !sessionStorage.getItem('IsThisFirstTime_Log_From_LiveServer')) {
                console.log('Live reload enabled.');
                sessionStorage.setItem('IsThisFirstTime_Log_From_LiveServer', true);
            }
        })();
    } else {
        console.error('Upgrade your browser. This Browser is NOT supported WebSocket for Live-Reloading.');
    }
    // ]]>
</script>
<svg id="SvgjsSvg1001" width="2" height="0" xmlns="http://www.w3.org/2000/svg" version="1.1"
     xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.dev"
     style="overflow: hidden; top: -100%; left: -100%; position: absolute; opacity: 0;">
    <defs id="SvgjsDefs1002"></defs>
    <polyline id="SvgjsPolyline1003" points="0,0"></polyline>
    <path id="SvgjsPath1004" d="M0 0 "></path>
</svg>

<!-- Code injected by live-server -->
<script>
    // <![CDATA[  <-- For SVG support
    if ('WebSocket' in window) {
        (function () {
            function refreshCSS() {
                var sheets = [].slice.call(document.getElementsByTagName("link"));
                var head = document.getElementsByTagName("head")[0];
                for (var i = 0; i < sheets.length; ++i) {
                    var elem = sheets[i];
                    var parent = elem.parentElement || head;
                    parent.removeChild(elem);
                    var rel = elem.rel;
                    if (elem.href && typeof rel != "string" || rel.length == 0 || rel.toLowerCase() == "stylesheet") {
                        var url = elem.href.replace(/(&|\?)_cacheOverride=\d+/, '');
                        elem.href = url + (url.indexOf('?') >= 0 ? '&' : '?') + '_cacheOverride=' + (new Date().valueOf());
                    }
                    parent.appendChild(elem);
                }
            }

            var protocol = window.location.protocol === 'http:' ? 'ws://' : 'wss://';
            var address = protocol + window.location.host + window.location.pathname + '/ws';
            var socket = new WebSocket(address);
            socket.onmessage = function (msg) {
                if (msg.data == 'reload') window.location.reload();
                else if (msg.data == 'refreshcss') refreshCSS();
            };
            if (sessionStorage && !sessionStorage.getItem('IsThisFirstTime_Log_From_LiveServer')) {
                console.log('Live reload enabled.');
                sessionStorage.setItem('IsThisFirstTime_Log_From_LiveServer', true);
            }
        })();
    } else {
        console.error('Upgrade your browser. This Browser is NOT supported WebSocket for Live-Reloading.');
    }
    // ]]>
</script>
<svg id="SvgjsSvg1001" width="2" height="0" xmlns="http://www.w3.org/2000/svg" version="1.1"
     xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.dev"
     style="overflow: hidden; top: -100%; left: -100%; position: absolute; opacity: 0;">
    <defs id="SvgjsDefs1002"></defs>
    <polyline id="SvgjsPolyline1003" points="0,0"></polyline>
    <path id="SvgjsPath1004" d="M0 0 "></path>
</svg>

<!-- Code injected by live-server -->
<script>
    // <![CDATA[  <-- For SVG support
    if ('WebSocket' in window) {
        (function () {
            function refreshCSS() {
                var sheets = [].slice.call(document.getElementsByTagName("link"));
                var head = document.getElementsByTagName("head")[0];
                for (var i = 0; i < sheets.length; ++i) {
                    var elem = sheets[i];
                    var parent = elem.parentElement || head;
                    parent.removeChild(elem);
                    var rel = elem.rel;
                    if (elem.href && typeof rel != "string" || rel.length == 0 || rel.toLowerCase() == "stylesheet") {
                        var url = elem.href.replace(/(&|\?)_cacheOverride=\d+/, '');
                        elem.href = url + (url.indexOf('?') >= 0 ? '&' : '?') + '_cacheOverride=' + (new Date().valueOf());
                    }
                    parent.appendChild(elem);
                }
            }

            var protocol = window.location.protocol === 'http:' ? 'ws://' : 'wss://';
            var address = protocol + window.location.host + window.location.pathname + '/ws';
            var socket = new WebSocket(address);
            socket.onmessage = function (msg) {
                if (msg.data == 'reload') window.location.reload();
                else if (msg.data == 'refreshcss') refreshCSS();
            };
            if (sessionStorage && !sessionStorage.getItem('IsThisFirstTime_Log_From_LiveServer')) {
                console.log('Live reload enabled.');
                sessionStorage.setItem('IsThisFirstTime_Log_From_LiveServer', true);
            }
        })();
    } else {
        console.error('Upgrade your browser. This Browser is NOT supported WebSocket for Live-Reloading.');
    }
    // ]]>
</script>
<svg id="SvgjsSvg1001" width="2" height="0" xmlns="http://www.w3.org/2000/svg" version="1.1"
     xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.dev"
     style="overflow: hidden; top: -100%; left: -100%; position: absolute; opacity: 0;">
    <defs id="SvgjsDefs1002"></defs>
    <polyline id="SvgjsPolyline1003" points="0,0"></polyline>
    <path id="SvgjsPath1004" d="M0 0 "></path>
</svg>