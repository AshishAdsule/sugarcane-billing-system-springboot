package com.scbs.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.scbs.main.model.Cane;
import com.scbs.main.service.CaneService;

@Controller
public class CaneController {

	@Autowired
	private CaneService caneService;
	
	@GetMapping("/cane")
	public String showCanePage(Model model) {
		model.addAttribute("cane",new Cane());
		model.addAttribute("caneList",caneService.getAllCane());
		return "cane";
	}
	@PostMapping("/saveCane")
	public String saveCane(Cane cane) {
		caneService.addCane(cane);
		return "redirect:/cane";
	}
	@GetMapping("/deleteCane/{id}")
	public String deleteCane(@PathVariable Long id)
	{
		caneService.deleteCaneById(id);
		return "redirect:/cane";
	}
	@GetMapping("/editCane/{id}")
	public String editCane(@PathVariable Long id,Model model)
	{
		Cane cane=caneService.getCaneById(id);
		model.addAttribute("cane",cane);
		model.addAttribute("caneList",caneService.getAllCane());
		return "cane";
	}
}
