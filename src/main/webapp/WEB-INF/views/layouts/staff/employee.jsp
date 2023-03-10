<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="client/fonts/icomoon/style.css">

    <link rel="stylesheet" href="client/css/rome.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="client/css/bootstrap.min.css">

    <!-- Style -->
    <link rel="stylesheet" href="client/css/style.css">
    <link rel="stylesheet" href="client/css/mainstaff.css">
    <link rel="stylesheet" href="client/css/service-dashboard.css">
    <link rel="stylesheet" href="client/css/employee.css">
    <link rel="stylesheet" href="client/font/css/all.min.css">

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
            <span>??i???u Khi???n</span>
            <a href="service?idStore=${idStore}" class="service-link d-none">
                <svg id=" service" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5"
                    stroke-linecap="round" stroke-linejoin="round">
                    <path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5" />
                </svg>
            </a>
            <span class="service-span d-none">D???ch V???</span>
            <a href="employee?idStore=${idStore}">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"
                    v-bind:svg-inline="''" v-bind:role="'presentation'" v-bind:focusable="'false'"
                    v-bind:tabindex="'-1'">
                    <path class="customize-fill" fill-rule="evenodd" clip-rule="evenodd"
                        d="M3.401 6.022A3.312 3.312 0 006.71 9.331a3.312 3.312 0 003.31-3.309 3.312 3.312 0 00-3.31-3.308A3.311 3.311 0 003.4 6.022zm3.305-1.441c-.794 0-1.44.647-1.44 1.441s.646 1.441 1.44 1.441c.794 0 1.442-.647 1.442-1.44 0-.795-.648-1.442-1.442-1.442zM23.04 18.507a.96.96 0 010 1.922H.96a.962.962 0 010-1.922H17.86l3.177-7.264a.252.252 0 00-.017-.247.245.245 0 00-.21-.116h-8.337c-.101 0-.191.058-.231.149l-2.735 6.135-.135.088H5.883a.961.961 0 110-1.921H8.22l.876-1.968a3.731 3.731 0 00-2.509-.988c-2.079 0-3.772 1.713-3.772 3.816a.93.93 0 01-.925.934.93.93 0 01-.926-.934c0-3.134 2.522-5.683 5.623-5.683 1.18 0 2.319.378 3.293 1.094l.605-1.354a2.175 2.175 0 011.988-1.29h8.336c.738 0 1.42.37 1.824.99.403.622.463 1.396.161 2.07l-2.835 6.49h3.082z"
                        fill="#005AEE"></path>
                </svg>
            </a>
            <span>Nh??n Vi??n</span>
            <a href="booking?idStore=${idStore}">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"
                    v-bind:svg-inline="''" v-bind:role="'presentation'" v-bind:focusable="'false'"
                    v-bind:tabindex="'-1'">
                    <path class="customize-fill"
                        d="M17.6 4.32h-.933v-.96c0-.576-.374-.96-.934-.96s-.933.384-.933.96v.96H9.2v-.96c0-.576-.373-.96-.933-.96s-.934.384-.934.96v.96H6.4c-1.587 0-2.8 1.248-2.8 2.88v11.52c0 1.632 1.213 2.88 2.8 2.88h11.2c1.587 0 2.8-1.248 2.8-2.88V7.2c0-1.632-1.213-2.88-2.8-2.88zm.933 5.184V18.72c0 .576-.373.96-.933.96H6.4c-.56 0-.933-.384-.933-.96V7.2c0-.576.373-.96.933-.96h.933v.96c0 .576.374.96.934.96s.933-.384.933-.96v-.96h5.6v.96c0 .576.373.96.933.96s.934-.384.934-.96v-.96h.933c.56 0 .933.384.933.96v2.304z"
                        fill="#005AEE"></path>
                </svg>
            </a>
            <span>L???ch H???n</span>
            <a href="customer?idStore=${idStore}">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"
                    v-bind:svg-inline="''" v-bind:role="'presentation'" v-bind:focusable="'false'"
                    v-bind:tabindex="'-1'">
                    <path class="customize-fill"
                        d="M9.002 11a4 4 0 100-8 4 4 0 000 8zm0-6a2 2 0 110 4 2 2 0 010-4zM17.002 13a3 3 0 100-6 3 3 0 000 6zm0-4a1 1 0 110 2 1 1 0 010-2zM17.002 14a5 5 0 00-3.06 1.05A7 7 0 002.002 20a1 1 0 102 0 5 5 0 1110 0 1 1 0 102 0 6.9 6.9 0 00-.86-3.35 3 3 0 014.86 2.35 1 1 0 102 0 5 5 0 00-5-5z"
                        fill="#005AEE"></path>
                </svg>
            </a>
            <span>Kh??ch H??ng</span>
            <a href="shift?idStore=${idStore}">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                    class="bi bi-calendar-check" viewBox="0 0 16 16">
                    <path
                        d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z" />
                    <path
                        d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z" />
                </svg>
            </a>
            <span>L???ch L??m Vi???c</span>
            <a href="" id="log-out">
                <svg viewBox="0 0 512 512" fill="currentColor">
                    <path
                        d="M255.2 468.6H63.8a21.3 21.3 0 01-21.3-21.2V64.6c0-11.7 9.6-21.2 21.3-21.2h191.4a21.2 21.2 0 100-42.5H63.8A63.9 63.9 0 000 64.6v382.8A63.9 63.9 0 0063.8 511H255a21.2 21.2 0 100-42.5z" />
                    <path
                        d="M505.7 240.9L376.4 113.3a21.3 21.3 0 10-29.9 30.3l92.4 91.1H191.4a21.2 21.2 0 100 42.6h247.5l-92.4 91.1a21.3 21.3 0 1029.9 30.3l129.3-127.6a21.3 21.3 0 000-30.2z" />
                </svg>
            </a>
            <span>????ng Xu???t</span>
        </div>
        <div class="main-container" style="display: block">
            <div class="user-box third-box service-box">
                <div class="adm-services">
                    <div class="adm-page-header">
                        <div class="adm-page-header__content">
                            <div class="adm-page-header__title">
                                <span class="adm-header__label">Nh??n Vi??n</span>
                            </div>
                            <div class="align-right">
                                <button data-toggle="modal" data-target="#add-employee_modal" class="adm-button"
                                    id="btn-AddEmployee">
                                    <span class="adm-button__icon-wrapper">
                                        <i class="fa-solid fa-plus"></i>
                                    </span>
                                    <span>Th??m Nh??n Vi??n</span>
                                </button>
                                <button data-toggle="modal" data-target="#add-regisShift" class="adm-button ml-4"
                                    id="btn-AddRegisShift">
                                    <span class="adm-button__icon-wrapper">
                                        <i class="fa-solid fa-plus"></i>
                                    </span>
                                    <span>Th??m Ng??y L??m Vi???c</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="page-content">
                <div class="service-and-category">
                    <div class="services-list">
                        <div class="mb-3 el-row is-justify-space-between is-align-middle el-row--flex">
                            <div class="adm-input-wrapper filter-search">
                                <div
                                    class="el-input el-input--medium el-input--prefix adm-input adm-input__size__medium is-icon-start">
                                    <input id="search_employee" type="text" placeholder="T??m ki???m"
                                        class="el-input__inner">
                                    <span class="el-input__prefix">
                                        <i
                                            class="adm-icon adm-icon__medium adm-icon__primary fa-solid fa-magnifying-glass"></i>
                                    </span>
                                </div>
                            </div>
                            <div class="el-tooltip adm-toggle-filters">
                                <button
                                    class="adm-button adm-button__filled__grey adm-button__size__medium is-icon-start">
                                    <span class="adm-button__icon-wrapper">
                                        <i class="fa-solid fa-filter"></i>
                                    </span>
                                    <span>L???c</span>
                                </button>
                            </div>
                        </div>
                        <div>
                            <div class="services-list-header">
                                <h5>T???t C??? Nh??n Vi??n <span>(${totalEmployee})</span></h5>
                            </div>
                            <div class="services-list-content">
                                <div class="service-list">
                                    <div class="head-row">
                                        <div class="el-row" style="margin-left: -8px; margin-right: -8px; height:32px">
                                            <div class="el-col el-col-24 el-col-sm-7"
                                                style="padding-left: 8px; padding-right: 8px;">
                                                <p>T??n</p>
                                            </div>
                                            <div class="el-col el-col-24 el-col-sm-4"
                                                style="padding-left: 8px; padding-right: 8px;">
                                                <p>Tr???ng Th??i</p>
                                            </div>
                                            <div class="el-col el-col-24 el-col-sm-4"
                                                style="padding-left: 8px; padding-right: 8px;">
                                                <p>??i???n tho???i</p>
                                            </div>
                                            <div class="el-col el-col-24 el-col-sm-4"
                                                style="padding-left: 8px; padding-right: 8px;">
                                                <p>Email</p>
                                            </div>
                                            <div class="el-col el-col-24 el-col-sm-4"
                                                style="padding-left: 8px; padding-right: 8px;">
                                                <p>Chi nh??nh</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <div>
                                        <c:forEach items="${employees}" var="e">
	                                        <div class="adm-service" data-employee=${e.idStaff}
	                                                data-manager="${e.idManager}"
	                                                style="border-color: rgb(192, 235, 117);background-color: #182e5b;">
	                                                <div class="adm-service__data">
	                                                    <div class="flex-center el-row is-align-middle"
	                                                        style="margin-left: -8px; margin-right: -8px;">
	                                                        <div class="service-name-col el-col el-col-24 el-col-sm-7"
	                                                            style="padding-left: 8px; padding-right: 8px;">
	                                                            <div class="overflow-ellipsis flex-center">
	                                                                <div class="adm-avatar size-40 margin-right--10 margin-left--0"
	                                                                    style="background-image: url(
	                                                                            ${e.pathImgStaff});
	                                                                            border: 3px solid rgb(255, 255, 255); color:
	                                                                            rgb(19, 150, 110); z-index: 5;">
	                                                                </div>
	                                                                <h5 class="overflow-ellipsis mb-0 name_employee"
	                                                                    style="font-size: 15px;">
	                                                                    ${e.surName} ${e.nameStaff}
	                                                                </h5>
	                                                            </div>
	                                                        </div>
	
	                                                        <div class="el-col el-col-24 el-col-sm-4"
	                                                            style="padding-left: 8px; padding-right: 8px;">
	                                                            <div class="status is-green">
	                                                                <svg viewBox="0 0 24 24" fill="none"
	                                                                    stroke="currentColor" stroke-width="2"
	                                                                    stroke-linecap="round" stroke-linejoin="round">
	                                                                    <path d="M20 6L9 17l-5-5"
	                                                                        data-employee=${e.idStaff} />
	                                                                </svg>
	                                                                <span class="status-text">${e.status}</span>
	                                                            </div>
	                                                        </div>
	                                                        <div class="el-col el-col-24 el-col-sm-4"
	                                                            style="padding-left: 8px; padding-right: 8px;">
	                                                            <span class="employee_phone">${e.phone}</span>
	                                                        </div>
	                                                        <div class="el-col el-col-24 el-col-sm-4 relative"
	                                                            style="padding-left: 8px; padding-right: 8px;">
	                                                            <span>${e.email}</span>
	                                                        </div>
	                                                        <div class="el-col el-col-24 el-col-sm-4 relative"
	                                                            style="padding-left: 38px; padding-right: 8px;">
	                                                            <span>${e.store.idStore}</span>
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
	                                                                        style="left: -50px !important; opactity: 1 !important;"
	                                                                        aria-labelledby="dropdownMenuButton">
	                                                                        <li data-employee=${e.idStaff}
	                                                                            data-manager=${e.idManager}
	                                                                            class="dropdown-item el-dropdown-menu edit-employee"
	                                                                            data-target="" data-toggle="modal">
	                                                                            <div
	                                                                                class="adm-dropdown-item__wrapper is-with-icon">
	                                                                                <div class="adm-dropdown-item__icon">
	                                                                                    <i class="fa-solid fa-pencil"></i>
	                                                                                </div>
	                                                                                <div class="adm-dropdown-item__label">
	                                                                                    Ch???nh s???a
	                                                                                </div>
	                                                                            </div>
	                                                                        </li>
	                                                                        <li data-employee=${e.idStaff}
	                                                                            class="dropdown-item el-dropdown-menu disable-employee">
	                                                                            <div
	                                                                                class="adm-dropdown-item__wrapper is-with-icon">
	                                                                                <div class="adm-dropdown-item__icon">
	                                                                                    <i
	                                                                                        class="fa-solid fa-ban icon-disable"></i>
	                                                                                </div>
	                                                                                <div
	                                                                                    class="adm-dropdown-item__label text-disable">
	                                                                                    T???m ngh???
	                                                                                </div>
	                                                                            </div>
	                                                                        </li>
	                                                                        <li data-toggle="modal"
	                                                                            data-target="#alertModalDelete"
	                                                                            data-employee=${e.idStaff}
	                                                                            class=" dropdown-item el-dropdown-menu delete-employee">
	                                                                            <div
	                                                                                class="adm-dropdown-item__wrapper is-red is-with-icon">
	                                                                                <div class="adm-dropdown-item__icon">
	                                                                                    <i
	                                                                                        class="fa-solid fa-trash-can"></i>
	                                                                                </div>
	                                                                                <div class="adm-dropdown-item__label">
	                                                                                    X??a
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

        <!-- {{!-- Modal add employee --}} -->
        <div class="modal fade" id="add-employee_modal" tabindex="-1" role="dialog"
            aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document"
                style="margin-top: 70px; width: 1200px ; max-width:1200px">
                <div class="modal-content">
                    <div class="el-dialog__header">
                        <span class="adm-modal-title tittle-employee">
                            T???o Nh??n Vi??n
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
                                                                            Nh???n v??o ????? t???i ???nh l??n
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

                                            <!-- {{!-- B???n vui l??ng nh???p t??n danh m???c --}} -->
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
                                                        H??? Nh??n Vi??n
                                                    </label>
                                                    <div class="el-form-item__content">
                                                        <div class="adm-input-wrapper">
                                                            <div
                                                                class="el-input el-input__default adm-input adm-input__size-default">
                                                                <input id="input-surname-employee__add" type="text"
                                                                    autocomplete="nope" maxlength="50" iconstart iconend
                                                                    rows="2" name="surname" tags class="el-input__inner"
                                                                    placeholder="Nh???p h??? c???a nh??n vi??n">
                                                            </div>
                                                        </div>
                                                        <div class="adm-form-item__error">
                                                            <!-- {{!-- B???n vui l??ng nh???p t??n danh m???c --}} -->
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
                                                        T??n Nh??n Vi??n
                                                    </label>
                                                    <div class="el-form-item__content">
                                                        <div class="adm-input-wrapper">
                                                            <div
                                                                class="el-input el-input__default adm-input adm-input__size-default">
                                                                <input id="input-name-employee__add" type="text"
                                                                    autocomplete="nope" maxlength="50" iconstart iconend
                                                                    rows="2" name="name_employee" tags
                                                                    class="el-input__inner"
                                                                    placeholder="Nh???p t??n c???a nh??n vi??n">
                                                            </div>
                                                        </div>
                                                        <div class="adm-form-item__error">
                                                            <!-- {{!-- B???n vui l??ng nh???p t??n danh m???c --}} -->
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="el-row" style="margin-left: -8px; margin-right: -8px;height: 116px;">
                                        <div class="el-col el-col-24 el-col-sm-24"
                                            style="padding-left: 8px; padding-right: 8px;">
                                            <div class="adm-form-item">
                                                <div class="el-form-item is-success is-required">
                                                    <label for="name" class="el-form-item__label">
                                                        Ch???n D???ch V??? Cho Ph??p
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
                                                                                Nguy???n B???o Trung
                                                                            </span>
                                                                            <i class="el-tag__close el-icon-close">
                                                                            </i>
                                                                        </span> --}} -->
                                                                    </span>
                                                                </div>
                                                                <div class="el-input" id="input-employee__service">
                                                                    <input id="input-service_assign__add" type="text"
                                                                        readonly="readonly" autocomplete="off"
                                                                        class="el-input__inner pointer"
                                                                        placeholder="Ch???n D???ch V??? Cho Ph??p">
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
                                                            <!-- {{!-- B???n vui l??ng nh???p t??n danh m???c --}} -->
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="el-row" style="margin-left: -8px; margin-right: -8px;height: 116px;">
                                        <div class="el-col el-col-24 el-col-sm-12"
                                            style="padding-left: 8px; padding-right: 8px; display:none">
                                            <div class="adm-form-item">
                                                <div class="el-form-item is-success is-required">
                                                    <label for="name" class="el-form-item__label">
                                                        C???a H??ng
                                                    </label>
                                                    <div class="el-form-item__content">
                                                        <div class="adm-input-wrapper">
                                                            <div
                                                                class="el-input el-input__default adm-input adm-input__size-default">
                                                                <input id="input-store-employee__add" type="text"
                                                                    readonly="readonly" autocomplete="off"
                                                                    class="el-input__inner pointer"
                                                                    placeholder="Ch???n C???a H??ng" name=""
                                                                    style="text-overflow: ellipsis;padding: 0px 40px 0px 12px;"
                                                                    ;>
                                                                <span class="el-input__suffix">
                                                                    <span class="el-input__suffix__inner">
                                                                        <i style="display:flex;align-items: center;justify-content: center;"
                                                                            class="fa-solid fa-angle-up el-select__caret el-input__icon"></i>
                                                                    </span>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="adm-form-item__error">
                                            <!-- {{!-- B???n vui l??ng nh???p t??n danh m???c --}} -->
                                        </div>
                                        <div class="el-col el-col-24 el-col-sm-12"
                                            style="padding-left: 8px; padding-right: 8px;">
                                            <div class="adm-form-item">
                                                <div class="el-form-item is-success is-required">
                                                    <label for="name" class="el-form-item__label">
                                                        Qu???n L??
                                                    </label>
                                                    <div class="el-form-item__content">
                                                        <div class="adm-input-wrapper">
                                                            <div
                                                                class="el-input el-input__default adm-input adm-input__size-default">
                                                                <input id="input-manager-employee__add" type="text"
                                                                    readonly="readonly" autocomplete="off"
                                                                    class="el-input__inner pointer"
                                                                    placeholder="Ch???n Ng?????i Qu???n L??"
                                                                    name="manager_name">
                                                                <span class="el-input__suffix">
                                                                    <span class="el-input__suffix__inner">
                                                                        <i style="display:flex;align-items: center;justify-content: center;"
                                                                            class="fa-solid fa-angle-up el-select__caret el-input__icon"></i>
                                                                    </span>
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <div class="adm-form-item__error">
                                                            <!-- {{!-- B???n vui l??ng nh???p t??n danh m???c --}} -->
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
                                                                <input maxlength="12" id="input-cccd-employee__add"
                                                                    type="text" autocomplete="off"
                                                                    class="el-input__inner"
                                                                    placeholder="Nh???p C??n C?????c C??ng D??n" name="cccd">
                                                            </div>
                                                        </div>
                                                        <div class="adm-form-item__error">
                                                            <!-- {{!-- B???n vui l??ng nh???p t??n danh m???c --}} -->
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="el-col el-col-24 el-col-sm-25"
                                            style="padding-left: 8px; padding-right: 8px;">
                                            <div class="adm-form-item">
                                                <div class="el-form-item is-success is-required">
                                                    <label for="name" class="el-form-item__label">
                                                        Lo???i Nh??n Vi??n
                                                    </label>
                                                    <div class="el-form-item__content">
                                                        <div class="adm-input-wrapper">
                                                            <div
                                                                class="el-input el-input__default adm-input adm-input__size-default">
                                                                <input id="input-type-employee__add" type="text"
                                                                    readonly="readonly" autocomplete="off"
                                                                    class="el-input__inner pointer"
                                                                    placeholder="Ch???n Lo???i Nh??n Vi??n" name="type_staff">
                                                                <span class="el-input__suffix">
                                                                    <span class="el-input__suffix__inner">
                                                                        <i style="display:flex;align-items: center;justify-content: center;"
                                                                            class="fa-solid fa-angle-up el-select__caret el-input__icon"></i>
                                                                    </span>
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <div class="adm-form-item__error">
                                                            <!-- {{!-- B???n vui l??ng nh???p t??n danh m???c --}} -->
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="el-col el-col-24 el-col-sm-25"
                                            style="padding-left: 8px; padding-right: 8px;">
                                            <div class="adm-form-item">
                                                <div class="el-form-item is-success is-required">
                                                    <label for="name" class="el-form-item__label">
                                                        Gi???i T??nh
                                                    </label>
                                                    <div class="el-form-item__content">
                                                        <div class="adm-input-wrapper">
                                                            <div
                                                                class="el-input el-input__default adm-input adm-input__size-default">
                                                                <input id="input-sex-employee__add" type="text"
                                                                    readonly="readonly" autocomplete="off"
                                                                    class="el-input__inner pointer"
                                                                    placeholder="Ch???n Gi???i T??nh" name="sex">
                                                                <span class="el-input__suffix">
                                                                    <span class="el-input__suffix__inner">
                                                                        <i style="display:flex;align-items: center;justify-content: center;"
                                                                            class="fa-solid fa-angle-up el-select__caret el-input__icon"></i>
                                                                    </span>
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <div class="adm-form-item__error">
                                                            <!-- {{!-- B???n vui l??ng nh???p t??n danh m???c --}} -->
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
                                                        Email
                                                    </label>
                                                    <div class="el-form-item__content">
                                                        <div class="adm-input-wrapper">
                                                            <div
                                                                class="el-input el-input__default adm-input adm-input__size-default">
                                                                <input id="input-email-employee__add" type="text"
                                                                    autocomplete="nope" maxlength="100" iconstart
                                                                    iconend rows="2" name="email" tags
                                                                    class="el-input__inner"
                                                                    placeholder="nhanvien@abcxyz.com">
                                                            </div>
                                                        </div>
                                                        <div class="adm-form-item__error">
                                                            <!-- {{!-- B???n vui l??ng nh???p t??n danh m???c --}} -->
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
                                                        S??? ??i???n Tho???i
                                                    </label>
                                                    <div class="el-form-item__content">
                                                        <div class="adm-input-wrapper">
                                                            <div
                                                                class="el-input el-input__default adm-input adm-input__size-default">
                                                                <input id="input-phone-employee__add" type="text"
                                                                    autocomplete="nope" maxlength="10" iconstart iconend
                                                                    rows="2" name="phone" tags class="el-input__inner"
                                                                    placeholder="S??? ??i???n Tho???i">
                                                            </div>
                                                        </div>
                                                        <div class="adm-form-item__error">
                                                            <!-- {{!-- B???n vui l??ng nh???p t??n danh m???c --}} -->
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
                            <input type="text" id="idStore" name="store_id" style="display:none">
                        </form>
                    </div>
                    <div class="modal-footer" style="justify-content: flex-end !important">
                        <button id="adm-btn-employee__close" data-dismiss="modal"
                            class="adm-button adm-button__filled__grey adm-button-size__medium" style="border:none">
                            <span>????ng</span>
                        </button>
                        <button id="adm-btn-employee__add"
                            class="adm-button adm-button__filled__blue adm-button-size__medium ml-3"
                            style="border:none">
                            <span>Th??m Nh??n Vi??n</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- {{!-- Modal alert --}}
        {{!-- alert confirm delete employee --}} -->
        <div class="modal fade" id="alertModalDelete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header" style="border:none;padding-bottom:0">
                        <h5 class="modal-title" id="alertModalLabel">X??a Nh??n Vi??n</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body notification-employe_delete" style="padding-bottom:5px">
                        <p>B???n c?? ch???c ch???n mu???n x??a nh??n vi??n n??y? H??nh ?????ng n??y s??? l??m m???t v??nh vi???n d??? li???u li??n quan
                            c???a
                            nh??n vi??n n??y.</p>
                    </div>
                    <div class="modal-footer">
                        <button data-dismiss="modal" class="adm-button adm-button__filled__grey adm-button-size__medium"
                            style="border:none;height:36px">
                            <span>????ng</span>
                        </button>
                        <button id="btn-delete__employee"
                            class="adm-button adm-button__filled__red adm-button-size__medium ml-3"
                            style="border:none;height:36px">
                            <span>X??a</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- {{!-- Modal regis shift --}} -->
        <div class="modal fade" id="add-regisShift" tabindex="-1" role="dialog"
            aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="el-dialog__header">
                        <span class="adm-modal-title">
                            ????ng K?? Th???i Gian L??m Vi???c
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
                                                Ng??y B???t ?????u
                                            </label>
                                            <div class="el-form-item__content">
                                                <div class="adm-input-wrapper">
                                                    <div
                                                        class="el-input el-input__default adm-input adm-input__size-default">
                                                        <input readonly="readonly" id="input_from" type="text"
                                                            autocomplete="nope" maxlength="200" iconstart iconend
                                                            rows="2" name tags class="el-input__inner pointer"
                                                            placeholder="Ch???n Ng??y B???t ?????u">
                                                    </div>
                                                </div>
                                                <div class="adm-form-item__error">
                                                    <!-- {{!-- B???n vui l??ng nh???p t??n danh m???c --}} -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="adm-form-item">
                                        <div class="el-form-item is-success is-required">
                                            <label for="name" class="el-form-item__label">
                                                Ng??y K???t Th??c
                                            </label>
                                            <div class="el-form-item__content">
                                                <div class="adm-input-wrapper">
                                                    <div
                                                        class="el-input el-input__default adm-input adm-input__size-default">
                                                        <input readonly="readonly" id="input_to" type="text"
                                                            autocomplete="nope" maxlength="300" iconstart iconend
                                                            rows="2" name tags class="el-input__inner pointer"
                                                            placeholder="Ch???n Ng??y K???t Th??c">
                                                    </div>
                                                </div>
                                                <div class="adm-form-item__error">
                                                    <!-- {{!-- B???n vui l??ng nh???p t??n danh m???c --}} -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="adm-form-item" style="display:none">
                                        <div class="el-form-item is-success is-required">
                                            <label for="name" class="el-form-item__label">
                                                C???a H??ng
                                            </label>
                                            <div class="el-form-item__content">
                                                <div class="adm-input-wrapper">
                                                    <div
                                                        class="el-input el-input__default adm-input adm-input__size-default">
                                                        <input id="input-store-regis-shift" type="text"
                                                            readonly="readonly" autocomplete="off"
                                                            class="el-input__inner pointer" placeholder="Ch???n C???a H??ng"
                                                            name=""
                                                            style="text-overflow: ellipsis;padding: 0px 40px 0px 12px;"
                                                            ;>
                                                        <span class="el-input__suffix">
                                                            <span class="el-input__suffix__inner">
                                                                <i style="display:flex;align-items: center;justify-content: center;"
                                                                    class="fa-solid fa-angle-up el-select__caret el-input__icon"></i>
                                                            </span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="adm-form-item__error">
                                            <!-- {{!-- B???n vui l??ng nh???p t??n danh m???c --}} -->
                                        </div>
                                    </div>
                                    <div class="adm-form-item">
                                        <div class="el-form-item is-success is-required">
                                            <label for="name" class="el-form-item__label">
                                                Ch???n Nh??n Vi??n ????ng K??
                                            </label>
                                            <div class="el-form-item__content">
                                                <div class="adm-select-wrapper">
                                                    <div
                                                        class="el-select el-select__default adm-select adm-select__size-default">
                                                        <div class="el-select__tags"
                                                            style="width: 50%; max-width: 400px;">
                                                            <span>
                                                                <!-- {{!-- <span
                                                                    class="el-tag el-tag--info el-tag--small el-tag--light">
                                                                    <span class="el-select__tags-text">
                                                                        Nguy???n B???o Trung
                                                                    </span>
                                                                    <i class="el-tag__close el-icon-close">
                                                                    </i>
                                                                </span> --}} -->
                                                            </span>
                                                        </div>
                                                        <div class="el-input" id="employee-regis__shift">
                                                            <input id="input-employee-regis__shift" type="text"
                                                                readonly="readonly" autocomplete="off"
                                                                class="el-input__inner pointer"
                                                                placeholder="Ch???n Nh??n Vi??n">
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
                                                    <!-- {{!-- B???n vui l??ng nh???p t??n danh m???c --}} -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button id="close-btn__addRegis" data-dismiss="modal"
                            class="adm-button adm-button__filled__grey adm-button-size__medium" style="border:none">
                            <span>????ng</span>
                        </button>
                        <button id="adm-add-regis_shift"
                            class="adm-button adm-button__filled__blue adm-button-size__medium ml-3"
                            style="border:none">
                            <span>Ho??n T???t</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <!-- {{!-- Drop down --}} -->
        <!-- {{!-- Dropdown Manager --}} -->
        <div class="el-select-dropdown el-popper adm-select-popper" id="dropdown-managers__employee"
            style="min-width: 450px; transform-origin: center bottom; z-index: 2026; display: none;">
            <div class="el-scrollbar">
                <div class="el-select-dropdown__wrap el-scrollbar__wrap"
                    style="margin-bottom: -17px; margin-right: -17px;">
                    <ul class="el-scrollbar__view el-select-dropdown__list">
                    <c:forEach items="${managers}" var="m">
                        <li data-manager="${m.idStaff}" data-store="${m.store.idStore}"
                            class="el-select-dropdown__item adm-select-option item-managers__dropdown">
                            <span>${m.surName} ${m.nameStaff}</span>
                        </li>     
                    </c:forEach>
                        <li class="el-select-dropdown__item adm-select-option no-data no-data__manager"
                            style="display:none; justify-content: center;cursor:default">
                            <span>Kh??ng c?? d??? li???u</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- {{!-- Dropdown sex --}} -->
        <div class="el-select-dropdown el-popper adm-select-popper" id="dropdown-sex__employee"
            style="min-width: 220px; transform-origin: center bottom; z-index: 2030; display: none;">
            <div class="el-scrollbar">
                <div class="el-select-dropdown__wrap el-scrollbar__wrap"
                    style="margin-bottom: -17px; margin-right: -17px;">
                    <ul class="el-scrollbar__view el-select-dropdown__list">
                        <li data-sex="Nam" class="el-select-dropdown__item adm-select-option item-sex__dropdown">
                            <span>Nam</span>
                        </li>
                        <li data-sex="N???" class="el-select-dropdown__item adm-select-option item-sex__dropdown">
                            <span>N???</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>


        <!-- {{!-- Dropdown service --}} -->
        <div class="el-select-dropdown el-popper adm-select-popper" id="dropdown-services__employee"
            style="min-width: 920px; transform-origin: center bottom; z-index: 2026; display: none;">
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

        <!-- {{!-- Dropdown TypeEmployee --}} -->
        <div class="el-select-dropdown el-popper adm-select-popper" id="dropdown-type__employee"
            style="min-width: 220px; transform-origin: center bottom; z-index: 2030; display: none;">
            <div class="el-scrollbar">
                <div class="el-select-dropdown__wrap el-scrollbar__wrap"
                    style="margin-bottom: -17px; margin-right: -17px;">
                    <ul class="el-scrollbar__view el-select-dropdown__list">
                    <c:forEach items="${typeEmployees}" var="t">
                    	<li data-type=${t.idTypeStaff}
                            class="el-select-dropdown__item adm-select-option item-type-employee__dropdown">
                            <span>${t.nameType}</span>
                        </li>
                    </c:forEach>
                    </ul>
                </div>
            </div>
        </div>

        <!-- {{!-- Dropdown Employee Regis --}} -->
        <div class="el-select-dropdown el-popper adm-select-popper" id="dropdown-employee__service"
            style="min-width: 450px; transform-origin: center bottom; z-index: 2003; display: none;">
            <div class="el-scrollbar">
                <div class="el-select-dropdown__wrap el-scrollbar__wrap"
                    style="margin-bottom: -17px; margin-right: -17px;">
                    <ul class="el-scrollbar__view el-select-dropdown__list">
                    <c:forEach items="${employeesActive}" var="e">
                    	<li data-employee=${e.idStaff} data-store=${e.store.idStore}
                            class="el-select-dropdown__item adm-select-option list-employee__dropdown">
                            <span>${e.surName} ${e.nameStaff}</span>
                        </li>
                    </c:forEach>
                        <li class="el-select-dropdown__item adm-select-option no-data no-data__employee"
                            style="display:none; justify-content: center;cursor:default">
                            <span>Kh??ng c?? d??? li???u</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- {{!-- toast --}} -->
        <div id="toast">
            <div id="img"></div>
            <div id="desc"></div>
        </div>

</body>

</html>
<script src="https://momentjs.com/downloads/moment.js"></script>
<script>
    const rawStaffs = ${rawStaffs};
    const rawStaffServices = ${rawStaffServices};
    const rawRegisShifts = ${rawRegisShifts};

    const regisShifts = rawRegisShifts.map(regisShift => {
        return {
            ...regisShift,
            dateRegis: moment(regisShift.dateRegis).format("yyyy-MM-DD")
        }
    })
</script>
<script src="client/script/staff/employee.js">
</script>
<script src="client/script/js-calendar/popper.min.js"></script>
<script src="client/script/js-calendar/rome.js"></script>
<script src="client/script/js-calendar/main.js"></script>