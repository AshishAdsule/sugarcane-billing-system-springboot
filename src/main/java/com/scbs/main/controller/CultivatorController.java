package com.scbs.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.scbs.main.model.Cultivator;
import com.scbs.main.service.CultivatorService;
import com.scbs.main.service.VillageService;

@Controller
public class CultivatorController {

	@Autowired
	private CultivatorService cultivatorService;
	
	@Autowired
	private VillageService villageService;
	
	
	@GetMapping("/cultivator")
	public String showCultivatorPage(Model model)
	{
		model.addAttribute("cultivator",new Cultivator());
		model.addAttribute("cultivatorList",cultivatorService.getAllCultivator());
		model.addAttribute("villageList",villageService.getAllVillage());
		return "cultivator";
	}
	@PostMapping("/saveCultivator")
	public String saveCultivator(Cultivator cultivator)
	{
		cultivatorService.saveCultivatorInfo(cultivator);
		return "redirect:/cultivator";
	}
	
	@GetMapping("/deleteCultivator/{id}")
	public String deleteCultivatorById(@PathVariable Long id)
	{
		cultivatorService.deleteCultivatorById(id);
		return "redirect:/cultivator";
	}
	@GetMapping("/editCultivator/{id}")
	public String editCultivatorById(@PathVariable Long id,Model model)
	{
		Cultivator cultivator=cultivatorService.getCultivatorById(id);
		model.addAttribute("cultivator",cultivator);
		model.addAttribute("cultivatorList",cultivatorService.getAllCultivator());
		model.addAttribute("villageList",villageService.getAllVillage());
		return "cultivator";
	}
	
	@GetMapping("/cultivatorReport")
	public String cultivatorReport(Model model){
	    model.addAttribute("cultivators", cultivatorService.getAllCultivator());
	    return "cultivatorReport";
	}
}
