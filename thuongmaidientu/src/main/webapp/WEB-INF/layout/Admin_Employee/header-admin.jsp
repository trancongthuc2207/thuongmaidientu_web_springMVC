<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 23/10/2022
  Time: 10:33 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<div class="page-main-header">--%>
<%--    <div class="main-header-right row">--%>
<%--        <div class="main-header-left d-lg-none w-auto">--%>
<%--            <div class="logo-wrapper">--%>
<%--                <a href="index.html">--%>
<%--                    <img class="blur-up lazyloaded d-block d-lg-none" src="" alt="">--%>
<%--                </a>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="mobile-sidebar w-auto">--%>
<%--            <div class="media-body text-end switch-sm">--%>
<%--                <label class="switch">--%>
<%--                    <a href="javascript:void(0)">--%>
<%--                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"--%>
<%--                             fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"--%>
<%--                             stroke-linejoin="round" class="feather feather-align-left" id="sidebar-toggle">--%>
<%--                            <line x1="17" y1="10" x2="3" y2="10"></line>--%>
<%--                            <line x1="21" y1="6" x2="3" y2="6"></line>--%>
<%--                            <line x1="21" y1="14" x2="3" y2="14"></line>--%>
<%--                            <line x1="17" y1="18" x2="3" y2="18"></line>--%>
<%--                        </svg>--%>
<%--                    </a>--%>
<%--                </label>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="nav-right col">--%>
<%--            <ul class="nav-menus">--%>
<%--                <li>--%>
<%--                    <form class="form-inline search-form">--%>
<%--                        <div class="form-group">--%>
<%--                            <input class="form-control-plaintext" type="search" placeholder="Search..">--%>
<%--                            <span class="d-sm-none mobile-search">--%>
<%--                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"--%>
<%--                                             viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"--%>
<%--                                             stroke-linecap="round" stroke-linejoin="round"--%>
<%--                                             class="feather feather-search">--%>
<%--                                            <circle cx="11" cy="11" r="8"></circle>--%>
<%--                                            <line x1="21" y1="21" x2="16.65" y2="16.65"></line>--%>
<%--                                        </svg>--%>
<%--                                    </span>--%>
<%--                        </div>--%>
<%--                    </form>--%>
<%--                </li>--%>
<%--                <li class="onhover-dropdown">--%>
<%--                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"--%>
<%--                         fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"--%>
<%--                         stroke-linejoin="round" class="feather feather-bell">--%>
<%--                        <path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path>--%>
<%--                        <path d="M13.73 21a2 2 0 0 1-3.46 0"></path>--%>
<%--                    </svg>--%>
<%--                    <span class="badge badge-pill badge-primary pull-right notification-badge">3</span>--%>
<%--                    <span class="dot"></span>--%>
<%--                    <ul class="notification-dropdown onhover-show-div p-0">--%>
<%--                        <li>Notification <span class="badge badge-pill badge-primary pull-right">3</span></li>--%>
<%--                        <li>--%>
<%--                            <div class="media">--%>
<%--                                <div class="media-body">--%>
<%--                                    <h6 class="mt-0">--%>
<%--                                                <span>--%>
<%--                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"--%>
<%--                                                         viewBox="0 0 24 24" fill="none" stroke="currentColor"--%>
<%--                                                         stroke-width="2" stroke-linecap="round" stroke-linejoin="round"--%>
<%--                                                         class="feather feather-shopping-bag shopping-color">--%>
<%--                                                        <path d="M6 2L3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z">--%>
<%--                                                        </path>--%>
<%--                                                        <line x1="3" y1="6" x2="21" y2="6"></line>--%>
<%--                                                        <path d="M16 10a4 4 0 0 1-8 0"></path>--%>
<%--                                                    </svg>--%>
<%--                                                </span>Your order ready for Ship..!--%>
<%--                                    </h6>--%>
<%--                                    <p class="mb-0">Lorem ipsum dolor sit amet, consectetuer.</p>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                            <div class="media">--%>
<%--                                <div class="media-body">--%>
<%--                                    <h6 class="mt-0 txt-success">--%>
<%--                                                <span>--%>
<%--                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"--%>
<%--                                                         viewBox="0 0 24 24" fill="none" stroke="currentColor"--%>
<%--                                                         stroke-width="2" stroke-linecap="round" stroke-linejoin="round"--%>
<%--                                                         class="feather feather-download download-color font-success">--%>
<%--                                                        <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path>--%>
<%--                                                        <polyline points="7 10 12 15 17 10"></polyline>--%>
<%--                                                        <line x1="12" y1="15" x2="12" y2="3"></line>--%>
<%--                                                    </svg>--%>
<%--                                                </span>Download Complete--%>
<%--                                    </h6>--%>
<%--                                    <p class="mb-0">Lorem ipsum dolor sit amet, consectetuer.</p>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                            <div class="media">--%>
<%--                                <div class="media-body">--%>
<%--                                    <h6 class="mt-0 txt-danger">--%>
<%--                                                <span>--%>
<%--                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"--%>
<%--                                                         viewBox="0 0 24 24" fill="none" stroke="currentColor"--%>
<%--                                                         stroke-width="2" stroke-linecap="round" stroke-linejoin="round"--%>
<%--                                                         class="feather feather-alert-circle alert-color font-danger">--%>
<%--                                                        <circle cx="12" cy="12" r="10"></circle>--%>
<%--                                                        <line x1="12" y1="8" x2="12" y2="12"></line>--%>
<%--                                                        <line x1="12" y1="16" x2="12.01" y2="16"></line>--%>
<%--                                                    </svg>--%>
<%--                                                </span>250 MB trash files--%>
<%--                                    </h6>--%>
<%--                                    <p class="mb-0">Lorem ipsum dolor sit amet, consectetuer.</p>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                        <li class="txt-dark"><a href="javascript:void(0)">All</a> notification</li>--%>
<%--                    </ul>--%>
<%--                </li>--%>

