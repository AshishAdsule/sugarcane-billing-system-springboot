package com.scbs.main.service;

import java.util.List;

import com.scbs.main.model.Harvestor;

public interface HarvestorService {

	void saveHarvestorInfo(Harvestor harvestor);
	List<Harvestor> getAllHarvestorList();
	void deleteHarvestorById(Long id);
	Harvestor getHarvestorById(Long id);
}
