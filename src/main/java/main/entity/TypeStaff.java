package main.entity;
import java.io.Serializable;

import javax.persistence.*;

@Entity
@Table (name = "TypeStaff")
public class TypeStaff {
	@Id
	@Column(name="IDTypeStaff")
	private String idTypeStaff;
	@Column(name="NameType")
	private String nameType;
	@Column(name="SalaryOnDay")
	private int salaryOnDay;
	@Column(name="Description")
	private String description;
	public String getIdTypeStaff() {
		return idTypeStaff;
	}
	public void setIdTypeStaff(String idTypeStaff) {
		this.idTypeStaff = idTypeStaff;
	}
	public String getNameType() {
		return nameType;
	}
	public void setNameType(String nameType) {
		this.nameType = nameType;
	}
	public int getSalaryOnDay() {
		return salaryOnDay;
	}
	public void setSalaryOnDay(int salaryOnDay) {
		this.salaryOnDay = salaryOnDay;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public TypeStaff(String idTypeStaff, String nameType, int salaryOnDay, String description) {
		super();
		this.idTypeStaff = idTypeStaff;
		this.nameType = nameType;
		this.salaryOnDay = salaryOnDay;
		this.description = description;
	}
	public TypeStaff() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
