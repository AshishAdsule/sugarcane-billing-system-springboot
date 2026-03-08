package com.scbs.main.service;

import java.util.List;

import com.scbs.main.model.Cane;

public interface CaneService {

	void addCane(Cane cane);
	List<Cane> getAllCane();
	void deleteCaneById(Long id);
	Cane getCaneById(Long id);
}
