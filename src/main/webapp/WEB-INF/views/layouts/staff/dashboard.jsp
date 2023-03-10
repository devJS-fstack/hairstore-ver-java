<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
 <link rel="stylesheet" href="client/css/mainstaff.css">
    <link rel="stylesheet" href="client/css/service-dashboard.css">
    <link rel="stylesheet" href="client/font/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.css">
    <link rel="stylesheet" href="client/css/booking.css">
    <link rel="stylesheet" href="client/css/employee.css">
    <link rel="stylesheet" href="client/css/dashboard-main.css">

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
            <span>Làm Việc</span>
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
        <div class="main-container pt-2"
            style="display: block;background-color: #f4f6fa;min-height: 100vh;width: 100%;">
            <div class="main-header is-main-navigation-bar-expanded">
                <div class="main-header__account el-dropdown" aria-haspopup="true" aria-expanded="false"
                    data-toggle="dropdown">
                    <div class="main-header__account__slot el-dropdown-selfdefine">
                        <div class="adm-avatar size-36 mr-0 ml-0 avt-manager">
                        </div>
                        <div class="main-header__account__slot__name tablet-hidden">
                            <span class="name-manager"></span>
                        </div>
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"
                            svg-inline="" role="presentation" focusable="false" tabindex="-1"
                            class="main-header__account__slot__arrow tablet-hidden">
                            <path
                                d="M12 15a.75.75 0 01-.48-.172l-4.5-3.75a.75.75 0 11.96-1.155l4.02 3.36 4.02-3.24a.75.75 0 011.058.112.75.75 0 01-.105 1.095l-4.5 3.623A.75.75 0 0112 15z"
                                fill="#005AEE" class="customize-fill"></path>
                        </svg>
                    </div>
                    <ul class="dropdown-menu el-scrollbar__view el-select-dropdown__list dropdown__account"
                        aria-labelledby="dropdownMenuButton">
                        <li style="padding-left:20px ;" class="el-select-dropdown__item adm-select-option info-manager">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-person" viewBox="0 0 16 16"
                                style="width: 22px;height: 21px;padding-bottom: 3px;margin-right: 4px;">
                                <path
                                    d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z" />
                            </svg>
                            <span>Thông Tin Cá Nhân</span>
                        </li>
                        <li style="padding-left:20px ;"
                            class="el-select-dropdown__item adm-select-option log-out__manager">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-box-arrow-right" viewBox="0 0 16 16"
                                style="width: 22px;height: 21px;padding-bottom: 3px;margin-right: 4px;">
                                <path fill-rule="evenodd"
                                    d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z" />
                                <path fill-rule="evenodd"
                                    d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z" />
                            </svg>
                            <span>Đăng Xuất</span>
                        </li>
                    </ul>
                </div>

            </div>
            <div class="adm-dashboard__container__wrapper">
                <div class="dashboard-page">
                    <div class="dashboard-header-stats">
                        <div class="dashboard-line-chart" style="padding-bottom: 0;">
                            <div class="dashboard-line-chart__header">
                                <div style="font-size: 16px;">Khách Hàng Mới</div>
                                <div class="dashboard-line-chart__header__right">
                                    <div class="el-dropdown">
                                        <button aria-haspopup="true" aria-expanded="false" data-toggle="dropdown"
                                            class="adm-button adm-button__borderless__dark adm-button__size__micro is-icon-end el-dropdown-selfdefine"
                                            id="dropdownMenuButton">
                                            <span class="customer-time_text">Tuần hiện tại</span>

                                            <i class="fa-solid fa-angle-down"></i>
                                        </button>
                                        <ul class="dropdown-menu el-scrollbar__view el-select-dropdown__list"
                                            aria-labelledby="dropdownMenuButton">
                                            <li style="padding-left:20px ;"
                                                class="el-select-dropdown__item adm-select-option item_customer-chart_time selected">
                                                <span>Tuần hiện tại</span>
                                            </li>
                                            <li style="padding-left:20px ;"
                                                class="el-select-dropdown__item adm-select-option item_customer-chart_time">
                                                <span>Tuần trước</span>
                                            </li>
                                            <li style="padding-left:20px ;"
                                                class="el-select-dropdown__item adm-select-option item_customer-chart_time">
                                                <span>Tháng hiện tại</span>
                                            </li>
                                            <li style="padding-left:20px ;"
                                                class="el-select-dropdown__item adm-select-option item_customer-chart_time">
                                                <span>Ba tháng trước</span>
                                            </li>
                                            <li style="padding-left:20px ;"
                                                class="el-select-dropdown__item adm-select-option item_customer-chart_time">
                                                <span>Sáu tháng trước</span>
                                            </li>
                                        </ul>
                                    </div>

                                </div>
                            </div>
                            <div class="dashboard-line-chart__container">
                                <div class="dashboard-line-chart__container__content">
                                    <div class="dashboard-line-chart__container__content__value">
                                        <span class="customer_num" style="font-size: 28px;"></span>
                                    </div>
                                    <div class="el-tooltip dashboard-line-chart__footer dashboard-line-chart--increasing"
                                        style="position: relative;bottom: 43px;">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"
                                            style="color: rgb(82, 215, 151); width:24px;height:16px" fill="currentColor"
                                            class="bi bi-arrow-up-right" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd"
                                                d="M14 2.5a.5.5 0 0 0-.5-.5h-6a.5.5 0 0 0 0 1h4.793L2.146 13.146a.5.5 0 0 0 .708.708L13 3.707V8.5a.5.5 0 0 0 1 0v-6z" />
                                        </svg>
                                        100% Tăng
                                    </div>
                                </div>
                                <div class="dashboard-line-chart__container__chart">
                                    <div style="">
                                        <div id="chart_customer"
                                            class="apexcharts-canvas apexchartspajpqly1f apexcharts-theme-light">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="dashboard-line-chart" style="padding-bottom: 0;">
                            <div class="dashboard-line-chart__header">
                                <div style="font-size: 16px;">Doanh Thu</div>
                                <div class="dashboard-line-chart__header__right">
                                    <div class="el-dropdown">
                                        <button aria-haspopup="true" aria-expanded="false" data-toggle="dropdown"
                                            class="adm-button adm-button__borderless__dark adm-button__size__micro is-icon-end el-dropdown-selfdefine"
                                            id="dropdownMenuButton">
                                            <span class="revenue-time_text">
                                                Tuần hiện tại
                                            </span>
                                            <i class="fa-solid fa-angle-down"></i>
                                        </button>
                                        <ul class="dropdown-menu el-scrollbar__view el-select-dropdown__list"
                                            aria-labelledby="dropdownMenuButton">
                                            <li style="padding-left:20px ;"
                                                class="el-select-dropdown__item adm-select-option item_revenue-chart_time selected">
                                                <span>Tuần hiện tại</span>
                                            </li>
                                            <li style="padding-left:20px ;"
                                                class="el-select-dropdown__item adm-select-option item_revenue-chart_time">
                                                <span>Tuần trước</span>
                                            </li>
                                            <li style="padding-left:20px ;"
                                                class="el-select-dropdown__item adm-select-option item_revenue-chart_time">
                                                <span>Tháng hiện tại</span>
                                            </li>
                                            <li style="padding-left:20px ;"
                                                class="el-select-dropdown__item adm-select-option item_revenue-chart_time">
                                                <span>Ba tháng trước</span>
                                            </li>
                                            <li style="padding-left:20px ;"
                                                class="el-select-dropdown__item adm-select-option item_revenue-chart_time">
                                                <span>Sáu tháng trước</span>
                                            </li>
                                        </ul>
                                    </div>

                                </div>
                            </div>
                            <div class="dashboard-line-chart__container">
                                <div class="dashboard-line-chart__container__content">
                                    <div class="dashboard-line-chart__container__content__value">
                                        <span class="sum_revenue" style="font-size: 28px;"></span>
                                    </div>
                                    <div style="position: relative;bottom: 43px;"
                                        class="el-tooltip dashboard-line-chart__footer dashboard-line-chart--increasing">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"
                                            style="color: rgb(82, 215, 151); width:24px;height:16px" fill="currentColor"
                                            class="bi bi-arrow-up-right" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd"
                                                d="M14 2.5a.5.5 0 0 0-.5-.5h-6a.5.5 0 0 0 0 1h4.793L2.146 13.146a.5.5 0 0 0 .708.708L13 3.707V8.5a.5.5 0 0 0 1 0v-6z" />
                                        </svg>
                                        100% Tăng
                                    </div>
                                </div>
                                <div class="dashboard-line-chart__container__chart">
                                    <div>
                                        <div id="chart_revenue"
                                            class="apexcharts-canvas apexchartspajpqly1f apexcharts-theme-light">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="dashboard-page__central-stats">
                        <div class="dashboard-appointments-stats dashboard-page__central-stats__appointments">
                            <div class="dashboard-appointments-stats__header">
                                <div class="dashboard-appointments-stats__header__content">
                                    <div class="dashboard-appointments-stats__header__content__appointments">
                                        <div class="dashboard-appointments-stats__header__content__title">
                                            Lịch hẹn thành công
                                        </div>
                                        <div class="dashboard-appointments-stats__header__content__stats">
                                            <div class="dashboard-appointments-stats__header__content__value">
                                                <span class="booking_success"></span>
                                            </div>
                                            <div
                                                class="el-tooltip dashboard-appointments-stats__header__content__percentage dashboard-appointments-stats__header__content__percentage--increasing">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"
                                                    style="color: rgb(82, 215, 151); width:24px;height:16px"
                                                    fill="currentColor" class="bi bi-arrow-up-right"
                                                    viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd"
                                                        d="M14 2.5a.5.5 0 0 0-.5-.5h-6a.5.5 0 0 0 0 1h4.793L2.146 13.146a.5.5 0 0 0 .708.708L13 3.707V8.5a.5.5 0 0 0 1 0v-6z" />
                                                </svg>
                                                100% Tăng
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="dashboard-appointments-stats__header__content__title">
                                            Lịch hẹn đang đợi xử lý
                                        </div>
                                        <div class="dashboard-appointments-stats__header__content__stats">
                                            <div class="dashboard-appointments-stats__header__content__value">
                                                <span class="booking_pendding"></span>
                                            </div>
                                            <div
                                                class="el-tooltip dashboard-appointments-stats__header__content__percentage dashboard-appointments-stats__header__content__percentage--increasing">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"
                                                    style="color: rgb(82, 215, 151); width:24px;height:16px"
                                                    fill="currentColor" class="bi bi-arrow-up-right"
                                                    viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd"
                                                        d="M14 2.5a.5.5 0 0 0-.5-.5h-6a.5.5 0 0 0 0 1h4.793L2.146 13.146a.5.5 0 0 0 .708.708L13 3.707V8.5a.5.5 0 0 0 1 0v-6z" />
                                                </svg>
                                                100% Tăng
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="dashboard-appointments-stats__header__dropdown">
                                    <div class="el-dropdown">
                                        <button aria-haspopup="true" aria-expanded="false" data-toggle="dropdown"
                                            class="adm-button adm-button__borderless__dark adm-button__size__micro is-icon-end el-dropdown-selfdefine"
                                            id="dropdownMenuButton">
                                            <span class="span-btn-time__booked"></span>
                                            <i class="fa-solid fa-angle-down"></i>
                                        </button>
                                        <ul class="dropdown-menu el-scrollbar__view el-select-dropdown__list dropdown__listTimeBooked"
                                            aria-labelledby="dropdownMenuButton">
                                            <li style="padding-left:20px ;"
                                                class="el-select-dropdown__item adm-select-option list-employee__dropdown">
                                                <span></span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <div class="dashboard-appointments-stats__content">
                                <div style="min-height: 250px;">
                                    <div id="chart_book"></div>
                                </div>
                            </div>

                            <div class="dashboard-appointments-stats__footer">
                                <div class="dashboard-appointments-stats__footer__element">
                                    <div style="min-height: 60.7px;">
                                        <div id="chart_bar"></div>
                                    </div>
                                </div>
                                <div
                                    class="dashboard-appointments-stats__footer__element dashboard-appointments-stats__footer__element--new-customer">
                                    <div class="dashboard-appointments-stats__footer__element__title">Khách hàng cũ
                                    </div>
                                    <div class="dashboard-appointments-stats__footer__element__value">
                                        <span class="old-customer"></span>
                                        <span
                                            class="dashboard-appointments-stats__footer__element__value__blue percent-old-customer"></span>
                                    </div>
                                </div>

                                <div class="dashboard-appointments-stats__footer__element">
                                    <div class="dashboard-appointments-stats__footer__element__title">Khách hàng mới
                                    </div>
                                    <div class="dashboard-appointments-stats__footer__element__value">
                                        <span class="new-customer"></span>
                                        <span
                                            class="dashboard-appointments-stats__footer__element__value__green percent-new-customer"></span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="dashboard-appointments-table-stats dashboard-page__central-stats__table">
                            <div class="dashboard-appointments-table-stats__header">
                                <div class="dashboard-appointments-table-stats__header__title">Lịch sử đặt lịch</div>
                            </div>
                            <div class="dashboard-appointments-table-stats__table custom-scrollbar">
                                <div class="list-history__booked">
                                    <!-- {{!-- <div class="adm-appointments-last-booked">
                                        <div class="adm-appointments-last-booked__row loaded">
                                            <div class="el-row is-align-middle el-row--flex"
                                                style="margin-left: -8px; margin-right: -8px;">
                                                <div class="adm-appointments-last-booked__time el-col el-col-5">
                                                    <div class="el-row is-align-middle el-row--flex">
                                                        <span>May 23, 2022 10:00 am</span>
                                                    </div>
                                                </div>
                                                <div class="el-col el-col-7"
                                                    style="padding-left: 8px; padding-right: 8px;">
                                                    <div class="el-row is-align-middle el-row--flex">
                                                        <span>Cắt gội massage</span>
                                                    </div>
                                                </div>
                                                <div class="el-col el-col-5"
                                                    style="padding-left: 8px; padding-right: 8px;">
                                                    <p class="flex-center">
                                                        <span class="overflow-ellipsis semi-bold">Văn Tình</span>
                                                    </p>
                                                </div>
                                                <div class="el-col el-col-7"
                                                    style="padding-left: 8px; padding-right: 8px;">
                                                    <p class="flex-center">
                                                        <span class="overflow-ellipsis semi-bold">Đã thanh toán</span>
                                                    </p>
                                                </div>
                                                <div class="el-col el-col-2"
                                                    style="padding-left: 8px; padding-right: 8px;">
                                                    <div class="el-row el-row--flex">
                                                        <div class="el-tooltip">
                                                            <div
                                                                class="el-row is-justify-center is-align-middle el-row--flex">
                                                                <div style="background-image: url(https://babershop.admin.trafft.com/api/v1/public/media/3d9a8071-df4b-4b55-a05a-6f6a68371d21?size=avatar);color: rgb(19, 150, 110);"
                                                                    class="adm-avatar size-32 mt-0 ml-0">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div> --}} -->
                                </div>
                                <div class="adm-pagination" style="padding: 16px 24px;">
                                    <div class="adm-pagination__page el-pagination">
                                        <slot class="pagination-text">
                                        </slot>
                                    </div>
                                    <div class="el-pagination pagination_main">
                                        <button class="btn-prev">
                                            <i class="fa-solid fa-angle-left el-icon"></i>
                                        </button>
                                        <ul class="el-pager">
                                            <!-- {{!-- <li class="number active">
                                                1
                                            </li>
                                            <li class="number">
                                                2
                                            </li> --}} -->
                                        </ul>
                                        <button class="btn-next">
                                            <i class="fa-solid fa-angle-right el-icon"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="sidebar-appointment">
                                <div class="sidebar">
                                    <div class="sidebar__header">
                                        <div class="sidebar__header__title semi-bold flex-center">
                                            Thông Tin Chi Tiết
                                        </div>
                                        <div class="sidebar__header__actions">
                                            <div class="adm-actions__drop-down ml-2">
                                                <div class="el-dropdown">
                                                    <button
                                                        style="color: #14233d;background-color: transparent;border: none;"
                                                        class="adm-button adm-button__borderless__grey adm-button__size__small is-icon-only el-dropdown-selfdefine">
                                                        <span class="adm-button__icon-wrapper">
                                                            <i class="fa-solid fa-ellipsis"></i>
                                                        </span>
                                                    </button>
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
                                            <div
                                                class="adm-appointment-info-section adm-appointment-info-section-datetime">
                                                <div class="adm-appointment-info-section__header">
                                                    <i class="fa-regular fa-calendar"
                                                        style="color: #005aee;font-size:20px"></i>
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
                                                    style="background-image: url(http://localhost:9090/client/images/1652612227642.jpg); color: rgb(36, 112, 172);">
                                                </div>
                                                <div class="adm-appointment-info-section-employee__text">
                                                    <div class="adm-appointment-info-section-employee__text__title">Nhân
                                                        viên
                                                        thực hiện</div>
                                                    <div class="adm-appointment-info-section-employee__text__name">
                                                        <span>Thắng Võ</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div
                                                class="adm-appointment-info-section adm-appointment-info-section-customers">
                                                <div class="adm-appointment-info-section__header">
                                                    <i
                                                        class="fa-regular fa-user adm-icon adm-icon__medium adm-icon__primary"></i>
                                                    <span class="adm-appointment-info-section__header__title">Khách
                                                        Hàng</span>
                                                </div>
                                                <div class="adm-appointment-info-section__content">
                                                    <div class="adm-appointment-info-section-customers__item">
                                                        <div class="adm-appointment-info-section-customers__item__name">
                                                            <span>Hoàng Nguyễn</span>
                                                        </div>
                                                        <div
                                                            class="adm-appointment-info-section-customers__item__email">
                                                            <span>minhhoang@gmail.com</span>
                                                        </div>
                                                        <div
                                                            class="adm-appointment-info-section-customers__item__phone">
                                                            <span>0879229094</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div
                                                class="adm-appointment-info-section adm-appointment-info-section-customers">
                                                <div class="adm-appointment-info-section__header">
                                                    <i
                                                        class="fa-solid fa-chair adm-icon adm-icon__medium adm-icon__primary"></i>
                                                    <span class="adm-appointment-info-section__header__title">Dịch
                                                        vụ</span>
                                                </div>
                                                <div class="adm-appointment-info-section__content">
                                                    <div
                                                        class="adm-appointment-info-section-customers__item service-list__book">
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
                                                data-target="#alertModalDelete"
                                                class="adm-button adm-button-size__medium"
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
                            </div>
                        </div>


                        <div class="dashboard-performance-stats dashboard-page__central-stats__performance">
                            <div class="dashboard-performance-stats__header">
                                <div>Thành Tích</div>
                                <div class="dashboard-performance-stats__header__right">
                                    <div class="el-dropdown">
                                        <button aria-haspopup="true" aria-expanded="false" data-toggle="dropdown"
                                            class="adm-button adm-button__borderless__dark adm-button__size__micro is-icon-end el-dropdown-selfdefine"
                                            id="dropdownMenuButton">
                                            <span class="text-time-performance">Tuần hiện tại</span>

                                            <i class="fa-solid fa-angle-down"></i>
                                        </button>
                                        <ul class="dropdown-menu el-scrollbar__view el-select-dropdown__list"
                                            aria-labelledby="dropdownMenuButton">
                                            <li style="padding-left:20px ;"
                                                class="el-select-dropdown__item adm-select-option item-time__performance">
                                                <span>Tuần hiện tại</span>
                                            </li>
                                            <li style="padding-left:20px ;"
                                                class="el-select-dropdown__item adm-select-option item-time__performance">
                                                <span>Tuần trước</span>
                                            </li>
                                            <li style="padding-left:20px ;"
                                                class="el-select-dropdown__item adm-select-option item-time__performance">
                                                <span>Tháng hiện tại</span>
                                            </li>
                                            <li style="padding-left:20px ;"
                                                class="el-select-dropdown__item adm-select-option item-time__performance">
                                                <span>Ba tháng trước</span>
                                            </li>
                                            <li style="padding-left:20px ;"
                                                class="el-select-dropdown__item adm-select-option item-time__performance">
                                                <span>Sáu tháng trước</span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="dashboard-performance-stats__menu">
                                    <div class="adm-menu adm-menu--horizontal">
                                        <ul class="el-menu--horizontal el-menu">
                                            <li
                                                class="el-menu-item adm-menu-item dashboard-performance-stats__menu__item is-active">
                                                Nhân Viên
                                            </li>
                                            <li class="el-menu-item adm-menu-item dashboard-performance-stats__menu__item"
                                                style="border-bottom-color: transparent;">
                                                Dịch Vụ
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="performance">
                                    <div class="dashboard-employee-performance-card dashboard-performance-stats__card">
                                        <div class="dashboard-employee-performance-card__header">
                                            <div style="background-image: url(https://babershop.admin.trafft.com/api/v1/public/media/3d9a8071-df4b-4b55-a05a-6f6a68371d21?size=avatar);color: rgb(19, 150, 110);"
                                                class="adm-avatar size-32 mr-3 ml-0">
                                            </div>
                                            Thắng Võ
                                        </div>
                                        <div class="dashboard-employee-performance-card__content">
                                            <div class="dashboard-employee-performance-card__content__item">
                                                Cuộc Hẹn
                                                <div class="dashboard-employee-performance-card__content__item__value">
                                                    3
                                                </div>
                                            </div>
                                            <div class="dashboard-employee-performance-card__content__item">
                                                Doanh Thu
                                                <div class="dashboard-employee-performance-card__content__item__value">
                                                    400.000đ
                                                </div>
                                            </div>
                                        </div>
                                        <div class="dashboard-employee-performance-card__chart">
                                            <div style="width:11.26%"></div>
                                        </div>
                                        <div class="dashboard-employee-performance-card__occupancy-percentage">
                                            <div
                                                class="dashboard-employee-performance-card__occupancy-percentage__title">
                                                Tỉ lệ số lịch hẹn</div>
                                            <div
                                                class="dashboard-employee-performance-card__occupancy-percentage__value">
                                                11.26%</div>
                                        </div>
                                    </div>
                                    <div class="dashboard-employee-performance-card dashboard-performance-stats__card">
                                        <div class="dashboard-employee-performance-card__header">
                                            <div style="background-image: url(https://babershop.admin.trafft.com/api/v1/public/media/3d9a8071-df4b-4b55-a05a-6f6a68371d21?size=avatar);color: rgb(19, 150, 110);"
                                                class="adm-avatar size-32 mr-3 ml-0">
                                            </div>
                                            Thắng Võ
                                        </div>
                                        <div class="dashboard-employee-performance-card__content">
                                            <div class="dashboard-employee-performance-card__content__item">
                                                Cuộc Hẹn
                                                <div class="dashboard-employee-performance-card__content__item__value">
                                                    3
                                                </div>
                                            </div>
                                            <div class="dashboard-employee-performance-card__content__item">
                                                Doanh Thu
                                                <div class="dashboard-employee-performance-card__content__item__value">
                                                    400.000đ
                                                </div>
                                            </div>
                                        </div>
                                        <div class="dashboard-employee-performance-card__chart">
                                            <div style="width:11.26%"></div>
                                        </div>
                                        <div class="dashboard-employee-performance-card__occupancy-percentage">
                                            <div
                                                class="dashboard-employee-performance-card__occupancy-percentage__title">
                                                Tỉ lệ số lịch hẹn</div>
                                            <div
                                                class="dashboard-employee-performance-card__occupancy-percentage__value">
                                                11.26%</div>
                                        </div>
                                    </div>
                                    <div class="dashboard-employee-performance-card dashboard-performance-stats__card">
                                        <div class="dashboard-employee-performance-card__header">
                                            <div style="background-image: url(https://babershop.admin.trafft.com/api/v1/public/media/3d9a8071-df4b-4b55-a05a-6f6a68371d21?size=avatar);color: rgb(19, 150, 110);"
                                                class="adm-avatar size-32 mr-3 ml-0">
                                            </div>
                                            Văn Tình
                                        </div>
                                        <div class="dashboard-employee-performance-card__content">
                                            <div class="dashboard-employee-performance-card__content__item">
                                                Cuộc Hẹn
                                                <div class="dashboard-employee-performance-card__content__item__value">
                                                    3
                                                </div>
                                            </div>
                                            <div class="dashboard-employee-performance-card__content__item">
                                                Doanh Thu
                                                <div class="dashboard-employee-performance-card__content__item__value">
                                                    4.500.000đ
                                                </div>
                                            </div>
                                        </div>
                                        <div class="dashboard-employee-performance-card__chart">
                                            <div style="width:80.74%"></div>
                                        </div>
                                        <div class="dashboard-employee-performance-card__occupancy-percentage">
                                            <div
                                                class="dashboard-employee-performance-card__occupancy-percentage__title">
                                                Tỉ lệ số lịch hẹn</div>
                                            <div
                                                class="dashboard-employee-performance-card__occupancy-percentage__value">
                                                80.74%</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>

            </div>

        </div>


        <!-- {{!-- Modal --}} -->
        <div class="modal fade" id="info-manager__modal" tabindex="-1" role="dialog"
            aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document"
                style="margin-top: 70px; width: 1200px ; max-width:1200px">
                <div class="modal-content">
                    <div class="el-dialog__header">
                        <span class="adm-modal-title tittle-employee">
                            Thông Tin Cá Nhân
                        </span>
                        <button id="close-add__employee" type="button" class="close" data-dismiss="modal"
                            aria-label="Close" style="outline: none;">
                            <span aria-hidden="true">&times;</span>
                    </div>
                    <div class="el-dialog__body">
                        <form class="el-form" id="editManagerForm" action="employee/edit-manager-with-img" method="post"
                            enctype="multipart/form-data">
                            <div class="flex">
                                <div class="mr-4">
                                    <div class="adm-form-item">
                                        <div class="el-form-item">
                                            <div class="el-form-item__content">
                                                <div class="avatar-uploader">
                                                    <div class="el-upload-available">
                                                        <div class="el-upload el-upload--picture">
                                                            <div class="el-upload-dragger">
                                                                <div class="el-upload-dragger__upload">
                                                                    <div>
                                                                        <i
                                                                            class="el-icon-upload fa-solid fa-cloud-arrow-up"></i>
                                                                        <div class="el-upload__text mt-2">
                                                                            Nhấn vào để tải ảnh lên
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <input type="file" name="file"
                                                                accept="image/png, image/jpeg" class="el-upload__input">
                                                        </div>
                                                    </div>
                                                </div>
                                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                                    xmlns="http://www.w3.org/2000/svg" svg-inline
                                                    class="avatar-uploader__trash">
                                                    <path
                                                        d="M19.5 7h-4.167V5.608a2.017 2.017 0 00-2.083-1.941h-2.5a2.017 2.017 0 00-2.083 1.941V7H4.5a.833.833 0 000 1.667h.833v9.166a2.5 2.5 0 002.5 2.5h8.334a2.5 2.5 0 002.5-2.5V8.667h.833A.833.833 0 0019.5 7zm-9.167-1.392c0-.133.175-.275.417-.275h2.5c.242 0 .417.142.417.275V7h-3.334V5.608zM17 17.833a.833.833 0 01-.833.834H7.833A.833.833 0 017 17.833V8.667h10v9.166z"
                                                        fill="#005AEE" class="customize-fill"></path>
                                                    <path
                                                        d="M9.5 16.167a.833.833 0 00.833-.834V12a.834.834 0 00-1.666 0v3.333a.833.833 0 00.833.834zM14.5 16.167a.833.833 0 00.833-.834V12a.834.834 0 00-1.666 0v3.333a.834.834 0 00.833.834z"
                                                        fill="#005AEE" class="customize-fill"></path>
                                                </svg>
                                            </div>
                                        </div>
                                        <div class="adm-form-item__error mt-3"
                                            style="display: flex;justify-content: center;">

                                            <!-- {{!-- Bạn vui lòng nhập tên danh mục --}} -->
                                        </div>
                                    </div>
                                </div>
                                <div class="flex-grow">
                                    <div class="el-row" style="margin-left: -8px; margin-right: -8px;height: 116px;">
                                        <div class="el-col el-col-24 el-col-sm-12"
                                            style="padding-left: 8px; padding-right: 8px;">
                                            <div class="adm-form-item">
                                                <div class="el-form-item is-success is-required">
                                                    <label for="name" class="el-form-item__label">
                                                        Họ Nhân Viên
                                                    </label>
                                                    <div class="el-form-item__content">
                                                        <div class="adm-input-wrapper">
                                                            <div
                                                                class="el-input el-input__default adm-input adm-input__size-default">
                                                                <input id="input-surname-employee" type="text"
                                                                    autocomplete="nope" maxlength="50" iconstart iconend
                                                                    rows="2" name="surname" tags class="el-input__inner"
                                                                    placeholder="Nhập họ của nhân viên">
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
                                                        Tên Nhân Viên
                                                    </label>
                                                    <div class="el-form-item__content">
                                                        <div class="adm-input-wrapper">
                                                            <div
                                                                class="el-input el-input__default adm-input adm-input__size-default">
                                                                <input id="input-name-employee" type="text"
                                                                    autocomplete="nope" maxlength="50" iconstart iconend
                                                                    rows="2" name="name_employee" tags
                                                                    class="el-input__inner"
                                                                    placeholder="Nhập tên của nhân viên">
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
                                                        CCCD/CMND
                                                    </label>
                                                    <div class="el-form-item__content">
                                                        <div class="adm-input-wrapper">
                                                            <div
                                                                class="el-input el-input__default adm-input adm-input__size-default">
                                                                <input maxlength="12" id="input-cccd-employee"
                                                                    type="text" autocomplete="off"
                                                                    class="el-input__inner"
                                                                    placeholder="Nhập Căn Cước Công Dân" name="cccd">
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
                                                        Email
                                                    </label>
                                                    <div class="el-form-item__content">
                                                        <div class="adm-input-wrapper">
                                                            <div
                                                                class="el-input el-input__default adm-input adm-input__size-default">
                                                                <input id="input-email-employee" type="text"
                                                                    autocomplete="nope" maxlength="100" iconstart
                                                                    iconend rows="2" name="email" tags
                                                                    class="el-input__inner"
                                                                    placeholder="nhanvien@abcxyz.com">
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
                                                                <input id="input-phone-employee" type="text"
                                                                    autocomplete="nope" maxlength="10" iconstart iconend
                                                                    rows="2" name="phone" tags class="el-input__inner"
                                                                    placeholder="Số Điện Thoại">
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
                            <input type="text" name="idManager" style="display:none">
                        </form>
                    </div>
                    <div class="modal-footer" style="justify-content: flex-end !important">
                        <button id="adm-btn-employee__close" data-dismiss="modal"
                            class="adm-button adm-button__filled__grey adm-button-size__medium" style="border:none">
                            <span>Đóng</span>
                        </button>
                        <button id="adm-btn-employee"
                            class="adm-button adm-button__filled__blue adm-button-size__medium ml-3"
                            style="border:none">
                            <span>Lưu Thay Đổi</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>


        <div id="toast" style="z-index:99999">
            <div id="img"></div>
            <div id="desc"></div>
        </div>

</body>

</html>
<script src="https://momentjs.com/downloads/moment.js"></script>
<script src="https://cdn.jsdelivr.net/npm/lodash@4.17.20/lodash.min.js"></script>
<script>
    const rawShifts = ${rawShifts};
    const rawBookItems = ${rawBookItems};
</script>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script src="https://pagination.js.org/dist/2.1.5/pagination.min.js"></script>
<script src="client/script/staff/dashboard.js">
</script>