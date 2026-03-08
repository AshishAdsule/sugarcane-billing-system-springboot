package com.scbs.main.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.scbs.main.model.WeightSlip;
import com.scbs.main.service.WeightSlipService;

@Controller
public class WeightReport {

	@Autowired
	private WeightSlipService weightSlipService;
//	@GetMapping("/weightReport")
//    public String weightReport(@RequestParam(required=false) String startDate,
//            @RequestParam(required=false) String endDate,
//            Model model){
//        model.addAttribute("weights", weightSlipService.getAllWeightSlips());
//        return "weightReport";
//    }
	@GetMapping("/weightReport")
	public String weightReport(
	        @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
	        @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate,
	        Model model) {

	    List<WeightSlip> weights;

	    if (startDate != null && endDate != null) {
	        // Fetch records between startDate and endDate
	        weights = weightSlipService.getWeightSlipsBetweenDates(startDate, endDate);
	    } else {
	        // If no dates provided, fetch all records
	    	
	        weights = weightSlipService.getAllWeightSlips();
	    }

	    model.addAttribute("weights", weights);
	    return "weightReport";
	}
}
