const accessToken = `${window.localStorage.getItem('accessToken')}`;
if (accessToken != `null`) {
    (async () => {
        const ids = location.href.split('?idStore=')[1];
        $('#idStore').val(ids);
        const { status, employee, role } = await checkToken(accessToken);
        if (status == 'success') {
            if (role == 3) {
                var dropDownsType = document.querySelectorAll('.item-type-employee__dropdown')
                var admEmployee = document.querySelectorAll('.adm-service')
                admEmployee.forEach(item => {
                    if (item.getAttribute('data-manager') === `SuperAdmin`) item.remove();
                })
                var dropDownManager = document.querySelectorAll('.item-managers__dropdown')
                dropDownManager.forEach(item => {
                    if (item.getAttribute('data-manager') === `SuperAdmin`) item.remove();
                })
                dropDownsType[2].remove();
                dropDownsType[3].remove();
                if (employee.store.idStore != parseInt(ids)) {
                    location.href = './page-err'
                }
            }
            else if (role == 4) {
                var admEmployee = document.querySelectorAll('.adm-service')
                admEmployee.forEach(item => {
                    if (item.getAttribute('data-manager') === `SuperAdmin`) item.style.backgroundColor = '#070d3e';
                })
                var service_link = document.querySelector('.service-link');
                var service_span = document.querySelector('.service-span');
                service_link.classList.remove('d-none');
                service_span.classList.remove('d-none');
            }
            const upload_element = document.querySelector('.avatar-uploader');
            const upload_input = document.querySelector('.el-upload__input');
            const upload_dragger = document.querySelector('.el-upload-dragger');
            const clearImg_upload = document.querySelector('.avatar-uploader__trash');

            //  function log err
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
            // variable to add employee
            var haveImg = false;
            // var idstore_add = -1;
            var idmanager;
            var idTypeStaff = 1;
            var idStore;
            var isUpload = false;
            //  input

            const inputSurName = document.getElementById('input-surname-employee__add');
            const inputNameEmployee = document.getElementById('input-name-employee__add');
            // const inputStore = document.querySelector('#input-store-employee__add');
            const inputManager = document.querySelector('#input-manager-employee__add');
            const inputCCCD = document.querySelector('#input-cccd-employee__add');
            const inputEmail = document.querySelector('#input-email-employee__add');
            const inputPhone = document.querySelector('#input-phone-employee__add');
            const inputSex = document.querySelector('#input-sex-employee__add');
            const inputService = document.querySelector('#input-service_assign__add');
            const inputTypeEm = document.querySelector('#input-type-employee__add');



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
                    successInputCategory(0, '')
                    haveImg = true;
                    clearImg_upload.style.display = 'block';
                }
            }

            clearImg_upload.onclick = () => {
                upload_dragger.innerHTML = `
    <div class="el-upload-dragger__upload">
    <div>
        <i
            class="el-icon-upload fa-solid fa-cloud-arrow-up"></i>
        <div class="el-upload__text mt-2">
            Nh???n v??o ????? t???i ???nh l??n
        </div>
    </div>
</div>
        `
                clearImg_upload.style.display = 'none';
                haveImg = false;
            }


            // handle dropdown

            // const dropDown_storeEmployee = document.querySelector('#dropdown-store__employee');
            const dropDown_managersEmployee = document.querySelector('#dropdown-managers__employee');
            const dropDown_sexEmployee = document.querySelector('#dropdown-sex__employee');
            const dropDown_servicesEmployee = document.querySelector('#dropdown-services__employee');
            const dropDown_typeEmployee = document.querySelector('#dropdown-type__employee');
            const arrows_down = document.querySelectorAll('.el-select__caret');
            // const itemDropdown_store = document.querySelectorAll('.item-store__dropdown');
            const itemDropdown_managers = document.querySelectorAll('.item-managers__dropdown');
            const itemDropdown_sex = document.querySelectorAll('.item-sex__dropdown');
            const itemDropdown_service = document.querySelectorAll('.item-service__dropdown');
            const itemDropdown_typeEm = document.querySelectorAll('.item-type-employee__dropdown');


            // variable scroll 
            var scrollStore = 448;
            var scrollManager = 450;
            var scrollSex = 560;
            var scrollService = 330;
            var scrollType = 560;
            const modalAddEmployee = document.querySelector('#add-employee_modal')

            inputManager.onclick = () => {
                if (dropDown_managersEmployee.getAttribute('style') == 'min-width: 450px; transform-origin: center bottom; z-index: 2026; display: none;') {
                    arrows_down[2].style.transform = 'rotate(0deg)';
                    dropDown_managersEmployee.style = `min-width: 450px; transform-origin: center top; z-index: 2030; position: fixed; top: ${scrollManager}px; left: 415px;display:block;`
                }
                else {
                    arrows_down[2].style.transform = 'rotate(180deg)';
                    dropDown_managersEmployee.style = `min-width: 450px; transform-origin: center bottom; z-index: 2026; display: none`
                }
            }

            inputSex.onclick = () => {
                if (dropDown_sexEmployee.getAttribute('style') == 'min-width: 220px; transform-origin: center bottom; z-index: 2030; display: none;') {
                    arrows_down[4].style.transform = 'rotate(0deg)';
                    dropDown_sexEmployee.style = `min-width: 220px; transform-origin: center top; z-index: 2026; position: fixed; top: ${scrollSex}px; right: 200px;display:block;`
                }
                else {
                    arrows_down[4].style.transform = 'rotate(180deg)';
                    dropDown_sexEmployee.style = `min-width: 220px; transform-origin: center bottom; z-index: 2030; display: none`
                }
            }

            inputService.onclick = () => {
                if (dropDown_servicesEmployee.getAttribute('style') == 'min-width: 920px; transform-origin: center bottom; z-index: 2026; display: none;') {
                    arrows_down[0].style.transform = 'rotate(0deg)';
                    dropDown_servicesEmployee.style = `min-width: 920px; transform-origin: center top; z-index: 2030; position: fixed; top: ${scrollService}px; right: 204px;display:block;`
                }
                else {
                    arrows_down[0].style.transform = 'rotate(180deg)';
                    dropDown_servicesEmployee.style = `min-width: 920px; transform-origin: center bottom; z-index: 2026; display: none`
                }
            }

            inputTypeEm.onclick = () => {
                if (dropDown_typeEmployee.getAttribute('style') == 'min-width: 220px; transform-origin: center bottom; z-index: 2030; display: none;') {
                    arrows_down[3].style.transform = 'rotate(0deg)';
                    dropDown_typeEmployee.style = `min-width: 220px; transform-origin: center top; z-index: 2026; position: fixed; top: ${scrollType}px; right: 434px;display:block;`
                }
                else {
                    arrows_down[3].style.transform = 'rotate(180deg)';
                    dropDown_typeEmployee.style = `min-width: 220px; transform-origin: center bottom; z-index: 2030; display: none`
                }
            }

            // oninput text
            inputSurName.oninput = () => {
                if (inputSurName.value == '') {
                    errInputCategory(1, 'B???n vui l??ng nh???p h??? c???a nh??n vi??n')
                } else {
                    successInputCategory(1, '')
                }
            }

            inputNameEmployee.oninput = () => {
                if (inputNameEmployee.value == '') {
                    errInputCategory(2, 'B???n vui l??ng nh???p t??n c???a nh??n vi??n')
                } else {
                    successInputCategory(2, '')
                }
            }

            inputCCCD.oninput = () => {
                inputCCCD.value = inputCCCD.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');
                if (inputCCCD.value == '') {
                    errInputCategory(6, 'B???n vui l??ng nh???p CCCD/CMND c???a nh??n vi??n')
                } else {
                    successInputCategory(6, '')
                }
            }

            inputEmail.oninput = () => {
                if (inputEmail.value == '') {
                    errInputCategory(9, 'B???n vui l??ng nh???p email c???a nh??n vi??n')
                } else {
                    successInputCategory(9, '')
                }
            }

            inputPhone.oninput = () => {
                inputPhone.value = inputPhone.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');
                if (inputPhone.value == '') {
                    errInputCategory(10, 'B???n vui l??ng nh???p s??? ??i???n tho???i c???a nh??n vi??n')
                } else {
                    successInputCategory(10, '')
                }
            }




            // modal scroll

            modalAddEmployee.onscroll = function () {
                var scrollTop = modalAddEmployee.scrollTop;
                scrollStore = 448 - scrollTop;
                scrollManager = 450 - scrollTop;
                scrollSex = 560 - scrollTop;
                scrollService = 330 - scrollTop;
                scrollType = 560 - scrollTop;
                if (dropDown_managersEmployee.style.display == 'block') {
                    dropDown_managersEmployee.style = `min-width: 450px; transform-origin: center top; z-index: 2030; position: fixed; top: ${scrollManager}px; left: 883px;display:block;`
                }
                if (dropDown_typeEmployee.style.display == 'block') {
                    dropDown_typeEmployee.style = `min-width: 220px; transform-origin: center top; z-index: 2026; position: fixed; top: ${scrollSex}px; right: 430px;display:block;`
                }
                if (dropDown_sexEmployee.style.display == 'block') {
                    dropDown_sexEmployee.style = `min-width: 220px; transform-origin: center top; z-index: 2026; position: fixed; top: ${scrollType}px; right: 200px;display:block;`
                }
                if (dropDown_servicesEmployee.style.display == 'block') {
                    dropDown_servicesEmployee.style = `min-width: 920px; transform-origin: center top; z-index: 2030; position: fixed; top: ${scrollService}px; right: 204px;display:block;`
                }

            }


            //  event onmouse

            // let isOver_store = false;
            let isOver_manager = false;
            let isOver_sex = false;
            let isOver_serive = false;
            let isOver_type = false;

            dropDown_managersEmployee.onmouseover = function () {
                isOver_manager = true;
            }

            dropDown_managersEmployee.onmouseleave = function () {
                isOver_manager = false;
            }

            dropDown_sexEmployee.onmouseover = function () {
                isOver_sex = true;
            }

            dropDown_sexEmployee.onmouseleave = function () {
                isOver_sex = false;
            }

            dropDown_servicesEmployee.onmouseover = function () {
                isOver_serive = true;
            }

            dropDown_servicesEmployee.onmouseleave = function () {
                isOver_serive = false;
            }

            dropDown_typeEmployee.onmouseover = function () {
                isOver_type = true;
            }

            dropDown_typeEmployee.onmouseleave = function () {
                isOver_type = false;
            }

            inputService.onfocusout = () => {
                if (!isOver_serive) {
                    arrows_down[0].style.transform = 'rotate(180deg)';
                    dropDown_servicesEmployee.style = `min-width: 920px; transform-origin: center bottom; z-index: 2026; display: none`
                }
            }

            inputManager.onfocusout = () => {
                if (!isOver_manager) {
                    arrows_down[2].style.transform = 'rotate(180deg)';
                    dropDown_managersEmployee.style = `min-width: 450px; transform-origin: center bottom; z-index: 2026; display: none`
                }
                if (noData_manager.style.display == 'flex') {
                    dropDown_managersEmployee.style = `min-width: 450px; transform-origin: center bottom; z-index: 2026; display: none`
                }
            }

            inputTypeEm.onfocusout = () => {
                if (!isOver_type) {
                    arrows_down[3].style.transform = 'rotate(180deg)';
                    dropDown_typeEmployee.style = `min-width: 220px; transform-origin: center bottom; z-index: 2030; display: none`
                }
            }

            inputSex.onfocusout = () => {
                if (!isOver_sex) {
                    arrows_down[4].style.transform = 'rotate(180deg)';
                    dropDown_sexEmployee.style = `min-width: 220px; transform-origin: center bottom; z-index: 2030; display: none`
                }
            }

            // variable click item dropdown

            var indexPreStore = -1;
            var indexPreManager = -1;
            var indexPreSex = -1;
            var indexPreType = 0;
            let countService = 0;
            // const spans_store = document.querySelectorAll('.item-store__dropdown span');
            const spans_manager = document.querySelectorAll('.item-managers__dropdown span');
            const spans_sexs = document.querySelectorAll('.item-sex__dropdown span');
            const spans_typeEm = document.querySelectorAll('.item-type-employee__dropdown span');
            const spans_service = document.querySelectorAll('.item-service__dropdown span');

            const noData_manager = document.querySelector('.no-data__manager');

            function renderAllManager() {
                itemDropdown_managers.forEach((item) => {
                    if (item.style.display == 'none') item.style.display = 'flex';
                })

                noData_manager.style.display = 'none';
            }


            itemDropdown_managers.forEach((item, index) => {
                item.onclick = function () {
                    successInputCategory(5, '')
                    if (indexPreManager != -1) {
                        itemDropdown_managers[indexPreManager].classList.remove('selected');
                    }
                    inputManager.value = spans_manager[index].textContent.trim();
                    arrows_down[2].style.transform = 'rotate(180deg)';
                    dropDown_managersEmployee.style = `min-width: 450px; transform-origin: center bottom; z-index: 2026; display: none`
                    item.classList.add('selected');
                    indexPreManager = index;
                    idmanager = item.getAttribute('data-manager');
                }
            })

            function renderSelectedAdmin() {
                itemDropdown_managers.forEach((item, index) => {
                    if (item.getAttribute('data-manager') === 'SuperAdmin') {
                        indexPreManager = index
                        item.classList.add('selected');
                        idmanager = item.getAttribute('data-manager');
                        inputManager.value = spans_manager[index].textContent.trim();
                    } else {
                        item.classList.remove('selected');
                        item.style.display = 'none';
                    }
                })
            }
            var idEmployeeClick_edit;

            function renderSelectedManagerAll() {
                itemDropdown_managers.forEach((item, index) => {
                    if (idEmployee == item.getAttribute('data-manager')) {
                        item.style.display = 'none';
                    } else {
                        item.classList.remove('selected');
                        item.style.display = 'flex';
                    }
                })
                indexPreManager = -1;
                inputManager.value = "";
            }

            itemDropdown_typeEm.forEach((item, index) => {
                item.onclick = () => {
                    arrServicesId = [];
                    idTypeStaff = item.getAttribute('data-type');
                    if (index > 0) {
                        removeAllSelectedService();
                        tags_service.innerHTML = "";
                        inputService.placeholder = 'Nh??n Vi??n N??y Kh??ng C???n Ch???n D???ch V??? Cho Ph??p';
                        inputService.value = '';
                        countClick = 0;
                        countService = 0;
                    }
                    else {
                        inputService.placeholder = 'Ch???n D???ch V??? Cho Ph??p';
                        inputService.value = "";
                    }
                    if (index == 2 || index == 3) {
                        renderSelectedAdmin();
                    } else {
                        renderSelectedManagerAll();
                    }
                    itemDropdown_typeEm[indexPreType].classList.remove('selected');
                    inputTypeEm.value = spans_typeEm[index].textContent.trim();
                    arrows_down[3].style.transform = 'rotate(180deg)';
                    dropDown_typeEmployee.style = `min-width: 220px; transform-origin: center bottom; z-index: 2030; display: none`
                    item.classList.add('selected');
                    indexPreType = index;
                }
            })

            itemDropdown_sex.forEach((item, index) => {
                item.onclick = function () {
                    successInputCategory(8, '')
                    if (indexPreSex != -1) {
                        itemDropdown_sex[indexPreSex].classList.remove('selected');
                    }
                    inputSex.value = spans_sexs[index].textContent.trim();
                    arrows_down[4].style.transform = 'rotate(180deg)';
                    dropDown_sexEmployee.style = `min-width: 220px; transform-origin: center bottom; z-index: 2030; display: none`
                    item.classList.add('selected');
                    indexPreSex = index;
                }
            })

            var indexFirstChecking = -1;
            var indexIsChecking = -1;
            function getIndexIsChecking() {
                for (var i = 0; i < itemDropdown_service.length; i++) {
                    if (itemDropdown_service[i].classList.contains('selected')) {
                        indexIsChecking = i;
                        break;
                    }
                }
            }
            const tags_service = document.querySelector('.el-select__tags span');
            var countClick = 0;
            function removeAllSelectedService() {
                itemDropdown_service.forEach((item, index) => {
                    if (item.classList.contains('selected')) item.classList.remove('selected');
                })
            }
            itemDropdown_service.forEach((item, index) => {
                item.onclick = () => {
                    arrServicesId = [];
                    successInputCategory(3, '')
                    if (indexPreType !== 0) {
                        itemDropdown_typeEm[indexPreType].classList.remove('selected');
                        inputTypeEm.value = spans_typeEm[0].textContent.trim();
                        itemDropdown_typeEm[0].classList.add('selected');
                        indexPreType = 0;
                    }
                    inputService.value = " ";
                    // inputService.placeholder = "Nh??n Vi??n N??y Kh??ng C???n Ch???n";
                    inputService.focus();
                    countClick++;
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
                            inputService.placeholder = 'L???a Ch???n D???ch V??? Cho Ph??p';
                            inputService.value = '';
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

            // handle submit form 

            const btnAddDefault = document.getElementById('btn-AddEmployee');

            // variable edit employee

            var idEmployee;

            // ==> form add employee

            const btnAddEmployee = document.getElementById('adm-btn-employee__add');
            const btnAddEmployee_span = document.querySelector('#adm-btn-employee__add span');
            var arrServicesId = [];
            const inputArrServices = document.getElementById('arrServiceAssign');
            const formEmployee = document.getElementById('addEmployeeForm');
            var emailOld, phoneOld;

            function pushIdServiceIntoArr() {
                itemDropdown_service.forEach((item, index) => {
                    if (item.classList.contains('selected')) {
                        arrServicesId.push(item.getAttribute('data-service'));
                    }
                })
            }

            btnAddDefault.addEventListener('click', (e) => {
                inputTypeEm.value = spans_typeEm[0].textContent.trim();
                arrows_down[3].style.transform = 'rotate(180deg)';
                dropDown_typeEmployee.style = `min-width: 220px; transform-origin: center bottom; z-index: 2030; display: none`
                itemDropdown_typeEm[0].classList.add('selected');
                countService = 0;
                tittleEmployee.textContent = "T???o Nh??n Vi??n"
                btnAddEmployee_span.textContent = "Th??m Nh??n Vi??n";
                upload_dragger.innerHTML = `
    <div class="el-upload-dragger__upload">
    <div>
        <i
            class="el-icon-upload fa-solid fa-cloud-arrow-up"></i>
        <div class="el-upload__text mt-2">
            Nh???n v??o ????? t???i ???nh l??n
        </div>
    </div>
</div>
        `
                clearImg_upload.style.display = 'none';
                haveImg = false;
                inputSurName.value = "";
                inputNameEmployee.value = "";
                inputCCCD.value = "";
                inputEmail.value = "";
                inputPhone.value = "";
                // clearSelected_Store();
                clearSelected_Manager();
                removeAllSelectedService();
                clearSelected_TypeEmployee();
                tags_service.innerHTML = "";
                inputService.value = "";
                inputService.placeholder = "Ch???n D???ch V??? Cho Ph??p";
                countClick = 0;
                countService = 0;
                idmanager = -1;
                idTypeStaff = 1;
                idEmployee = '';
                successInputCategory(0, '');
                successInputCategory(1, '');
                successInputCategory(2, '');
                successInputCategory(3, '');
                successInputCategory(4, '');
                successInputCategory(5, '');
                successInputCategory(6, '');
                successInputCategory(8, '');
                successInputCategory(9, '');
                successInputCategory(10, '');
            })

            const inputEditEm = document.querySelector('#idEmployeeEdit');

            btnAddEmployee.addEventListener('click', async (e) => {
                e.preventDefault();
                let flag = 0;

                // validate surname
                if (inputSurName.value == '') {
                    errInputCategory(1, 'B???n vui l??ng nh???p h??? c???a nh??n vi??n')
                } else {
                    successInputCategory(1, '')
                    flag = 1;
                }
                // validate name
                if (inputNameEmployee.value == '') {
                    errInputCategory(2, 'B???n vui l??ng nh???p t??n c???a nh??n vi??n')
                } else {
                    successInputCategory(2, '')
                    if (flag == 1) flag = 2
                }
                // validate service
                if (inputService.placeholder == 'Ch???n D???ch V??? Cho Ph??p') {
                    pushIdServiceIntoArr()
                    if (arrServicesId.length == 0) {
                        errInputCategory(3, 'B???n vui l??ng ch???n d???ch v??? cho ph??p c???a nh??n vi??n n??y')
                    } else {
                        arrServicesId = [];
                        successInputCategory(3, '')
                        if (flag == 2) flag = 4
                    }
                } else {
                    successInputCategory(3, '')
                    if (flag == 2) flag = 4
                }
                // validate manager
                if (inputManager.value == "") {
                    errInputCategory(5, 'B???n vui l??ng ch???n nh??n vi??n qu???n l??')
                } else {
                    successInputCategory(5, '')
                    if (flag == 4) flag = 5
                }
                // validate CCCD
                if (inputCCCD.value == '') {
                    errInputCategory(6, 'B???n vui l??ng nh???p CCCD/CMND c???a nh??n vi??n')
                } else {
                    if (inputCCCD.value.length == 12 || inputCCCD.value.length == 9) {
                        successInputCategory(6, '')
                        if (flag == 5) flag = 6
                    }
                    else {
                        errInputCategory(6, 'B???n vui l??ng nh???p ????ng CCCD/CMND c???a nh??n vi??n')
                    }
                }
                // validate sex
                if (inputSex.value == "") {
                    errInputCategory(8, 'B???n vui l??ng ch???n gi???i t??nh')
                } else {
                    successInputCategory(8, '')
                    if (flag == 6) flag = 7
                }

                // validate email
                if (inputEmail.value == "") {
                    errInputCategory(9, 'B???n vui l??ng nh???p email c???a nh??n vi??n n??y')
                } else {
                    if (validateEmail(inputEmail.value)) {
                        if ($('#adm-btn-employee__add').text().trim() == 'L??u Thay ?????i') {
                            const { status } = await checkExistEmail_edit(emailOld, inputEmail.value)
                            if (status === 'Found') {
                                errInputCategory(9, 'Email n??y ???? ???????c s??? d???ng')
                            } else {
                                successInputCategory(9, '')
                                if (flag == 7) flag = 8
                            }
                        } else {
                            const { status } = await checkExistEmail(inputEmail.value)
                            if (status === 'Found') {
                                errInputCategory(9, 'Email n??y ???? ???????c s??? d???ng')
                            } else {
                                successInputCategory(9, '')
                                if (flag == 7) flag = 8
                            }
                        }
                    } else {
                        errInputCategory(9, 'B???n vui l??ng nh???p ????ng email')
                    }
                }
                // validate phone
                if (inputPhone.value == "") {
                    errInputCategory(10, 'B???n vui l??ng nh???p s??? ??i???n tho???i c???a nh??n vi??n n??y')
                }
                else {
                    if (validatePhone(inputPhone.value)) {
                        if ($('#adm-btn-employee__add').text().trim() == 'L??u Thay ?????i') {
                            const { status } = await checkExistPhone_edit(phoneOld, inputPhone.value)
                            if (status == 'exist') {
                                errInputCategory(10, 'S??? ??i???n tho???i n??y ???? ???????c d??ng')
                            } else {
                                successInputCategory(10, '')
                                if (flag == 8) flag = 9
                            }
                        } else {
                            const { status } = await checkExistPhone(inputPhone.value)
                            if (status == 'Found') {
                                errInputCategory(10, 'S??? ??i???n tho???i n??y ???? ???????c d??ng')
                            } else {
                                successInputCategory(10, '')
                                if (flag == 8) flag = 9
                            }
                        }
                    } else {
                        errInputCategory(10, 'B???n vui l??ng nh???p ????ng s??? ??i???n tho???i')
                    }
                }
                // validate upload img
                if (haveImg) {
                    successInputCategory(0, '')
                    if (flag == 9) flag = 10
                }
                else {
                    errInputCategory(0, 'Ch???n ???nh ?????i di???n')
                }
                // ==>
                if (flag == 10) {
                    if (idTypeStaff == 1) {
                        pushIdServiceIntoArr();
                        inputArrServices.value = arrServicesId;
                    }

                    if ($('#adm-btn-employee__add').text().trim() == 'L??u Thay ?????i') {
                        if (isUpload)
                            formEmployee.action = "employee/edit-employee-withimg";
                        else {
                            formEmployee.action = 'employee/edit-employee-without-img'
                            formEmployee.enctype = '';
                        }
                    }
                    inputSurName.value = inputSurName.value.trim();
                    inputNameEmployee.value = inputNameEmployee.value.trim();
                    inputEmail.value = inputEmail.value.trim();
                    inputCCCD.value = inputCCCD.value.trim();
                    inputPhone.value = inputPhone.value.trim();
                    idStore = ids;
                    inputManager.value = idmanager;
                    inputTypeEm.value = idTypeStaff;
                    await sendVietnameseData(inputNameEmployee.value, inputSurName.value, inputSex.value);
                    formEmployee.submit();
                }

            })

            const editEmployee = document.querySelectorAll('.edit-employee');
            const tittleEmployee = document.querySelector('.tittle-employee');
            // handle edit employee

            function clearSelected_TypeEmployee() {
                inputTypeEm.value = '';
                indexPreType = 0;
                itemDropdown_typeEm.forEach((item, index) => {
                    if (item.classList.contains('selected')) item.classList.remove('selected');
                })
            }

            function resetSelected_Manager(idManager) {
                inputManager.value = "";
                itemDropdown_managers.forEach((item, index) => {
                    if (item.getAttribute('data-manager') == idManager) {
                        if (!item.classList.contains('selected')) {
                            item.classList.add('selected');
                        }
                        indexPreManager = index;
                        inputManager.value = spans_manager[index].textContent.trim();

                    }
                    else {
                        if (item.classList.contains('selected')) {
                            item.classList.remove('selected');
                        }
                    }
                })
            }

            function clearSelected_Manager() {
                inputManager.value = '';
                indexPreManager = -1;
                renderAllManager();
                itemDropdown_managers.forEach((item, index) => {
                    if (item.classList.contains('selected')) item.classList.remove('selected');

                })
            }

            function resetSelected_TypeStaff(idType) {
                inputTypeEm.value = "";
                itemDropdown_typeEm.forEach((item, index) => {
                    if (item.getAttribute('data-type') == idType) {
                        if (!item.classList.contains('selected')) {
                            item.classList.add('selected');
                        }
                        indexPreType = index;
                        inputTypeEm.value = spans_typeEm[index].textContent.trim();
                        if (index > 0) {
                            inputService.placeholder = 'Nh??n Vi??n N??y Kh??ng C???n Ch???n D???ch V??? Cho Ph??p';
                            inputService.value = ""
                        }
                    }
                    else {
                        if (item.classList.contains('selected')) {
                            item.classList.remove('selected');
                        }
                    }
                })

            }

            function resetSelected_Sex(gender) {
                inputSex.value = "";
                itemDropdown_sex.forEach((item, index) => {
                    if (item.getAttribute('data-sex') == gender) {
                        if (!item.classList.contains('selected')) {
                            item.classList.add('selected');
                        }
                        indexPreSex = index;
                        inputSex.value = spans_sexs[index].textContent.trim();
                    }
                    else {
                        if (item.classList.contains('selected')) {
                            item.classList.remove('selected');
                        }
                    }
                })
            }

            function resetSelected_Service() {
                itemDropdown_service.forEach((item, index) => {
                    if (item.classList.contains('selected')) {
                        item.classList.remove('selected');
                    }
                })
            }

            function isCheckService(arrService) {
                var count = 0;
                countService = 0;
                itemDropdown_service.forEach((item, index) => {
                    arrService.forEach((service, indexS) => {
                        if (service.idService == item.getAttribute('data-service')) {
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


            editEmployee.forEach((item, index) => {
                item.onclick = async () => {
                    $('#add-employee_modal').modal('show');
                    tittleEmployee.textContent = "Ch???nh S???a Nh??n Vi??n";
                    btnAddEmployee_span.textContent = "L??u Thay ?????i";
                    idEmployee = item.getAttribute('data-employee');
                    const employee = (rawStaffs ?? []).find(staff => staff.idStaff === idEmployee);
                    isUpload = false;
                    if (item.getAttribute('data-manager') === 'SuperAdmin') {
                        renderSelectedAdmin();
                    } else {
                        renderAllManager();
                    }
                    // set variable to edit
                    idStore = ids;
                    idmanager = employee.idManager;
                    idTypeStaff = employee.typeStaff;
                    inputEditEm.value = employee.idStaff;
                    // ==>
                    inputSurName.value = employee.surName;
                    inputNameEmployee.value = employee.nameStaff;
                    inputCCCD.value = employee.cccd;
                    inputEmail.value = employee.email;
                    emailOld = employee.email;
                    phoneOld = employee.phone;
                    inputPhone.value = employee.phone;
                    upload_dragger.innerHTML = `
                    <div class="uploaded-photo-preview">
                        <img src="${employee.pathImgStaff}" alt="">
                    </div>
                    `
                    haveImg = true;
                    clearImg_upload.style.display = 'block';
                    // resetSelected_Store(employee.IDStore);
                    resetSelected_Manager(employee.idManager);
                    resetSelected_Sex(employee.gender);
                    resetSelected_TypeStaff(employee.typeStaff);
                    resetSelected_Service();
                    const service_employee = (rawStaffServices ?? []).filter(raw => raw.idStaff === idEmployee);
                    if (rawStaffServices.length) {
                        inputService.value = " ";
                        isCheckService(service_employee);
                    }
                    else {
                        removeAllSelectedService();
                        tags_service.innerHTML = "";
                        inputService.value = '';
                        countClick = 0;
                        countService = 0;
                    }
                successInputCategory(0, '');
                successInputCategory(1, '');
                successInputCategory(2, '');
                successInputCategory(3, '');
                successInputCategory(4, '');
                successInputCategory(5, '');
                successInputCategory(6, '');
                successInputCategory(8, '');
                successInputCategory(9, '');
                successInputCategory(10, '');
                }
            })

            //  handle delete employee 

            // variable to delete employee
            var idEmployee_delete;

            const deleteItem_employee = document.querySelectorAll('.delete-employee');
            const btnConfrimDelete = document.getElementById('btn-delete__employee');
            const notiDeleteEmployee = document.querySelector('.notification-employe_delete p')


            deleteItem_employee.forEach((item, index) => {
                item.onclick = async () => {
                    idEmployee_delete = item.getAttribute('data-employee');
                    const { status, infoBookFuture, infoBookDone } = await getInfoBookEmployee(idEmployee_delete);
                    if (status == 'success') {
                        var haveBook = false
                        if (infoBookFuture.length > 0) {
                            haveBook = true;
                            notiDeleteEmployee.textContent = `B???n c?? ch???c ch???n mu???n x??a nh??n vi??n n??y? H??nh ?????ng n??y s??? x??a ??i ${infoBookFuture.length} l???n ?????t nh??n vi??n n??y trong t????ng lai`;
                        }
                        if (infoBookDone.length > 0) {
                            haveBook = true;
                            notiDeleteEmployee.textContent = `B???n c?? ch???c ch???n mu???n x??a nh??n vi??n n??y? H??nh ?????ng n??y s??? x??a ??i ${infoBookDone.length} l???n ???? ?????t nh??n vi??n n??y`;
                        }
                        if (infoBookFuture.length > 0 && infoBookDone.length > 0) {
                            haveBook = true;
                            notiDeleteEmployee.textContent = `B???n c?? ch???c ch???n mu???n x??a nh??n vi??n n??y? H??nh ?????ng n??y s??? x??a ??i ${infoBookDone.length} l???n ???? ?????t nh??n vi??n n??y v?? ${infoBookFuture.length} l???n ?????t nh??n vi??n n??y trong t????ng lai`;
                        }
                        if (!haveBook)
                            notiDeleteEmployee.textContent = `B???n c?? ch???c ch???n mu???n x??a nh??n vi??n n??y? H??nh ?????ng n??y s??? x??a nh???ng th??ng tin kh??c li??n quan ?????n nh??n vi??n n??y`;
                    }
                }
            })

            // handle disable employee

            const disableItem = document.querySelectorAll('.disable-employee');
            const disableText = document.querySelectorAll('.text-disable');
            const disableIcon = document.querySelectorAll('.icon-disable');

            const statusEmployee = document.querySelectorAll('.status svg path');
            const statusColor = document.querySelectorAll('.status');
            const statusText = document.querySelectorAll('.status-text');
            function disableItemClick(idEmployee) {
                for (var i = 0; i < statusEmployee.length; i++) {
                    if (statusEmployee[i].getAttribute('data-employee') == idEmployee) {
                        statusEmployee[i].setAttribute('d', 'M18 6L6 18M6 6l12 12');
                        statusColor[i].classList.remove('is-green')
                        statusColor[i].classList.add('is-red')
                        statusText[i].textContent = 'T???m Ngh???'
                        disableText[i].textContent = 'Ho???t ?????ng'
                        disableIcon[i].classList.remove('fa-ban');
                        disableIcon[i].classList.add('fa-check');
                        break;
                    }
                }
            }

            function enableItemClick(idEmployee) {
                for (var i = 0; i < statusEmployee.length; i++) {
                    if (statusEmployee[i].getAttribute('data-employee') == idEmployee) {
                        statusEmployee[i].setAttribute('d', 'M20 6L9 17l-5-5');
                        statusColor[i].classList.add('is-green')
                        statusColor[i].classList.remove('is-red')
                        statusText[i].textContent = 'Ho???t ?????ng'
                        disableText[i].textContent = 'T???m ngh???'
                        disableIcon[i].classList.add('fa-ban');
                        disableIcon[i].classList.remove('fa-check');
                        break;
                    }
                }
            }



            disableItem.forEach((item, index) => {
                item.onclick = async () => {
                    let idEmployee_disable = item.getAttribute('data-employee');
                    if (disableText[index].textContent.trim() == 'T???m ngh???') {
                        const { status } = await setStatusEmployee(idEmployee_disable, 'T???m Ngh???', 'No Active')
                        if (status == 'success') {
                            disableItemClick(idEmployee_disable);
                            launch_toast('Nh??n vi??n n??y ???? ???????c t???m ngh???');
                        }
                    }
                    else {
                        const { status } = await setStatusEmployee(idEmployee_disable, 'Ho???t ?????ng', 'Active')
                        if (status == 'success') {
                            enableItemClick(idEmployee_disable);
                            launch_toast('Nh??n vi??n n??y ???? ???????c ho???t ?????ng');
                        }
                    }

                }
            })

            function removeEmployeeDeleted(idEmployee) {
                const admEmployee_all = document.querySelectorAll('.adm-service');
                for (var i = 0; i < admEmployee_all.length; i++) {
                    if (admEmployee_all[i].getAttribute('data-employee') == idEmployee) {
                        admEmployee_all[i].remove();
                        break;
                    }
                }
            }

            btnConfrimDelete.onclick = async function () {
                if (role == 3) {
                    launch_toast('B???n kh??ng c?? quy???n l??m vi???c n??y');
                    $('#alertModalDelete').modal('hide');
                }
                else if (role == 4) {
                    const { status } = await deleteEmployee(idEmployee_delete);
                    if (status == 'success') {
                        removeEmployeeDeleted(idEmployee_delete);
                        $('#alertModalDelete').modal('hide');
                        launch_toast('X??a th??nh c??ng');
                    }
                }
            }

            function renderStatus() {
                statusText.forEach((item, index) => {
                    if (item.textContent.trim() == 'T???m Ngh???') {
                        statusEmployee[index].setAttribute('d', 'M18 6L6 18M6 6l12 12');
                        statusColor[index].classList.remove('is-green')
                        statusColor[index].classList.add('is-red')
                        statusText[index].textContent = 'T???m Ngh???'
                        disableText[index].textContent = 'Ho???t ?????ng'
                        disableIcon[index].classList.remove('fa-ban');
                        disableIcon[index].classList.add('fa-check');
                    }
                })
            }

            // => handle regis shift 

            const btnConfirmRegis = document.getElementById('adm-add-regis_shift');
            const inputdateFrom = document.getElementById('input_from');
            const inputdateTo = document.getElementById('input_to');
            // const inputStore_Regis = document.getElementById('input-store-regis-shift')

            const inputEmployeRegis = document.getElementById('input-employee-regis__shift');
            const dropDown_employeeService = document.querySelector('#dropdown-employee__service');
            const listDropdown_employee = document.querySelectorAll('.list-employee__dropdown');

            var scrollYStore_Regis = 455;
            var scrollY_employee = 505;
            let isOver_employee = false;
            var isOver_storeRegis = false;


            dropDown_employeeService.onmouseover = function () {
                isOver_employee = true;
            }

            dropDown_employeeService.onmouseleave = function () {
                isOver_employee = false;
            }



            inputEmployeRegis.onclick = () => {
                if (dropDown_employeeService.getAttribute('style') == 'min-width: 450px; transform-origin: center bottom; z-index: 2003; display: none;') {
                    arrows_down[5].style.transform = 'rotate(0deg)';
                    dropDown_employeeService.style = `min-width: 450px; position: fixed; top: ${scrollY_employee}px; left: 543px; transform-origin: center bottom; z-index: 2003; display:block;`
                }
                else {
                    arrows_down[5].style.transform = 'rotate(180deg)';
                    dropDown_employeeService.style = 'min-width: 450px; transform-origin: center bottom; z-index:2003; display: none;'
                }
            }

            inputEmployeRegis.onfocusout = () => {
                if (!isOver_employee) {
                    arrows_down[5].style.transform = 'rotate(180deg)';
                    dropDown_employeeService.style = 'min-width: 450px; transform-origin: center bottom; z-index:2003; display: none;'
                }
            }
            const noData_employee = document.querySelector('.no-data__employee')

            const btnRegisShift = document.getElementById('btn-AddRegisShift')

            btnRegisShift.onclick = (e) => {
                removeAllSelectedEmployee();
                inputdateFrom.value = "";
                inputdateTo.value = "";
                successInputCategory(11, '');
                successInputCategory(12, '');
                successInputCategory(14, '');
            }

            var indexFirstChecking_e = -1;
            var indexIsChecking_e = -1;
            var countClick_e = 0;
            var countEmployee = 0;

            function getIndexIsChecking_e() {
                for (var i = 0; i < listDropdown_employee.length; i++) {
                    if (listDropdown_employee[i].classList.contains('selected')) {
                        indexIsChecking_e = i;
                        break;
                    }
                }
            }


            const tags_employee = document.querySelectorAll('.el-select__tags span');
            const span_nameEmployee = document.querySelectorAll('.list-employee__dropdown span');
            function removeAllSelectedEmployee() {
                tags_employee[1].innerHTML = '';
                inputEmployeRegis.value = "";
                countClick_e = 0;
                countEmployee = 0;
                listDropdown_employee.forEach((item, index) => {
                    if (item.classList.contains('selected')) item.classList.remove('selected');
                })
            }
            listDropdown_employee.forEach((item, index) => {
                item.onclick = function () {
                    // arrIdStaff_service = []
                    inputEmployeRegis.value = ' ';
                    inputEmployeRegis.focus();
                    countClick_e++;
                    if (countClick_e == 1) {
                        indexFirstChecking_e = index;
                    }
                    if (listDropdown_employee[index].classList.contains('selected')) {
                        listDropdown_employee[index].classList.remove('selected');
                        if (indexFirstChecking_e == index && countClick_e > 1) {
                            getIndexIsChecking_e();
                            if (indexIsChecking_e == -1) {
                                indexIsChecking_e = indexFirstChecking_e;
                            }
                            indexFirstChecking_e = indexIsChecking_e;
                            const tagsText = document.querySelector('.el-select__tags-text')
                            tagsText.innerHTML = span_nameEmployee[indexIsChecking_e].textContent.trim()
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
                            inputEmployeRegis.placeholder = 'Ch???n Nh??n Vi??n';
                            inputEmployeRegis.value = '';
                            countClick_e = 0;
                        }
                    }
                    else {
                        countEmployee++;
                        item.classList.add('selected');
                        if (countEmployee == 2) {
                            tags_employee[1].innerHTML += `<span
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
                            tags_employee[1].innerHTML = `
                    <span
                        class="el-tag el-tag--info el-tag--small el-tag--light">
                        <span class="el-select__tags-text">
                            ${span_nameEmployee[index].textContent.trim()}
                        </span>
                    </span>`
                        }
                    }
                    // successInputCategory(13, '');
                }

            })

            inputdateFrom.onfocusout = () => {
                var datenow = new Date();
                var dateInputFrom = new Date(`${inputdateFrom.value}`);
                datenow.setHours(0, 0, 0, 0);
                dateInputFrom.setHours(0, 0, 0, 0);
                if (datenow.getTime() > dateInputFrom.getTime()) {
                    errInputCategory(11, 'B???n vui l??ng ch???n ????ng ng??y')
                }
                else {
                    successInputCategory(11, '');
                }
            }

            var getDaysArray = function (start, end) {
                for (var arr = [], dt = new Date(start); dt <= new Date(end); dt.setDate(dt.getDate() + 1)) {
                    arr.push(new Date(dt));
                }
                return arr;
            };

            var arrDateRegis = [];
            var arrEmployeeRegis = [];
            var idStoreRegis;

            function pushIdEmployee() {
                arrEmployeeRegis = [];
                listDropdown_employee.forEach((item, index) => {
                    if (item.classList.contains('selected')) {
                        arrEmployeeRegis.push(item.getAttribute('data-employee'))
                    }
                })
            }




            function pushDateRegisToArr(daylist) {
                arrDateRegis = [];
                for (var i = 0; i < daylist.length; i++) {
                    arrDateRegis.push(`${daylist[i].getFullYear()}-${daylist[i].getMonth() + 1}-${daylist[i].getDate()}`)
                }
            }




            btnConfirmRegis.addEventListener('click', async (e) => {
                e.preventDefault();
                var flag = 0;
                if (inputdateFrom.value == "") {
                    errInputCategory(11, 'B???n vui l??ng ch???n ng??y b???t ?????u')
                }
                else {
                    var datenow = new Date();
                    var dateInputFrom = new Date(`${inputdateFrom.value}`);
                    datenow.setHours(0, 0, 0, 0);
                    dateInputFrom.setHours(0, 0, 0, 0);
                    if (datenow.getTime() > dateInputFrom.getTime()) {
                        errInputCategory(11, 'B???n vui l??ng ch???n ng??y l???n h??n ng??y hi???n t???i')
                    }
                    else {
                        flag = 1;
                        successInputCategory(11, '');
                    }
                }

                if (inputdateTo.value == "") {
                    errInputCategory(12, 'B???n vui l??ng ch???n ng??y k???t th??c')
                }
                else {
                    if (flag == 1) flag = 2
                    successInputCategory(12, '');
                }

                if (inputEmployeRegis.value == "") {
                    errInputCategory(14, 'B???n vui l??ng ch???n nh??n vi??n c???n ????ng k?? ng??y l??m vi???c')
                }
                else {
                    if (flag == 2) flag = 4
                    successInputCategory(14, '');
                }

                if (flag == 4) {
                    var dateInputFrom = new Date(`${inputdateFrom.value}`);
                    var dateInptutTo = new Date(`${inputdateTo.value}`);
                    var daylist = getDaysArray(dateInputFrom, dateInptutTo);
                    daylist.map((v) => v.toISOString().slice(0, 10)).join("")
                    pushDateRegisToArr(daylist);
                    pushIdEmployee();
                    const alreadyRegis = arrEmployeeRegis.some(employee => 
                        arrDateRegis.some(date => 
                        (regisShifts ?? []).some(regis => 
                            regis.idStaff === employee && date === regis.dateRegis)))
                    if (alreadyRegis) {
                        errInputCategory(14, '???? c?? nh??n vi??n ????ng k?? l??m vi???c trong th???i gian n??y');
                    } else {
                        successInputCategory(14, '');
                        const { status } = await regisShift(arrDateRegis, arrEmployeeRegis, ids);
                        if (status == 'success') {
                            $('#add-regisShift').modal('hide');
                            launch_toast('????ng K?? L??m Vi???c Th??nh C??ng');
                        } 
                    }
                }
            })


            const input_search = document.querySelector('#search_employee')

            function removeVietnameseTones(str) {
                str = str.replace(/??|??|???|???|??|??|???|???|???|???|???|??|???|???|???|???|???/g, "a");
                str = str.replace(/??|??|???|???|???|??|???|???|???|???|???/g, "e");
                str = str.replace(/??|??|???|???|??/g, "i");
                str = str.replace(/??|??|???|???|??|??|???|???|???|???|???|??|???|???|???|???|???/g, "o");
                str = str.replace(/??|??|???|???|??|??|???|???|???|???|???/g, "u");
                str = str.replace(/???|??|???|???|???/g, "y");
                str = str.replace(/??/g, "d");
                str = str.replace(/??|??|???|???|??|??|???|???|???|???|???|??|???|???|???|???|???/g, "A");
                str = str.replace(/??|??|???|???|???|??|???|???|???|???|???/g, "E");
                str = str.replace(/??|??|???|???|??/g, "I");
                str = str.replace(/??|??|???|???|??|??|???|???|???|???|???|??|???|???|???|???|???/g, "O");
                str = str.replace(/??|??|???|???|??|??|???|???|???|???|???/g, "U");
                str = str.replace(/???|??|???|???|???/g, "Y");
                str = str.replace(/??/g, "D");
                str = str.replace(/\u0300|\u0301|\u0303|\u0309|\u0323/g, "");
                str = str.replace(/\u02C6|\u0306|\u031B/g, "");
                str = str.replace(/ + /g, " ");
                str = str.trim();
                str = str.replace(/!|@|%|\^|\*|\(|\)|\+|\=|\<|\>|\?|\/|,|\.|\:|\;|\'|\"|\&|\#|\[|\]|~|\$|_|`|-|{|}|\||\\/g, " ");
                return str;
            }

            function showAllEmployee() {
                var itemEmployee = document.querySelectorAll('.adm-service');
                itemEmployee.forEach((item, index) => {
                    item.style.display = 'flex';
                })
            }

            input_search.oninput = () => {
                var employee_name = document.querySelectorAll('.name_employee');
                var employee_phone = document.querySelectorAll('.employee_phone')
                var itemEmployee = document.querySelectorAll('.adm-service');
                var searchValue = removeVietnameseTones(input_search.value.trim().toUpperCase());
                var inputArr = input_search.value.split('');
                if (inputArr[0] != '0') {
                    if (input_search.value == "") {
                        showAllEmployee();
                    }
                    employee_name.forEach((item, index) => {
                        var name = removeVietnameseTones(item.textContent.trim().toUpperCase())
                        if (name.search(searchValue) > -1) {
                            itemEmployee[index].style.display = 'flex';
                        }
                        else {
                            itemEmployee[index].style.display = 'none';
                        }
                    })
                }
                else {
                    employee_phone.forEach((item, index) => {
                        var phone = item.textContent.trim();
                        if (phone.search(input_search.value.trim()) > -1) {
                            itemEmployee[index].style.display = 'flex';
                        } else {
                            itemEmployee[index].style.display = 'none';
                        }
                    })
                }


            }

            window.addEventListener('load', () => {
                renderStatus();
            })

            async function checkExistPhone(phone) {
                return postData("user/check-duplicate", {
                    referenceDuplicate: "PHONE",
                    phone,
                })
            }

            async function checkExistPhone_edit(phoneOld, phoneNew) {
                return postData("user/check-duplicate", {
                    referenceDuplicate: "PHONE",
                    phone: phoneNew,
                    oldPhone: phoneOld,
                })
            }

            async function checkExistEmail(email) {
                return postData("user/check-duplicate", {
                    referenceDuplicate: "EMAIL",
                    email,
                })
            }

            async function sendVietnameseData(name, surName, sex) {
                return postData("user/send-vietnam-data", {
                    surNameEmployee: surName,
                    nameEmployee: name,
                    sex
                })
            }

            async function checkExistEmail_edit(emailOld, emailNew) {
                return postData("user/check-duplicate", {
                    referenceDuplicate: "EMAIL",
                    email: emailNew,
                    oldEmail: emailOld,
                })
            }

            async function regisShift(arrDate, arrEmployee, idStore) {
                return postData("employee/regis-shift", {
                    arrDate: arrDate.join(","),
                    arrEmployee: arrEmployee.join(","),
                    idStore,
                })
            }

            async function setStatusEmployee(idEmployee, status, status_account) {
                return postData("user/set-status", {
                    accountId: idEmployee,
                    statusEmployee: status,
                    statusAccount: status_account,
                })
            }

            async function getInfoBookEmployee(idEmployee) {
                return (await instance.post('employee/info-book', {
                    idEmployee
                })).data;
            }


            async function deleteEmployee(idEmployee) {
                return (await instance.post('employee/delete-employee', {
                    idEmployee
                })).data;
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

function launch_toast(mess) {
    var x = document.getElementById("toast")
    x.className = "show";
    x.textContent = '';
    setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);
    setTimeout(function () { x.textContent = mess }, 700);
}