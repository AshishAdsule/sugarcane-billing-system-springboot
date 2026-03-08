package com.scbs.main.service;

import java.util.List;

import com.scbs.main.model.Village;

public interface VillageService {

	void saveVillage(Village village);
	List<Village> getAllVillage();
	void deleteVillageById(Long id);
	Village getVillageById(Long id);
}
