<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" href="client/css/mainstaff.css">
    <link rel="stylesheet" href="client/css/service-dashboard.css">
    <link rel="stylesheet" href="client/css/employee.css">
    <link rel="stylesheet" href="client/font/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.css">
    <link rel="stylesheet" href="client/css/booking.css">
</head>

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
            <a href="service?idStore=${idStore}" class="service-link d-none">
                <svg id=" service" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5"
                    stroke-linecap="round" stroke-linejoin="round">
                    <path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5" />
                </svg>
            </a>
            <span class="service-span d-none">Dịch Vụ</span>
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
                                <span class="adm-header__label">Lịch Hẹn</span>
                            </div>
                            <div class="align-right">
                                <button data-toggle="modal" data-target="#add-booking" id="add_booking"
                                    class="adm-button adm-button-service">
                                    <span class="adm-button__icon-wrapper">
                                        <i class="fa-solid fa-plus"></i>
                                    </span>
                                    <span>Thêm Lịch Hẹn</span>
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
                                    <h5>Nhân Viên<span>(${totalEmployee})</span> </h5>
                                </div>
                                <div class="categories-list mb-3">
                                    <div class="category all-categories active mb-4">
                                        <div class="category-name">
                                            <div>Tất Cả Nhân Viên</div>
                                            <span class="num-services num_all-booking"></span>
                                        </div>
                                    </div>
                                    <div>
                                    <c:forEach items="${employees}" var="e">
                                    	<div data-employee=${e.idStaff} class="category"
                                            style="border:none;border-radius: 10px; ">
                                            <div class="adm-avatar size-32 mr-4 mb-2"
                                                style="background-image: url(${e.pathImgStaff}); color: rgb(36, 112, 172);">
                                            </div>
                                            <div class="category-name overflow-ellipsis">
                                                <div class="name-type-service" style="text-transform: capitalize;">
                                                   ${e.surName} ${e.nameStaff}</div>
                                                <span class="num-bookings num-services"></span>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="services-list">
                        <div id="calendar"></div>
                    </div>

                </div>
                <div class="sidebar-employee">
                    <div class="sidebar">
                        <div class="sidebar__header">
                            <div class="sidebar__header__title semi-bold flex-center">
                                Thông Tin Chi Tiết
                            </div>
                            <div class="sidebar__header__actions">
                                <div class="adm-actions__drop-down ml-2">
                                    <div class="el-dropdown">
                                        <button aria-haspopup="true" aria-expanded="false" data-toggle="dropdown"
                                            style="color: #14233d;background-color: transparent;border: none;"
                                            class="adm-button adm-button__borderless__grey adm-button__size__small is-icon-only el-dropdown-selfdefine edit-icon">
                                            <span class="adm-button__icon-wrapper">
                                                <i class="fa-solid fa-ellipsis"></i>
                                            </span>
                                        </button>
                                        <ul class="dropdown-menu el-scrollbar__view el-select-dropdown__list"
                                            aria-labelledby="dropdownMenuButton">
                                            <li style="padding-left:12px;"
                                                class="el-select-dropdown__item adm-select-option edit-booking">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                    fill="currentColor" class="bi bi-pencil mr-2" viewBox="0 0 16 16">
                                                    <path
                                                        d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z" />
                                                </svg>
                                                <span>Chỉnh sửa</span>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="sidebar__header__actions__close ml-2"
                                        style="font-size: 20px;color: #00143c;">
                                        <i class="fa-solid fa-xmark"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="sidebar__content">
                            <div class="sidebar__status">
                                <div class="status flex-center">
                                    <i class="fa-solid fa-user-check mr-3"></i>
                                    <span class="status-symbol approved">
                                        Đã Đặt Lịch
                                    </span>
                                </div>
                            </div>
                            <div>
                                <div class="adm-appointment-info-section adm-appointment-info-section-datetime">
                                    <div class="adm-appointment-info-section__header">
                                        <i class="fa-regular fa-calendar" style="color: #005aee;font-size:20px"></i>
                                        <span class="adm-appointment-info-section__header__title">
                                            Ngày & Giờ
                                        </span>
                                    </div>
                                    <div class="adm-appointment-info-section__content">
                                        <div class="adm-appointment-info-section-datetime__date">
                                            <span>17-05-2022</span>
                                        </div>
                                        <div class="adm-appointment-info-section-datetime__time">
                                            <span>20:30</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="adm-appointment-info-section-employee">
                                    <div class="adm-avatar size-32 mr-0 ml-0 avatar-employe_book"
                                        style="background-image: url(http://localhost:3000/img/1652612227642.jpg); color: rgb(36, 112, 172);">
                                    </div>
                                    <div class="adm-appointment-info-section-employee__text">
                                        <div class="adm-appointment-info-section-employee__text__title">Nhân viên
                                            thực hiện</div>
                                        <div class="adm-appointment-info-section-employee__text__name">
                                            <span>Thắng Võ</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="adm-appointment-info-section adm-appointment-info-section-customers">
                                    <div class="adm-appointment-info-section__header">
                                        <i class="fa-regular fa-user adm-icon adm-icon__medium adm-icon__primary"></i>
                                        <span class="adm-appointment-info-section__header__title">Khách Hàng</span>
                                    </div>
                                    <div class="adm-appointment-info-section__content">
                                        <div class="adm-appointment-info-section-customers__item">
                                            <div class="adm-appointment-info-section-customers__item__name">
                                                <span>Hoàng Nguyễn</span>
                                            </div>
                                            <div class="adm-appointment-info-section-customers__item__email">
                                                <span>minhhoang@gmail.com</span>
                                            </div>
                                            <div class="adm-appointment-info-section-customers__item__phone">
                                                <span>0879229094</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="adm-appointment-info-section adm-appointment-info-section-customers">
                                    <div class="adm-appointment-info-section__header">
                                        <i class="fa-solid fa-chair adm-icon adm-icon__medium adm-icon__primary"></i>
                                        <span class="adm-appointment-info-section__header__title">Dịch vụ</span>
                                    </div>
                                    <div class="adm-appointment-info-section__content">
                                        <div class="adm-appointment-info-section-customers__item service-list__book">
                                            <div class="adm-appointment-info-section-service">
                                                <span>Cắt gội massage</span>
                                                <span>200.000đ</span>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <div class="section sidebar-appointment__payments">
                                    <div class="section-title">
                                        <i
                                            class="fa-regular fa-credit-card adm-icon adm-icon__medium adm-icon__primary"></i>
                                        <span>Tổng tiền</span>
                                    </div>
                                    <div class="flex-center">
                                        <h6 class="payment-book">100.000đ</h6>
                                    </div>
                                </div>
                            </div>
                            <span class="flex action-booking">
                                <button id="cancel-booking" data-dismiss="modal" data-toggle="modal"
                                    data-target="#alertModalDelete" class="adm-button adm-button-size__medium"
                                    style="border:none;background: #d63434;margin-left:16px">
                                    <span>Hủy Lịch Hẹn</span>
                                </button>
                                <button id="adm-export-invoice"
                                    class="adm-button adm-button__filled__blue adm-button-size__medium ml-3"
                                    style="border:none">
                                    <span>Xuất Hóa Đơn</span>
                                </button>
                            </span>
                        </div>
                    </div>
                    <!-- {{!-- <div class="sidebar-overlay">
                    </div> --}} -->
                </div>
            </div>

        </div>

        <!-- {{!-- Modal add booking --}} -->

        <div class="modal fade" id="add-booking" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document"
                style="margin-top: 70px; width: 1200px ; max-width:1200px">
                <div class="modal-content">
                    <div class="el-dialog__header">
                        <span class="adm-modal-title title-booking">
                            Thêm Lịch Hẹn
                        </span>
                        <button id="close-add__employee" type="button" class="close" data-dismiss="modal"
                            aria-label="Close" style="outline: none;">
                            <span aria-hidden="true">&times;</span>
                    </div>
                    <div class="el-dialog__body">
                        <form class="el-form" id="addEmployeeForm" action="employee/add-employee" method="post"
                            enctype="multipart/form-data">
                            <div class="flex">
                                <div class="mr-4">

                                </div>
                                <div class="flex-grow">
                                    <div class="el-row" style="margin-left: -8px; margin-right: -8px;height: 116px;">
                                        <div class="el-col el-col-24 el-col-sm-12"
                                            style="padding-left: 8px; padding-right: 8px;">
                                            <div class="adm-form-item">
                                                <div class="el-form-item is-success is-required">
                                                    <label for="name" class="el-form-item__label">
                                                        Ngày Đặt Lịch
                                                    </label>
                                                    <div class="el-form-item__content">
                                                        <div class="adm-input-wrapper">
                                                            <div
                                                                class="el-input el-input__default adm-input adm-input__size-default">
                                                                <input id="input_from" type="date" autocomplete="off"
                                                                    class="el-input__inner pointer" name="store_id"
                                                                    style="text-overflow: ellipsis;padding: 0px 40px 0px 12px;"
                                                                    ;>
                                                                <!-- {{!-- <span class="el-input__suffix">
                                                                    <span class="el-input__suffix__inner">
                                                                        <i style="display:flex;align-items: center;justify-content: center;"
                                                                            class="fa-solid fa-angle-up el-select__caret el-input__icon"></i>
                                                                    </span>
                                                                </span> --}} -->
                                                            </div>
                                                        </div>
                                                        <div class="adm-form-item__error">
                                                            <!-- {{!-- Bạn vui lòng nhập tên danh mục --}} -->
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="el-col el-col-24 el-col-sm-12"
                                            style="padding-left: 8px; padding-right: 8px;">
                                            <div class="adm-form-item">
                                                <div class="el-form-item is-success is-required">
                                                    <label for="name" class="el-form-item__label">
                                                        Thời Gian
                                                    </label>
                                                    <div class="el-form-item__content">
                                                        <div class="adm-input-wrapper">
                                                            <div
                                                                class="input-time_book el-input el-input__default adm-input is-disabled adm-input__size-default">
                                                                <input id="input-time__booking" type="text"
                                                                    readonly="readonly" autocomplete="off"
                                                                    class="el-input__inner pointer"
                                                                    placeholder="Chọn Thời Gian" name="manager_name"
                                                                    disabled>
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
                                        </div>
                                    </div>
                                    <div class="el-row" style="margin-left: -8px; margin-right: -8px;height: 116px;">
                                        <div class="el-col el-col-24 el-col-sm-12"
                                            style="padding-left: 8px; padding-right: 8px;">
                                            <div class="adm-form-item">
                                                <div class="el-form-item is-success is-required">
                                                    <label for="name" class="el-form-item__label">
                                                        Chọn Dịch Vụ
                                                    </label>
                                                    <div class="el-form-item__content">
                                                        <div class="adm-select-wrapper">
                                                            <div
                                                                class="el-select el-select__default adm-select adm-select__size-default">
                                                                <div class="el-select__tags"
                                                                    style="width: 100%; max-width: 300px;">
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
                                                                <div class="el-input">
                                                                    <input id="input-service_booking" type="text"
                                                                        readonly="readonly" autocomplete="off"
                                                                        class="el-input__inner pointer"
                                                                        placeholder="Chọn Dịch Vụ">
                                                                    <span class="el-input__suffix">
                                                                        <span class="el-input__suffix__inner">
                                                                            <i style="display:flex;align-items: center;justify-content: center;"
                                                                                class="fa-solid fa-angle-up el-select__caret el-input__icon"></i>
                                                                        </span>
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
                                        <div class="el-col el-col-24 el-col-sm-12"
                                            style="padding-left: 8px; padding-right: 8px;">
                                            <div class="adm-form-item">
                                                <div class="el-form-item is-success is-required">
                                                    <label for="name" class="el-form-item__label">
                                                        Chọn Nhân Viên
                                                    </label>
                                                    <div class="el-form-item__content">
                                                        <div class="adm-select-wrapper">
                                                            <div
                                                                class="el-select el-select__default adm-select adm-select__size-default">
                                                                <div class="el-select__tags"
                                                                    style="width: 100%; max-width: 400px;">
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
                                                                <div class="el-input">
                                                                    <input id="input-employee_booking" type="text"
                                                                        readonly="readonly" autocomplete="off"
                                                                        class="el-input__inner pointer"
                                                                        placeholder="Chọn Nhân Viên">
                                                                    <span class="el-input__suffix">
                                                                        <span class="el-input__suffix__inner">
                                                                            <i style="display:flex;align-items: center;justify-content: center;"
                                                                                class="fa-solid fa-angle-up el-select__caret el-input__icon"></i>
                                                                        </span>
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
                                    <div class="el-row" style="margin-left: -8px; margin-right: -8px;height: 116px;">
                                        <div class="el-col el-col-24 el-col-sm-12"
                                            style="padding-left: 8px; padding-right: 8px;">
                                            <div class="adm-form-item">
                                                <div class="el-form-item is-success is-required">
                                                    <label for="name" class="el-form-item__label">
                                                        Số Điện Thoại
                                                    </label>
                                                    <div class="el-form-item__content">
                                                        <div class="adm-input-wrapper">
                                                            <div
                                                                class="el-input el-input__default adm-input adm-input__size-default">
                                                                <input id="input_phone_cus" type="text"
                                                                    autocomplete="nope" maxlength="10" iconstart iconend
                                                                    rows="2" name="email" tags class="el-input__inner"
                                                                    placeholder="Nhập Số Điện Thoại KH Đặt Lịch">
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

                            <input type="text" id="arrServiceAssign" name="arrServices" style="display:none">
                            <input type="text" id="idEmployeeEdit" name="idStaff" style="display:none">
                        </form>
                    </div>
                    <div class="modal-footer" style="justify-content: flex-end !important">
                        <button id="adm-btn-employee__close" data-dismiss="modal"
                            class="adm-button adm-button__filled__grey adm-button-size__medium" style="border:none">
                            <span>Đóng</span>
                        </button>
                        <button id="adm-btn-booking__add"
                            class="adm-button adm-button__filled__blue adm-button-size__medium ml-3"
                            style="border:none">
                            <span class="span-btn__booking">Thêm Lịch Hẹn</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- {{!-- Modal alert --}} -->
        <div class="modal fade" id="alertModalDelete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header" style="border:none;padding-bottom:0">
                        <h5 class="modal-title" id="alertModalLabel">Hủy Lịch Hẹn</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body notification-employe_delete" style="padding-bottom:5px">
                        <p>Bạn có chắn chẳn muốn hủy lịch hẹn này?</p>
                    </div>
                    <div class="modal-footer">
                        <button data-dismiss="modal" class="adm-button adm-button__filled__grey adm-button-size__medium"
                            style="border:none;height:36px">
                            <span>Đóng</span>
                        </button>
                        <button id="btn-confirm-cancel__booking"
                            class="adm-button adm-button__filled__red adm-button-size__medium ml-3"
                            style="border:none;height:36px">
                            <span>Hủy Lịch</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- {{!-- Dropdown --}}
        {{!-- Dropdown service --}} -->
        <div class="el-select-dropdown el-popper adm-select-popper" id="dropdown-services__employee"
            style="min-width: 430px; transform-origin: center bottom; z-index: 2026; display: none;">
            <div class="el-scrollbar">
                <div class="el-select-dropdown__wrap el-scrollbar__wrap"
                    style="margin-bottom: -17px; margin-right: -17px;">
                    <ul class="el-scrollbar__view el-select-dropdown__list">
                    <c:forEach items="${services}" var="s">
                    	<li data-service=${s.idService}
                            class="el-select-dropdown__item adm-select-option item-service__dropdown">
                            <span>${s.nameService}</span>
                        </li>
                    </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        <!-- {{!-- Dropdown employee active --}} -->
        <div class="el-select-dropdown el-popper adm-select-popper" id="dropdown-employee__booking"
            style="min-width: 540px; transform-origin: center bottom; z-index: 2026; display: none;">
            <div class="el-scrollbar">
                <div class="el-select-dropdown__wrap el-scrollbar__wrap"
                    style="margin-bottom: -17px; margin-right: -17px;">
                    <ul class="el-scrollbar__view el-select-dropdown__list">
                    <c:forEach items="${employees}" var="e">
                    	<li data-employee=${e.idStaff}
                            class="el-select-dropdown__item adm-select-option item-employee">
                            <span>${e.surName} ${e.nameStaff}</span>
                        </li>
                    </c:forEach>
                        <li class="el-select-dropdown__item adm-select-option no-data no-data__employee"
                            style="display:none; justify-content: center;cursor:default">
                            <span>Không có dữ liệu</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- {{!-- Drop down shift --}} -->
        <div class="el-select-dropdown el-popper adm-select-popper" id="dropdown-shift__booking"
            style="min-width: 540px; transform-origin: center bottom; z-index: 2026; display: none;">
            <div class="el-scrollbar">
                <div class="el-select-dropdown__wrap el-scrollbar__wrap"
                    style="margin-bottom: -17px; margin-right: -17px;">
                    <ul class="el-scrollbar__view el-select-dropdown__list">
                    <c:forEach items="${shifts}" var="s" varStatus="status">
                    	<li data-shift=${s.idShift} class="el-select-dropdown__item adm-select-option item-shift">
                            <span>
                            <c:choose>
                            	<c:when test="${s.hourStart > 9 && s.minuteStart > 9}">${s.hourStart}h${s.minuteStart}</c:when>
                            	<c:when test="${s.hourStart < 9 && s.minuteStart < 9}">0${s.hourStart}h0${s.minuteStart}</c:when>
                            	<c:when test="${s.hourStart < 9 && s.minuteStart > 9}">0${s.hourStart}h${s.minuteStart}</c:when>
                            	<c:when test="${s.hourStart > 9 && s.minuteStart < 9}">${s.hourStart}h0${s.minuteStart}</c:when>
                            	<c:when test="${s.hourStart == 9 && s.minuteStart < 9}">0${s.hourStart}h0${s.minuteStart}</c:when>
                            	<c:when test="${s.hourStart == 9 && s.minuteStart > 9}">0${s.hourStart}h${s.minuteStart}</c:when>
                            </c:choose>
                            </span>
                        </li>
                    </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        <div id="toast">
            <div id="img"></div>
            <div id="desc"></div>
        </div>
