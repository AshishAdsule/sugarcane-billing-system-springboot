package com.scbs.main.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scbs.main.model.Village;
import com.scbs.main.repostiory.VillageRepository;
import com.scbs.main.service.VillageService;

@Service
public class VillageServiceImpl implements VillageService{

	@Autowired
	private VillageRepository repository;
	public VillageServiceImpl(VillageRepository repository) {
		super();
		this.repository = repository;
	}

	@Override
	public void saveVillage(Village village) {
		repository.save(village);
	}

	@Override
	public List<Village> getAllVillage() {
		// TODO Auto-generated method stub
		return repository.findAll();
	}

	@Override
	public void deleteVillageById(Long id) {
		repository.deleteById(id);;
	}

	@Override
	public Village getVillageById(Long id) {
		return repository.findById(id).orElse(null);
	}

}
