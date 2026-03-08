package com.scbs.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.scbs.main.model.Transporter;
import com.scbs.main.service.*;

@Controller
@RequestMapping("/transporter")
public class TransporterController {

    @Autowired
    private TransporterService transporterService;

    @Autowired
    private VehicleService vehicleService;

    @Autowired
    private WaterService waterService;

    @Autowired
    private VillageService villageService;

    @Autowired
    private CultivatorService cultivatorService;

    // ===============================
    // SHOW PAGE
    // ===============================
    @GetMapping
    public String showTransporterPage(Model model) {

        model.addAttribute("transporter", new Transporter());
        model.addAttribute("transporterList", transporterService.getAllTraList());

        model.addAttribute("vehicleList", vehicleService.getAllVehicle());
        model.addAttribute("waterList", waterService.getAllWaterTypes());
        model.addAttribute("villageList", villageService.getAllVillage());
        model.addAttribute("cultivatorList", cultivatorService.getAllCultivator());

        return "transporter";
    }

    // ===============================
    // SAVE
    // ===============================
    @PostMapping("/save")
    public String saveTransporter(@ModelAttribute Transporter transporter) {

        transporterService.saveTransporterInfo(transporter);
        return "redirect:/transporter";
    }

    // ===============================
    // DELETE (POST to avoid 405)
    // ===============================
    @PostMapping("/delete/{id}")
    public String deleteTransporter(@PathVariable Long id) {

        transporterService.deleteTransporterById(id);
        return "redirect:/transporter";
    }

    // ===============================
    // EDIT
    // ===============================
    @GetMapping("/edit/{id}")
    public String editTransporter(@PathVariable Long id, Model model) {

        Transporter transporter = transporterService.getTransporterById(id);

        model.addAttribute("transporter", transporter);
        model.addAttribute("transporterList", transporterService.getAllTraList());

        model.addAttribute("vehicleList", vehicleService.getAllVehicle());
        model.addAttribute("waterList", waterService.getAllWaterTypes());
        model.addAttribute("villageList", villageService.getAllVillage());
        model.addAttribute("cultivatorList", cultivatorService.getAllCultivator());

        return "transporter";
    }
}