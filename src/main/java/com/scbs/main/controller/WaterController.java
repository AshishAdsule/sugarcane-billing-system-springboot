package com.scbs.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.scbs.main.model.Water;
import com.scbs.main.service.WaterService;

@Controller
public class WaterController {

	@Autowired
	private WaterService waterService;
	
	
	@GetMapping("/water")
	public String showWaterPage(Model model)
	{
		model.addAttribute("water", new Water());
		model.addAttribute("waterList",waterService.getAllWaterTypes());
		return "water";
	}
	
	@PostMapping("/saveWater")
	public String saveWaterInfo(Water water)
	{
		waterService.saveWaterInfo(water);
		return "redirect:/water";
	}
	@GetMapping("/deleteWater/{id}")
	public String deleteWaterById(@PathVariable Long id)
	{
		waterService.deleteWaterById(id);
		return "redirect:/water";
	}
	
	@GetMapping("/editWater/{id}")
	public String editWaterById(@PathVariable Long id,Model model)
	{
		Water water=waterService.updateWaterById(id);
		model.addAttribute("water",water);
		model.addAttribute("waterList",waterService.getAllWaterTypes());
		return "water";
	}
}
