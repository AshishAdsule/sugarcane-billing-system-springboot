package com.scbs.main.serviceImpl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scbs.main.model.CaneCutSlip;
import com.scbs.main.repostiory.CaneCutSlipRepository;
import com.scbs.main.service.CaneCutSlipService;

@Service
public class CaneCutSlipServiceImpl implements CaneCutSlipService {

    @Autowired
    private CaneCutSlipRepository repository;

    @Override
    public void saveCaneCut(CaneCutSlip caneCut) {
        repository.save(caneCut);
    }

    @Override
    public List<CaneCutSlip> getAllCaneCut() {
        return repository.findAll();
    }

    @Override
    public void deleteCaneCut(Long id) {
        repository.deleteById(id);
    }

    @Override
    public CaneCutSlip getCaneCutById(Long id) {
        return repository.findById(id).orElse(null);
    }

	@Override
	public long countCutSlips() {
		// TODO Auto-generated method stub
		return repository.count();
	}
}