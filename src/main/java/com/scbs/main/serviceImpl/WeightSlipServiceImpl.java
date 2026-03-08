package com.scbs.main.serviceImpl;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scbs.main.model.WeightSlip;
import com.scbs.main.repostiory.WeightSlipRepository;
import com.scbs.main.service.WeightSlipService;

@Service
public class WeightSlipServiceImpl implements WeightSlipService{

	 @Autowired
	    private WeightSlipRepository weightSlipRepository;

	    @Override
	    public void saveWeightSlip(WeightSlip weightSlip) {
	        weightSlip.setNetWeight(
	            weightSlip.getGrossWeight() - weightSlip.getTareWeight()
	        );
	        weightSlipRepository.save(weightSlip);
	    }

	    @Override
	    public List<WeightSlip> getAllWeightSlips() {
	        return weightSlipRepository.findAll();
	    }

	    @Override
	    public WeightSlip getWeightSlipById(Long id) {
	        return weightSlipRepository.findById(id).orElse(null);
	    }

	    @Override
	    public void deleteWeightSlip(Long id) {
	        weightSlipRepository.deleteById(id);
	    }

		@Override
		public List<WeightSlip> getWeightSlipsBetweenDates(LocalDate startDate, LocalDate endDate) {
			// TODO Auto-generated method stub
			return weightSlipRepository.findByWeightSlipDateBetween(startDate, endDate);
		}

		@Override
		public Double getTotWeight() {
			// TODO Auto-generated method stub
			return weightSlipRepository.getTotalWeight();
		}
}
