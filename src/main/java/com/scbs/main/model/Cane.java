package com.scbs.main.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
public class Cane {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long caneId;
	
	private String caneName;

	
	public Long getCaneId() {
		return caneId;
	}

	public void setCaneId(Long caneId) {
		this.caneId = caneId;
	}

	public String getCaneName() {
		return caneName;
	}

	public void setCaneName(String caneName) {
		this.caneName = caneName;
	}
}
