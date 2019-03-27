package com.cts.VehicleReservationSystem.bean;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity(name="vehicle")
@Table(name="vehicle", schema = "vehiclereservation_db")
public class Vehicle {
	@Id
	@Column(name="vehicleNumber")
	private int vehicleNumber;
	private String branch;
	private String vehicleType;
	//@DateTimeFormat(pattern = "MM/DD/yyyy")
	@Temporal(TemporalType.DATE)
	private Date insuranceExpiry;
	//@DateTimeFormat(pattern = "MM/DD/yyyy")
	@Temporal(TemporalType.DATE)

	private Date lastService;
	//@DateTimeFormat(pattern = "MM/DD/yyyy")
	@Temporal(TemporalType.DATE)

	private Date serviceDue;
	public int getVehicleNumber() {
		return vehicleNumber;
	}
	public void setVehicleNumber(int i) {
		this.vehicleNumber = i;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getVehicleType() {
		return vehicleType;
	}
	public void setVehicleType(String vehicleType) {
		this.vehicleType = vehicleType;
	}
	
	
	
	
	public Date getInsuranceExpiry() {
		return insuranceExpiry;
	}
	public void setInsuranceExpiry(Date insuranceExpiry) {
		this.insuranceExpiry = insuranceExpiry;
	}
	public Date getLastService() {
		return lastService;
	}
	public void setLastService(Date lastService) {
		this.lastService = lastService;
	}
	public Date getServiceDue() {
		return serviceDue;
	}
	public void setServiceDue(Date serviceDue) {
		this.serviceDue = serviceDue;
	}
	
	
	@Override
	public String toString() {
		return "Vehicle [vehicleNumber=" + vehicleNumber + ", branch=" + branch + ", vehicleType=" + vehicleType
				+ ", insuranceExpiry=" + insuranceExpiry + ", lastService=" + lastService + ", serviceDue=" + serviceDue
				+ "]";
	}
	public Vehicle()
	{}
	

}
