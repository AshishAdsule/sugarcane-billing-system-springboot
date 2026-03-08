package com.scbs.main.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scbs.main.model.Farmer;
import com.scbs.main.repostiory.FarmerRepository;
import com.scbs.main.repostiory.VillageRepository;
import com.scbs.main.service.FarmerService;

@Service
public class FarmerServiceImpl implements FarmerService
{
	@Autowired
	private FarmerRepository farmerRepository;

	@Override
	public void saveFarmer(Farmer farmer) {
		farmerRepository.save(farmer);
	}

	@Override
	public List<Farmer> getAllFarmers() {
		List<Farmer> fl=farmerRepository.findAll();
		return fl;
	}

	@Override
	public void deleteFarmerById(Long id) {
		farmerRepository.deleteById(id);
	}

	@Override
	public Farmer getFarmerById(Long id) {
		Farmer f=farmerRepository.findById(id).orElse(null);
		return f;
	}

}
