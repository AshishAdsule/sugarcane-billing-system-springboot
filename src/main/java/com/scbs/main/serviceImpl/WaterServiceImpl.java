package com.scbs.main.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scbs.main.model.Water;
import com.scbs.main.repostiory.WaterRepository;
import com.scbs.main.service.WaterService;

@Service
public class WaterServiceImpl implements WaterService{

	@Autowired
	private WaterRepository waterRepo;
	
	
	@Override
	public void saveWaterInfo(Water water) {
		waterRepo.save(water);
	}

	@Override
	public List<Water> getAllWaterTypes() {
		// TODO Auto-generated method stub
		return waterRepo.findAll();
	}

	@Override
	public void deleteWaterById(Long waterId) {
		waterRepo.deleteById(waterId);
	}

	@Override
	public Water updateWaterById(Long WaterId) {
		// TODO Auto-generated method stub
		return waterRepo.findById(WaterId).orElse(null);
	}

}
