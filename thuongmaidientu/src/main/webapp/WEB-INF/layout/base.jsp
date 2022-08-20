<%-- 
    Document   : base
    Created on : Jul 24, 2022, 1:05:52 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>
            <tiles:insertAttribute name="title" />
        </title>
        <script src="https://kit.fontawesome.com/6f26e389c8.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </head>
    <body>
        <tiles:insertAttribute name="header" />
        <div class="container">
        <tiles:insertAttribute name="content" />
        </div class="container">
        <tiles:insertAttribute name="footer" />
    </body>
</html>
<style>
    /*  ------------------ HEADER ---------------------------  */
    .header{
        overflow: hidden;
        background-color: #333;
        position: absolute;
        top: 0;
        width: 100%;
        padding: 16px;
    }

    .navTask {
        margin-right: 2%;
    }
    /* Dropdown Button */
    .dropbtn {
        background-color: #04AA6D;
        color: white;
        padding: 10px;
        font-size: 16px;
        border: none;
        border-radius: 20px 20px;
    }

    /* The container <div> - needed to position the dropdown content */
    .dropdown {
        position: relative;
        display: inline-block;
    }

    /* Dropdown Content (Hidden by Default) */
    .dropdown-content {
        display: none;
        position: fixed;
        background-color: #f1f1f1;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
        z-index: 1;
    }

    /* Links inside the dropdown */
    .dropdown-content a {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: flex;
    }

    /* Change color of dropdown links on hover */
    .dropdown-content a:hover {
        background-color: #ddd;
    }

    /* Show the dropdown menu on hover */
    .dropdown:hover .dropdown-content {
        display: block;
    }

    /* Change the background color of the dropdown button when the dropdown content is shown */
    .dropdown:hover .dropbtn {
        background-color: #3e8e41;
    }

    /*  ------------------ INDEX ---------------------------  */
    .row {
        padding-top: 10px;
    }
    .container {
        padding: 16px;
        margin-top: 30px;
    }

    <%--  BOX  --%>
    .speech-bubble {
        width: 150px;
        /*height: 80px;*/
        position: absolute;
        background: #2997e8;
        border-radius: 10px;
        text-align: center;
        color: white;
    }

    .speech-bubble::before {
        width: 0;
        height: 0;
        margin: 13px 0 0 -25px;
        position: absolute;
        content: "";
        border-top: 13px solid transparent;
        border-bottom: 13px solid transparent;
        border-right: 26px solid #2997e8;
    }

    .dropbtn-right-side {
        background-color: #04AA6D;
        color: white;
        padding: 10px;
        font-size: 16px;
        border: none;
        border-radius: 20px 20px;
    }

    /* The container <div> - needed to position the dropdown content */
    .dropdown-right {
        position: relative;
        display: flex;
    }

    /* Dropdown Content (Hidden by Default) */
    .dropdown-content-right {
        margin-left: 115%;
        display: none;
        position: absolute;
        background-color: #f1f1f1;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
        z-index: 1;
    }

    /* Links inside the dropdown */
    .dropdown-content-right a {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }

    /* Change color of dropdown links on hover */
    .dropdown-content-right a:hover {
        background-color: #ddd;
    }

    /* Show the dropdown menu on hover */
    .dropdown-right:hover .dropdown-content-right {
        display: block;
    }

    /* Change the background color of the dropdown button when the dropdown content is shown */
    .dropdown-right:hover .dropbtn-right-side {
        background-color: #3e8e41;
    }

    /*  ------------------ĐỘNG NGANG------------------ */
    .sidenav {
        height: 70%;
        width: 10%;
        position: fixed;
        z-index: 0;
        top: 120px;
        left: 0px;
        right: 50px;
        background-color: #ff0000;
        overflow-x: hidden;
        padding-top: 0px;
        transition: 0.5s;
        margin-bottom: 20%;
    }

    /* ON HOVER */
    .sidenav:hover {
        width: 250px;
    }

    .sidenav normalb:hover {
        background-color: #4F0909;
    }

    .buttonGroup {
        align-content: baseline;
    }

    /* Darker background on mouse-over */
    .btn:hover {
        background-color: #4F0909;
    }

    .sidenav h1 {
        background-color: #850101; /* Blue background */
        border: thin; /* Remove borders */
        color: white; /* White text */
        font-size: 16px; /* Set a font size */
        cursor: pointer; /* Mouse pointer on hover */
        overflow: hidden;
    }

    .sidenav h1:hover {
        background-color: #4F0909;
    }

    /* The navigation menu links */
    .sidenav a {
        padding-left: 10px;
        text-decoration: none;
        font-size: 18px;
        color: #f1f1f1;
        display: block;
        transition: 0.3s
    }

    .sidenav a:hover, .offcanvas a:focus {
        color: #f1f1f1;
    }
</style>