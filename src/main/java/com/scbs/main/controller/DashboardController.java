package com.scbs.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.scbs.main.service.CaneCutSlipService;
import com.scbs.main.service.CultivatorService;
import com.scbs.main.service.WeightSlipService;

@Controller
public class DashboardController {

	@Autowired
	private CultivatorService cultivatorService;
	@Autowired
	private WeightSlipService weightSlipService;
	
	@Autowired
	private CaneCutSlipService caneCutSlipService;
	
	@GetMapping("/dashboard")
	public String showDashboard(Model model) {
		long totalCultivator=cultivatorService.getTotalCultivators();
		long totalBill=caneCutSlipService.countCutSlips();
		Double totalWeight=weightSlipService.getTotWeight();
		model.addAttribute("cultivatorCount",totalCultivator);
		model.addAttribute("totalBill",totalBill);
		model.addAttribute("totalWeight",totalWeight);
		return "dashboard";
	}
}
