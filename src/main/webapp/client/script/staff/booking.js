const accessToken = `${window.localStorage.getItem('accessToken')}`;
if (accessToken != `null`) {
    (async () => {
        const { status, employee, role } = await checkToken(accessToken);
        if (status == 'success') {
            const idStore = location.href.split('?idStore=')[1];
            if (role === 3) {
                if (employee.IDStore !== parseInt(idStore)) {
                    location.href = './page-err'
                }
            }
            else if (role == 4) {
                var service_link = document.querySelector('.service-link');
                var service_span = document.querySelector('.service-span');
                service_link.classList.remove('d-none');
                service_span.classList.remove('d-none');
            }
            const sidebar = document.querySelector('.sidebar');
            $('.sidebar__header__actions__close').click(function () {
                phone_val = "";
                sidebar.classList.remove('active');
                $('.sidebar-overlay').remove();
            })

            var idEvent;

            const dateBook_info = document.querySelector('.adm-appointment-info-section-datetime__date span')
            const timeBook_info = document.querySelector('.adm-appointment-info-section-datetime__time span')
            const avatar_info = document.querySelector('.avatar-employe_book');
            const nameEmployee_info = document.querySelector('.adm-appointment-info-section-employee__text__name span');
            const nameCustomer_info = document.querySelector('.adm-appointment-info-section-customers__item__name span');
            const emailCustomer_info = document.querySelector('.adm-appointment-info-section-customers__item__email span');
            const phoneCustomer_info = document.querySelector('.adm-appointment-info-section-customers__item__phone span');
            const serviceBook_info = document.querySelector('.service-list__book');
            const paymentBook_info = document.querySelector('.payment-book');
            const statusBook_info = document.querySelector('.status-symbol');
            var phoneCancelBook;
            var phoneExportBill;
            var nameStaff_work = "";
            var arrProducts = []
            var idStaff_bill;
            var payment_bill;
            var date_bill;
            const action_booking = document.querySelector('.action-booking');

            // edit booking
            const editBooking = document.querySelector('.edit-booking');
            const editIcon = document.querySelector('.edit-icon');
            var dateBook_val;
            var shift_val;
            var arrService_val;
            var idStaff_val;
            var phone_val;


            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay'
                },
                events: [],
                eventClick: async (info) => {
                    idEvent = info.event._def.defId;
                    let date = info.event.start;
                    let hourStart = date.getHours();
                    let minuteStart = date.getMinutes();
                    let dateBook = `${date.getFullYear()}-${date.getMonth() + 1}-${date.getDate()}`
                    // const { status, booking, customer } = await getInfoBooking(info.event.title, dateBook, hourStart, minuteStart);
                    const bookIntegration = bookings.find(booking => booking.PhoneCustomer === info.event.title
                                                            && booking.DateBook === moment(dateBook).format("yyyy-MM-DD")
                                                            && booking.HourStart === hourStart
                                                            && booking.MinuteStart === minuteStart);
                    const customer = bookIntegration?.customer;
                    const bookItems = bookIntegration?.bookItems;
                    // render
                    phoneCancelBook = info.event.title;
                    phoneExportBill = info.event.title;
                    statusBook_info.textContent = `${bookIntegration.Status}`
                    var day = date.getDate() > 9 ? date.getDate() : `0${date.getDate()}`;
                    var month = date.getMonth() + 1 > 9 ? date.getMonth() + 1 : `0${date.getMonth() + 1}`;
                    var hour = date.getHours() > 9 ? date.getHours() : `0${date.getHours()}`;
                    var minute = date.getMinutes() > 9 ? date.getMinutes() : `0${date.getMinutes()}`;
                    dateBook_info.textContent = `${day}-${month}-${date.getFullYear()}`
                    timeBook_info.textContent = `${hour}:${minute}`
                    nameEmployee_info.textContent = `${bookIntegration.SurName} ${bookIntegration.NameStaff}`;
                    nameStaff_work = `${bookIntegration.SurName} ${bookIntegration.NameStaff}`
                    idStaff_bill = bookIntegration.IDStaff
                    avatar_info.style.backgroundImage = `url('${bookIntegration.PathImgStaff}')`;
                    if (customer?.phoneCustomer) {
                        nameCustomer_info.textContent = `${customer.nameCustomer}`;
                        emailCustomer_info.textContent = `${customer.emailCustomer}`;
                        phoneCustomer_info.textContent = `${customer.phoneCustomer}`;
                    }
                    else {
                        nameCustomer_info.textContent = ``;
                        emailCustomer_info.textContent = ``;
                        phoneCustomer_info.textContent = `${info.event.title}`;
                    }
                    html = ``;
                    arrProducts = [];
                    arrProducts = bookItems;
                    bookItems.forEach((item, index) => {
                        const service = item.service;
                        html += `<div class="adm-appointment-info-section-service">
            <span>${service.nameService}</span>
            <span>${service.price}.000đ</span>
        </div>`
                    })
                    serviceBook_info.innerHTML = html;
                    payment_bill = bookIntegration.Payment;
                    date_bill = bookIntegration.DateBook;
                    paymentBook_info.textContent = `${formatPayment(bookIntegration.Payment)}.000đ`;
                    sidebar.classList.add('active');
                    $('<div class="sidebar-overlay"></div>').insertAfter('.sidebar')
                    $('.sidebar-overlay').click(function () {
                        phone_val = "";
                        sidebar.classList.remove('active');
                        $('.sidebar-overlay').remove();
                    })

                    if (bookIntegration.Status == 'Đã đặt lịch') {
                        action_booking.style.display = 'flex';
                        editIcon.style.display = 'block';
                        // {insert value to edit} 
                        dateBook_val = bookIntegration.DateBook
                        shift_val = bookItems[0].idShiftBook
                        arrService_val = arrProducts;
                        idStaff_val = bookIntegration.IDStaff
                        phone_val = bookIntegration.PhoneCustomer
                    } else {
                        action_booking.style.display = 'none';
                        editIcon.style.display = 'none';
                    }
                },
            });



            function formatPayment(payment) {
                var paymentString = payment.toString().split('');
                var result = '';
                var countStr = 0;
                paymentString.forEach((item, index) => {
                    if (paymentString.length == 4) {
                        if (index == 1) {
                            result += `.${item}`
                        }
                        else {
                            result += item;
                        }
                    }
                    else {
                        result += item;
                    }

                })
                return result;

            }


            calendar.render();
            bookings.forEach(obj => {
                var hour = obj.HourStart > 9 ? obj.HourStart : `0${obj.HourStart}`;
                var minute = obj.MinuteStart > 9 ? obj.MinuteStart : `0${obj.MinuteStart}`;
                addEvent({
                    title: obj.PhoneCustomer,
                    start: `${obj.DateBook}T${hour}:${minute}:00`,
                })
            })


            function addEvent(data) {
                calendar.addEvent(data);
                calendar.render();
            }



            const itemEmployee = document.querySelectorAll('.category')
            var indexPre_em = 0;
            itemEmployee.forEach((item, index) => {
                item.onclick = async () => {
                    itemEmployee[indexPre_em].classList.remove('active');
                    item.classList.add('active');
                    indexPre_em = index;
                    if (index == 0) {
                        var arrEvent = calendar.getEvents();
                        arrEvent.forEach(item => item.remove())
                        bookings.forEach(obj => {
                            var hour = obj.HourStart > 9 ? obj.HourStart : `0${obj.HourStart}`;
                            var minute = obj.MinuteStart > 9 ? obj.MinuteStart : `0${obj.MinuteStart}`;
                            addEvent({
                                title: obj.PhoneCustomer,
                                start: `${obj.DateBook}T${hour}:${minute}:00`
                            })
                        })
                    } else {
                        const idEmployee = item.getAttribute('data-employee');

                        //  handle render booking
                        const bookingsByIdEmployee = (bookings ?? []).filter(booking => booking.IDStaff === idEmployee);
                        const arrEvent = calendar.getEvents();
                        arrEvent.forEach(item => item.remove())
                        bookingsByIdEmployee.forEach(obj => {
                            var hour = obj.HourStart > 9 ? obj.HourStart : `0${obj.HourStart}`;
                            var minute = obj.MinuteStart > 9 ? obj.MinuteStart : `0${obj.MinuteStart}`;
                            addEvent({
                                title: obj.PhoneCustomer,
                                start: `${obj.DateBook}T${hour}:${minute}:00`,
                            })
                        })
                    }

                }
            })
            const numServiceText = document.querySelectorAll('.num-bookings')
            const numAllBooking = document.querySelectorAll('.num_all-booking');
            async function renderNumBooking_idEmployee() {
                var lengthAll = 0;
                var isDone = false;
                itemEmployee.forEach(async (item, index) => {
                    const idEmployee = item.getAttribute('data-employee');
                    const lengthBook = (bookings ?? []).filter(booking => booking.IDStaff === idEmployee && booking.Status === "Đã đặt lịch").length
                    if (index > 0) {
                        if (lengthBook > 0) {
                            lengthAll += lengthBook;
                            numServiceText[index - 1].textContent = `Có ${lengthBook} lịch hẹn mới`;
                        } else {
                            numServiceText[index - 1].textContent = `Chưa có lịch hẹn nào mới`;
                        }
                    }
                    if (lengthAll > 0) {
                        numAllBooking[0].textContent = `${parseInt(lengthAll)} lịch hẹn mới`
                    } else {
                        numAllBooking[0].textContent = `Chưa có lịch hẹn nào mới`
                    }
                })
            }


            window.addEventListener('load', async () => {
                renderNumBooking_idEmployee();
            })


            const div_category = document.querySelectorAll('.adm-form-item .el-form-item');
            const err_div = document.querySelectorAll('.adm-form-item__error')
            function errInputCategory(index, text) {
                div_category[index].classList.remove('is-success');
                div_category[index].classList.add('is-error');
                err_div[index].textContent = text;
            }

            function successInputCategory(index, text) {
                div_category[index].classList.add('is-success');
                div_category[index].classList.remove('is-error');
                err_div[index].textContent = text;
            }

            const input_from = document.querySelector('#input_from')
            const inputService_book = document.querySelector('#input-service_booking');
            const inputEmployee_book = document.getElementById('input-employee_booking');
            const inputTime_book = document.getElementById('input-time__booking');
            const dropDown_servicesEmployee = document.querySelector('#dropdown-services__employee');
            const dropdownEmployee_booking = document.querySelector('#dropdown-employee__booking');
            const dropdownTime_booking = document.querySelector('#dropdown-shift__booking');
            const arrows_down = document.querySelectorAll('.el-select__caret');
            const itemDropdown_service = document.querySelectorAll('.item-service__dropdown');
            const itemDropdown_employee = document.querySelectorAll('.item-employee');
            const itemDropdown_shift = document.querySelectorAll('.item-shift');
            var scrollService = 420;
            var scrollEmployee = 420;
            var scrollTime = 325;

            inputService_book.onclick = () => {
                if (dropDown_servicesEmployee.getAttribute('style') == 'min-width: 430px; transform-origin: center bottom; z-index: 2026; display: none;') {
                    arrows_down[1].style.transform = 'rotate(0deg)';
                    dropDown_servicesEmployee.style = `min-width: 430px; transform-origin: center top; z-index: 2030; position: fixed; top: ${scrollService}px; left: 220px;display:block;`
                }
                else {
                    arrows_down[1].style.transform = 'rotate(180deg)';
                    dropDown_servicesEmployee.style = `min-width: 430px; transform-origin: center bottom; z-index: 2026; display: none`
                }
            }

            inputEmployee_book.onclick = () => {
                if (dropdownEmployee_booking.getAttribute('style') == 'min-width: 540px; transform-origin: center bottom; z-index: 2026; display: none;') {
                    arrows_down[2].style.transform = 'rotate(0deg)';
                    dropdownEmployee_booking.style = `min-width: 540px; transform-origin: center top; z-index: 2030; position: fixed; top: ${scrollEmployee}px; right: 205px;display:block;`
                }
                else {
                    arrows_down[2].style.transform = 'rotate(180deg)';
                    dropdownEmployee_booking.style = `min-width: 540px; transform-origin: center bottom; z-index: 2026; display: none`
                }
            }

            inputTime_book.onclick = () => {
                if (dropdownTime_booking.getAttribute('style') == 'min-width: 540px; transform-origin: center bottom; z-index: 2026; display: none;') {
                    arrows_down[0].style.transform = 'rotate(0deg)';
                    dropdownTime_booking.style = `min-width: 540px; transform-origin: center top; z-index: 2030; position: fixed; top: ${scrollTime}px; right: 205px;display:block;`
                }
                else {
                    arrows_down[0].style.transform = 'rotate(180deg)';
                    dropdownTime_booking.style = `min-width: 540px; transform-origin: center bottom; z-index: 2026; display: none`
                }
            }

            const modalAddBooking = document.getElementById('add-booking')

            modalAddBooking.addEventListener('scroll', () => {
                var scrollTop = modalAddBooking.scrollTop;
                scrollService = 440 - scrollTop;
                scrollEmployee = 440 - scrollTop;
                scrollTime = 325 - scrollTop;
                if (dropDown_servicesEmployee.style.display == "block") {
                    dropDown_servicesEmployee.style = `min-width: 430px; transform-origin: center top; z-index: 2030; position: fixed; top: ${scrollService}px; left: 220px;display:block;`
                }
                if (dropdownTime_booking.style.display == "block") {
                    dropdownTime_booking.style = `min-width: 540px; transform-origin: center top; z-index: 2030; position: fixed; top: ${scrollTime}px; right: 205px;display:block;`
                }
                if (dropdownEmployee_booking.style.display == "block") {
                    dropdownEmployee_booking.style = `min-width: 540px; transform-origin: center top; z-index: 2030; position: fixed; top: ${scrollEmployee}px; right: 205px;display:block;`
                }
            })



            let isOver_serive = false;
            let isOver_employee = false;
            let isOver_time = false

            dropDown_servicesEmployee.onmouseover = function () {
                isOver_serive = true;
            }

            dropDown_servicesEmployee.onmouseleave = function () {
                isOver_serive = false;
            }

            dropdownEmployee_booking.onmouseover = function () {
                isOver_employee = true;
            }

            dropdownEmployee_booking.onmouseleave = function () {
                isOver_employee = false;
            }

            dropdownTime_booking.onmouseover = function () {
                isOver_time = true;
            }

            dropdownTime_booking.onmouseleave = function () {
                isOver_time = false;
            }

            var noData_employee = document.querySelector('.no-data__employee');
            var isHaveEmployee = false;
            var arrIndexEmployee = [];
            input_from.onchange = async () => {
                inputTime_book.disabled = false;
                $('.input-time_book').removeClass('is-disabled');
                inputTime_book.value = "";
                if (input_from.value == "") {
                    $('.input-time_book').addClass('is-disabled');
                    inputTime_book.value = "";
                    inputTime_book.disabled = true;
                } else {
                    successInputCategory(0, "");
                }
                removeAllSelectedTime();
                // const { status, shift, arrIdShift } = await getShiftIsFull(input_from.value)
                let isFull = false;
                const arrIdShift = [];
                const bookingsByDate = bookings.filter(booking => booking.DateBook === (input_from.value));
                const regisByDate = (rawRegisShifts ?? []).filter(regis => moment(regis.dateRegis).format("yyyy-MM-DD") === input_from.value);
                bookingsByDate.forEach(booking => {
                    const bookingsByShift = bookingsByDate.filter(element => element.IDShift === booking.IDShift);
                    if (bookingsByShift.length === regisByDate.length) {
                        isFull = true;
                        arrIdShift.push(booking.IDShift);
                    }
                });

                if (isFull) {
                    hideTimeIsFull(arrIdShift);
                }
                else {
                    showAllTime();
                }

                if (regisByDate.length) {
                    arrIndexEmployee = [];
                    removeAllSelectedEmployee();
                    hideAllEmployee();
                    renderEmployee_DateRegis(regisByDate);
                    noData_employee.style.display = 'none';
                    isHaveEmployee = true;
                    inputEmployee_book.value = "";
                }
                else {
                    removeAllSelectedEmployee();
                    hideAllEmployee();
                    noData_employee.style.display = 'flex';
                    isHaveEmployee = false;
                    inputEmployee_book.value = "";
                }
            }



            function renderEmployee_DateRegis(arrEmployee) {
                itemDropdown_employee.forEach((item, index) => {
                    arrEmployee.forEach((item1) => {
                        if (item.getAttribute('data-employee') == item1.idStaff) {
                            item.style.display = 'flex'
                            arrIndexEmployee.push(index);
                        }
                    })
                })

            }

            function removeAllSelectedTime() {
                indexPre_time = -1;
                for (var i = 0; i < itemDropdown_shift.length; i++) {
                    if (itemDropdown_shift[i].classList.contains('selected')) {
                        itemDropdown_shift[i].classList.remove('selected');
                        break;
                    }
                }
            }

            function removeAllSelectedEmployee(idEmployee) {
                indexPre_employee = -1;
                for (var i = 0; i < itemDropdown_employee.length; i++) {
                    if (itemDropdown_employee[i].classList.contains('selected')) {
                        itemDropdown_employee[i].classList.remove('selected');
                        break;
                    }
                }
            }

            function renderEmployee_ArrIndex(arrIndex) {
                itemDropdown_employee.forEach((item, index) => {
                    arrIndex.forEach(item1 => {
                        if (item1 == index) {
                            item.style.display = 'flex';
                        }
                    })
                })
            }

            const inputPhoneCus_book = document.querySelector('#input_phone_cus');

            inputPhoneCus_book.oninput = async () => {
                inputPhoneCus_book.value = inputPhoneCus_book.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');
                if (inputPhoneCus_book.value.length == 10 && inputPhoneCus_book.value != phone_val) {
                    const bookAlreadyExist = bookings.find(booking => booking.PhoneCustomer === inputPhoneCus_book.value
                        && booking.DateBook >= moment().format("yyyy-MM-DD") && booking.Status === "Đã đặt lịch");
                    if (bookAlreadyExist) {
                        const date = new Date(`${bookAlreadyExist.DateBook}`)
                        const day = date.getDate() > 9 ? date.getDate() : `0${date.getDate()}`;
                        const month = date.getMonth() + 1 > 9 ? date.getMonth() + 1 : `0${date.getMonth() + 1}`;
                        const dateFormat = `${day}-${month}-${date.getFullYear()}`
                        errInputCategory(4, `Số điện thoại này đã được đặt lịch mới vào ${dateFormat}. Vui lòng hủy lịch hoặc hoàn thành trước khi đăng ký lịch mới!`)
                    }
                    else {
                        successInputCategory(4, "")
                    }
                } else {
                    successInputCategory(4, "")
                }
            }



            function hideAllEmployee() {
                itemDropdown_employee.forEach(item => {
                    item.style.display = 'none';
                })
            }

            function showAllTime() {
                itemDropdown_shift.forEach((item, index) => {
                    item.style.display = 'flex';
                })
            }

            function hideTimeIsFull(arrIdShift) {
                itemDropdown_shift.forEach((item, index) => {
                    arrIdShift.forEach(shift => {
                        if (shift == item.getAttribute('data-shift')) {
                            item.style.display = 'none';
                        }
                    })
                })
            }



            inputService_book.onfocusout = () => {
                if (!isOver_serive) {
                    arrows_down[1].style.transform = 'rotate(180deg)';
                    dropDown_servicesEmployee.style = `min-width: 430px; transform-origin: center bottom; z-index: 2026; display: none`
                }
            }

            inputEmployee_book.onfocusout = () => {
                if (!isOver_employee) {
                    arrows_down[2].style.transform = 'rotate(180deg)';
                    dropdownEmployee_booking.style = `min-width: 540px; transform-origin: center bottom; z-index: 2026; display: none`
                }
                if (noData_employee.style.display == 'flex') {
                    arrows_down[2].style.transform = 'rotate(180deg)';
                    dropdownEmployee_booking.style = `min-width: 540px; transform-origin: center bottom; z-index: 2026; display: none`
                }
            }

            inputTime_book.onfocusout = () => {
                if (!isOver_time) {
                    arrows_down[0].style.transform = 'rotate(180deg)';
                    dropdownTime_booking.style = `min-width: 540px; transform-origin: center bottom; z-index: 2026; display: none`
                }
            }

            var indexFirstChecking = -1;
            var indexIsChecking = -1;
            let countService = 0;

            function getIndexIsChecking() {
                for (var i = 0; i < itemDropdown_service.length; i++) {
                    if (itemDropdown_service[i].classList.contains('selected')) {
                        indexIsChecking = i;
                        break;
                    }
                }
            }
            const tags_service = document.querySelector('.el-select__tags span');
            const spans_service = document.querySelectorAll('.item-service__dropdown span');
            const spans_employee = document.querySelectorAll('.item-employee span');
            const spans_time = document.querySelectorAll('.item-shift span');

            var countClick = 0;
            function removeAllSelectedService() {
                itemDropdown_service.forEach((item, index) => {
                    if (item.classList.contains('selected')) item.classList.remove('selected');
                })
            }


            itemDropdown_service.forEach((item, index) => {
                item.onclick = () => {
                    arrService = [];
                    inputService_book.value = " ";
                    inputService_book.placeholder = "";
                    inputService_book.focus();
                    countClick++;
                    successInputCategory(2, "")
                    if (countClick == 1) {
                        indexFirstChecking = index;
                    }
                    if (item.classList.contains('selected')) {
                        item.classList.remove('selected');
                        if (indexFirstChecking == index && countClick > 1) {
                            getIndexIsChecking();
                            if (indexIsChecking == -1) {
                                indexIsChecking = indexFirstChecking;
                            }
                            indexFirstChecking = indexIsChecking;
                            const tagsText = document.querySelector('.el-select__tags-text')
                            tagsText.innerHTML = spans_service[indexIsChecking].textContent.trim()
                        }
                        countService--;
                        if (countService == 1) {
                            var spanCount = document.querySelectorAll('.el-tag--info');
                            spanCount[1].remove();
                        }
                        else if (countService > 1) {
                            var spanCount = document.querySelectorAll('.el-select__tags-text');
                            spanCount[1].textContent = `+${countService - 1}`
                        }
                        else {
                            tags_service.innerHTML = "";
                            inputService_book.placeholder = 'Chọn Dịch Vụ';
                            inputService_book.value = '';
                            countClick = 0;
                        }
                    } else {
                        countService++;
                        item.classList.add('selected');
                        if (countService == 2) {
                            tags_service.innerHTML += `<span
                class="el-tag el-tag--info el-tag--small el-tag--light">
                <span class="el-select__tags-text">
                    +${countService - 1}
                </span>
            </span>`
                        } else if (countService > 2) {
                            var spanCount = document.querySelectorAll('.el-select__tags-text');
                            spanCount[1].textContent = `+${countService - 1}`
                        }
                        else {
                            tags_service.innerHTML = `
                    <span
                        class="el-tag el-tag--info el-tag--small el-tag--light">
                        <span class="el-select__tags-text">
                            ${spans_service[index].textContent.trim()}
                        </span>
                    </span>`
                        }
                    }
                }
            })
            var arrService = [];
            function pushIdServiceToArr() {
                itemDropdown_service.forEach((item, index) => {
                    if (item.classList.contains('selected')) arrService.push(item.getAttribute('data-service'))
                })
            }
            var indexPre_employee = -1
            itemDropdown_employee.forEach((item, index) => {
                item.onclick = function () {
                    idStaff = item.getAttribute('data-employee')
                    successInputCategory(3, "")
                    if (indexPre_employee != -1) {
                        itemDropdown_employee[indexPre_employee].classList.remove('selected');
                    }
                    inputEmployee_book.value = spans_employee[index].textContent.trim();
                    arrows_down[2].style.transform = 'rotate(180deg)';
                    dropdownEmployee_booking.style = `min-width: 540px; transform-origin: center bottom; z-index: 2026; display: none`
                    item.classList.add('selected');
                    indexPre_employee = index;
                }
            })

            var indexPre_time = -1;
            var idShift;
            itemDropdown_shift.forEach((item, index) => {
                item.onclick = async () => {
                    idShift = item.getAttribute('data-shift')
                    successInputCategory(1, "")
                    if (isHaveEmployee) {
                        const booking = bookings.find(booking => booking.DateBook === input_from.value && booking.IDShift === item.getAttribute('data-shift'));
                        if (booking) {
                            inputEmployee_book.value = "";
                            removeAllSelectedEmployee(booking.IDStaff);
                            renderEmployee_Shift(booking.IDStaff);
                        } else {
                            hideAllEmployee();
                            renderEmployee_ArrIndex(arrIndexEmployee)
                        }
                    }
                    if (indexPre_time != -1) {
                        itemDropdown_shift[indexPre_time].classList.remove('selected');
                    }
                    inputTime_book.value = spans_time[index].textContent.trim();
                    arrows_down[0].style.transform = 'rotate(180deg)';
                    dropdownTime_booking.style = `min-width: 540px; transform-origin: center bottom; z-index: 2026; display: none`
                    item.classList.add('selected');
                    indexPre_time = index;
                }
            })

            const add_booking = document.getElementById('add_booking');
            const confirm_booking = document.getElementById('adm-btn-booking__add');


            add_booking.addEventListener('click', () => {
                arrService = [];
                input_from.value = "";
                $('.title-booking').text('Thêm Lịch Hẹn');
                $('.span-btn__booking').text('Thêm Lịch Hẹn');
                $('.input-time_book').addClass('is-disabled');
                inputTime_book.value = "";
                inputTime_book.disabled = true;
                removeAllSelectedTime();
                inputEmployee_book.value = "";
                removeAllSelectedEmployee();
                removeAllSelectedService();
                tags_service.innerHTML = "";
                inputService_book.value = "";
                inputService_book.placeholder = "Chọn Dịch Vụ";
                countClick = 0;
                countService = 0;
                inputPhoneCus_book.value = "";
                successInputCategory(0, "")
                successInputCategory(1, "")
                successInputCategory(2, "")
                successInputCategory(3, "")
                successInputCategory(4, "")
            })

            function renderTimeBooked(idShift) {
                for (var i = 0; i < itemDropdown_shift.length; i++) {
                    if (itemDropdown_shift[i].getAttribute('data-shift') == idShift) {
                        itemDropdown_shift[i].classList.add('selected');
                        indexPre_time = i;
                        inputTime_book.value = spans_time[i].textContent.trim();
                        break;
                    }
                }
            }

            function renderStaffBooked(idStaff) {
                for (var i = 0; i < itemDropdown_employee.length; i++) {
                    if (itemDropdown_employee[i].getAttribute('data-employee') == idStaff) {
                        itemDropdown_employee[i].classList.add('selected');
                        indexPre_employee = i;
                        inputEmployee_book.value = spans_employee[i].textContent.trim();
                        break;
                    }
                }
            }

            async function renderEmployeeRegisShift(date) {
                const regisByDate = (rawRegisShifts ?? []).filter(regis => moment(regis.dateRegis).format("yyyy-MM-DD") === date);
                if (regisByDate.length) {
                    arrIndexEmployee = [];
                    removeAllSelectedEmployee();
                    hideAllEmployee();
                    renderEmployee_DateRegis(regisByDate);
                    noData_employee.style.display = 'none';
                    isHaveEmployee = true;
                    inputEmployee_book.value = "";
                }
                else {
                    removeAllSelectedEmployee();
                    hideAllEmployee();
                    noData_employee.style.display = 'flex';
                    isHaveEmployee = false;
                    inputEmployee_book.value = "";
                }
            }

            function renderServiceBooked(arrService) {
                var count = 0;
                inputService_book.value = " ";
                countService = 0;
                itemDropdown_service.forEach((item, index) => {
                    arrService.forEach((element, indexS) => {
                        if (element.service.idService == item.getAttribute('data-service')) {
                            item.classList.add('selected');
                            count++;
                            countService++;
                            if (count == 1) {
                                tags_service.innerHTML = `
                        <span
                            class="el-tag el-tag--info el-tag--small el-tag--light">
                            <span class="el-select__tags-text">
                                ${spans_service[index].textContent.trim()}
                            </span>
                        </span>
                        `
                            }
                        }
                    })
                })
                if (count > 1) {
                    tags_service.innerHTML += `<span
                            class="el-tag el-tag--info el-tag--small el-tag--light">
                            <span class="el-select__tags-text">
                                +${count - 1}
                            </span>
                        </span>`
                }
                getIndexIsChecking();
                indexFirstChecking = indexIsChecking;
                indexIsChecking = -1;
                countClick = 2;
            }


            editBooking.onclick = async () => {
                add_booking.click()
                $('.title-booking').text('Chỉnh Sửa Lịch Hẹn');
                $('.span-btn__booking').text('Lưu Thay Đổi');
                input_from.value = dateBook_val;
                $('.input-time_book').removeClass('is-disabled');
                inputTime_book.disabled = false;
                renderTimeBooked(shift_val);
                await renderEmployeeRegisShift(dateBook_val)
                renderStaffBooked(idStaff_val);
                inputPhoneCus_book.value = phone_val;
                renderServiceBooked(arrService_val)
                idShift = shift_val;
                idStaff = idStaff_val;
            }

            var idStaff = 0;
            function launch_toast(mess) {
                var x = document.getElementById("toast")
                x.className = "show";
                x.textContent = '';
                setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);
                setTimeout(function () { x.textContent = mess }, 700);
            }

            confirm_booking.addEventListener('click', async () => {
                var flag = 0;
                if (input_from.value == "") {
                    errInputCategory(0, "Bạn vui lòng chọn ngày đặt lịch")
                } else {
                    var datenow = new Date();
                    var dateInputFrom = new Date(`${input_from.value}`);
                    datenow.setHours(0, 0, 0, 0);
                    dateInputFrom.setHours(0, 0, 0, 0);
                    if (datenow.getTime() > dateInputFrom.getTime()) {
                        errInputCategory(0, 'Bạn vui lòng chọn đúng ngày')
                    }
                    else {
                        successInputCategory(0, "");
                        if (flag == 0) flag = 1;
                    }
                }

                if (inputTime_book.value == "") {
                    errInputCategory(1, "Bạn vui lòng chọn thời gian đặt lịch")
                } else {
                    successInputCategory(1, "");
                    if (flag == 1) flag = 2;
                }

                if (inputService_book.value == "") {
                    errInputCategory(2, "Bạn vui lòng chọn dịch vụ")
                }
                else {
                    successInputCategory(2, "");
                    if (flag == 2) flag = 3;
                }

                if (inputEmployee_book.value == "") {
                    errInputCategory(3, "Bạn vui lòng chọn nhân viên thực hiện")
                }
                else {
                    successInputCategory(3, "");
                    if (flag == 3) flag = 4;
                }

                if (inputPhoneCus_book.value == "") {
                    errInputCategory(4, "Bạn vui lòng nhập số điện thoại khách hàng")
                }
                else {
                    if (!validatePhone(inputPhoneCus_book.value))
                        errInputCategory(4, "Bạn vui lòng nhập đúng số điện thoai của khách hàng")
                    else {
                        if (inputPhoneCus_book.value !== phone_val) {
                            const bookAlreadyExist = bookings.find(booking => booking.PhoneCustomer === inputPhoneCus_book.value
                                && booking.DateBook >= moment().format("yyyy-MM-DD") && booking.Status === "Đã đặt lịch");
                            if (bookAlreadyExist) {
                                errInputCategory(4, "Số điện thoại này đã được đặt lịch vào ngày này. Vui lòng hủy lịch hoặc hoàn thành trước khi đăng ký lịch mới!")
                            } else {
                                successInputCategory(4, "");
                                if (flag == 4) flag = 5;
                            }
                        }
                        else {
                            successInputCategory(4, "");
                            if (flag == 4) flag = 5;
                        }
                    }
                }





                //  ==>
                if (flag == 5) {
                    if ($('.span-btn__booking').text() == 'Lưu Thay Đổi') {
                        var arrEvent = calendar.getEvents();
                        arrEvent.forEach(item => {
                            if (item._def.defId == idEvent) {
                                item.remove();
                                renderNumBooking_idEmployee();
                            }
                        })
                        pushIdServiceToArr();
                        const { status } = await editBooking_func(phone_val, input_from.value, idShift, arrService, inputPhoneCus_book.value, idStaff, idStore);
                        if (status == 'success') {
                           location.reload();
                        } else {
                            launch_toast("Đặt lịch không thành công. Vui lòng thử lại sau!");
                        }
                    }
                    else {
                        pushIdServiceToArr();
                        const { status } = await addBooking(input_from.value, idShift, arrService, inputPhoneCus_book.value, idStaff, idStore);
                        if (status === "success") {
                            location.reload();
                        } else {
                            launch_toast("Đặt lịch không thành công. Vui lòng thử lại sau");
                        }
                    }
                }

            })

            const cancelBooking = document.querySelector('#cancel-booking');
            const btnConfirmCancel = document.querySelector('#btn-confirm-cancel__booking');

            btnConfirmCancel.addEventListener('click', async () => {
                const { status } = await cancelBooking_Phone(phoneCancelBook);
                if (status == 'success') {
                    sidebar.classList.remove('active');
                    $('.sidebar-overlay').remove();
                    $('#alertModalDelete').modal('hide');
                    location.reload();
                } else {
                    sidebar.classList.remove('active');
                    $('.sidebar-overlay').remove();
                    $('#alertModalDelete').modal('hide');
                    launch_toast("Hủy lịch thất bại. Vui lòng thử lại sau!");
                }
            })


            function renderEmployee_Shift(employee) {
                itemDropdown_employee.forEach((item, index) => {
                    if (item.getAttribute('data-employee') == employee) {
                        item.style.display = 'none';
                    }
                })
            }

            function renderAllEmployee() {
                noData_employee.style.display = 'none';
                itemDropdown_employee.forEach((item, index) => {
                    item.style.display = 'flex';
                })
            }

            const btnExport_invoice = document.getElementById('adm-export-invoice');

            btnExport_invoice.addEventListener('click', async () => {
                var idBill = Date.now();
                const { status } = await createInvoice(idBill, idStaff_bill, payment_bill, phoneExportBill, date_bill);
                if (status == 'success') {
                    launch_toast("Đang xuất hóa đơn...");
                    sidebar.classList.remove('active');
                    phone_val = "";
                    $('.sidebar-overlay').remove();
                    renderNumBooking_idEmployee();
                    await exportInvoice(idBill, arrProducts.map(obj => {
                        return {
                            "quantity": 1,
                            "description": `${obj.service.nameService}`,
                            "tax-rate": 0,
                            "price": `${obj.service.price}`
                        }
                    }), phoneExportBill);
                    location.reload();
                } else {
					launch_toast("Đã có lỗi khi xuất hóa đơn. Vui lòng thử lại sau!");
                    sidebar.classList.remove('active');
                    phone_val = "";
                    $('.sidebar-overlay').remove();
				}
            })

            async function exportInvoice(idbill, product, phone) {
                var date = new Date();
                var month = date.getMonth() + 1 > 9 ? date.getMonth() + 1 : `0${date.getMonth() + 1}`;
                var day = date.getDate() > 9 ? date.getDate() : `0${date.getDate()}`;
                var data = {
                    "images": {
                        "logo": "",
                    },
                    "sender": {
                        "company": `The BaberShop`,
                        "address": `${store.street}`,
                        "zip": `${store.phone}`,
                        "city": `${store.city}`,
                    },
                    "client": {
                        "company": "Nhân viên",
                        "address": `${nameStaff_work}`,
                        "zip": "Khách hàng",
                        "city": `${phone}`,
                    },
                    "information": {
                        "number": `${idbill}`,
                        "date": `${day}-${month}-${date.getFullYear()}`,
                        "due-date": `${day}-${month}-${date.getFullYear()}`
                    },
                    // The products you would like to see on your invoice
                    // Total values are being calculated automatically
                    "products": product,
                    "settings": {
                        "currency": "VND", // See documentation 'Locales and Currency' for more info. Leave empty for no currency.
                        "locale": "vi-VN", // Defaults to en-US, used for number formatting (See documentation 'Locales and Currency')
                        "tax-notation": "", // Defaults to 'vat'
                    },
                    "translate": {
                        "invoice": "HÓA ĐƠN",  // Default to 'INVOICE'
                        "number": "Mã hóa đơn", // Defaults to 'Number'
                        "date": "Ngày", // Default to 'Date'
                        "due-date": "Đến ngày",
                        "subtotal": "Tổng tiền", // Defaults to 'Subtotal'
                        "products": "Dịch vụ",
                        "Dịch vụ": "Producten", // Defaults to 'Products'
                        "quantity": "Số lượng", // Default to 'Quantity'
                        "price": "Đơn giá", // Defaults to 'Price'
                        "product-total": "Thành tiền", // Defaults to 'Total'
                        "total": "Tổng tiền" // Defaults to 'Total'
                    },
                }
                await easyinvoice.createInvoice(data, async function (result) {
                    await easyinvoice.download(`${idbill}.pdf`, result.pdf);
                });
            }

            // CALL API

            async function createInvoice(idBill, idStaff, payment, phoneCus, date) {
                console.log({ 
					idBill: `${idBill}`,
                    accountId: idStaff,
                    payment,
                    phone: phoneCus,
                    arrDate: date,
                    idStore, 
                   });
                return postData("booking/create-bill", {
					idBill: `${idBill}`,
                    accountId: idStaff,
                    payment,
                    phone: phoneCus,
                    arrDate: date,
                    idStore,
				})
            }

            async function cancelBooking_Phone(phone) {
                return postData('booking/cancel-booking', {
                    phone
                });
            }

            async function editBooking_func(phoneCusOld, dateNew, shiftNew, arrServiceNew, phoneCusNew, staffNew, store) {
                return postData("booking/edit-booking", {
                    arrDate: dateNew,
                    idShift: shiftNew,
                    arrService: arrServiceNew,
                    phone: phoneCusNew,
                    accountId: staffNew,
                    idStore: store,
                    oldPhone: phoneCusOld,
                })
            }

            async function addBooking(date, shift, arrService, phoneCus, staff, store) {
                return postData("booking/add-booking", {
                    arrDate: date,
                    idShift: shift,
                    arrService,
                    phone: phoneCus,
                    accountId: staff,
                    idStore: store,
                })
            }

        }
        const logoutBtn = document.querySelector('#log-out')
        logoutBtn.onclick = (e) => {
            e.preventDefault();
            window.localStorage.clear();
            window.location = '/login.htm'
        }
    })();
} else {
    window.location = '/page-err'
}