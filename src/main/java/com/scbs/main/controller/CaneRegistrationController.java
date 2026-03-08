package com.scbs.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.scbs.main.model.CaneRegistration;
import com.scbs.main.service.*;

@Controller
public class CaneRegistrationController {

    @Autowired
    private CaneRegistrationService registrationService;

    @Autowired
    private CultivatorService cultivatorService;

    @Autowired
    private VillageService villageService;

    @Autowired
    private WaterService waterService;

    @Autowired
    private CaneService caneService;

    @GetMapping("/registration")
    public String showRegistrationPage(Model model) {

        model.addAttribute("registration", new CaneRegistration());
        model.addAttribute("registrationList", 
                           registrationService.getAllRegistrations());

        model.addAttribute("cultivatorList", 
                           cultivatorService.getAllCultivator());

        model.addAttribute("villageList", 
                           villageService.getAllVillage());

        model.addAttribute("waterList", 
                           waterService.getAllWaterTypes());

        model.addAttribute("caneList", 
                           caneService.getAllCane());

        return "registration";
    }

    @PostMapping("/saveRegistration")
    public String saveRegistration(CaneRegistration registration) {
        registrationService.saveRegistration(registration);
        return "redirect:/registration";
    }

    @GetMapping("/deleteRegistration/{id}")
    public String deleteRegistration(@PathVariable Long id) {
        registrationService.deleteRegistrationById(id);
        return "redirect:/registration";
    }

    @GetMapping("/editRegistration/{id}")
    public String editRegistration(@PathVariable Long id, Model model) {

        CaneRegistration registration = 
            registrationService.getRegistrationById(id);

        model.addAttribute("registration", registration);
        model.addAttribute("registrationList", 
                           registrationService.getAllRegistrations());

        model.addAttribute("cultivatorList", 
                           cultivatorService.getAllCultivator());

        model.addAttribute("villageList", 
                           villageService.getAllVillage());

        model.addAttribute("waterList", 
                           waterService.getAllWaterTypes());

        model.addAttribute("caneList", 
                           caneService.getAllCane());

        return "registration";
    }
    @GetMapping("/registrationReport")
    public String registrationReport(Model model){
        model.addAttribute("registrations", registrationService.getAllRegistrations());
        return "registrationReport";
    }
}