package com.scbs.main.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scbs.main.model.Cane;
import com.scbs.main.repostiory.CaneRepository;
import com.scbs.main.service.CaneService;

@Service
public class CaneServiceImpl implements CaneService{
	@Autowired
	private CaneRepository caneRepository;
	
	@Override
	public void addCane(Cane cane) {
		caneRepository.save(cane);
	}

	@Override
	public List<Cane> getAllCane() {
		return caneRepository.findAll();
	}

	@Override
	public void deleteCaneById(Long id) {
		caneRepository.deleteById(id);
	}

	@Override
	public Cane getCaneById(Long id) {
		// TODO Auto-generated method stub
		return caneRepository.findById(id).orElse(null);
	}

}
