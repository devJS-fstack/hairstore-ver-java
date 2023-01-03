package main.entity;
import java.io.Serializable;

import javax.persistence.*;

@Entity
@Table (name = "Staff_Service")
public class StaffService implements Serializable {
	@Id
	@Column(name="IDStaff")
	private String idStaff;
	@Id
	@Column(name="IDService")
	private int idService;
	public String getIdStaff() {
		return idStaff;
	}
	public void setIdStaff(String idStaff) {
		this.idStaff = idStaff;
	}
	public int getIdService() {
		return idService;
	}
	public void setIdService(int idService) {
		this.idService = idService;
	}
	public StaffService(String idStaff, int idService) {
		super();
		this.idStaff = idStaff;
		this.idService = idService;
	}
	public StaffService() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
