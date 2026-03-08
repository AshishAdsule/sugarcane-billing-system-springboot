package com.scbs.main.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.scbs.main.model.CaneCutSlip;
import com.scbs.main.service.*;

@Controller
public class CaneCutSlipController {

    @Autowired private CaneCutSlipService caneCutService;
    @Autowired private CaneRegistrationService registrationService;
    @Autowired private HarvestorService harvestorService;
    @Autowired private TransporterService transporterService;
    @Autowired private VehicleService vehicleService;

    @GetMapping("/caneCut")
    public String showCaneCutPage(Model model) {

        model.addAttribute("caneCut", new CaneCutSlip());
        model.addAttribute("caneCutList", caneCutService.getAllCaneCut());

        model.addAttribute("registrationList", registrationService.getAllRegistrations());
        model.addAttribute("harvestorList", harvestorService.getAllHarvestorList());
        model.addAttribute("transporterList", transporterService.getAllTraList());
        model.addAttribute("vehicleList", vehicleService.getAllVehicle());

        return "caneCut";
    }

    @PostMapping("/saveCaneCut")
    public String saveCaneCut(CaneCutSlip caneCut) {
        caneCutService.saveCaneCut(caneCut);
        return "redirect:/caneCut";
    }

    @GetMapping("/deleteCaneCut/{id}")
    public String deleteCaneCut(@PathVariable Long id) {
        caneCutService.deleteCaneCut(id);
        return "redirect:/caneCut";
    }

    @GetMapping("/editCaneCut/{id}")
    public String editCaneCut(@PathVariable Long id, Model model) {

        model.addAttribute("caneCut", caneCutService.getCaneCutById(id));
        model.addAttribute("caneCutList", caneCutService.getAllCaneCut());

        model.addAttribute("registrationList", registrationService.getAllRegistrations());
        model.addAttribute("harvestorList", harvestorService.getAllHarvestorList());
        model.addAttribute("transporterList", transporterService.getAllTraList());
        model.addAttribute("vehicleList", vehicleService.getAllVehicle());

        return "caneCut";
    }
    @GetMapping("/caneCutReport")
    public String caneCutReport(Model model){
        List<CaneCutSlip> cuts = caneCutService.getAllCaneCut();
        if(cuts == null) cuts = new ArrayList<>();
        model.addAttribute("cuts", cuts);
        return "caneCutReport";
    }
}