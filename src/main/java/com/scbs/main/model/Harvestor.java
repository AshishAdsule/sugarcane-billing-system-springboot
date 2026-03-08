package com.scbs.main.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table
public class Harvestor {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long HarvestorId ;
	private String  HarvestorName;
	private String HarvestorAddress;
	private String TotalWorkers;
	public Long getHarvestorId() {
		return HarvestorId;
	}
	public void setHarvestorId(Long harvestorId) {
		HarvestorId = harvestorId;
	}
	public String getHarvestorName() {
		return HarvestorName;
	}
	public void setHarvestorName(String harvestorName) {
		HarvestorName = harvestorName;
	}
	public String getHarvestorAddress() {
		return HarvestorAddress;
	}
	public void setHarvestorAddress(String harvestorAddress) {
		HarvestorAddress = harvestorAddress;
	}
	public String getTotalWorkers() {
		return TotalWorkers;
	}
	public void setTotalWorkers(String totalWorkers) {
		TotalWorkers = totalWorkers;
	}
}
