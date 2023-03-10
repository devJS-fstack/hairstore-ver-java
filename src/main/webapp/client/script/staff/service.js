const accessToken = `${window.localStorage.getItem('accessToken')}`;
if (accessToken != `null`) {
    (async () => {
        const { status, employee, role } = await checkToken(accessToken);
        if (status == 'success') {
            (() => {
                const idStore = location.href.split('?idStore=')[1];
                if (role === 3) {
                    location.href = './page-err'
                }
                navheader.style.display = 'none'
                const btn_addCategory = document.getElementById('adm-add-category');
                const input_category = document.getElementById('input-category');
                const input_desCategory = document.getElementById('input-des-category');
                const div_category = document.querySelectorAll('.adm-form-item .el-form-item');
                const err_div = document.querySelectorAll('.adm-form-item__error')
                const close_addCategory = document.getElementById('close-add__category');
                const categories_jq = $('.category')
                const close_add = document.getElementById('close-btn__add')
                const adm_addCategory = document.querySelector('.adm-button-category');
                const ul_dropdownCategory = document.querySelector('.list-dropdown__categories');
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

                adm_addCategory.addEventListener('click', (e) => {
                    input_category.value = '';
                    input_desCategory.value = '';
                })

                btn_addCategory.addEventListener('click', async (e) => {
                    e.preventDefault();

                    let flag = 0;
                    if (input_category.value == '') {
                        errInputCategory(0, 'B???n vui l??ng nh???p t??n danh m???c')
                    } else {
                        successInputCategory(0, '')
                        flag = 1;
                    }

                    if (input_desCategory.value == '') {
                        errInputCategory(1, 'B???n vui l??ng nh???p m?? t??? c???a danh m???c n??y')
                    } else {
                        successInputCategory(1, '')
                        if (flag == 1) {
                            flag = 2;
                        }
                    }

                    if (flag == 2) {
                        const { status } = await createCategory(input_category.value, input_desCategory.value)
                        console.log("status: ", {status})
                        if (status == 'success') {
                            var categories_After = $('.category')
                            location.reload();
                            //     $(`<div data-type="${categories.length}" class="category">
                            //     <div class="category-name overflow-ellipsis">
                            //         <div style="text-transform: capitalize;">${input_category.value}</div>
                            //         <span class="num-services">0 D???ch V???</span>
                            //     </div>
                            //     <div class="adm-actions__drop-down">
                            //         <div class="el-dropdown">
                            //             <button aria-haspopup="true" aria-expanded="false"
                            //                 data-toggle="dropdown" class="adm-btn" id="dropdownMenuButton">
                            //                 <span class="adm-btn__icon">
                            //                     <i class="fa-solid fa-ellipsis"></i>
                            //                 </span>
                            //             </button>
                            //             <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            //                 <li class="edit-category dropdown-item el-dropdown-menu">
                            //                     <div class="adm-dropdown-item__wrapper is-with-icon">
                            //                         <div class="adm-dropdown-item__icon">
                            //                             <i class="fa-solid fa-pencil"></i>
                            //                         </div>
                            //                         <div class="adm-dropdown-item__label">
                            //                             Ch???nh s???a
                            //                         </div>
                            //                     </div>
                            //                 </li>
                            //                 <li data-type="${categories.length}"
                            //                     class="delete-category dropdown-item el-dropdown-menu">
                            //                     <div class="adm-dropdown-item__wrapper is-red is-with-icon">
                            //                         <div class="adm-dropdown-item__icon">
                            //                             <i class="fa-solid fa-trash-can"></i>
                            //                         </div>
                            //                         <div class="adm-dropdown-item__label">
                            //                             X??a
                            //                         </div>
                            //                     </div>
                            //                 </li>
                            //             </ul>
                            //         </div>
                            //     </div>
                            // </div>`).insertAfter(categories_After[categories.length - 1]);
                            $('#add-category_modal').modal('hide');
                            const delete_dropdown = document.querySelectorAll('.delete-category');
                            const categories_jq = $('.category')
                            // ul_dropdownCategory.innerHTML += `<li data-type=${categories.length}
                            // class="el-select-dropdown__item adm-select-option list-category__dropdown">
                            // <span>${input_category.value}</span>
                            // </li>`
                            clickDeleteCategory(delete_dropdown, categories_jq);
                        }
                    }

                })

                close_addCategory.addEventListener('click', (e) => {
                    successInputCategory(0, '')
                    successInputCategory(1, '')
                })
                close_add.addEventListener('click', (e) => {
                    successInputCategory(0, '')
                    successInputCategory(1, '')
                })




                const member_thumbs = document.querySelectorAll('.member-thumbs');
                member_thumbs.forEach(item => {
                        let html = ''
                        let count = 0;
                        for (var i = 0; i < employee_relate.length; i++) {
                            if (employee_relate[i].IDService == item.getAttribute('data-service')) {
                                if (count < 2) {
                                    html += `<div class="adm-avatar size-32 margin-right-0 margin-left--10"
                                            style="background-image: url(
                                            ${employee_relate[i].PathImgStaff});
                                            border: 3px solid rgb(255, 255, 255); color:
                                            rgb(19, 150, 110); z-index: 5;">
                                    </div>`
                                }
                                count++;
                            }
                        }
                        if (count > 2) {
                            html += ` <div class="member-thumbs__more-item adm-avatar size-32 margin-right-0 margin-left--10"
                                style="background-color: rgb(230, 239, 254);
                                border: 3px solid rgb(255, 255, 255);
                                color: rgb(0, 90, 238);">+${count - 2}
                            </div>`
                        }
                        item.innerHTML = html;
                        const delete_dropdown = document.querySelectorAll('.delete-category');
                        const categories_jq = $('.category')
                        clickDeleteCategory(delete_dropdown, categories_jq);
                    });



                const edit_dropdown = document.querySelectorAll('.edit-category');
                const input_editCategory = document.querySelector('#input-category__edit');
                const inputDes_editCategory = document.querySelector('#input-des-category__edit');
                const nameServices = document.querySelectorAll('.name-type-service');
                const btnEditCategory = document.getElementById('adm-edit-category');
                const close_edit = document.getElementById('close-btn__edit');
                const edit_closeIcon = document.getElementById('close-edit__category');
                const numberService = document.querySelectorAll('.num-services')
                function clickDeleteCategory(deletes, categoryjq) {
                    deletes.forEach((item, index) => {
                        item.onclick = async () => {
                            const { status } = await deleteCategory(item.getAttribute('data-type'));
                            console.log({ status })
                            if (status == 'success') {
                                location.reload();
                            }
                        }
                    })
                }


                let idType = '';
                let indexType = -1;

                edit_dropdown.forEach((item, index) => {
                    item.onclick = async () => {
                        // const { status, info } = await infoCategory(item.getAttribute('data-type'))
                        const info = (rawCategories ?? []).find(element => element.idTypeService == item.getAttribute('data-type'));
                        input_editCategory.value = info.nameType
                        inputDes_editCategory.value = info.description;
                        idType = item.getAttribute('data-type');
                        indexType = index;
                    }
                })

                edit_closeIcon.addEventListener('click', (e) => {
                    successInputCategory(2, '')
                    successInputCategory(3, '')
                })

                close_edit.addEventListener('click', (e) => {
                    successInputCategory(2, '')
                    successInputCategory(3, '')
                })

                btnEditCategory.addEventListener('click', async (e) => {
                    e.preventDefault();
                    let flag = 0;
                    if (input_editCategory.value == '') {
                        errInputCategory(2, 'B???n vui l??ng nh???p t??n danh m???c')
                    } else {
                        successInputCategory(2, '')
                        flag = 1;
                    }

                    if (inputDes_editCategory.value == '') {
                        errInputCategory(3, 'B???n vui l??ng nh???p m?? t??? c???a danh m???c n??y')
                    } else {
                        successInputCategory(3, '')
                        if (flag == 1) {
                            flag = 2;
                        }
                    }

                    if (flag == 2) {
                        const { status } = await editCategory(idType, input_editCategory.value.trim(), inputDes_editCategory.value.trim());
                        const category = (rawCategories ?? []).find(element => element.idTypeService == idType);
                        category.nameType = input_editCategory.value.trim();
                        category.description = inputDes_editCategory.value.trim();
                        if (status == 'success') {
                           nameServices[indexType].textContent = input_editCategory.value.trim();
                           $('#edit-category_modal').modal('hide');
                        }
                    }
                })

                const categories = document.querySelectorAll('.category')


                categories.forEach((item, index) => {
                    item.onclick = (e) => {
                        var lengthService = numberService[index].textContent.trim().split(' ')[0]
                        $('.services-list-header h5').text(`T???t C??? D???ch V??? (${lengthService})`)
                        if (!e.target.closest('.adm-actions__drop-down')) {
                            notActiveCategory();
                            item.classList.add('active');
                            if (index != 0) {
                                categories[index - 1].style.borderBottom = 'none';
                                renderService_Category(item.getAttribute('data-type'))
                            }
                            else {
                                renderAllService();
                            }
                        }
                    }
                })

                function notActiveCategory() {
                    categories.forEach((item, index) => {
                        categories[index].classList.remove('active');
                        categories[index].style = '';
                    })
                }

                function renderService_Category(idType) {
                    const adm_service = document.querySelectorAll('.adm-service');
                    adm_service.forEach((item, index) => {
                        console.log("item data type: ", item.getAttribute('data-type'));
                        if (item.getAttribute('data-type') != idType) {
                            item.style.display = 'none';
                        }
                        else {
                            item.style.display = 'flex';
                        }
                    })
                }

                function renderAllService() {
                    const adm_service = document.querySelectorAll('.adm-service');
                    adm_service.forEach((item, index) => {
                        item.style.display = 'flex';
                    })
                }


                // handle add service

                const upload_element = document.querySelector('.adm-square-uploader__image');
                const upload_input = document.querySelector('.el-upload__input');
                const upload_dragger = document.querySelector('.el-upload-dragger');

                //input
                const input_categoryService = document.querySelector('#input-category-service__add');
                const input_employeeService = document.querySelector('#input-employee-service');
                const input_priceService = document.querySelector('#input-price-service');

                // drop down
                const dropDown_categoryService = document.querySelector('#dropdown-category__service');
                const dropDown_employeeService = document.querySelector('#dropdown-employee__service');
                const arrows_down = document.querySelectorAll('.el-select__caret');
                const listDropdown_category = document.querySelectorAll('.list-category__dropdown');
                const spans_categorydd = document.querySelectorAll('.list-category__dropdown span');
                const listDropdown_employee = document.querySelectorAll('.list-employee__dropdown');
                const spans_employeedd = document.querySelectorAll('.list-employee__dropdown span');
                const action_uploadImg = document.querySelector('.adm-square-uploader__actions');
                const btnChange_upload = document.querySelector('#change-upload');
                const btnDelete_upload = document.querySelector('#delete-upload');

                // variable to add

                let idType_service = 1;
                let arrIdStaff_service = [];
                let price_service = 0;





                var haveImg = false;
                var isUpload = false;

                upload_element.onclick = (e) => {
                    upload_input.click();
                    upload_input.onchange = () => {
                        isUpload = true;
                        var upload_img = "";
                        const file = upload_input.files[0];
                        upload_img = URL.createObjectURL(file)
                        upload_dragger.innerHTML = `
                            <div class="uploaded-photo-preview">
                                <img src="${upload_img}" alt="">
                            </div>
                            `
                        haveImg = true;
                        action_uploadImg.style.display = 'flex';
                    }
                }



                btnChange_upload.addEventListener('click', (e) => {
                    e.preventDefault();
                    upload_element.click();
                })

                btnDelete_upload.addEventListener('click', (e) => {
                    e.preventDefault();
                    upload_dragger.innerHTML = `
                            <div>
                                <i class="fa-solid fa-upload adm-icon adm-icon__extraLarge adm-icon__primary"></i>
                                <div class="el-upload__text">Nh???p v??o ????? t???i ???nh l??n</div>
                            </div>
                        `
                    action_uploadImg.style.display = 'none';
                    haveImg = false;
                })


                var scrollY = 312;
                var scrollY_employee = 552;

                input_categoryService.onclick = (e) => {
                    if (dropDown_categoryService.getAttribute('style') == 'min-width: 492.575px; transform-origin: center top; z-index: 2026; display: none;') {
                        arrows_down[0].style.transform = 'rotate(0deg)';
                        dropDown_categoryService.style = `min-width: 492.575px; transform-origin: center top; z-index: 2030; position: fixed; top: ${scrollY}px; left: 618px;display:block;`
                    }
                    else {
                        arrows_down[0].style.transform = 'rotate(180deg)';
                        dropDown_categoryService.style = `min-width: 492.575px; transform-origin: center top; z-index: 2026; display: none`
                    }
                }





                const modalAddService = document.querySelector('#add-service_modal')
                const tittleService = document.querySelector('.tittle-service');
                modalAddService.onscroll = function () {
                    var scrollTop = modalAddService.scrollTop;
                    scrollY = 312 - scrollTop;
                    scrollY_employee = 552 - scrollTop;
                    if (dropDown_categoryService.style.display == 'block') {
                        dropDown_categoryService.style = `min-width: 492.575px; transform-origin: center top; z-index: 2030; position: fixed; top: ${scrollY}px; left: 618px;display:block;`
                    }
                    if (dropDown_employeeService.style.display == 'block') {
                        dropDown_employeeService.style = `min-width: 320px; position: fixed; top: ${scrollY_employee}px; left: 798px; transform-origin: center bottom; z-index: 2003;display:block`
                    }
                }
                var indexPredd = 0;

                let isOver_category = false;
                let isOver_employee = false;
                dropDown_categoryService.onmouseover = function () {
                    isOver_category = true;
                }

                dropDown_categoryService.onmouseleave = function () {
                    isOver_category = false;
                }

                dropDown_employeeService.onmouseover = function () {
                    isOver_employee = true;
                }

                dropDown_employeeService.onmouseleave = function () {
                    isOver_employee = false;
                }

                listDropdown_category.forEach((item, index) => {
                    item.onclick = function () {
                        listDropdown_category[indexPredd].classList.remove('selected');
                        isClickCategory_dd = true;
                        input_categoryService.value = spans_categorydd[index].textContent.trim();
                        arrows_down[0].style.transform = 'rotate(180deg)';
                        dropDown_categoryService.style = `min-width: 492.575px; transform-origin: center top; z-index: 2026; display: none`
                        item.classList.add('selected');
                        successInputCategory(6, '');
                        indexPredd = index;
                        idType_service = item.getAttribute('data-type');
                    }
                })
                input_categoryService.onfocusout = () => {
                    if (!isOver_category) {
                        arrows_down[0].style.transform = 'rotate(180deg)';
                        dropDown_categoryService.style = `min-width: 492.575px; transform-origin: center top; z-index: 2026; display: none`
                    }

                }


                // handle employee dropdown 


                input_employeeService.onclick = (e) => {
                    if (dropDown_employeeService.getAttribute('style') == 'min-width: 320px; transform-origin: center bottom; z-index: 2003; display: none;') {
                        arrows_down[1].style.transform = 'rotate(0deg)';
                        dropDown_employeeService.style = `min-width: 320px; position: fixed; top: ${scrollY_employee}px; left: 798px; transform-origin: center bottom; z-index: 2003; display:block;`
                    }
                    else {
                        arrows_down[1].style.transform = 'rotate(180deg)';
                        dropDown_employeeService.style = 'min-width: 320px; transform-origin: center bottom; z-index:2003; display: none;'
                    }
                }

                input_employeeService.onfocusout = () => {
                    if (!isOver_employee) {
                        arrows_down[1].style.transform = 'rotate(180deg)';
                        dropDown_employeeService.style = 'min-width: 320px; transform-origin: center bottom; z-index:2003; display: none;'
                    }
                }
                var indexFirstChecking = -1;
                var indexIsChecking = -1;
                var countClick = 0;

                function getIndexIsChecking() {
                    for (var i = 0; i < listDropdown_employee.length; i++) {
                        if (listDropdown_employee[i].classList.contains('selected')) {
                            indexIsChecking = i;
                            break;
                        }
                    }
                }


                const tags_employee = document.querySelector('.el-select__tags span');
                const span_nameEmployee = document.querySelectorAll('.list-employee__dropdown span');
                var countEmployee = 0;
                listDropdown_employee.forEach((item, index) => {
                    item.onclick = function () {
                        arrIdStaff_service = []
                        input_employeeService.value = ' ';
                        input_employeeService.focus();
                        countClick++;
                        if (countClick == 1) {
                            indexFirstChecking = index;
                        }
                        if (listDropdown_employee[index].classList.contains('selected')) {
                            listDropdown_employee[index].classList.remove('selected');
                            if (indexFirstChecking == index && countClick > 1) {
                                getIndexIsChecking();
                                if (indexIsChecking == -1) {
                                    indexIsChecking = indexFirstChecking;
                                }
                                indexFirstChecking = indexIsChecking;
                                const tagsText = document.querySelector('.el-select__tags-text')
                                tagsText.innerHTML = span_nameEmployee[indexIsChecking].textContent.trim()
                            }
                            countEmployee--;
                            if (countEmployee == 1) {
                                const spanCount = document.querySelectorAll('.el-tag--info');
                                spanCount[1].remove();
                            }
                            else if (countEmployee > 1) {
                                const spanCount = document.querySelectorAll('.el-select__tags-text');
                                spanCount[1].textContent = `+${countEmployee - 1}`
                            }
                            else {
                                const spanCount = document.querySelectorAll('.el-tag--info');
                                spanCount[0].remove();
                                input_employeeService.placeholder = 'L???a Ch???n Nh??n Vi??n';
                                input_employeeService.value = '';
                                countClick = 0;
                            }
                        }
                        else {
                            countEmployee++;
                            item.classList.add('selected');
                            if (countEmployee == 2) {
                                tags_employee.innerHTML += `<span
                                    class="el-tag el-tag--info el-tag--small el-tag--light">
                                    <span class="el-select__tags-text">
                                        +${countEmployee - 1}
                                    </span>
                                </span>`
                            }
                            else if (countEmployee > 2) {
                                const spanCount = document.querySelectorAll('.el-select__tags-text');
                                spanCount[1].textContent = `+${countEmployee - 1}`
                            }
                            else {
                                tags_employee.innerHTML = `
                                    <span
                                        class="el-tag el-tag--info el-tag--small el-tag--light">
                                        <span class="el-select__tags-text">
                                            ${span_nameEmployee[index].textContent.trim()}
                                        </span>
                                    </span>`
                            }
                            successInputCategory(8, '')
                        }
                    }

                })



                function checkNotSelected() {
                    listDropdown_employee.forEach((item, index) => {
                        if (item.classList.contains('selected')) {
                            return true;
                        }
                        return false;
                    })
                }

                function resetSelected_S() {
                    listDropdown_employee.forEach((item, index) => {
                        if (item.classList.contains('selected')) {
                            item.classList.remove('selected');
                        }
                    })
                }

                function resetSelected_C() {
                    listDropdown_category.forEach((item, index) => {
                        if (item.classList.contains('selected')) {
                            item.classList.remove('selected');
                        }
                    })
                }
                // handle price service

                input_priceService.oninput = () => {
                    input_priceService.value = input_priceService.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');
                    if (input_priceService.value.length >= 1 && input_priceService.value != '$') {
                        input_priceService.value = `$${input_priceService.value}`

                    }
                    if (input_priceService.value == '' || input_priceService.value == '$0') {
                        div_category[9].classList.remove('is-success');
                        div_category[9].classList.add('is-error');
                        err_div[10].textContent = 'B???n vui l??ng nh???p gi?? cho d???ch v???';
                    } else {
                        div_category[9].classList.add('is-success');
                        div_category[9].classList.remove('is-error');
                        err_div[10].textContent = '';
                    }
                    price_service = input_priceService.value.split('$')[1];
                }

                // handle submit add service

                const btnAddService = document.getElementById('adm-btn-service__add');
                const inputNameService = document.getElementById('input-name-service__add')
                const inputDesService = document.getElementById('input-des-service__add')
                const inputNameEmployee_service = document.getElementById('input-employee-service')
                const button_addS = document.querySelector('.adm-button-service')

                button_addS.onclick = () => {
                    input_categoryService.value = spans_categorydd[0].textContent.trim();
                    resetSelected_C();
                    listDropdown_category[0].classList.add('selected');
                    indexPredd = 0;
                    tittleService.textContent = 'T???o D???ch V???';
                    $('#adm-btn-service__add span').text('Th??m D???ch V???')
                    inputNameService.value = '';
                    inputDesService.value = '';
                    input_employeeService.placeholder = 'L???a Ch???n Nh??n Vi??n';
                    input_employeeService.value = '';
                    tags_employee.innerHTML = '';
                    countEmployee = 0;
                    resetSelected_S();
                    input_priceService.value = '';
                    btnDelete_upload.click();
                    successInputCategory(4, "")
                    successInputCategory(5, "")
                    successInputCategory(7, "")
                    successInputCategory(8, "")
                    div_category[9].classList.add('is-success');
                    div_category[9].classList.remove('is-error');
                    err_div[10].textContent = '';

                }

                inputNameService.oninput = () => {
                    if (inputNameService.value == '') {
                        errInputCategory(5, 'B???n vui l??ng nh???p t??n d???ch v???')
                    } else {
                        successInputCategory(5, '')
                    }
                }

                inputDesService.oninput = () => {
                    if (inputDesService.value == '') {
                        errInputCategory(7, 'B???n vui l??ng nh???p t??n d???ch v???')
                    } else {
                        successInputCategory(7, '')
                    }
                }

                function pushIdServices() {
                    listDropdown_employee.forEach((item, index) => {
                        if (item.classList.contains('selected')) {
                            arrIdStaff_service.push(item.getAttribute('data-employee'))
                        }
                    })
                }

                var idService_edit = 0;

                btnAddService.addEventListener('click', async (e) => {
                    e.preventDefault();
                    let flag = 0;
                    if (inputNameService.value == '') {
                        errInputCategory(5, 'B???n vui l??ng nh???p t??n d???ch v???')
                    } else {
                        successInputCategory(5, '')
                        flag = 1;
                    }
                    if (inputDesService.value == '') {
                        errInputCategory(7, 'B???n vui l??ng nh???p m?? t??? cho d???ch v???')
                    } else {
                        successInputCategory(7, '')
                        if (flag == 1) {
                            flag = 2
                        }
                    }
                    if (inputNameEmployee_service.value == '') {
                        errInputCategory(8, 'B???n vui l??ng ch???n nh??n vi??n cho d???ch v???')
                    } else {
                        successInputCategory(8, '')
                        if (flag == 2) {
                            flag = 3
                        }
                    }

                    if (input_priceService.value == 0 || input_priceService.value == '$0') {
                        div_category[9].classList.remove('is-success');
                        div_category[9].classList.add('is-error');
                        err_div[10].textContent = 'B???n vui l??ng nh???p gi?? cho d???ch v???';
                    } else {
                        div_category[9].classList.add('is-success');
                        div_category[9].classList.remove('is-error');
                        err_div[10].textContent = '';
                        if (flag == 3) {
                            flag = 4;
                        }
                    }
                    if (haveImg) {
                        successInputCategory(4, '')
                        if (flag == 4) {
                            flag = 5
                        }
                    } else {
                        errInputCategory(4, 'B???n vui l??ng ch???n ???nh d???ch v???')
                    }

                    //  ==> 
                    if (flag == 5) {
                        const form = document.getElementById('addServiceForm');
                        const arrEmploy = document.getElementById('arrEmployee');
                        const inputIdS = document.getElementById('idServiceNew')
                        if ($('#adm-btn-service__add span').text() == 'L??u Thay ?????i') {
                            form.action = "service/edit-service";
                            inputIdS.value = idService_edit;
                        }
                        else {
                            const adm_All = document.querySelectorAll('.adm-service');
                            let lengthServiceAll = adm_All.length;
                            inputIdS.value = lengthServiceAll + 1;
                        }
                        if (!isUpload) {
                            form.action = 'service/edit-service-without-img'
                            form.enctype = '';
                        }
                        pushIdServices();
                        arrEmployee.value = arrIdStaff_service;
                        input_categoryService.value = idType_service;
                        console.log("descrip: ", inputDesService.value);
                        form.submit();
                    }

                })


                function isCheckEmployee_dd(arrEm) {
                    var count = 0;
                    countEmployee = 0;
                    listDropdown_employee.forEach((item, index) => {
                        arrEm.forEach((item1, index1) => {
                            if (item1.idStaff == item.getAttribute('data-employee')) {
                                item.classList.add('selected');
                                count++;
                                countEmployee++;
                                if (count == 1) {
                                    tags_employee.innerHTML = `
                                    <span
                                        class="el-tag el-tag--info el-tag--small el-tag--light">
                                        <span class="el-select__tags-text">
                                            ${span_nameEmployee[index].textContent.trim()}
                                        </span>
                                    </span>`
                                }
                            }
                        })
                    })
                    if (count > 1) {
                        tags_employee.innerHTML += `<span
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

                // Handle edit service 
                const editDropDown_service = document.querySelectorAll('.edit-service');
                function renderDataCategory(idType) {
                    listDropdown_category.forEach((item, index) => {
                        if (item.getAttribute('data-type') == idType) {
                            input_categoryService.value = spans_categorydd[index].textContent.trim();
                            listDropdown_category[index].classList.add('selected');
                            indexPredd = index;
                        }
                    })
                }
                editDropDown_service.forEach((item, index) => {
                    item.onclick = async () => {
                        isUpload = false;
                        idService_edit = item.getAttribute('data-service');
                        tittleService.textContent = 'Ch???nh S???a D???ch V???';
                        $('#adm-btn-service__add span').text("L??u Thay ?????i")
                        if (status === 'success') {
                            // console.log(infoService)
                            const info = rawServices.find(service => service.idService == idService_edit);
                            console.log(info)
                            idType_service = info.typeService;
                            resetSelected_C();
                            renderDataCategory(idType_service)
                            // input_categoryService.value = spans_categorydd[info.TypeService - 1].textContent.trim();
                            // listDropdown_category[info.TypeService - 1].classList.add('selected');
                            // indexPredd = info.TypeService - 1;
                            inputNameService.value = info.nameService;
                            inputDesService.value = info.description;
                            resetSelected_S();
                            input_priceService.value = `$${info.price}`;
                            btnDelete_upload.click();
                            upload_dragger.innerHTML = `
                            <div class="uploaded-photo-preview">
                                <img src="${info.pathImg}" alt="">
                            </div>
                            `
                            const employee_service = (rawStaffServices ?? []).filter(element => element.idService == idService_edit);
                            input_employeeService.placeholder = '';
                            input_employeeService.value = ' ';
                            isCheckEmployee_dd(employee_service);
                            haveImg = true;
                            action_uploadImg.style.display = 'flex';
                            successInputCategory(4, "")
                            successInputCategory(5, "")
                            successInputCategory(7, "")
                            successInputCategory(8, "")
                            div_category[9].classList.add('is-success');
                            div_category[9].classList.remove('is-error');
                            err_div[10].textContent = '';

                        }
                    }
                })

                // handle delete service
                const btnConfirm_deleteService = document.querySelector('#btn-delete__service');
                var idService_delete;
                var idtype;
                const notiDelete = document.querySelector('.notification_delete-service p')

                var deleteDropDown_service = document.querySelectorAll('.delete-service');
                deleteDropDown_service.forEach((item, index) => {
                    item.onclick = async () => {
                        idService_delete = item.getAttribute('data-service');
                        const { status, infoBookFuture, infoBookDone } = await getInfoBookItem(idService_delete);
                        if (status == 'success') {
                            var haveBook = false
                            if (infoBookFuture.length > 0) {
                                haveBook = true;
                                notiDelete.textContent = `B???n c?? ch???c ch???n mu???n x??a d???ch v??? n??y? H??nh ?????ng n??y s??? x??a ??i ${infoBookFuture.length} l???n ?????t d???ch v??? n??y trong t????ng lai`;
                            }
                            if (infoBookDone.length > 0) {
                                haveBook = true;
                                notiDelete.textContent = `B???n c?? ch???c ch???n mu???n x??a d???ch v??? n??y? H??nh ?????ng n??y s??? x??a ??i ${infoBookDone.length} l???n ???? ?????t d???ch v??? n??y`;
                            }
                            if (infoBookFuture.length > 0 && infoBookDone.length > 0) {
                                haveBook = true;
                                notiDelete.textContent = `B???n c?? ch???c ch???n mu???n x??a d???ch v??? n??y? H??nh ?????ng n??y s??? x??a ??i ${infoBookDone.length} l???n ???? ?????t d???ch v??? n??y v?? ${infoBookFuture.length} l???n ?????t d???ch v??? n??y trong t????ng lai`;
                            }
                            if (!haveBook)
                                notiDelete.textContent = `B???n c?? ch???c ch???n mu???n x??a d???ch v??? n??y? H??nh ?????ng n??y s??? x??a nh???ng th??ng tin kh??c li??n quan ?????n d???ch v??? n??y`;

                        }

                        idtype = item.getAttribute('data-type');
                    }
                })


                function removeService(idService) {
                    const adm_All = document.querySelectorAll('.adm-service');
                    for (var i = 0; i < adm_All.length; i++) {
                        if (adm_All[i].getAttribute('data-service') == idService) {
                            adm_All[i].remove();
                            break;
                        }
                    }
                }

                function renderDataCategory_afterDelete(idType) {
                    console.log(idType);
                    numberService.forEach((item, index) => {
                        if (item.getAttribute('data-type') == idType) {
                            var lengthCurrent = numberService[index].textContent.split(' ')[0];
                            var lengthCurrentAll = numberService[0].textContent.split(' ')[0];
                            numberService[index].textContent = `${lengthCurrent - 1} D???ch V???`;
                            numberService[0].textContent = `${lengthCurrentAll - 1} D???ch V???`;
                        }
                    })
                }

                btnConfirm_deleteService.addEventListener('click', async () => {
                    $('#alertModal').modal('hide');
                    const { status } = await deleteService(idService_delete);
                    if (status == "success") {
                        //location.reload();
                        renderDataCategory_afterDelete(idtype);
                        removeService(idService_delete);
                    }


                })


                // render info employee 

                const spans_temp = $('.span-info-click');
                const click_infoEm = document.querySelectorAll('.temp-click__info');
                const list = document.querySelectorAll('.list');
                const infoDiv = document.querySelectorAll('.info-employ__service');
                let isFirstClickInfo = false;
                var indexPreClick = -1;
                click_infoEm.forEach((item, index) => {
                    item.onclick = async () => {
                        if (indexPreClick === index) {
                            infoDiv[indexPreClick].style.display = 'none'
                            indexPreClick = -1;
                            return;
                        } else if (indexPreClick !== -1) {
							infoDiv[indexPreClick].style.display = 'none'
						}
                        list[index].innerHTML = ``;
                        ids = item.getAttribute('data-service');
                        const info = (employee_relate ?? []).filter(element => element.IDService == ids);
                        info.forEach((item1, index1) => {
                            list[index].innerHTML += `<span class="list-row">
                                <div class="adm-avatar size-24 mr-2 ml-0"
                                    style="background-image: url(${item1.PathImgStaff});color: rgb(36, 112, 172);">
                                </div>
                                <span>${item1.NameStaff}</span>
                            </span>`
                        })
                        indexPreClick = index;
                        infoDiv[index].style.display = "block";
                        if (info.length == 3) {
                            infoDiv[index].style.top = `${-75 - 22 * (info.length)}px`;
                        }
                        else if (info.length == 2) {
                            infoDiv[index].style.top = `${-75 - 15 * (info.length)}px`;
                        }
                        else if (info.length == 4) {
                            infoDiv[index].style.top = `${-75 - 25 * (info.length)}px`;
                        }
                        else if (info.length > 4) {
                            infoDiv[index].style.top = `${-80 - 26 * 5}px`;
                        }
                    }


                })

                // API DATA

                async function getInfoBookItem(idService) {
                    return (await instance.post('service/info-book', {
                        idService,
                    })).data
                }

                async function deleteService(idService) {
                    return (await instance.post('service/delete-service', {
                        idService,
                    })).data
                }

                async function createCategory(name, desc) {
                    return postData("service/create-category", { nameType: name, description: desc });
                }

                async function deleteCategory(id) {
                    return postData("service/delete-category", { idTypeService: id })
                }

                async function editCategory(id, name, desc) {
                    return postData("service/edit-category", { idTypeService: id, nameType: name, description: desc })
                }
            })();
        }
        const logoutBtn = document.querySelector('#log-out')
        logoutBtn.onclick = (e) => {
            e.preventDefault();
            window.localStorage.clear();
            window.location = '/login.htm'
        }
    })();
}
else {
    window.location = '/page-err';
}