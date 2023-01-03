package main.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table (name = "RegisShift")
public class RegisShift implements Serializable {
	@Id
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "DateRegis")
	private Date dateRegis;
	@Id
	@Column(name="IDStaff")
	private String idStaff;
	@Column(name="IDDayOfWeek")
	private int dayOfWeek;
	@ManyToOne()
	@JoinColumn(name="IDStore")
	private Store store;
	@Column(name = "StatusRegis")
	private String statusRegis;
	public Date getDateRegis() {
		return dateRegis;
	}
	public void setDateRegis(Date dateRegis) {
		this.dateRegis = dateRegis;
	}
	public String getIdStaff() {
		return idStaff;
	}
	public RegisShift() {
		super();
		// TODO Auto-generated constructor stub
	}
	public void setIdStaff(String idStaff) {
		this.idStaff = idStaff;
	}
	public Store getStore() {
		return store;
	}
	public void setStore(Store store) {
		this.store = store;
	}
	public int getDayOfWeek() {
		return dayOfWeek;
	}
	public RegisShift(Date dateRegis, String idStaff, int dayOfWeek, Store store, String statusRegis) {
		super();
		this.dateRegis = dateRegis;
		this.idStaff = idStaff;
		this.dayOfWeek = dayOfWeek;
		this.store = store;
		this.statusRegis = statusRegis;
	}
	public void setDayOfWeek(int dayOfWeek) {
		this.dayOfWeek = dayOfWeek;
	}
	public String getStatusRegis() {
		return statusRegis;
	}
	public void setStatusRegis(String statusRegis) {
		this.statusRegis = statusRegis;
	}
}
