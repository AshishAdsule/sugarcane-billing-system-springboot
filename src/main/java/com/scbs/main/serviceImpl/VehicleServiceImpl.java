package com.scbs.main.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scbs.main.model.Vehicle;
import com.scbs.main.repostiory.VehicleRepository;
import com.scbs.main.service.VehicleService;

@Service
public class VehicleServiceImpl implements VehicleService{

	@Autowired
	private VehicleRepository vehicleRepo;
	
	@Override
	public void saveVehicle(Vehicle vehicle) {
		vehicleRepo.save(vehicle);
	}

	@Override
	public List<Vehicle> getAllVehicle() {
		
		return vehicleRepo.findAll();
	}

	@Override
	public void deleteVehicle(Long vehicleId) {
		vehicleRepo.deleteById(vehicleId);
	}

	@Override
	public Vehicle getVehicleById(Long vehicleId) {
		return vehicleRepo.findById(vehicleId).orElse(null);
	}

}