<%--                <li class="onhover-dropdown">--%>
<%--                    <div class="media align-items-center">--%>
<%--                        <img class="align-self-center pull-right img-50 blur-up lazyloaded"--%>
<%--                             src="assets/images/dashboard/user3.jpg" alt="header-user">--%>
<%--                        <div class="dotted-animation">--%>
<%--                            <span class="animate-circle"></span>--%>
<%--                            <span class="main-circle"></span>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <ul class="profile-dropdown onhover-show-div p-20 profile-dropdown-hover">--%>
<%--                        <li>--%>
<%--                            <a href="javascript:void(0)">--%>
<%--                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"--%>
<%--                                     viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"--%>
<%--                                     stroke-linecap="round" stroke-linejoin="round" class="feather feather-user">--%>
<%--                                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>--%>
<%--                                    <circle cx="12" cy="7" r="4"></circle>--%>
<%--                                </svg>Edit Profile--%>
<%--                            </a>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                            <a href="javascript:void(0)">--%>
<%--                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"--%>
<%--                                     viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"--%>
<%--                                     stroke-linecap="round" stroke-linejoin="round" class="feather feather-mail">--%>
<%--                                    <path--%>
<%--                                            d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z">--%>
<%--                                    </path>--%>
<%--                                    <polyline points="22,6 12,13 2,6"></polyline>--%>
<%--                                </svg>Inbox--%>
<%--                            </a>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                            <a href="javascript:void(0)">--%>
<%--                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"--%>
<%--                                     viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"--%>
<%--                                     stroke-linecap="round" stroke-linejoin="round" class="feather feather-lock">--%>
<%--                                    <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>--%>
<%--                                    <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>--%>
<%--                                </svg>Lock Screen--%>
<%--                            </a>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                            <a href="javascript:void(0)">--%>
<%--                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"--%>
<%--                                     viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"--%>
<%--                                     stroke-linecap="round" stroke-linejoin="round"--%>
<%--                                     class="feather feather-settings">--%>
<%--                                    <circle cx="12" cy="12" r="3"></circle>--%>
<%--                                    <path--%>
<%--                                            d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z">--%>
<%--                                    </path>--%>
<%--                                </svg>Settings--%>
<%--                            </a>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                            <a href="javascript:void(0)">--%>
<%--                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"--%>
<%--                                     viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"--%>
<%--                                     stroke-linecap="round" stroke-linejoin="round"--%>
<%--                                     class="feather feather-log-out">--%>
<%--                                    <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>--%>
<%--                                    <polyline points="16 17 21 12 16 7"></polyline>--%>
<%--                                    <line x1="21" y1="12" x2="9" y2="12"></line>--%>
<%--                                </svg>Logout--%>
<%--                            </a>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--            <div class="d-lg-none mobile-toggle pull-right">--%>
<%--                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"--%>
<%--                     stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"--%>
<%--                     class="feather feather-more-horizontal">--%>
<%--                    <circle cx="12" cy="12" r="1"></circle>--%>
<%--                    <circle cx="19" cy="12" r="1"></circle>--%>
<%--                    <circle cx="5" cy="12" r="1"></circle>--%>
<%--                </svg>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
