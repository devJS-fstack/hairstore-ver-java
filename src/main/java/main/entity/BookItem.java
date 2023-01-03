package main.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table (name = "BookItem")
public class BookItem implements Serializable {
	@Id
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "DateBook")
	private Date dateBook;
	@Id
	@Column(name = "IDShiftBook")
	private String idShiftBook;
	@Id
	@Column(name = "IDStaff")
	private String idStaff;
	@EmbeddedId
	@ManyToOne()
	@JoinColumn(name="IDService")
	private Service service;
	@Column(name = "Price")
	private int price;
	public Date getDateBook() {
		return dateBook;
	}
	public void setDateBook(Date dateBook) {
		this.dateBook = dateBook;
	}
	public String getIdShiftBook() {
		return idShiftBook;
	}
	public BookItem() {
	}
	public void setIdShiftBook(String idShiftBook) {
		this.idShiftBook = idShiftBook;
	}
	public String getIdStaff() {
		return idStaff;
	}
	public void setIdStaff(String idStaff) {
		this.idStaff = idStaff;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Service getService() {
		return service;
	}
	public void setService(Service service) {
		this.service = service;
	}
	public BookItem(Date dateBook, String idShiftBook, String idStaff, Service service, int price) {
		super();
		this.dateBook = dateBook;
		this.idShiftBook = idShiftBook;
		this.idStaff = idStaff;
		this.service = service;
		this.price = price;
	}
}
