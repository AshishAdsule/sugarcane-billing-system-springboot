package com.scbs.main.model;

import jakarta.persistence.*;
import java.util.Date;

@Entity
public class CaneRegistration {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long registrationId;

    @ManyToOne
    @JoinColumn(name = "cultivator_id")
    private Cultivator cultivator;

    @ManyToOne
    @JoinColumn(name = "village_id")
    private Village village;

    @ManyToOne
    @JoinColumn(name = "water_id")
    private Water water;

    @ManyToOne
    @JoinColumn(name = "cane_id")
    private Cane cane;

    private Double totalAreaOfCane;

    @Temporal(TemporalType.DATE)
    private Date registrationDate;

    @Temporal(TemporalType.DATE)
    private Date laganKhodvaDate;

    private String gatNo;

	public Long getRegistrationId() {
		return registrationId;
	}

	public void setRegistrationId(Long registrationId) {
		this.registrationId = registrationId;
	}

	public Cultivator getCultivator() {
		return cultivator;
	}

	public void setCultivator(Cultivator cultivator) {
		this.cultivator = cultivator;
	}

	public Village getVillage() {
		return village;
	}

	public void setVillage(Village village) {
		this.village = village;
	}

	public Water getWater() {
		return water;
	}

	public void setWater(Water water) {
		this.water = water;
	}

	public Cane getCane() {
		return cane;
	}

	public void setCane(Cane cane) {
		this.cane = cane;
	}

	public Double getTotalAreaOfCane() {
		return totalAreaOfCane;
	}

	public void setTotalAreaOfCane(Double totalAreaOfCane) {
		this.totalAreaOfCane = totalAreaOfCane;
	}

	public Date getRegistrationDate() {
		return registrationDate;
	}

	public void setRegistrationDate(Date registrationDate) {
		this.registrationDate = registrationDate;
	}

	public Date getLaganKhodvaDate() {
		return laganKhodvaDate;
	}

	public void setLaganKhodvaDate(Date laganKhodvaDate) {
		this.laganKhodvaDate = laganKhodvaDate;
	}

	public String getGatNo() {
		return gatNo;
	}

	public void setGatNo(String gatNo) {
		this.gatNo = gatNo;
	}

    // Getters and Setters
    
    
}