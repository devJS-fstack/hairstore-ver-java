package main.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Customer")
public class Customer implements Serializable {
	@Id
	@OneToOne
	@JoinColumn(name = "PhoneCustomer")
	private TaiKhoan taiKhoan;
	@Column(name = "NameCustomer")
	private String nameCustomer;
	@Column(name = "EmailCustomer")
	private String emailCustomer;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "DateCreate")
	private Date dateCreate;
	public TaiKhoan getTaiKhoan() {
		return taiKhoan;
	}
	public void setTaiKhoan(TaiKhoan taiKhoan) {
		this.taiKhoan = taiKhoan;
	}
	public String getNameCustomer() {
		return nameCustomer;
	}
	public void setNameCustomer(String nameCustomer) {
		this.nameCustomer = nameCustomer;
	}
	public String getEmailCustomer() {
		return emailCustomer;
	}
	public Customer(TaiKhoan taiKhoan, String nameCustomer, String emailCustomer, Date dateCreate) {
		super();
		this.taiKhoan = taiKhoan;
		this.nameCustomer = nameCustomer;
		this.emailCustomer = emailCustomer;
		this.dateCreate = dateCreate;
	}
	public void setEmailCustomer(String emailCustomer) {
		this.emailCustomer = emailCustomer;
	}
	public Date getDateCreate() {
		return dateCreate;
	}
	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public void setDateCreate(Date dateCreate) {
		this.dateCreate = dateCreate;
	}
}
