<%-- 
    Document   : login
    Created on : Aug 4, 2022, 3:34:56 PM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<c:url value="/register" var="register"/>
<c:url value="/login" var="url"/>
<div class="container">
    <div class="contentLogin">
        <div>
            <img class="advertiseLogin"
                 src="https://res.cloudinary.com/dxxwcby8l/image/upload/v1647248722/r8sjly3st7estapvj19u.jpg">
        </div>
        <form name='login-form' class="form_dk" action="${url}" method="post">
            <div class="container-log">
                <h1 style="text-align: center"> - Đăng nhập -</h1>
                <label><b>Username</b></label>
                <input type="text" placeholder="Enter Username" name="username" required>

                <label><b>Password</b></label>
                <input type="password" placeholder="Enter Password" name="password" required>

                <button class="buttonSubmitLogin" type="submit">Login</button>
                <label>
                    <input type="checkbox" checked="checked" name="remember"> Remember me
                </label>
            </div>
            <div class="container-cancle" style="background-color:#f1f1f1">
                <button type="button" class="cancelbtn">Cancel</button>
                <span class="psw">Forgot <a href="#">password?</a></span>
            </div>
            <div class="container-cancle" style="background-color:#f1f1f1">
                <span class="psw">Register Noww!! <a href="${register}">Here</a></span>
            </div>
        </form>
    </div>
</div>

<style>
    .contentLogin {
        display: flex;
    }

    .advertiseLogin {
        border-radius: 2%;
        border-color: red;
        width: 100%;
    }

    .form_dk {
        margin: 10px 10px 10px 10px;
        border: 3px solid #f1f1f1;
        width: 40%;
        height: auto;
        padding-top: 16px;
    }
    /* Full-width inputs */
    input[type=text], input[type=password] {
        width: 100%;
        padding: 12px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        box-sizing: border-box;
    }

    /* Set a style for all buttons */
    buttonSubmitLogin {
        background-color: #04AA6D;
        color: white;
        padding: 14px 20px;
        margin: 8px 8px;
        border: none;
        cursor: pointer;
        width: 50%;
    }

    /* Add a hover effect for buttons */
    button:hover {
        opacity: 0.8;
    }

    /* Extra style for the cancel button (red) */
    .cancelbtn {
        padding: 10px 18px;
        background-color: #f44336;
        margin-left: 20%;
    }

    span.psw {
        float: right;
        padding-top: 16px;
        margin-right: 10%;
    }

</style>