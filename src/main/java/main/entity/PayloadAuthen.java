package main.entity;

public class PayloadAuthen {
	private String accountId;
	private String password;
	private String referenceDuplicate;
	private String email;
	private String verifyNumber;
	private String surNameEmployee;
	private String oldEmail;
	private String oldPhone;
	private String statusEmployee;
	private String statusAccount;
	private String arrDate;
	private String arrEmployee;
	private String[] arrService;
	private int amountDay;
	private String firstDate;
	private String lastDate;
	private String monthPay;
	private int pageNumber;
	
	
	public int getPageNumber() {
		return pageNumber;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public String getMonthPay() {
		return monthPay;
	}
	public void setMonthPay(String monthPay) {
		this.monthPay = monthPay;
	}
	public String getFirstDate() {
		return firstDate;
	}
	public void setFirstDate(String firstDate) {
		this.firstDate = firstDate;
	}
	public String getLastDate() {
		return lastDate;
	}
	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}
	public int getAmountDay() {
		return amountDay;
	}
	public void setAmountDay(int amountDay) {
		this.amountDay = amountDay;
	}
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public String getIdBill() {
		return idBill;
	}
	public void setIdBill(String idBill) {
		this.idBill = idBill;
	}
	public String[] getArrService() {
		return arrService;
	}
	public void setArrService(String[] arrService) {
		this.arrService = arrService;
	}
	public String getStatusEmployee() {
		return statusEmployee;
	}
	public String getArrDate() {
		return arrDate;
	}
	public void setArrDate(String arrDate) {
		this.arrDate = arrDate;
	}
	public String getArrEmployee() {
		return arrEmployee;
	}
	public void setArrEmployee(String arrEmployee) {
		this.arrEmployee = arrEmployee;
	}
	public void setStatusEmployee(String statusEmployee) {
		this.statusEmployee = statusEmployee;
	}
	public String getStatusAccount() {
		return statusAccount;
	}
	public void setStatusAccount(String statusAccount) {
		this.statusAccount = statusAccount;
	}
	public String getOldEmail() {
		return oldEmail;
	}
	public void setOldEmail(String oldEmail) {
		this.oldEmail = oldEmail;
	}
	public String getOldPhone() {
		return oldPhone;
	}
	public void setOldPhone(String oldPhone) {
		this.oldPhone = oldPhone;
	}
	public String getSurNameEmployee() {
		return surNameEmployee;
	}
	public void setSurNameEmployee(String surNameEmployee) {
		this.surNameEmployee = surNameEmployee;
	}
	private String nameEmployee;
	private String accessToken;
	private String idStore;
	private String role;
	private String pathImg;
	private String phone;
	private String sex;
	private String idShift;
	private int payment;
	private String idBill;
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public PayloadAuthen() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "PayloadAuthen [accountId=" + accountId + ", password=" + password + ", referenceDuplicate="
				+ referenceDuplicate + ", email=" + email + ", verifyNumber=" + verifyNumber + ", nameEmployee="
				+ nameEmployee + ", accessToken=" + accessToken + ", idStore=" + idStore + ", role=" + role
				+ ", pathImg=" + pathImg + "]";
	}
	public String getAccountId() {
		return accountId;
	}
	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getReferenceDuplicate() {
		return referenceDuplicate;
	}
	public void setReferenceDuplicate(String referenceDuplicate) {
		this.referenceDuplicate = referenceDuplicate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getVerifyNumber() {
		return verifyNumber;
	}
	public void setVerifyNumber(String verifyNumber) {
		this.verifyNumber = verifyNumber;
	}
	public String getNameEmployee() {
		return nameEmployee;
	}
	public void setNameEmployee(String nameEmployee) {
		this.nameEmployee = nameEmployee;
	}
	public String getAccessToken() {
		return accessToken;
	}
	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}
	public String getIdStore() {
		return idStore;
	}
	public void setIdStore(String idStore) {
		this.idStore = idStore;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getPathImg() {
		return pathImg;
	}
	public void setPathImg(String pathImg) {
		this.pathImg = pathImg;
	}
	public String getIdShift() {
		return idShift;
	}
	public void setIdShift(String idShift) {
		this.idShift = idShift;
	}
	public PayloadAuthen(String accountId, String password, String referenceDuplicate, String email,
			String verifyNumber, String surNameEmployee, String oldEmail, String oldPhone, String statusEmployee,
			String statusAccount, String arrDate, String arrEmployee, String[] arrService, int amountDay,
			String firstDate, String lastDate, String monthPay, String nameEmployee, String accessToken, String idStore,
			String role, String pathImg, String phone, String sex, String idShift, int payment, String idBill, int pageNumber) {
		super();
		this.accountId = accountId;
		this.password = password;
		this.referenceDuplicate = referenceDuplicate;
		this.email = email;
		this.verifyNumber = verifyNumber;
		this.surNameEmployee = surNameEmployee;
		this.oldEmail = oldEmail;
		this.oldPhone = oldPhone;
		this.statusEmployee = statusEmployee;
		this.statusAccount = statusAccount;
		this.arrDate = arrDate;
		this.arrEmployee = arrEmployee;
		this.arrService = arrService;
		this.amountDay = amountDay;
		this.firstDate = firstDate;
		this.lastDate = lastDate;
		this.monthPay = monthPay;
		this.nameEmployee = nameEmployee;
		this.accessToken = accessToken;
		this.idStore = idStore;
		this.role = role;
		this.pathImg = pathImg;
		this.phone = phone;
		this.sex = sex;
		this.idShift = idShift;
		this.payment = payment;
		this.idBill = idBill;
		this.pageNumber = pageNumber;
	}
	
}
