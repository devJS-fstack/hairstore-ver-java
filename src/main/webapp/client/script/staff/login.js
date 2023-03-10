const inputs = document.querySelectorAll(".input-field");
const toggle_btn = document.querySelectorAll(".toggle");
const main = document.querySelector("main");
const bullets = document.querySelectorAll(".bullets span");
const images = document.querySelectorAll(".image");



// hide headers

navheader.style.display = 'none';

inputs.forEach((inp) => {
    inp.addEventListener("focus", () => {
        inp.classList.add("active");
    });
    inp.addEventListener("blur", () => {
        if (inp.value != "") return;
        inp.classList.remove("active");
    });
});

toggle_btn.forEach((btn) => {
    btn.addEventListener("click", (e) => {
        e.preventDefault();
        main.classList.toggle("sign-up-mode");
    });
});

function moveSlider() {
    let index = this.dataset.value;

    let currentImage = document.querySelector(`.img-${index}`);
    images.forEach((img) => img.classList.remove("show"));
    currentImage.classList.add("show");

    const textSlider = document.querySelector(".text-group");
    textSlider.style.transform = `translateY(${-(index - 1) * 2.8}rem)`;

    bullets.forEach((bull) => bull.classList.remove("active"));
    this.classList.add("active");
}

bullets.forEach((bullet) => {
    bullet.addEventListener("click", moveSlider);
});


// handle login button
const login_btn = document.querySelector('.login-btn');
const input_acc = document.querySelector('.input-acc');
const input_pass = document.querySelector('.input-pass');
const signinForm = document.querySelector('.sign-in-form');
const err = document.querySelector('.err-form')
login_btn.onclick = async (e) => {
    e.preventDefault();
    const { status, idStore, token } = await login_staff(input_acc.value, input_pass.value);
    if (status == "success") {
        window.localStorage.setItem('accessToken', token);
        window.location = `/dashboard-manager?idStore=${idStore}`
    }
    else {
        err.style.display = 'block';
    }
}

const btnForgotPass = document.querySelector('.btn-confirm__forgot-pass')
const inputEmail_forgot = document.querySelector('.input-email')
const inputPassFirst_forgot = document.querySelector('.input-pass-first')
const inputPassNext_forgot = document.querySelector('.input-pass-next')

const errEmail = document.querySelector('.err-email-forgot')
const errPassFirst = document.querySelector('.err-pass-first')
const errPassNext = document.querySelector('.err-pass-next')

function logErr(err, style, mess) {
    err.style.display = style
    err.textContent = mess
}

btnForgotPass.onclick = async (e) => {
    e.preventDefault();
    var flag = 0;
    if (inputEmail_forgot.value == "") {
        logErr(errEmail, 'block', 'Vui l??ng nh???p email')
    } else {
        const { status } = await checkExistEmail(inputEmail_forgot.value)
        console.log("Status: ", status);
        if (status === 'Found') {
            logErr(errEmail, 'none', '')
            flag = 1;
        } else {
            logErr(errEmail, 'block', 'Email n??y kh??ng t???n t???i trong h??? th???ng')
        }
    }

    if (inputPassFirst_forgot.value == "") {
        logErr(errPassFirst, 'block', 'Vui l??ng nh???p m???t kh???u m???i')
    } else {
        if (validatePassword(inputPassFirst_forgot.value)) {
            logErr(errPassFirst, 'none', '')
            if (flag == 1) flag = 2;
        } else {
            logErr(errPassFirst, 'block', 'M???t kh???u n??y qu?? y???u')
        }
    }

    if (inputPassNext_forgot.value == "") {
        logErr(errPassNext, 'block', 'Vui l??ng nh???p m???t kh???u x??c nh???n')
    } else {
        if (inputPassNext_forgot.value !== inputPassFirst_forgot.value) {
            logErr(errPassNext, 'block', 'Vui l??ng ????ng m???t kh???u x??c nh???n')
        } else {
            logErr(errPassNext, 'none', '')
            if (flag == 2) flag = 3;
        }
    }

    if (flag == 3) {
        sendEmailConfirm(inputEmail_forgot.value.trim(), inputPassNext_forgot.value);
        main.classList.toggle("sign-up-mode");
        launch_toast('Ho??n t???t. Vui l??ng x??c th???c qua email')
            inputEmail_forgot.value = ""
            inputPassFirst_forgot.value = ""
            inputPassNext_forgot.value = ""
            inputs.forEach((inp) => {
                inp.classList.remove("active");
        });
        

    }
}
input_acc.onfocus = () => err.style.display = 'none';
input_pass.onfocus = () => err.style.display = 'none';

window.addEventListener('load', () => {
    const accessToken = `${window.localStorage.getItem('accessToken')}`;
    if (accessToken != `null`) {
        (async () => {
            const { status, employee, idEmployee } = await checkToken(accessToken);
            console.log("obejct: " , {status, employee, idEmployee});
            if (status == 'success') {
                window.location = `/dashboard-manager?idStore=${idstore}`
            }
        })();
    }
})


function launch_toast(mess) {
    var x = document.getElementById("toast")
    x.className = "show";
    x.textContent = '';
    setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);
    setTimeout(function () { x.textContent = mess }, 700);
}

async function sendEmailConfirm(email, password) {
    return postData("user/send-mail-forgot-password", { email, password });
}

async function checkExistEmail(email) {
    return postData("user/check-duplicate", { referenceDuplicate: "EMAIL", email });
}

async function login_staff(acc, pass) {
    return postData("user/login", { accountId: acc, password: pass });
}