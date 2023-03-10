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
        <div class="main-container" style="display: block">
            <div class="user-box third-box service-box">
                <div class="adm-services">
                    <div class="adm-page-header">
                        <div class="adm-page-header__content">
                            <div class="adm-page-header__title">
                                <span class="adm-header__label">Lịch Làm Việc</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="page-content">
                <div class="service-and-category">
                    <div class="services-list">
                        <div id="calendar"></div>
                        <div class="sidebar-employee">
                            <div class="sidebar">
                                <div class="sidebar__header">
                                    <div class="sidebar__header__title semi-bold flex-center month_info">
                                        Bảng Lương Tháng 05/2022
                                    </div>
                                    <div class="sidebar__header__actions">
                                        <div class="adm-actions__drop-down ml-2">
                                            <div class="sidebar__header__actions__close ml-2"
                                                style="font-size: 20px;color: #00143c;">
                                                <i class="fa-solid fa-xmark"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="sidebar__content">
                                    <div>
                                        <div class="adm-appointment-info-section-employee">
                                            <div class="adm-avatar size-32 mr-0 ml-0 avatar-employe"
                                                style="background-image: url(http://localhost:3000/img/1652612227642.jpg); color: rgb(36, 112, 172);">
                                            </div>
                                            <div class="adm-appointment-info-section-employee__text">
                                                <div class="adm-appointment-info-section-employee__text__title">Nhân
                                                    viên
                                                </div>
                                                <div class="adm-appointment-info-section-employee__text__name">
                                                    <span class="name-type__employee">Thắng Võ</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div
                                            class="adm-appointment-info-section adm-appointment-info-section-customers">
                                            <div class="adm-appointment-info-section__header">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10"
                                                    class="adm-icon adm-icon__medium adm-icon__primary"
                                                    fill="currentColor" class="bi bi-calendar-plus" viewBox="0 0 16 16">
                                                    <path
                                                        d="M8 7a.5.5 0 0 1 .5.5V9H10a.5.5 0 0 1 0 1H8.5v1.5a.5.5 0 0 1-1 0V10H6a.5.5 0 0 1 0-1h1.5V7.5A.5.5 0 0 1 8 7z" />
                                                    <path
                                                        d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z" />
                                                </svg>
                                                <span class="adm-appointment-info-section__header__title">Các ngày
                                                    đã đăng ký làm</span>
                                            </div>
                                            <div class="adm-appointment-info-section__content mt-2">
                                                <div
                                                    class="adm-appointment-info-section-customers__item service-list__book">
                                                    <div class="adm-appointment-info-section-service dates_work"
                                                        style="display:block">
                                                        <span class="ml-2">Cắt gội massage</span>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                        <div class="section sidebar-appointment__payments">
                                            <div class="section-title">
                                                <i
                                                    class="fa-regular fa-credit-card adm-icon adm-icon__medium adm-icon__primary"></i>
                                                <span class="salary">Tổng tiền lương</span>
                                            </div>
                                            <div class="flex-center">
                                                <h6 class="salary-employee ml-2">100.000đ</h6>
                                            </div>
                                        </div>
                                    </div>
                                    <span class="flex action-booking">
                                        <button id="adm-export-invoice"
                                            class="adm-button adm-button__filled__blue adm-button-size__medium ml-3"
                                            style="border:none;width:100%">
                                            <span>Thanh Toán</span>
                                        </button>
                                        <button id="adm-check-success"
                                            class="adm-button green adm-button-size__medium ml-3 d-none"
                                            style="border:none;width:100%">
                                            <span>Hoàn Thành</span>
                                        </button>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>

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
    const rawRegisShifts = ${rawRegisShifts};
    const rawStaffs = ${rawStaffs};
    const rawTypeStaffs = ${rawTypeStaffs};

    const regisShift = (rawRegisShifts ?? []).map(regis => {
        const staff = rawStaffs.find(rawStaff => rawStaff.idStaff === regis.idStaff);
        const typeStaff = rawTypeStaffs.find(type => type.idTypeStaff == staff.typeStaff);
        return {
            DateRegis: moment(regis.dateRegis).format("yyyy-MM-DD"),
            IDDayOfWeek: regis.dayOfWeek,
            IDStaff: regis.idStaff,
            NameStaff: staff.nameStaff,
            SurName: staff.surName,
            StatusRegis: regis.statusRegis,
            PathImgStaff: staff.pathImgStaff,
            SalaryOnDay: typeStaff.salaryOnDay,
            NameType: typeStaff.nameType,
        }
    })
    const store = rawRegisShifts[0].store;
</script>
<script src="https://unpkg.com/easyinvoice/dist/easyinvoice.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.js"></script>
<script src="client/script/staff/shift.js"></script>