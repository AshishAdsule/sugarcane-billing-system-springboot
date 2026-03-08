package com.scbs.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.scbs.main.model.Harvestor;
import com.scbs.main.service.HarvestorService;

@Controller
public class HarvestorController {
	@Autowired
	private HarvestorService harvestorService;
	
	@GetMapping("/harvestor")
	public String showHarvestorPage(Model model) {
		model.addAttribute("harvestor",new Harvestor());
		model.addAttribute("harvestorList",harvestorService.getAllHarvestorList());
		return "harvestor";
	}
	
	@PostMapping("/saveHarvestor")
	public String saveHarvestor(Harvestor harvestor)
	{
		harvestorService.saveHarvestorInfo(harvestor);
		return "redirect:/harvestor";
	}
	@GetMapping("/deleteHarvestor/{id}")
	public String deleteHarvestorById(@PathVariable Long id) {
		harvestorService.deleteHarvestorById(id);
		return "redirect:/harvestor";
	}
	@GetMapping("/editHarvestor/{id}")
	public String editHarvestorById(@PathVariable Long id,Model model)
	{
		model.addAttribute("harvestor",new Harvestor());
		model.addAttribute("harvestorList",harvestorService.getHarvestorById(id));
		return "harvestor";
	}
	
}
