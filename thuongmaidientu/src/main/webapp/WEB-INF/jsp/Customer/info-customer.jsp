<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 06/09/2022
  Time: 9:30 CH
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:url value="/resources/assets/" var="ass"></c:url>
<!-- breadcrumb start -->
<div class="breadcrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <div class="page-title">
                    <h2>dashboard</h2>
                </div>
            </div>
            <div class="col-sm-6">
                <nav aria-label="breadcrumb" class="theme-breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">dashboard</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>
<!-- breadcrumb End -->


<!-- dashboard section start -->
<section class="dashboard-section section-b-space user-dashboard-section">
    <div class="" style="padding: 50px">
        <div class="row">
            <c:forEach items="${cusCur}" var="in4">
            <div class="col-lg-3">
                <div class="dashboard-sidebar">
                    <div class="profile-top">
                        <div class="profile-image">
                            <c:if test="${in4.image.startsWith('https') == false}">
                                <img id="img_temp" src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Admin"
                                     class="img-fluid">
                            </c:if>
                            <c:if test="${in4.image.startsWith('https') == true}">
                                <img id="img_temp" class="img-fluid"
                                     src="${in4.image}"
                                     alt="Admin">
                            </c:if>
                        </div>
                        <div class="profile-detail">
                            <h5>${in4.nameC}</h5>
                            <h6>${in4.email}</h6>
                        </div>
                    </div>
                    <div class="faq-tab">
                        <ul class="nav nav-tabs" id="top-tab" role="tablist">
                            <li class="nav-item"><a data-bs-toggle="tab" data-bs-target="#profile"
                                                    class="nav-link active">Profile</a></li>
                            <sec:authorize access="hasRole('ROLE_USER')">
                                <li class="nav-item"><a href="/thuongmaidientu/user/cus-orders-manager"
                                                        class="nav-link">My Orders</a></li>
                            </sec:authorize>
                            <sec:authorize access="hasRole('ROLE_EMPLOYEE')">
                                <c:if test="${accessEmp == false}">
                                    <li class="nav-item"><a
                                            href="/thuongmaidientu/user/cus-orders-manager?idCus=${cusID}"
                                            class="nav-link">My Orders</a></li>
                                </c:if>
                            </sec:authorize>
                            <li class="nav-item"><a data-bs-toggle="tab" data-bs-target="#address"
                                                    class="nav-link">Address Book</a></li>
                            <li class="nav-item"><a data-bs-toggle="tab" data-bs-target="#payment"
                                                    class="nav-link">Saved Cards</a></li>
                            <li class="nav-item"><a href="/thuongmaidientu/logout" class="nav-link">Log Out</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="faq-content tab-content" id="top-tabContent">
                    <div class="tab-pane fade show active" id="profile">
                        <div class="row">
                            <div class="col-12">
                                <div class="card mt-0">
                                    <div class="card-body">
                                        <div class="dashboard-box">
                                            <div class="dashboard-title top-sec">
                                                <h4>profile</h4>
                                                <a href="#" class="btn btn-sm btn-solid">+ add new</a>
                                            </div>
                                            <c:url value="/user/infor-customer/update" var="action"/>
                                            <form:form action="${action}" method="POST" modelAttribute="customers"
                                                       enctype="multipart/form-data"
                                                       class="form-edit-pro was-validated"
                                                       style="margin-top: 10px; font-size: 20px; margin-right: 0px">
                                                <div class="row gutters-sm">
                                                    <div class="col-md-8">
                                                        <div class="card mb-3">
                                                            <div class="card-body">
                                                                <div class="row">
                                                                    <form:input cssStyle="width: 40%; display: none"
                                                                                type="text"
                                                                                class="col-sm-9 text-secondary form-control"
                                                                                path="idCustomer"
                                                                                value="${in4.idCustomer}"/>
                                                                    <div class="col-sm-3">
                                                                        <h6 class="mb-0">Họ và tên</h6>
                                                                    </div>
                                                                    <form:input style="width: 40%;" type="text"
                                                                                class="col-sm-9 text-secondary form-control editCus"
                                                                                path="nameC"
                                                                                value="${in4.nameC}"
                                                                                required="required"/>
                                                                </div>
                                                                <hr>
                                                                <div class="row">
                                                                    <div class="col-sm-3">
                                                                        <h6 class="mb-0">Giới tính</h6>
                                                                    </div>
                                                                    <h6 style="width: 40%;"
                                                                        class="in4Sex">${in4.sex}</h6>
                                                                    <form:select
                                                                            cssStyle="text-align: center;width: 180px;height: 50px;border-color: transparent"
                                                                            path="sex" class="form-selec editCusSex"
                                                                            required="required">
                                                                        <option value="Nam">Nam</option>
                                                                        <option value="Nữ">Nữ</option>
                                                                        <option value="Khác">Khác</option>
                                                                    </form:select>
                                                                </div>
                                                                <hr>
                                                                <div class="row">
                                                                    <div class="col-sm-3">
                                                                        <h6 class="mb-0">CMND</h6>
                                                                    </div>
                                                                    <form:input
                                                                            style="width: 40%; border:none; background-color:transparent"
                                                                            type="text"
                                                                            class="col-sm-9 text-secondary form-control editCus"
                                                                            path="serialNumberC"
                                                                            value="${in4.serialNumberC}"
                                                                            required="required" readonly="true" maxlength="12"/>
                                                                </div>
                                                                <hr>
                                                                <div class="row">
                                                                    <div class="col-sm-3">
                                                                        <h6 class="mb-0">Số điện thoại</h6>
                                                                    </div>
                                                                    <form:input
                                                                            style="width: 40%;border:none; background-color:transparent"
                                                                            type="text"
                                                                            class="col-sm-9 text-secondary form-control editCus"
                                                                            path="phoneNumber"
                                                                            value="${in4.phoneNumber}"
                                                                            required="required" maxlength="10"/>
                                                                </div>
                                                                <hr>
                                                                <div class="row">
                                                                    <div class="col-sm-3">
                                                                        <h6 class="mb-0">Email</h6>
                                                                    </div>
                                                                    <form:input
                                                                            style="width: 40%;border:none; background-color:transparent"
                                                                            type="email"
                                                                            class="col-sm-9 text-secondary form-control editCus"
                                                                            path="email"
                                                                            value="${in4.email}"
                                                                            required="required"/>
                                                                </div>
                                                                <hr>
                                                                <div class="row">
                                                                    <div class="col-sm-3">
                                                                        <h6 class="mb-0">Địa chỉ</h6>
                                                                    </div>
                                                                    <form:input
                                                                            style="width: 100%;border:none; background-color:transparent"
                                                                            type="text"
                                                                            class="col-sm-9 text-secondary form-control editCus address"
                                                                            path="address"
                                                                            value="${in4.address}" required="required"/>
                                                                    <div class="select-address" style="display: none">
                                                                        <select onchange="listProvinceOnchange()"
                                                                                class="province"
                                                                                name="ls_province"></select>
                                                                        <select onchange="listDistrictOnchange()"
                                                                                class="district"
                                                                                name="ls_district"></select>
                                                                        <select onchange="listWardOnchange()"
                                                                                class="ward" name="ls_ward"></select>
                                                                    </div>
                                                                </div>
                                                                <div>
                                                                    <div class="col-sm-3 editCusImg"
                                                                         style="display: none">
                                                                        <h6 class="mb-0">Chọn ảnh</h6>
                                                                    </div>
                                                                    <form:input id="file" path="file" type="file"
                                                                                cssClass="form-control editCusImg"
                                                                                cssStyle="display: none"
                                                                                required="required"/>
                                                                </div>
                                                                <div>
                                                                        <%--  EDIT BUTTON  --%>
                                                                    <i onclick="editCusClick()"
                                                                       style="float: right;margin-left: 30px;font-size: 20px"
                                                                       class="btn fa-solid fa-pen-to-square"></i>
                                                                        <%--  /EDOT BUTTON  --%>
                                                                        <%--  SAVE BUTTON  --%>
                                                                    <button type="submit"
                                                                            style="color: red;margin-left: 30px;font-size: 20px;display: none"
                                                                            class="btn fa-solid fa-pen-to-square edit save">
                                                                        save
                                                                    </button>
                                                                        <%--  SAVE BUTTON  --%>
                                                                        <%--  CANCLE BUTTON  --%>
                                                                    <button type="button" onclick="cancleCusEdit()"
                                                                            style="color: red;margin-left: 30px;font-size: 20px; display: none"
                                                                            class="btn fa-solid fa-xmark edit cancle">
                                                                        Huỷ
                                                                    </button>
                                                                        <%--  CANCLE BUTTON  --%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form:form>
                                            <div class="dashboard-title mt-lg-5 mt-3 top-sec">
                                                <h4>login details</h4>
                                                <a href="#" class="btn btn-sm btn-solid">+ add new</a>
                                            </div>
                                            <div class="dashboard-detail">
                                                <ul>
                                                    <div style="width: 100%">
                                                        <h3 type="button" onclick="clickChangePass()">* Đổi mật
                                                            khẩu</h3>
                                                        <c:if test="${errMsgPass != null}">
                                                            <div>
                                                                <h3 style="color: red">${errMsgPass}</h3>
                                                            </div>
                                                        </c:if>
                                                        <c:url value="/user/infor-customer/update-account" var="upPas"/>
                                                        <form:form action="${upPas}" method="POST"
                                                                   modelAttribute="account"
                                                                   enctype="multipart/form-data"
                                                                   cssClass="editPass" style="display:none">
                                                            <div style="width: 450px;padding: 10px;border-style: dashed">
                                                                <form:input path="idAccount"
                                                                            style="width: 200px;height: 25px"
                                                                            type="text" cssStyle="display: none"
                                                                            value="${idAcc}"/>
                                                                <div style="display: flex">
                                                                    <h6 class="mb-0" style="width: 200px">Nhập mật khẩu
                                                                        mới:</h6>
                                                                    <form:input path="passwordC"
                                                                                style="width: 200px;height: 25px"
                                                                                type="password"
                                                                                class="col-sm-9 text-secondary form-control"/>
                                                                </div>
                                                                <div style="display: flex; margin-top: 10px">
                                                                    <h6 class="mb-0" style="width: 200px">Xác nhận mật
                                                                        khẩu mới:</h6>
                                                                    <form:input path="confirmPassword"
                                                                                style="width: 200px;height: 25px"
                                                                                type="password"
                                                                                class="col-sm-9 text-secondary form-control"/>
                                                                </div>
                                                                <button type="submit"
                                                                        style="color: red;margin-left: 30px;font-size: 20px;"
                                                                        class="btn fa-solid fa-pen-to-square saveP">save
                                                                </button>
                                                            </div>
                                                        </form:form>
                                                    </div>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="address">
                        <div class="row">
                            <div class="col-12">
                                <div class="card mt-0">
                                    <div class="card-body">
                                        <div class="top-sec">
                                            <h3>Address Book</h3>
                                            <a href="#" class="btn btn-sm btn-solid">+ add new</a>
                                        </div>
                                        <div class="address-book-section">
                                            <div class="row g-4">
                                                <div class="select-box active col-xl-4 col-md-6">
                                                    <div class="address-box">
                                                        <div class="top">
                                                            <h6>HUNG VO <span>home</span></h6>
                                                        </div>
                                                        <div class="middle">
                                                            <div class="address">
                                                                <p>52 TRAN VAN DU/p>
                                                                <p>HO CHI MINH CITY</p>
                                                                <p>70000</p>
                                                            </div>
                                                            <div class="number">
                                                                <p>mobile: <span>+123 - 456 - 7890</span></p>
                                                            </div>
                                                        </div>
                                                        <div class="bottom">
                                                            <a href="javascript:void(0)"
                                                               data-bs-target="#edit-address"
                                                               data-bs-toggle="modal" class="bottom_btn">edit</a>
                                                            <a href="#" class="bottom_btn">remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="select-box col-xl-4 col-md-6">
                                                    <div class="address-box">
                                                        <div class="top">
                                                            <h6>HUNG VO <span>OFFICE</span></h6>
                                                        </div>
                                                        <div class="middle">
                                                            <div class="address">
                                                                <p>52 TRAN VAN DU/p>
                                                                <p>HO CHI MINH CITY</p>
                                                                <p>70000</p>
                                                            </div>
                                                            <div class="number">
                                                                <p>mobile: <span>+123 - 456 - 7890</span></p>
                                                            </div>
                                                        </div>
                                                        <div class="bottom">
                                                            <a href="javascript:void(0)"
                                                               data-bs-target="#edit-address"
                                                               data-bs-toggle="modal" class="bottom_btn">edit</a>
                                                            <a href="#" class="bottom_btn">remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="payment">
                        <div class="row">
                            <div class="col-12">
                                <div class="card mt-0">
                                    <div class="card-body">
                                        <div class="top-sec">
                                            <h3>Saved Cards</h3>
                                            <a href="#" class="btn btn-sm btn-solid">+ add new</a>
                                        </div>
                                        <div class="address-book-section">
                                            <div class="row g-4">
                                                <div class="select-box active col-xl-4 col-md-6">
                                                    <div class="address-box">
                                                        <div class="bank-logo">
                                                            <img src="${ass}images/bank-logo.png"
                                                                 class="bank-logo">
                                                            <img src="${ass}images/visa.png"
                                                                 class="network-logo">
                                                        </div>
                                                        <div class="card-number">
                                                            <h6>Card Number</h6>
                                                            <h5>6262 6126 2112 1515</h5>
                                                        </div>
                                                        <div class="name-validity">
                                                            <div class="left">
                                                                <h6>name on card</h6>
                                                                <h5>HUNG</h5>
                                                            </div>
                                                            <div class="right">
                                                                <h6>validity</h6>
                                                                <h5>XX/XX</h5>
                                                            </div>
                                                        </div>
                                                        <div class="bottom">
                                                            <a href="javascript:void(0)"
                                                               data-bs-target="#edit-address"
                                                               data-bs-toggle="modal" class="bottom_btn">edit</a>
                                                            <a href="#" class="bottom_btn">remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="select-box col-xl-4 col-md-6">
                                                    <div class="address-box">
                                                        <div class="bank-logo">
                                                            <img src="${ass}images/bank-logo1.png"
                                                                 class="bank-logo">
                                                            <img src="${ass}images/visa.png"
                                                                 class="network-logo">
                                                        </div>
                                                        <div class="card-number">
                                                            <h6>Card Number</h6>
                                                            <h5>6262 6126 2112 1515</h5>
                                                        </div>
                                                        <div class="name-validity">
                                                            <div class="left">
                                                                <h6>name on card</h6>
                                                                <h5>HUNG</h5>
                                                            </div>
                                                            <div class="right">
                                                                <h6>validity</h6>
                                                                <h5>XX/XX</h5>
                                                            </div>
                                                        </div>
                                                        <div class="bottom">
                                                            <a href="javascript:void(0)"
                                                               data-bs-target="#edit-address"
                                                               data-bs-toggle="modal" class="bottom_btn">edit</a>
                                                            <a href="#" class="bottom_btn">remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </c:forEach>
    </div>
