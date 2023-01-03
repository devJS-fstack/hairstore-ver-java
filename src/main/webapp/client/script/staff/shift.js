const accessToken = `${window.localStorage.getItem('accessToken')}`;
if (accessToken != `null`) {
    (async () => {
        const { status, employee, role } = await checkToken(accessToken);
        var amountDateSuccess = 0;
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
            var firstDay;
            var lastDay;
            var dateClick;
            var timePay, idstaff, amountDay, payment, nameStaff_work, salary_day;
            const sidebar_status = document.querySelector('.sidebar__status');
            const exportInvoiceBtn = document.querySelector('#adm-export-invoice');
            const exportDoneBtn = document.querySelector('#adm-check-success');
            const sidebar = document.querySelector('.sidebar');
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
                    let date = info.event.start;
                    idstaff = info.event.id;
                    amountDateSuccess = 0
                    dateClick = date;
                    currentMonth(date);
                    var firstDateString = `${firstDay.getFullYear()}-${firstDay.getMonth() + 1}-${firstDay.getDate()}`
                    var lastDateString = `${lastDay.getFullYear()}-${lastDay.getMonth() + 1}-${lastDay.getDate()}`
                    var monthPayment = `${lastDay.getMonth() + 1}/${lastDay.getFullYear()}`
                    const datework = regisShift.filter(regis => 
                        moment(regis.DateRegis).isBetween(moment(firstDateString), moment(lastDateString), null, "[]")
                        && regis.IDStaff === info.event.id);
                    amountDay = datework.length;
                    var avtEmployee = document.querySelector('.avatar-employe');
                    var dateWork_element = document.querySelector('.dates_work');
                    var html = ``;
                    $('.month_info').text(`Bảng Lương Tháng ${firstDay.getMonth() + 1}/${firstDay.getFullYear()}`);
                    timePay = `${firstDay.getMonth() + 1}/${firstDay.getFullYear()}`;
                    avtEmployee.style = `background-image: url(${datework[0].PathImgStaff}); color: rgb(36, 112, 172);`
                    $('.name-type__employee').text(`${datework[0].SurName} ${datework[0].NameStaff} - ${datework[0].NameType}`)
                    nameStaff_work = `${datework[0].SurName} ${datework[0].NameStaff}`;
                    var haveRegis = false;
                    datework.forEach(obj => {
                        var colorClass = "";
                        if (obj.StatusRegis == 'Đã hoàn thành') {
                            colorClass = "text-warning"
                            amountDateSuccess++;
                        } else if (obj.StatusRegis == 'Đã thanh toán') {
                            colorClass = "text-success";
                        }
                        else {
                            var dateDate = new Date(obj.DateRegis);
                            if (dateDate.getDate() == date.getDate()) {
                                haveRegis = true;
                            }
                            colorClass = "text-danger"
                        }
                        html += `<span class="d-block">${formatDateViet(obj.DateRegis)} - <span class="${colorClass}">${obj.StatusRegis}</span>
                        </span>`
                    })
                    if (haveRegis) {
                        exportDoneBtn.classList.remove('d-none')
                    } else {
                        exportDoneBtn.classList.add('d-none')
                    }
                    dateWork_element.innerHTML = html;
                    var salary = Math.floor(amountDateSuccess * datework[0].SalaryOnDay)
                    $('.salary-employee').text(`${formatMoneyViet(salary)}.000đ - ${amountDateSuccess} ngày`)
                    payment = salary;
                    salary_day = datework[0].SalaryOnDay;
                    sidebar.classList.add('active');
                    $('<div class="sidebar-overlay"></div>').insertAfter('.sidebar')
                    $('.sidebar-overlay').click(function () {
                        sidebar.classList.remove('active');
                        $('.sidebar-overlay').remove();
                    })

                    if (amountDateSuccess > 0) {
                        exportInvoiceBtn.style.display = 'flex';
                    } else {
                        exportInvoiceBtn.style.display = 'none';
                    }
                }
            });
            const btnExport_invoice = document.getElementById('adm-export-invoice');
            btnExport_invoice.addEventListener('click', async () => {
                var idBill = Date.now();
                var firstDateString = `${firstDay.getFullYear()}-${firstDay.getMonth() + 1}-${firstDay.getDate()}`
                var lastDateString = `${lastDay.getFullYear()}-${lastDay.getMonth() + 1}-${lastDay.getDate()}`
                const { status } = await createInvoice_Salary(idBill, timePay, idstaff, amountDateSuccess, payment, firstDateString, lastDateString);
                if (status == 'success') {
                    launch_toast("Đang xuất hóa đơn...");
                    sidebar.classList.remove('active');
                    $('.sidebar-overlay').remove();
                    await exportInvoice(idBill);
                    location.reload();
                } else {
                    launch_toast("Có lỗi khi xuất hóa đơn!");
                    sidebar.classList.remove('active');
                    $('.sidebar-overlay').remove();
                }
            })

            exportDoneBtn.addEventListener('click', async () => {
                var dateString = `${dateClick.getFullYear()}-${dateClick.getMonth() + 1}-${dateClick.getDate()}`
                const { status } = await updateDoneWork(dateString, idstaff)
                if (status === "success") {
                    sidebar.classList.remove('active');
                    $('.sidebar-overlay').remove();
                    await launch_toast("Vui lòng đợi trong giây lát...");
                    setTimeout(() => {
                        location.reload();
                    }, 2000);
                } else {
                    await launch_toast("Có lỗi xảy ra vui lòng thử lại sau!");
                }
            })

            async function exportInvoice(idbill) {
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
                    // // Your recipient
                    "client": {
                        "company": "Nhân viên",
                        "address": "",
                        "zip": `${nameStaff_work}`,
                        "city": ``,
                    },
                    "information": {
                        // Invoice number
                        "number": `${idbill}`,
                        // Invoice data
                        "date": `${day}-${month}-${date.getFullYear()}`,
                        "due-date": `${day}-${month}-${date.getFullYear()}`
                    },
                    "products": [{
                        "quantity": amountDateSuccess,
                        "description": `Ngày`,
                        "tax-rate": 0,
                        "price": `${salary_day}`
                    }],
                    "settings": {
                        "currency": "VND", // See documentation 'Locales and Currency' for more info. Leave empty for no currency.
                        "locale": "vi-VN", // Defaults to en-US, used for number formatting (See documentation 'Locales and Currency')
                        "tax-notation": "", // Defaults to 'vat'
                    },
                    "translate": {
                        "invoice": "HÓA ĐƠN LÀM VIỆC",  // Default to 'INVOICE'
                        "number": "Mã hóa đơn", // Defaults to 'Number'
                        "date": "Ngày", // Default to 'Date'
                        "due-date": "Đến ngày",
                        "subtotal": "Tổng tiền", // Defaults to 'Subtotal'
                        "products": "Loại",
                        "Dịch vụ": "Producten", // Defaults to 'Products'
                        "quantity": "Số ngày làm", // Default to 'Quantity'
                        "price": "Đơn giá", // Defaults to 'Price'
                        "product-total": "Thành tiền", // Defaults to 'Total'
                        "total": "Tổng tiền" // Defaults to 'Total'
                    },
                }
                await easyinvoice.createInvoice(data, async function (result) {
                    await easyinvoice.download(`${idbill}.pdf`, result.pdf);
                });
            }

            async function launch_toast(mess) {
                var x = document.getElementById("toast")
                x.className = "show";
                x.textContent = '';
                setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);
                setTimeout(function () { x.textContent = mess }, 700);
            }

            regisShift.forEach(obj => {
                addEvent({
                    id: obj.IDStaff,
                    title: `${obj.SurName} ${obj.NameStaff}`,
                    start: `${obj.DateRegis}`,
                })
            })

            if (regisShift.length == 0) {
                calendar.render();
            }

            function addEvent(data) {
                calendar.addEvent(data);
                calendar.render();
            }
            const logoutBtn = document.querySelector('#log-out')
            logoutBtn.onclick = (e) => {
                e.preventDefault();
                window.localStorage.clear();
                window.location = '/login.htm';
            }

            $('.sidebar__header__actions__close').click(function () {
                sidebar.classList.remove('active');
                $('.sidebar-overlay').remove();
            })

            function nameVietOfMonth(number) {
                switch (number) {
                    case 1: return 'Tháng 1';
                    case 2: return 'Tháng 2';
                    case 3: return 'Tháng 3';
                    case 4: return 'Tháng 4';
                    case 5: return 'Tháng 5';
                    case 6: return 'Tháng 6';
                    case 7: return 'Tháng 7';
                    case 8: return 'Tháng 8';
                    case 9: return 'Tháng 9';
                    case 10: return 'Tháng 10';
                    case 11: return 'Tháng 11';
                    case 12: return 'Tháng 12';
                }
            }

            function formatDateViet(date) {
                var date = new Date(date);
                return `${date.getDate()} ${nameVietOfMonth(date.getMonth() + 1)}, ${date.getFullYear()}`
            }

            function formatMoneyViet(x) {
                return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
            }

            function currentMonth(currDate) {
                firstDay = new Date(currDate.getFullYear(), currDate.getMonth(), 1);
                lastDay = new Date(currDate.getFullYear(), currDate.getMonth() + 1, 0);
                first = firstDay.getDate();
                last = lastDay.getDate();
            }

            // call API

            async function updateDoneWork(date, idStaff) {
                return postData("shift/update-done-work", {
                    arrDate: date,
                    accountId: idStaff,
                })
            }

            async function createInvoice_Salary(idBill, timePay, idStaff, amountDay, payment, firstDate, lastDate) {
                console.log( {
                    idBill,
                    monthPay: timePay,
                    accountId: idStaff,
                    amountDay,
                    payment,
                    firstDate,
                    lastDate,
                });
                return postData("shift/create-invoice", {
                    idBill,
                    monthPay: timePay,
                    accountId: idStaff,
                    amountDay,
                    payment,
                    firstDate,
                    lastDate,
                })
            }
        }
    })();
} else {
    window.location = '/page-err'
}
