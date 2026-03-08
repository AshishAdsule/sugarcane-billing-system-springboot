package com.scbs.main.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scbs.main.model.Cultivator;
import com.scbs.main.repostiory.CultivatorRepository;
import com.scbs.main.service.CultivatorService;

@Service
public class CultivatorServiceImpl implements CultivatorService{

	@Autowired
	private CultivatorRepository cultivatorRepo;
	@Override
	public void saveCultivatorInfo(Cultivator cultivator) {
		cultivatorRepo.save(cultivator);
	}

	@Override
	public List<Cultivator> getAllCultivator() {
		// TODO Auto-generated method stub
		return cultivatorRepo.findAll();
	}

	@Override
	public void deleteCultivatorById(Long id) {
		cultivatorRepo.deleteById(id);
	}

	@Override
	public Cultivator getCultivatorById(Long id) {
		// TODO Auto-generated method stub
		return cultivatorRepo.findById(id).orElse(null);
	}

	@Override
	public long getTotalCultivators() {
		// TODO Auto-generated method stub
		return cultivatorRepo.count();
	}

}
