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
public class WeightSlip {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long weightSlipId;

    @ManyToOne
    @JoinColumn(name = "cane_cut_id")
    private CaneCutSlip caneCutSlip;

    private Double grossWeight;
    private Double tareWeight;
    private Double netWeight;

    private LocalDate weightSlipDate;

    private String remarks;

	public Long getWeightSlipId() {
		return weightSlipId;
	}

	public void setWeightSlipId(Long weightSlipId) {
		this.weightSlipId = weightSlipId;
	}

	public CaneCutSlip getCaneCutSlip() {
		return caneCutSlip;
	}

	public void setCaneCutSlip(CaneCutSlip caneCutSlip) {
		this.caneCutSlip = caneCutSlip;
	}

	public Double getGrossWeight() {
		return grossWeight;
	}

	public void setGrossWeight(Double grossWeight) {
		this.grossWeight = grossWeight;
	}

	public Double getTareWeight() {
		return tareWeight;
	}

	public void setTareWeight(Double tareWeight) {
		this.tareWeight = tareWeight;
	}

	public Double getNetWeight() {
		return netWeight;
	}

	public void setNetWeight(Double netWeight) {
		this.netWeight = netWeight;
	}

	public LocalDate getWeightSlipDate() {
		return weightSlipDate;
	}

	public void setWeightSlipDate(LocalDate weightSlipDate) {
		this.weightSlipDate = weightSlipDate;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

    
}