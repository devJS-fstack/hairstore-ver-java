const navheader = document.querySelector('.navbar');
navheader.style.display = 'none'


async function setPasswordNew(passwordNew, email) {
    return postData("user/modify-password", { password: passwordNew, email });
}

async function confirmVerify_changepass(verifyNumber) {
    return postData("user/verify-forgot-pass", { verifyNumber });
}

async function sendverify(email) {
    return postData("user/send-mail-forgot-password", { email });
}

async function checkToken(accessToken) {
    return postData("user/verify-token", { accessToken });
}

async function checkDuplicatePhone(phone) {
    return postData("user/regis/check-duplicate", { phone, referenceDuplicate: "ACCOUNT" });
}

async function checkDuplicateEmail(email) {
    return postData("user/regis/check-duplicate", { email, referenceDuplicate: "EMAIL" });
}

async function login(account, password) {
    return postData("user/login", { account, password } );
}


const validateEmail = (email) => {
    return String(email)
        .toLowerCase()
        .match(
            /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
        );
};

const validatePhone = (phone) => {
    return /([\+84|84|0]+(3|5|7|8|9|1[2|6|8|9]))+([0-9]{8})\b/.test(phone);
}

const validatePassword = (pass) => {
    return /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{8,}$/.test(pass);
}

async function postData(url = '', data = {}) {
    const response = await fetch(url, {
      method: 'POST',
      mode: 'cors',
      cache: 'no-cache',
      credentials: 'same-origin',
      headers: {
        'Content-Type': 'application/json'
      },
      redirect: 'follow',
      referrerPolicy: 'no-referrer',
      body: JSON.stringify(data)
    });
    return response.json();
}