<%-- 
    Document   : login
    Created on : Aug 4, 2022, 3:34:56 PM
    Author     : ADMIN
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<c:url value="/login" var="url"/>
<section class="h-100">
    <div class="container h-100">
        <div class="row justify-content-sm-center h-100">
            <div class="col-xxl-4 col-xl-5 col-lg-5 col-md-7 col-sm-9">
                <div class="text-center my-4">
                    <span class="h1 text-uppercase text-primary bg-dark px-2">ĐĂNG NHẬP</span>
                </div>
                <div class="card shadow-lg" style="margin-top: 50px">
                    <div class="card-body p-5">
                        <form action="${url}" method="post">
                            <!-- Email input -->
                            <div class="form-outline mb-4">
                                <input type="text" class="form-control" placeholder=" Username" name="username" required/>
                            </div>

                            <!-- Password input -->
                            <div class="form-outline mb-4">
                                <input type="password" class="form-control" placeholder=" Mật khẩu" name="password" required/>
                            </div>

                            <!-- 2 column grid layout for inline styling -->
                            <div class="row mb-4">
                                <div class="col d-flex justify-content-center">
                                    <!-- Checkbox -->
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="form2Example34" checked />
                                        <label class="form-check-label" for="form2Example34">Lưu đăng nhập</label>
                                    </div>
                                </div>

                                <div class="col"">
                                    <!-- Simple link -->
                                    <a href="#!" style="margin-left: 35px">Quên mật khẩu?</a>
                                </div>
                            </div>

                            <!-- Submit button -->
                            <button type="submit" class="btn btn-primary btn-block mb-4">Đăng Nhập</button>

                            <!-- Register buttons -->
                            <div class="text-center">
                                <p>Không có tài khoản? <a href="#!">Đăng ký!</a></p>
                                <p>hoặc đăng nhập với:</p>
                                <button type="button" class="btn btn-primary btn-floating mx-1" style="margin-top: 15px">
                                    <i class="fab fa-facebook-f"></i>
                                </button>

                                <button type="button" class="btn btn-primary btn-floating mx-1" style="margin-top: 15px">
                                    <i class="fab fa-google"></i>
                                </button>

                                <button type="button" class="btn btn-primary btn-floating mx-1" style="margin-top: 15px">
                                    <i class="fab fa-twitter"></i>
                                </button>

                                <button type="button" class="btn btn-primary btn-floating mx-1" style="margin-top: 15px">
                                    <i class="fab fa-github"></i>
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>