</section>
<!-- dashboard section end -->


<!-- Modal start -->
<div class="modal logout-modal fade" id="logout" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Logging Out</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Do you want to log out?
            </div>
            <div class="modal-footer">
                <a href="#" class="btn btn-dark btn-custom" data-bs-dismiss="modal">no</a>
                <a href="/thuongmaidientu/logout" class="btn btn-solid btn-custom">yes</a>
            </div>
        </div>
    </div>
</div>
<!-- modal end -->


<c:url value="/js/" var="index"></c:url>
<script src="${index}vietnamlocalselector.js"></script>
<script src="${index}vietnamlocalselector.nonoop.js"></script>
<script>
    var localpicker = new LocalPicker({
        province: "ls_province",
        district: "ls_district",
        ward: "ls_ward"
    });

    var options = {
        /*
          HTML Selector. You can pass value of name, id or class.
          It will automatically detect exist elements for you.
          Example: 'myIdOrClass','#myId', '.myClass', 'myName'
          */
        province: 'ls_province',
        district: 'ls_district',
        ward: 'ls_ward',

        /*
        Define value for option tag. Valid option: id|name
        */
        getValueBy: 'id',

        //Placeholder text
        provinceText: 'Chọn tỉnh / thành phố',
        districtText: 'Chọn quận / huyện',
        districtNoText: 'Địa phương này không có quận / huyện',
        wardText: 'Chọn phường / xã',
        wardNoText: 'Địa phương này không có phường / xã',

        // Default value if no location exist
        emptyValue: " ",

        // Hide option where no local exist
        hideEmptyValueOption: true,

        // Hide place-holder option (first option)
        hidePlaceHolderOption: true,

        /*
        Include local level on option text as prefix
        Example: true = Quận Bình Thạnh | false = Bình Thạnh
        */
        provincePrefix: false,
        districtPrefix: true,
        wardPrefix: true,

        /*
        Include local level in option tag's attribute
        */
        levelAsAttribute: true,
        levelAttributeName: "data-level",
    };
