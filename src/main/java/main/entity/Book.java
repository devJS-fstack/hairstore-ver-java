package main.entity;
import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table (name = "Book")
public class Book implements Serializable {
	@Id
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "DateBook")
	private Date dateBook;
	@Id
	@Column(name = "IDShiftBook")
	private String idShiftBook;
	@EmbeddedId
	@ManyToOne()
	@JoinColumn(name="IDStaff")
	private Staff staff;
	public Book() {
		super();
	}
	@Column(name = "Payment")
	private int payment;
	public Book(Date dateBook, String idShiftBook, Staff staff, int payment, String phoneCustomer, int idStore,
			String statusBook) {
		super();
		this.dateBook = dateBook;
		this.idShiftBook = idShiftBook;
		this.staff = staff;
		this.payment = payment;
		this.phoneCustomer = phoneCustomer;
		this.idStore = idStore;
		this.statusBook = statusBook;
	}
	@Column(name = "PhoneCustomer")
	private String phoneCustomer;
	@Column(name = "IDStore")
	private int idStore;
	@Column(name = "StatusBook")
	private String statusBook;
	public Date getDateBook() {
		return dateBook;
	}
	public void setDateBook(Date dateBook) {
		this.dateBook = dateBook;
	}
	public String getIdShiftBook() {
		return idShiftBook;
	}
	public void setIdShiftBook(String idShiftBook) {
		this.idShiftBook = idShiftBook;
	}
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
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
	public Staff getStaff() {
		return staff;
	}
	public void setStaff(Staff staff) {
		this.staff = staff;
	}
	public String getStatusBook() {
		return statusBook;
	}
	public void setStatusBook(String statusBook) {
		this.statusBook = statusBook;
	}
}
