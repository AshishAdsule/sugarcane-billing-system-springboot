package com.scbs.main.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scbs.main.model.Harvestor;
import com.scbs.main.repostiory.HarvestorRepository;
import com.scbs.main.service.HarvestorService;

@Service
public class HarvestorServiceImpl implements HarvestorService{

	@Autowired
	private HarvestorRepository harvestorRepo;
	
	
	@Override
	public void saveHarvestorInfo(Harvestor harvestor) {
		harvestorRepo.save(harvestor);
	}

	@Override
	public List<Harvestor> getAllHarvestorList() {
		// TODO Auto-generated method stub
		return harvestorRepo.findAll();
	}

	@Override
	public void deleteHarvestorById(Long id) {
		harvestorRepo.deleteById(id);
	}

	@Override
	public Harvestor getHarvestorById(Long id) {
		// TODO Auto-generated method stub
		return harvestorRepo.findById(id).orElse(null);
	}

}
