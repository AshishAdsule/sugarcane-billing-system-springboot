package com.scbs.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.scbs.main.model.WeightSlip;
import com.scbs.main.service.CaneCutSlipService;
import com.scbs.main.service.WeightSlipService;

@Controller
@RequestMapping("/weightslip")   // ✅ IMPORTANT
public class WeightSlipController {

    @Autowired
    private WeightSlipService weightSlipService;

    @Autowired
    private CaneCutSlipService caneCutSlipService;

    // ===============================
    // SHOW PAGE
    // ===============================
    @GetMapping
    public String showWeightSlipPage(Model model) {

        model.addAttribute("weightSlip", new WeightSlip());
        model.addAttribute("weightSlipList", weightSlipService.getAllWeightSlips());
        model.addAttribute("caneCutList", caneCutSlipService.getAllCaneCut());

        return "weightslip";
    }

    // ===============================
    // SAVE
    // ===============================
    @PostMapping("/save")
    public String saveWeightSlip(@ModelAttribute WeightSlip weightSlip) {

        weightSlipService.saveWeightSlip(weightSlip);
        return "redirect:/weightslip";
    }

    // ===============================
    // EDIT
    // ===============================
    @GetMapping("/edit/{id}")
    public String editWeightSlip(@PathVariable Long id, Model model) {

        model.addAttribute("weightSlip", weightSlipService.getWeightSlipById(id));
        model.addAttribute("weightSlipList", weightSlipService.getAllWeightSlips());
        model.addAttribute("caneCutList", caneCutSlipService.getAllCaneCut());

        return "weightslip";
    }

    // ===============================
    // DELETE
    // ===============================
    @PostMapping("/delete/{id}")
    public String deleteWeightSlip(@PathVariable Long id) {

        weightSlipService.deleteWeightSlip(id);
        return "redirect:/weightslip";
    }
    @GetMapping("/weightReport")
    public String weightReport(Model model){
        model.addAttribute("weights", weightSlipService.getAllWeightSlips());
        return "weightReport";
    }
    
    @GetMapping("/print/{id}")
    public String printWeightSlip(@PathVariable("id") Long id, Model model){

        WeightSlip slip = weightSlipService.getWeightSlipById(id);

        model.addAttribute("slip", slip);

        return "weightslip-print";
    }
}