package com.scbs.main.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table
public class Water {

	@Id
	@GeneratedValue(strategy =GenerationType.IDENTITY)
	private  Long waterId;
	private  String waterType;
	public Long getWaterId() {
		return waterId;
	}
	public void setWaterId(Long waterId) {
		this.waterId = waterId;
	}
	public String getWaterType() {
		return waterType;
	}
	public void setWaterType(String waterType) {
		this.waterType = waterType;
	}
}
