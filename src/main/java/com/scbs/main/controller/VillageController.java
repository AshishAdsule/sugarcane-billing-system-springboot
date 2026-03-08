package com.scbs.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.scbs.main.model.Village;
import com.scbs.main.service.VillageService;

@Controller
public class VillageController {
	
	@Autowired
	private VillageService service;
	
	@GetMapping("/village")
	public String showVillageForm(Model model) {
		model.addAttribute("village",new Village());// for new form
		model.addAttribute("villages",service.getAllVillage());
		return "village";
	}
	@PostMapping("/saveVillage")
	public String saveVillage(Village village) {
		service.saveVillage(village);
		return "redirect:/village";
	}
	
	@GetMapping("/deleteVillage/{id}")
	public String delteVillage(@PathVariable Long id) {
		service.deleteVillageById(id);
		return "redirect:/village";
	}
	@GetMapping("/editVillage/{id}")
	public String updateVillage(@PathVariable Long id,Model model) {
			Village village=service.getVillageById(id);
			model.addAttribute("village",village);
			model.addAttribute("villages",service.getAllVillage());
		return "village";
	}
}
