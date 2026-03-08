package com.scbs.main.controller;
import com.scbs.main.serviceImpl.FarmerServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.scbs.main.model.Farmer;
import com.scbs.main.service.FarmerService;
import com.scbs.main.service.VillageService;


@Controller
public class FarmerController {

  
	@Autowired
	private FarmerService farmerService;
	@Autowired
	private VillageService villageService;
	
	@GetMapping("/farmer")
	public String showFarmerPage(Model model) {
		model.addAttribute("farmer",new Farmer());
		model.addAttribute("farmers",farmerService.getAllFarmers());
		model.addAttribute("villages",villageService.getAllVillage());
		return "farmer";
	}
	
	@PostMapping("/saveFarmer")
	public String saveFarmer(Farmer farmer)
	{
		farmerService.saveFarmer(farmer);
		return "redirect:/farmer";
	}
	
	@GetMapping("/deleteFarmer/{id}")
	public String deleteFarmer(@PathVariable Long id)
	{
		farmerService.deleteFarmerById(id);
		return "redirect:/farmer";
	}
	@GetMapping("/editFarmer/{id}")
	public String editFarmer(@PathVariable Long id,Model model)
	{
		Farmer farmer=farmerService.getFarmerById(id);
		model.addAttribute("farmer",farmer);
		model.addAttribute("farmers",farmerService.getAllFarmers());
		model.addAttribute("villages",villageService.getAllVillage());
		return "farmer";
	}
}
