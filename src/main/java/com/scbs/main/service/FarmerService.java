package com.scbs.main.service;

import java.util.List;

import com.scbs.main.model.Farmer;

public interface FarmerService {

	void saveFarmer(Farmer farmer);
	List<Farmer> getAllFarmers();
	void deleteFarmerById(Long id);
	Farmer getFarmerById(Long id);
}
