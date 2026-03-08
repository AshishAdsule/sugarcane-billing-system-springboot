package com.scbs.main.service;

import java.util.List;

import com.scbs.main.model.Water;

public interface WaterService {

	void saveWaterInfo(Water water);
	List<Water> getAllWaterTypes();
	void deleteWaterById(Long waterId);
	Water updateWaterById(Long WaterId);
}
