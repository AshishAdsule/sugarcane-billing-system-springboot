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
public class Cultivator {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long cultivatorId;

    private String cultivatorName;
    private String cultivatorAddress;
    private String cultivatorMobileNo;
    private String cultivatorType;

    private String bankName;
    private String accountNo;

    private Double totalAreaOfCane;

    @ManyToOne
    @JoinColumn(name = "village_id")
    private Village village;

	public Long getCultivatorId() {
		return cultivatorId;
	}

	public void setCultivatorId(Long cultivatorId) {
		this.cultivatorId = cultivatorId;
	}

	public String getCultivatorName() {
		return cultivatorName;
	}

	public void setCultivatorName(String cultivatorName) {
		this.cultivatorName = cultivatorName;
	}

	public String getCultivatorAddress() {
		return cultivatorAddress;
	}

	public void setCultivatorAddress(String cultivatorAddress) {
		this.cultivatorAddress = cultivatorAddress;
	}

	public String getCultivatorMobileNo() {
		return cultivatorMobileNo;
	}

	public void setCultivatorMobileNo(String cultivatorMobileNo) {
		this.cultivatorMobileNo = cultivatorMobileNo;
	}

	public String getCultivatorType() {
		return cultivatorType;
	}

	public void setCultivatorType(String cultivatorType) {
		this.cultivatorType = cultivatorType;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public Double getTotalAreaOfCane() {
		return totalAreaOfCane;
	}

	public void setTotalAreaOfCane(Double totalAreaOfCane) {
		this.totalAreaOfCane = totalAreaOfCane;
	}

	public Village getVillage() {
		return village;
	}

	public void setVillage(Village village) {
		this.village = village;
	}
}
