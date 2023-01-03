package main.entity;

import java.util.Date;

import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Bill")
public class Bill {
	@Id
	@Column(name = "IDBill")
	private String idBill;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "DateCreate")
	private Date dateCreate;
	@Column(name = "Status")
	private String status;
	@Column(name = "Payment")
	private int payment;
	@Column(name = "IDStaff")
	private String idStaff;
	@Column(name = "PhoneCustomer")
	private String phoneCustomer;
	@Column(name = "IDStore")
	private int idStore;
	public Bill(String idBill, Date dateCreate, String status, int payment, String idStaff, String phoneCustomer,
			int idStore) {
		super();
		this.idBill = idBill;
		this.dateCreate = dateCreate;
		this.status = status;
		this.payment = payment;
		this.idStaff = idStaff;
		this.phoneCustomer = phoneCustomer;
		this.idStore = idStore;
	}
	public Bill() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getIdBill() {
		return idBill;
	}
	public void setIdBill(String idBill) {
		this.idBill = idBill;
	}
	public Date getDateCreate() {
		return dateCreate;
	}
	public void setDateCreate(Date dateCreate) {
		this.dateCreate = dateCreate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public String getIdStaff() {
		return idStaff;
	}
	public void setIdStaff(String idStaff) {
		this.idStaff = idStaff;
	}
	public String getPhoneCustomer() {
		return phoneCustomer;
	}
	public void setPhoneCustomer(String phoneCustomer) {
		this.phoneCustomer = phoneCustomer;
	}
	public int getIdStore() {
		return idStore;
	}
	public void setIdStore(int idStore) {
		this.idStore = idStore;
	}
}