</body>

</html>
<script src="https://momentjs.com/downloads/moment.js"></script>
<script>
	const rawBookings = ${rawBookings};
	const rawShifts = ${rawShifts};
	const rawBookItems = ${rawBookItems};
	const rawCustomers = ${rawCustomers};
	const rawRegisShifts = ${rawRegisShifts};
	const store = ${rawStore};

    const bookings = (rawBookings ?? []).map(booking => {
        const shift = (rawShifts ?? []).find(shift => shift.idShift === booking.idShiftBook);
        const date = moment(booking.dateBook).format("yyyy-MM-DD")
        const bookItems = (rawBookItems ?? []).filter(bookItem => moment(bookItem.dateBook).format("yyyy-MM-DD") === date
                                                && bookItem.idShiftBook === booking.idShiftBook 
                                                && bookItem.idStaff === booking.staff.idStaff);
        const customer = (rawCustomers ?? []).find(customer => customer.taiKhoan.account === booking.phoneCustomer);
        return {
            DateBook: date,
            HourStart: shift.hourStart,
            MinuteStart: shift.minuteStart,
            PhoneCustomer: booking.phoneCustomer,
            Status: booking.statusBook,
            IDStaff: booking.staff.idStaff,
            SurName: booking.staff.surName,
            NameStaff: booking.staff.nameStaff,
            PathImgStaff: booking.staff.pathImgStaff,
            Payment: booking.payment,
            IDShift: booking.idShiftBook,
            bookItems,
            customer: {
                ...customer,
                phoneCustomer: customer?.taiKhoan?.account,
            },
        }
    })
</script>
<script src="https://unpkg.com/easyinvoice/dist/easyinvoice.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.js"></script>
<script src="client/script/staff/booking.js">
</script>