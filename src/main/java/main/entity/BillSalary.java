package main.entity;

import java.util.Date;

import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "BillSalary")
public class BillSalary {
	@Id
	@Column(name = "IDBill")
	private String idBill;
	@Column(name = "MonthPay")
	private String monthPay;
	@Column(name = "Staff")
	private String idStaff;
	@Column(name = "Status")
	private String status;
	@Column(name = "AmountDate")
	private int amountDate;
	@Column(name = "Payment")
	private int payment;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "DateCreate")
	private Date dateCreate;
	public Date getDateCreate() {
		return dateCreate;
	}
	public void setDateCreate(Date dateCreate) {
		this.dateCreate = dateCreate;
	}
	public String getIdBill() {
		return idBill;
	}
	public void setIdBill(String idBill) {
		this.idBill = idBill;
	}
	public String getMonthPay() {
		return monthPay;
	}
	public void setMonthPay(String monthPay) {
		this.monthPay = monthPay;
	}
	public String getIdStaff() {
		return idStaff;
	}
	public void setIdStaff(String idStaff) {
		this.idStaff = idStaff;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getAmountDate() {
		return amountDate;
	}
	public void setAmountDate(int amountDate) {
		this.amountDate = amountDate;
	}
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public BillSalary(String idBill, String monthPay, String idStaff, String status, int amountDate, int payment, Date dateCreate) {
		super();
		this.idBill = idBill;
		this.monthPay = monthPay;
		this.idStaff = idStaff;
		this.status = status;
		this.amountDate = amountDate;
		this.payment = payment;
		this.dateCreate = dateCreate;
	}
	public BillSalary() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
