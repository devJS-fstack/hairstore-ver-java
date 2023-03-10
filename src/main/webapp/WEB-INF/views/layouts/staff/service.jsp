<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/client/css/mainstaff.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/client/css/service-dashboard.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/client/font/css/all.min.css">

</head>
<script src="https://kit.fontawesome.com/dc57e24782.js" crossorigin="anonymous"></script>

<body>
    <div class="wrapper">
        <div class="left-side">
            <a href="dashboard-manager?idStore=${idStore}">
                <svg id="home" viewBox="0 0 512 512" fill="currentColor" xmlns="http://www.w3.org/2000/svg"
                    class="active">
                    <path
                        d="M197.3 170.7h-160A37.4 37.4 0 010 133.3v-96A37.4 37.4 0 0137.3 0h160a37.4 37.4 0 0137.4 37.3v96a37.4 37.4 0 01-37.4 37.4zM37.3 32c-3 0-5.3 2.4-5.3 5.3v96c0 3 2.4 5.4 5.3 5.4h160c3 0 5.4-2.4 5.4-5.4v-96c0-3-2.4-5.3-5.4-5.3zm0 0M197.3 512h-160A37.4 37.4 0 010 474.7v-224a37.4 37.4 0 0137.3-37.4h160a37.4 37.4 0 0137.4 37.4v224a37.4 37.4 0 01-37.4 37.3zm-160-266.7c-3 0-5.3 2.4-5.3 5.4v224c0 3 2.4 5.3 5.3 5.3h160c3 0 5.4-2.4 5.4-5.3v-224c0-3-2.4-5.4-5.4-5.4zm0 0M474.7 512h-160a37.4 37.4 0 01-37.4-37.3v-96a37.4 37.4 0 0137.4-37.4h160a37.4 37.4 0 0137.3 37.4v96a37.4 37.4 0 01-37.3 37.3zm-160-138.7c-3 0-5.4 2.4-5.4 5.4v96c0 3 2.4 5.3 5.4 5.3h160c3 0 5.3-2.4 5.3-5.3v-96c0-3-2.4-5.4-5.3-5.4zm0 0M474.7 298.7h-160a37.4 37.4 0 01-37.4-37.4v-224A37.4 37.4 0 01314.7 0h160A37.4 37.4 0 01512 37.3v224a37.4 37.4 0 01-37.3 37.4zM314.7 32c-3 0-5.4 2.4-5.4 5.3v224c0 3 2.4 5.4 5.4 5.4h160c3 0 5.3-2.4 5.3-5.4v-224c0-3-2.4-5.3-5.3-5.3zm0 0" />
                </svg>
            </a>
            <span>Điều Khiển</span>
            <a href="service?idStore=${idStore}">
                <svg id=" service" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5"
                    stroke-linecap="round" stroke-linejoin="round">
                    <path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5" />
                </svg>
            </a>
            <span>Dịch Vụ</span>
            <a href="employee?idStore=${idStore}">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"
                    v-bind:svg-inline="''" v-bind:role="'presentation'" v-bind:focusable="'false'"
                    v-bind:tabindex="'-1'">
                    <path class="customize-fill" fill-rule="evenodd" clip-rule="evenodd"
                        d="M3.401 6.022A3.312 3.312 0 006.71 9.331a3.312 3.312 0 003.31-3.309 3.312 3.312 0 00-3.31-3.308A3.311 3.311 0 003.4 6.022zm3.305-1.441c-.794 0-1.44.647-1.44 1.441s.646 1.441 1.44 1.441c.794 0 1.442-.647 1.442-1.44 0-.795-.648-1.442-1.442-1.442zM23.04 18.507a.96.96 0 010 1.922H.96a.962.962 0 010-1.922H17.86l3.177-7.264a.252.252 0 00-.017-.247.245.245 0 00-.21-.116h-8.337c-.101 0-.191.058-.231.149l-2.735 6.135-.135.088H5.883a.961.961 0 110-1.921H8.22l.876-1.968a3.731 3.731 0 00-2.509-.988c-2.079 0-3.772 1.713-3.772 3.816a.93.93 0 01-.925.934.93.93 0 01-.926-.934c0-3.134 2.522-5.683 5.623-5.683 1.18 0 2.319.378 3.293 1.094l.605-1.354a2.175 2.175 0 011.988-1.29h8.336c.738 0 1.42.37 1.824.99.403.622.463 1.396.161 2.07l-2.835 6.49h3.082z"
                        fill="#005AEE"></path>
                </svg>
            </a>
            <span>Nhân Viên</span>
            <a href="booking?idStore=${idStore}">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"
                    v-bind:svg-inline="''" v-bind:role="'presentation'" v-bind:focusable="'false'"
                    v-bind:tabindex="'-1'">
                    <path class="customize-fill"
                        d="M17.6 4.32h-.933v-.96c0-.576-.374-.96-.934-.96s-.933.384-.933.96v.96H9.2v-.96c0-.576-.373-.96-.933-.96s-.934.384-.934.96v.96H6.4c-1.587 0-2.8 1.248-2.8 2.88v11.52c0 1.632 1.213 2.88 2.8 2.88h11.2c1.587 0 2.8-1.248 2.8-2.88V7.2c0-1.632-1.213-2.88-2.8-2.88zm.933 5.184V18.72c0 .576-.373.96-.933.96H6.4c-.56 0-.933-.384-.933-.96V7.2c0-.576.373-.96.933-.96h.933v.96c0 .576.374.96.934.96s.933-.384.933-.96v-.96h5.6v.96c0 .576.373.96.933.96s.934-.384.934-.96v-.96h.933c.56 0 .933.384.933.96v2.304z"
                        fill="#005AEE"></path>
                </svg>
            </a>
            <span>Lịch Hẹn</span>
            <a href="customer?idStore=${idStore}">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"
                    v-bind:svg-inline="''" v-bind:role="'presentation'" v-bind:focusable="'false'"
                    v-bind:tabindex="'-1'">
                    <path class="customize-fill"
                        d="M9.002 11a4 4 0 100-8 4 4 0 000 8zm0-6a2 2 0 110 4 2 2 0 010-4zM17.002 13a3 3 0 100-6 3 3 0 000 6zm0-4a1 1 0 110 2 1 1 0 010-2zM17.002 14a5 5 0 00-3.06 1.05A7 7 0 002.002 20a1 1 0 102 0 5 5 0 1110 0 1 1 0 102 0 6.9 6.9 0 00-.86-3.35 3 3 0 014.86 2.35 1 1 0 102 0 5 5 0 00-5-5z"
                        fill="#005AEE"></path>
                </svg>
            </a>
            <span>Khách Hàng</span>
            <a href="shift?idStore=${idStore}">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                    class="bi bi-calendar-check" viewBox="0 0 16 16">
                    <path
                        d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z" />
                    <path
                        d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z" />
                </svg>
            </a>
            <span>Lịch Làm Việc</span>
            <a href="" id="log-out">
                <svg viewBox="0 0 512 512" fill="currentColor">
                    <path
                        d="M255.2 468.6H63.8a21.3 21.3 0 01-21.3-21.2V64.6c0-11.7 9.6-21.2 21.3-21.2h191.4a21.2 21.2 0 100-42.5H63.8A63.9 63.9 0 000 64.6v382.8A63.9 63.9 0 0063.8 511H255a21.2 21.2 0 100-42.5z" />
                    <path
                        d="M505.7 240.9L376.4 113.3a21.3 21.3 0 10-29.9 30.3l92.4 91.1H191.4a21.2 21.2 0 100 42.6h247.5l-92.4 91.1a21.3 21.3 0 1029.9 30.3l129.3-127.6a21.3 21.3 0 000-30.2z" />
                </svg>
            </a>
            <span>Đăng Xuất</span>
        </div>
        <div class="main-container" style="display: block">
            <div class="user-box third-box service-box">
                <div class="adm-services">
                    <div class="adm-page-header">
                        <div class="adm-page-header__content">
                            <div class="adm-page-header__title">
                                <span class="adm-header__label">Dịch Vụ</span>
                            </div>
                            <div class="align-right">
                                <button data-toggle="modal" data-target="#add-service_modal"
                                    class="adm-button adm-button-service">
                                    <span class="adm-button__icon-wrapper">
                                        <i class="fa-solid fa-plus"></i>
                                    </span>
                                    <span>Thêm Dịch Vụ</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="page-content">
                <div class="service-and-category">
                    <div class="adm-sidebar-menu-wrapper">
                        <div class="adm-slidebar-menu-wrapper__content">
                            <div class="services-categories">
                                <div>
                                    <h5>Danh Mục <span>(${totalCategory})</span> </h5>
                                </div>
                                <div class="categories-list mb-3">
                                    <div class="category all-categories active">
                                        <div class="category-name">
                                            <div>Tất Cả Dịch Vụ</div>
                                            <span class="num-services">${totalService} Dịch Vụ</span>
                                        </div>
                                    </div>
                                    <div>
                                    <c:forEach items="${categories}" var="category">
                                        <div data-type="${category.idTypeService}" class="category">
                                            <div class="category-name overflow-ellipsis">
                                                <div class="name-type-service" style="text-transform: capitalize;">
                                                    ${category.nameType}</div>
                                                <span class="num-services"
                                                    data-type="${category.idTypeService}">${category.amount} Dịch Vụ</span>
                                            </div>
                                            <div class="adm-actions__drop-down">
                                                <div class="el-dropdown">
                                                    <button aria-haspopup="true" aria-expanded="false"
                                                        data-toggle="dropdown" class="adm-btn" id="dropdownMenuButton">
                                                        <span class="adm-btn__icon">
                                                            <i class="fa-solid fa-ellipsis"></i>
                                                        </span>
                                                    </button>
                                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                        <li data-type="${category.idTypeService}"
                                                            class="edit-category dropdown-item el-dropdown-menu"
                                                            data-target="#edit-category_modal" data-toggle="modal">
                                                            <div class="adm-dropdown-item__wrapper is-with-icon">
                                                                <div class="adm-dropdown-item__icon">
                                                                    <i class="fa-solid fa-pencil"></i>
                                                                </div>
                                                                <div class="adm-dropdown-item__label">
                                                                    Chỉnh sửa
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li data-type="${category.idTypeService}"
                                                            class="delete-category dropdown-item el-dropdown-menu">
                                                            <div class="adm-dropdown-item__wrapper is-red is-with-icon">
                                                                <div class="adm-dropdown-item__icon">
                                                                    <i class="fa-solid fa-trash-can"></i>
                                                                </div>
                                                                <div class="adm-dropdown-item__label">
                                                                    Xóa
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    </div>
                                </div>
                                <button data-toggle="modal" data-target="#add-category_modal"
                                    class="adm-button adm-button-category adm-button__filled__grey" style="width:100%">
                                    <span class="adm-button__icon-wrapper">
                                        <i class="fa-solid fa-plus"></i>
                                    </span>
                                    <span>Thêm Danh Mục</span>
                            </div>
                        </div>
                    </div>
                    <div class="services-list">
                        <div>
                            <div class="services-list-header">
                                <h5>Tất Cả Dịch Vụ <span>(${totalService})</span></h5>
                            </div>
                            <div class="services-list-content">
                                <div class="service-list">
                                    <div class="head-row">
                                        <div class="el-row" style="margin-left: -8px; margin-right: -8px; height:32px">
                                            <div class="el-col el-col-24 el-col-sm-10"
                                                style="padding-left: 8px; padding-right: 8px;">
                                                <p>Tên</p>
                                            </div>
                                            <div class="el-col el-col-24 el-col-sm-4"
                                                style="padding-left: 8px; padding-right: 8px;">
                                                <p>Trạng Thái</p>
                                            </div>
                                            <div class="el-col el-col-24 el-col-sm-4"
                                                style="padding-left: 8px; padding-right: 8px;">
                                                <p>Giá</p>
                                            </div>
                                            <div class="el-col el-col-24 el-col-sm-4"
                                                style="padding-left: 8px; padding-right: 8px;">
                                                <p>Nhân viên</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <div>
                                            <c:forEach items="${services}" var="s">
                                            <div data-service=${s.idService} data-type=${s.typeService}
                                                class="adm-service"
                                                style="border-color: rgb(192, 235, 117);background-color: #182e5b;">
                                                <div class="adm-service__data">
                                                    <div class="flex-center el-row is-align-middle"
                                                        style="margin-left: -8px; margin-right: -8px;">
                                                        <div class="service-name-col el-col el-col-24 el-col-sm-10"
                                                            style="padding-left: 8px; padding-right: 8px;">
                                                            <div class="service-name overflow-ellipsis flex-center">
                                                                <div class="adm-avatar size-40 margin-right--10 margin-left--0"
                                                                    style="background-image: url(
                                                                            ${s.pathImg});
                                                                            border: 3px solid rgb(255, 255, 255); color:
                                                                            rgb(19, 150, 110); z-index: 5;">
                                                                </div>
                                                                <h5 class="overflow-ellipsis mb-0"
                                                                    style="font-size: 15px;">${s.nameService}
                                                                </h5>
                                                            </div>
                                                        </div>

                                                        <div class="el-col el-col-24 el-col-sm-4"
                                                            style="padding-left: 8px; padding-right: 8px;">
                                                            <div class="status is-green"><svg viewBox="0 0 24 24"
                                                                    fill="none" stroke="currentColor" stroke-width="2"
                                                                    stroke-linecap="round" stroke-linejoin="round">
                                                                    <path d="M20 6L9 17l-5-5" />
                                                                </svg>
                                                                ${s.status}
                                                            </div>
                                                        </div>
                                                        <div class="el-col el-col-24 el-col-sm-4"
                                                            style="padding-left: 8px; padding-right: 8px;">
                                                            <span>${s.price}</span>
                                                        </div>
                                                        <div data-service=${s.idService}
                                                            class="el-col el-col-24 el-col-sm-4 relative temp-click__info"
                                                            style="padding-left: 8px; padding-right: 8px;">
                                                            <div class="el-popover fade-in el-popper dark autocomplete info-employ__service"
                                                                style="width: 200px; transform-origin: center bottom; z-index: 2005; position: absolute; top: -75px; left: -65px; display:none;">
                                                                <div class="list">
                                                                    <span class="list-row">
                                                                        <div class="adm-avatar size-24 mr-2 ml-0"
                                                                            style="background-image: url(https://babershop.admin.trafft.com/api/v1/public/media/29b53508-de3d-4bdb-9cc0-932ba9939ff2?size=avatar);color: rgb(36, 112, 172);">
                                                                        </div>
                                                                        <span>Thắng Võ</span>
                                                                    </span>
                                                                    <span class="list-row">
                                                                        <div class="adm-avatar size-24 mr-2 ml-0"
                                                                            style="background-image: url(https://babershop.admin.trafft.com/api/v1/public/media/29b53508-de3d-4bdb-9cc0-932ba9939ff2?size=avatar);color: rgb(36, 112, 172);">
                                                                        </div>
                                                                        <span>Tình Nguyễn</span>
                                                                    </span>
                                                                </div>
                                                                <div class="popper__arrow"
                                                                    style="left: 80.5px;top: 20px;position: relative;">

                                                                </div>
                                                            </div>
                                                            <span class="span-info-click">
                                                                <span class="el-popover__reference-wrapper">
                                                                    <div data-service="${s.idService}"
                                                                        class="member-thumbs el-popover__reference">
                                                                        <!-- <div
                                                                            class="adm-avatar size-32 margin-right-0 margin-left--10"
                                                                            style="background-image: url(
                                                                            https://babershop.admin.trafft.com/api/v1/public/media/3d9a8071-df4b-4b55-a05a-6f6a68371d21?size=avatar);
                                                                            border: 3px solid rgb(255, 255, 255); color:
                                                                            rgb(19, 150, 110); z-index: 5;">
                                                                        </div>
                                                                        <div class="adm-avatar size-32 margin-right-0 margin-left--10"
                                                                            style="background-image: url(
                                                                            https://babershop.admin.trafft.com/api/v1/public/media/29b53508-de3d-4bdb-9cc0-932ba9939ff2?size=avatar);
                                                                            border: 3px solid rgb(255, 255, 255); color:
                                                                            rgb(19, 150, 110); z-index: 5;">
                                                                        </div>
                                                                        <div class="member-thumbs__more-item adm-avatar size-32 margin-right-0 margin-left--10"
                                                                            style="background-color: rgb(230, 239, 254);
                                                                            border: 3px solid rgb(255, 255, 255);
                                                                            color: rgb(0, 90, 238);">+3
                                                                        </div> -->
                                                                    </div>
                                                                </span>
                                                            </span>
                                                        </div>
                                                        <div class="el-col el-col-24 el-col-sm-2"
                                                            style="padding-left: 8px; padding-right: 8px;">
                                                            <div class="adm-actions__drop-down">
                                                                <div class="el-dropdown">
                                                                    <button aria-haspopup="true" aria-expanded="false"
                                                                        data-toggle="dropdown" class="adm-btn"
                                                                        id="dropdownMenuButton">
                                                                        <span class="adm-btn__icon">
                                                                            <i class="fa-solid fa-ellipsis"></i>
                                                                        </span>
                                                                    </button>
                                                                    <ul class="dropdown-menu"
                                                                        aria-labelledby="dropdownMenuButton">
                                                                        <li data-service=${s.idService}
                                                                            class="edit-service dropdown-item el-dropdown-menu"
                                                                            data-target="#add-service_modal"
                                                                            data-toggle="modal">
                                                                            <div
                                                                                class="adm-dropdown-item__wrapper is-with-icon">
                                                                                <div class="adm-dropdown-item__icon">
                                                                                    <i class="fa-solid fa-pencil"></i>
                                                                                </div>
                                                                                <div class="adm-dropdown-item__label">
                                                                                    Chỉnh sửa
                                                                                </div>
                                                                            </div>
                                                                        </li>
                                                                        <li data-service=${s.idService}
                                                                            data-type=${s.typeService}
                                                                            data-toggle="modal"
                                                                            data-target="#alertModal"
                                                                            class="delete-service dropdown-item el-dropdown-menu">
                                                                            <div
                                                                                class="adm-dropdown-item__wrapper is-red is-with-icon">
                                                                                <div class="adm-dropdown-item__icon">
                                                                                    <i
                                                                                        class="fa-solid fa-trash-can"></i>
                                                                                </div>
                                                                                <div class="adm-dropdown-item__label">
                                                                                    Xóa
                                                                                </div>
                                                                            </div>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            </c:forEach>

                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- {{!-- Moodal --}} -->

        <!-- {{!-- Modal add category --}} -->
        <div class="modal fade" id="add-category_modal" tabindex="-1" role="dialog"
            aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="el-dialog__header">
                        <span class="adm-modal-title">
                            Thêm Danh Mục
                        </span>
                        <button id="close-add__category" type="button" class="close" data-dismiss="modal"
                            aria-label="Close" style="outline: none;">
                            <span aria-hidden="true">&times;</span>
                    </div>
                    <div class="el-dialog__body">
                        <form class="el-form" id="addCategory">
                            <div class="el-row" style="margin-left: -8px; margin-right: -8px;">
                                <div class="el-col el-col-24 el-col-sm-24"
                                    style="padding-left: 8px; padding-right: 8px;">
                                    <div class="adm-form-item">
                                        <div class="el-form-item is-success is-required">
                                            <label for="name" class="el-form-item__label">
                                                Tên Danh Mục
                                            </label>
                                            <div class="el-form-item__content">
                                                <div class="adm-input-wrapper">
                                                    <div
                                                        class="el-input el-input__default adm-input adm-input__size-default">
                                                        <input id="input-category" type="text" autocomplete="nope"
                                                            maxlength="200" iconstart iconend rows="2" name tags
                                                            class="el-input__inner">
                                                    </div>
                                                </div>
                                                <div class="adm-form-item__error">
                                                    <!-- {{!-- Bạn vui lòng nhập tên danh mục --}} -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="adm-form-item">
                                        <div class="el-form-item is-success is-required">
                                            <label for="name" class="el-form-item__label">
                                                Mô Tả Danh Mục
                                            </label>
                                            <div class="el-form-item__content">
                                                <div class="adm-input-wrapper">
                                                    <div
                                                        class="el-input el-input__default adm-input adm-input__size-default">
                                                        <input id="input-des-category" type="text" autocomplete="nope"
                                                            maxlength="300" iconstart iconend rows="2" name tags
                                                            class="el-input__inner">
                                                    </div>
                                                </div>
                                                <div class="adm-form-item__error">
                                                    <!-- {{!-- Bạn vui lòng nhập tên danh mục --}} -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button id="close-btn__add" data-dismiss="modal"
                            class="adm-button adm-button__filled__grey adm-button-size__medium" style="border:none">
                            <span>Đóng</span>
                        </button>
                        <button id="adm-add-category"
                            class="adm-button adm-button__filled__blue adm-button-size__medium ml-3"
                            style="border:none">
                            <span>Thêm Danh Mục</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <!-- {{!-- Modal edit category --}} -->
        <div class="modal fade" id="edit-category_modal" tabindex="-1" role="dialog"
            aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="el-dialog__header">
                        <span class="adm-modal-title">
                            Chỉnh Sửa Danh Mục
                        </span>
                        <button id="close-edit__category" type="button" class="close" data-dismiss="modal"
                            aria-label="Close" style="outline: none;">
                            <span aria-hidden="true">&times;</span>
                    </div>
                    <div class="el-dialog__body">
                        <form class="el-form" id="editCategory">
                            <div class="el-row" style="margin-left: -8px; margin-right: -8px;">
                                <div class="el-col el-col-24 el-col-sm-24"
                                    style="padding-left: 8px; padding-right: 8px;">
                                    <div class="adm-form-item">
                                        <div class="el-form-item is-success is-required">
                                            <label for="name" class="el-form-item__label">
                                                Tên Danh Mục
                                            </label>
                                            <div class="el-form-item__content">
                                                <div class="adm-input-wrapper">
                                                    <div
                                                        class="el-input el-input__default adm-input adm-input__size-default">
                                                        <input id="input-category__edit" type="text" autocomplete="nope"
                                                            maxlength="100" iconstart iconend rows="2" name tags
                                                            class="el-input__inner">
                                                    </div>
                                                </div>
                                                <div class="adm-form-item__error">
                                                    <!-- {{!-- Bạn vui lòng nhập tên danh mục --}} -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="adm-form-item">
                                        <div class="el-form-item is-success is-required">
                                            <label for="name" class="el-form-item__label">
                                                Mô Tả Danh Mục
                                            </label>
                                            <div class="el-form-item__content">
                                                <div class="adm-input-wrapper">
                                                    <div
                                                        class="el-input el-input__default adm-input adm-input__size-default">
                                                        <input id="input-des-category__edit" type="text"
                                                            autocomplete="nope" maxlength="100" iconstart iconend
                                                            rows="2" name tags class="el-input__inner">
                                                    </div>
                                                </div>
                                                <div class="adm-form-item__error">
                                                    <!-- {{!-- Bạn vui lòng nhập tên danh mục --}} -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button id="close-btn__edit" data-dismiss="modal"
                            class="adm-button adm-button__filled__grey adm-button-size__medium" style="border:none">
                            <span>Đóng</span>
                        </button>
                        <button id="adm-edit-category"
                            class="adm-button adm-button__filled__blue adm-button-size__medium ml-3"
                            style="border:none">
                            <span>Lưu Thay Đổi</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- {{!-- Modal add service --}} -->
        <div class="modal fade" id="add-service_modal" tabindex="-1" role="dialog"
            aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document"
                style="margin-top: 70px; width: 750px ; max-width:750px">
                <div class="modal-content">
                    <div class="el-dialog__header">
                        <span class="adm-modal-title tittle-service">
                            Tạo Dịch Vụ
                        </span>
                        <button id="close-add__category" type="button" class="close" data-dismiss="modal"
                            aria-label="Close" style="outline: none;">
                            <span aria-hidden="true">&times;</span>
                    </div>
                    <div class="el-dialog__body">
                        <form class="el-form" id="addServiceForm" action="service/add-service" method="POST" accept-charset="UTF-8"
                            enctype="multipart/form-data">
                            <div class="el-row" style="margin-left: -8px; margin-right: -8px;">
                                <div class="el-col el-col-24 el-col-sm-7"
                                    style="padding-left: 8px; padding-right: 8px;">
                                    <div class="adm-form-item">
                                        <div class="el-form-item">
                                            <label for="name" class="el-form-item__label">
                                                Ảnh Dịch Vụ
                                            </label>
                                            <div class="el-form-item__content">
                                                <div class="el-form-item__uploader">
                                                    <div class="adm-square-uploader__image" style="height: 193px;">
                                                        <div>
                                                            <div class="el-upload el-upload--picture">
                                                                <div class="el-upload-dragger">
                                                                    <div class="el-upload-dragger__upload">
                                                                        <div>
                                                                            <i
                                                                                class="fa-solid fa-upload adm-icon adm-icon__extraLarge adm-icon__primary"></i>
                                                                            <div class="el-upload__text">
                                                                                Nhấp vào để tải ảnh lên
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <input type="file" name="file"
                                                                    accept="image/png, image/jpeg"
                                                                    class="el-upload__input">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="adm-square-uploader__actions mt-3" style="display:none">
                                                        <div>
                                                            <button id="change-upload"
                                                                class="adm-button adm-button__ghost__dark adm-button__size__mini">
                                                                <span>Thay Đổi</span>
                                                            </button>
                                                        </div>
                                                        <button id="delete-upload"
                                                            class="adm-button adm-button__ghost__red adm-button__size__mini is-icon-start">
                                                            <span class="adm-button__icon-wrapper">
                                                                <i class="fa-solid fa-trash-can"></i>
                                                            </span>
                                                            <span>Xóa</span>
                                                        </button>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="adm-form-item__error mt-2">
                                                <!-- {{!-- Bạn vui lòng nhập tên danh mục --}} -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="el-col el-col-24 el-col-sm-17"
                                    style="padding-left: 8px; padding-right: 8px;height:348px">
                                    <div class="el-row" style="margin-left: -8px; margin-right: -8px;">
                                        <div class="el-col el-col-24 el-col-sm-24"
                                            style="padding-left: 8px; padding-right: 8px;">
                                            <div class="adm-form-item">
                                                <div class="el-form-item is-success is-required">
                                                    <label for="name" class="el-form-item__label">
                                                        Tên Dịch Vụ
                                                    </label>
                                                    <div class="el-form-item__content">
                                                        <div class="adm-input-wrapper">
                                                            <div
                                                                class="el-input el-input__default adm-input adm-input__size-default">
                                                                <input id="input-name-service__add" type="text"
                                                                    autocomplete="nope" maxlength="100" iconstart
                                                                    iconend rows="2" name="name_service" tags
                                                                    class="el-input__inner">
                                                            </div>
                                                        </div>
                                                        <div class="adm-form-item__error">
                                                            <!-- {{!-- Bạn vui lòng nhập tên danh mục --}} -->
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="adm-form-item">
                                                <div class="el-form-item is-success is-required">
                                                    <label for="name" class="el-form-item__label">
                                                        Danh Mục
                                                    </label>
                                                    <div class="el-form-item__content">
                                                        <div class="adm-input-wrapper">
                                                            <div
                                                                class="el-input el-input__default adm-input adm-input__size-default">
                                                                <input id="input-category-service__add" type="text"
                                                                    readonly="readonly" autocomplete="off"
                                                                    class="el-input__inner pointer"
                                                                    placeholder="Lựa Chọn Danh Mục"
                                                                    name="category_name">
                                                                <span class="el-input__suffix">
                                                                    <span class="el-input__suffix__inner">
                                                                        <i style="display:flex;align-items: center;justify-content: center;"
                                                                            class="fa-solid fa-angle-up el-select__caret el-input__icon"></i>
                                                                    </span>
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <div class="adm-form-item__error">
                                                            <!-- {{!-- Bạn vui lòng nhập tên danh mục --}} -->
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="adm-form-item">
                                                <div class="el-form-item is-success is-required">
                                                    <label for="name" class="el-form-item__label">
                                                        Mô Tả Dịch Vụ
                                                    </label>
                                                    <div class="el-form-item__content">
                                                        <div class="adm-input-wrapper">
                                                            <div
                                                                class="el-input el-input__default adm-input adm-input__size-default">
                                                                <input id="input-des-service__add" type="text"
                                                                    autocomplete="nope" maxlength="300" iconstart
                                                                    iconend rows="2" name="description_service" tags
                                                                    class="el-input__inner">
                                                            </div>
                                                        </div>
                                                        <div class="adm-form-item__error">
                                                            <!-- {{!-- Bạn vui lòng nhập tên danh mục --}} -->
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="el-col el-col-24 el-col-sm-24"
                                    style="padding-left: 8px; padding-right: 8px;height:93px">
                                    <div class="el-row" style="margin-left: -8px; margin-right: -8px;">
                                        <div class="one-row-form-item with-border-top">
                                            <div class="one-row-form-item__left ml-3">
                                                <div class="one-row-form-item__left__label semi-bold">Nhân Viên</div>
                                            </div>
                                            <div class="one-row-form-item__right" style="flex-basis: 320px;">
                                                <div class="adm-form-item">
                                                    <div class="el-form-item">
                                                        <div class="el-form-item__content">
                                                            <div class="adm-select-wrapper">
                                                                <div
                                                                    class="el-select el-select__default adm-select adm-select__size-default">
                                                                    <div class="el-select__tags"
                                                                        style="width: 100%; max-width: 170px;">
                                                                        <span>
                                                                            <!-- {{!-- <span
                                                                                class="el-tag el-tag--info el-tag--small el-tag--light">
                                                                                <span class="el-select__tags-text">
                                                                                    Nguyễn Bảo Trung
                                                                                </span>
                                                                                <i class="el-tag__close el-icon-close">
                                                                                </i>
                                                                            </span> --}} -->
                                                                        </span>
                                                                    </div>
                                                                    <div class="el-input" id="input-employee__service">
                                                                        <input id="input-employee-service" type="text"
                                                                            readonly="readonly" autocomplete="off"
                                                                            class="el-input__inner"
                                                                            placeholder="Lựa Chọn Nhân Viên">
                                                                        <span class="el-input__suffix">
                                                                            <span class="el-input__suffix__inner">
                                                                                <i style="align-items: center;"
                                                                                    class="fa-solid fa-angle-up el-select__caret el-input__icon"></i>
                                                                            </span>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="adm-form-item__error">
                                                                <!-- {{!-- Bạn vui lòng nhập tên danh mục --}} -->
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="el-col el-col-24 el-col-sm-24"
                                    style="padding-left: 8px; padding-right: 8px;height:172px">
                                    <div class="el-row" style="margin-left: -8px; margin-right: -8px;">
                                        <div class="one-row-form-item with-border-top">
                                            <div class="one-row-form-item__left ml-3">
                                                <div class="one-row-form-item__left__label semi-bold">Đơn Giá</div>
                                            </div>
                                            <div class="one-row-form-item__right" style="flex-basis: 164px;">
                                                <div class="adm-form-item">
                                                    <div class="el-form-item">
                                                        <div class="el-form-item__content">
                                                            <div class="adm-select-wrapper">
                                                                <div
                                                                    class="el-select el-select__default adm-select adm-select__size-default">
                                                                    <div class="el-input">
                                                                        <input id="input-price-service"
                                                                            style=" cursor:text" type="text"
                                                                            autocomplete="off" name="price_service"
                                                                            class="el-input__inner">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="adm-form-item__error mt-2 ml-2"
                                                                style="color:#005aee;">
                                                                1$ = 1000đ
                                                                <!-- {{!-- Bạn vui lòng nhập tên danh mục --}} -->
                                                            </div>
                                                            <div class="adm-form-item__error mt-2 ml-2">

                                                                <!-- {{!-- Bạn vui lòng nhập tên danh mục --}} -->
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <input type="text" id="arrEmployee" name="arrEmployee" style="display:none">
                            <input type="text" id="idServiceNew" name="idServiceNew" style="display:none">
                        </form>
                    </div>
                    <div class="modal-footer" style="justify-content: flex-end !important">
                        <button id="adm-btn-service__close" data-dismiss="modal"
                            class="adm-button adm-button__filled__grey adm-button-size__medium" style="border:none">
                            <span>Đóng</span>
                        </button>
                        <button id="adm-btn-service__add"
                            class="adm-button adm-button__filled__blue adm-button-size__medium ml-3"
                            style="border:none">
                            <span>Thêm Dịch Vụ</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- {{!-- Modal alert --}} -->
        <div class="modal fade" id="alertModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header" style="border:none;padding-bottom:0">
                        <h5 class="modal-title" id="alertModalLabel">Xóa Dịch Vụ</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body notification_delete-service" style="padding-bottom:5px">
                        <p>Bạn có chắc chắn muốn xóa dịch vụ này? Hành động này sẽ làm mất đi vĩnh viễn dữ liệu liên
                            quan đến dịch vụ này</p>
                    </div>
                    <div class="modal-footer">
                        <button data-dismiss="modal" class="adm-button adm-button__filled__grey adm-button-size__medium"
                            style="border:none;height:36px">
                            <span>Đóng</span>
                        </button>
                        <button id="btn-delete__service"
                            class="adm-button adm-button__filled__red adm-button-size__medium ml-3"
                            style="border:none;height:36px">
                            <span>Xóa</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- {{!-- Dropdown --}}
        {{!-- Dropdown category --}} -->
        <div class="el-select-dropdown el-popper adm-select-popper" id="dropdown-category__service"
            style="min-width: 492.575px; transform-origin: center top; z-index: 2026; display: none;">
            <div class="el-scrollbar">
                <div class="el-select-dropdown__wrap el-scrollbar__wrap"
                    style="margin-bottom: -17px; margin-right: -17px;">
                    <ul class="el-scrollbar__view el-select-dropdown__list list-dropdown__categories">
	                    <c:forEach items="${categories}" var="c">
	                    	<li data-type="${c.idTypeService}"
	                            class="el-select-dropdown__item adm-select-option list-category__dropdown">
	                            <span>${c.nameType}</span>
	                        </li>
	                    </c:forEach>
                    </ul>
                </div>
            </div>
        </div>

        <!-- {{!-- Dropdown employee --}} -->
        <div class="el-select-dropdown el-popper adm-select-popper" id="dropdown-employee__service"
            style="min-width: 320px; transform-origin: center bottom; z-index: 2003; display: none;">
            <div class="el-scrollbar">
                <div class="el-select-dropdown__wrap el-scrollbar__wrap"
                    style="margin-bottom: -17px; margin-right: -17px;">
                    <ul class="el-scrollbar__view el-select-dropdown__list">
	                    <c:forEach items="${staffs}" var="st">
		                    <li data-employee="${st.idStaff}"
	                            class="el-select-dropdown__item adm-select-option list-employee__dropdown">
	                            <span>${st.surName} ${st.nameStaff}</span>
	                        </li>
	                    </c:forEach>
                    </ul>
                </div>
            </div>
        </div>


</body>

</html>

<script>
    const rawStaffs = ${rawStaffs};
    const rawStaffServices = ${rawStaffServices};
    const rawCategories = ${rawCategories};
    const rawServices = ${rawServices};
    
    const mapEmployeeRelateService = (employees, staffServices) => {
        return (staffServices ?? []).map(staffService => {
            const employee = employees.find(employee => employee?.idStaff === staffService?.idStaff);
            if (employee) {
                return {
                    IDService: staffService?.idService,
                    PathImgStaff: employee?.pathImgStaff,
                    SurName: employee?.surName,
                    NameStaff: employee?.nameStaff,
                }
            }
            return null;
        }).filter(element => !!element);
    };

    const employee_relate = mapEmployeeRelateService(rawStaffs, rawStaffServices);
    
</script>

<script src="client/script/staff/service.js">
</script>