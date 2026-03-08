package com.scbs.main.service;

import java.util.List;

import com.scbs.main.model.Vehicle;

public interface VehicleService {

	void saveVehicle(Vehicle vehicle);
	List<Vehicle> getAllVehicle();
	void deleteVehicle(Long vehicleId);
	Vehicle getVehicleById(Long vehicleId);
}
