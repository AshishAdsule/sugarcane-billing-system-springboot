package com.scbs.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.scbs.main.model.Vehicle;
import com.scbs.main.service.VehicleService;

@Controller
public class VehicleController {



	@Autowired
	private VehicleService vehicleservice;
	
	@GetMapping("/vehicle")
	public String showVehiclePage(Model model) {
		model.addAttribute("vehicle", new Vehicle());// for loading new form 
		model.addAttribute("vehicleList",vehicleservice.getAllVehicle());
		return "vehicle";
	}
	
	@PostMapping("/saveVehicle")
	public String saveVehicle(Vehicle vehicle)
	{
		vehicleservice.saveVehicle(vehicle);
		return "redirect:/vehicle";
	}
	@GetMapping("/delete/{vehicleId}")
	public String deleteVehicle(@PathVariable Long vehicleId)
	{
		vehicleservice.deleteVehicle(vehicleId);
		return "redirect:/vehicle";
	}
	
	@GetMapping("/edit/{vehicleId}")
	public String editVehicle(@PathVariable Long vehicleId,Model model)
	{
		Vehicle vehicle=vehicleservice.getVehicleById(vehicleId);
		model.addAttribute("vehicle",vehicle);
		model.addAttribute("vehicleList",vehicleservice.getAllVehicle());
		return "vehicle";
	}
	
}
