package com.scbs.main.model;

import java.time.LocalDate;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table
public class CaneCutSlip {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long caneCutId;

    @ManyToOne
    @JoinColumn(name = "registration_id")
    private CaneRegistration registration;

    @ManyToOne
    @JoinColumn(name = "harvestor_id")
    private Harvestor harvestor;

    @ManyToOne
    @JoinColumn(name = "transporter_id")
    private Transporter transporter;

    @ManyToOne
    @JoinColumn(name = "vehicle_id")
    private Vehicle vehicle;

    private LocalDate caneCutDate;

    private Double totalArea;

	public Long getCaneCutId() {
		return caneCutId;
	}

	public void setCaneCutId(Long caneCutId) {
		this.caneCutId = caneCutId;
	}

	public CaneRegistration getRegistration() {
		return registration;
	}

	public void setRegistration(CaneRegistration registration) {
		this.registration = registration;
	}

	public Harvestor getHarvestor() {
		return harvestor;
	}

	public void setHarvestor(Harvestor harvestor) {
		this.harvestor = harvestor;
	}

	public Transporter getTransporter() {
		return transporter;
	}

	public void setTransporter(Transporter transporter) {
		this.transporter = transporter;
	}

	public Vehicle getVehicle() {
		return vehicle;
	}

	public void setVehicle(Vehicle vehicle) {
		this.vehicle = vehicle;
	}

	public LocalDate getCaneCutDate() {
		return caneCutDate;
	}

	public void setCaneCutDate(LocalDate caneCutDate) {
		this.caneCutDate = caneCutDate;
	}

	public Double getTotalArea() {
		return totalArea;
	}

	public void setTotalArea(Double totalArea) {
		this.totalArea = totalArea;
	}
    
}