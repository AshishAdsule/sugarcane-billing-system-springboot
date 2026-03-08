package com.scbs.main.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table
public class Transporter {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long transporterId;

    private String transporterName;
    private String transporterMobileNo;
    private String transporterAddress;

    private String witnessName;
    private String witnessAddress;

    private String cultivatorType;

    @ManyToOne
    @JoinColumn(name = "vehicle_id")
    private Vehicle vehicle;

    @ManyToOne
    @JoinColumn(name = "water_id")
    private Water water;

    @ManyToOne
    @JoinColumn(name = "village_id")
    private Village village;

    @ManyToOne
    @JoinColumn(name = "cultivator_id")
    private Cultivator cultivator;

	public Long getTransporterId() {
		return transporterId;
	}

	public void setTransporterId(Long transporterId) {
		this.transporterId = transporterId;
	}

	public String getTransporterName() {
		return transporterName;
	}

	public void setTransporterName(String transporterName) {
		this.transporterName = transporterName;
	}

	public String getTransporterMobileNo() {
		return transporterMobileNo;
	}

	public void setTransporterMobileNo(String transporterMobileNo) {
		this.transporterMobileNo = transporterMobileNo;
	}

	public String getTransporterAddress() {
		return transporterAddress;
	}

	public void setTransporterAddress(String transporterAddress) {
		this.transporterAddress = transporterAddress;
	}

	public String getWitnessName() {
		return witnessName;
	}

	public void setWitnessName(String witnessName) {
		this.witnessName = witnessName;
	}

	public String getWitnessAddress() {
		return witnessAddress;
	}

	public void setWitnessAddress(String witnessAddress) {
		this.witnessAddress = witnessAddress;
	}

	public String getCultivatorType() {
		return cultivatorType;
	}

	public void setCultivatorType(String cultivatorType) {
		this.cultivatorType = cultivatorType;
	}

	public Vehicle getVehicle() {
		return vehicle;
	}

	public void setVehicle(Vehicle vehicle) {
		this.vehicle = vehicle;
	}

	public Water getWater() {
		return water;
	}

	public void setWater(Water water) {
		this.water = water;
	}

	public Village getVillage() {
		return village;
	}

	public void setVillage(Village village) {
		this.village = village;
	}

	public Cultivator getCultivator() {
		return cultivator;
	}

	public void setCultivator(Cultivator cultivator) {
		this.cultivator = cultivator;
	}

	
}