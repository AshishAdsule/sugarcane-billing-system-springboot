package com.scbs.main.service;

import java.util.List;

import com.scbs.main.model.Cultivator;

public interface CultivatorService {
	
	void saveCultivatorInfo(Cultivator cultivator);
	List<Cultivator> getAllCultivator();
	void deleteCultivatorById(Long id);
	Cultivator getCultivatorById(Long id);
	long getTotalCultivators();
}