</script>
<script>
    let imgInp = document.getElementById("file");
    let img_Temp = document.getElementById("img_temp");
    imgInp.onchange = evt => {
        const [file] = imgInp.files
        if (file) {
            img_Temp.src = URL.createObjectURL(file)
        }
    }


    var inputCan = document.getElementsByClassName("editCus");
    var editNone = document.getElementsByClassName("editCusImg");
    var btnE = document.getElementsByClassName("edit");
    var fSelect = document.getElementsByClassName("editCusSex");
    var in4S = document.getElementsByClassName("in4Sex");
    var fEditPass = document.getElementsByClassName("editPass")
    var fSelect_Address = document.getElementsByClassName("select-address");
    var address_full = document.getElementsByClassName("address")[0];

    var clickChangeP = 0;
    window.onload = function () {
        for (var i = 0; i < inputCan.length; i++) {
            var inp = inputCan[i];
            inp.setAttribute("readonly", true);
            inp.style.backgroundColor = "transparent";
            inp.style.borderColor = "transparent";

            fSelect[0].setAttribute("disabled", true);
            fSelect[0].style.display = "none";
            // fEditPass[0].style.display = "none";
            fSelect_Address[0].style.display = "none";
        }
    }

    function editCusClick() {
        for (var i = 0; i < inputCan.length; i++) {
            var inp = inputCan[i];
            inp.removeAttribute("readonly");
        }

        editNone[0].style.display = "block";
        editNone[1].style.display = "block";
        fSelect[0].removeAttribute("disabled");
        fSelect[0].style.display = "block";
        in4S[0].style.display = "none";
        for (var i = 0; i < btnE.length; i++) {
            var ed = btnE[i];
            ed.style.display = "block";
        }
        fSelect_Address[0].style.display = "block";
        address_full.style.display = "block";
    }

    function cancleCusEdit() {
        for (var i = 0; i < inputCan.length; i++) {
            var inp = inputCan[i];
            inp.setAttribute("readonly", true);
        }

        editNone[0].style.display = "none";
        editNone[1].style.display = "none";
        fSelect[0].setAttribute("disabled", true);
        fSelect[0].style.display = "none";
        in4S[0].style.display = "block";
        for (var i = 0; i < btnE.length; i++) {
            var ed = btnE[i];
            ed.style.display = "none";
        }
        fSelect_Address[0].style.display = "none";
        address_full.style.display = "block";
    }

    function clickChangePass() {
        if (clickChangeP == 0) {
            clickChangeP = 1;
            fEditPass[0].style.display = "block";
        } else {
            clickChangeP = 0;
            fEditPass[0].style.display = "none";
        }
    }

    function listProvinceOnchange() {
        var numberHome = "";
        var lstProvince = document.getElementsByClassName("province")[0].selectedIndex
        var strProv = document.getElementsByClassName("province")[0].options[lstProvince].innerText
        var addr = numberHome + address_full.value.toString().slice(numberHome.length, address_full.value.indexOf(",")) + ", " + strProv
        document.getElementsByClassName("address")[0].value = addr;
    }

    function listDistrictOnchange() {
        var numberHome = "";

        var lstProvince = document.getElementsByClassName("province")[0].selectedIndex
        var strProv = document.getElementsByClassName("province")[0].options[lstProvince].innerText

        var lstDistrict = document.getElementsByClassName("district")[0].selectedIndex
        var strDistrict = document.getElementsByClassName("district")[0].options[lstDistrict].innerText

        var addr = numberHome + address_full.value.toString().slice(numberHome.length, address_full.value.indexOf(",")) + ", " + strDistrict + ", " + strProv
        document.getElementsByClassName("address")[0].value = addr;
    }

    function listWardOnchange() {
        var numberHome = "";


        var lstProvince = document.getElementsByClassName("province")[0].selectedIndex
        var strProv = document.getElementsByClassName("province")[0].options[lstProvince].innerText

        var lstDistrict = document.getElementsByClassName("district")[0].selectedIndex
        var strDistrict = document.getElementsByClassName("district")[0].options[lstDistrict].innerText

        var lstWard = document.getElementsByClassName("ward")[0].selectedIndex
        var strWard = document.getElementsByClassName("ward")[0].options[lstWard].innerText

        var addr = numberHome + address_full.value.toString().slice(numberHome.length, address_full.value.indexOf(",")) + ", " + strWard + ", " + strDistrict + ", " + strProv
        document.getElementsByClassName("address")[0].value = addr;
    }

</script>
<!-- Style for profile customer -->
<style>
    body {
        margin-top: 20px;
        color: #1a202c;
        text-align: left;
        background-color: #e2e8f0;
    }

    .main-body {
        padding: 15px;
    }

    .card {
        box-shadow: 0 1px 3px 0 rgba(0, 0, 0, .1), 0 1px 2px 0 rgba(0, 0, 0, .06);
    }

    .card {
        position: relative;
        display: flex;
        flex-direction: column;
        min-width: 0;
        word-wrap: break-word;
        background-color: #fff;
        background-clip: border-box;
        border: 0 solid rgba(0, 0, 0, .125);
        border-radius: .25rem;
    }

    .card-body {
        flex: 1 1 auto;
        min-height: 1px;
        padding: 1rem;
    }

    .gutters-sm {
        margin-right: -8px;
        margin-left: -8px;
    }

    .gutters-sm > .col, .gutters-sm > [class*=col-] {
        padding-right: 8px;
        padding-left: 8px;
    }

    .mb-3, .my-3 {
        margin-bottom: 1rem !important;
    }

    .bg-gray-300 {
        background-color: #e2e8f0;
    }

    .h-100 {
        height: 100% !important;
    }

    .shadow-none {
        box-shadow: none !important;
    }
</style>