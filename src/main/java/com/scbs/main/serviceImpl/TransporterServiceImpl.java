package com.scbs.main.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scbs.main.model.Transporter;
import com.scbs.main.repostiory.TransporterRepository;
import com.scbs.main.service.TransporterService;

@Service
public class TransporterServiceImpl implements TransporterService{

	@Autowired
	private TransporterRepository transporterRepo;
	
	@Override
	public void saveTransporterInfo(Transporter transporter) {
		transporterRepo.save(transporter);
	}

	@Override
	public List<Transporter> getAllTraList() {
		// TODO Auto-generated method stub
		return transporterRepo.findAll();
	}

	@Override
	public void deleteTransporterById(Long id) {
		transporterRepo.deleteById(id);
	}

	@Override
	public Transporter getTransporterById(Long id) {
		// TODO Auto-generated method stub
		return transporterRepo.findById(id).orElse(null);
	}

}
