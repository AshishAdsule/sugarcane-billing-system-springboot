package com.scbs.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.scbs.main.model.Admin;
import com.scbs.main.service.AdminService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

 // Show registration page
    @GetMapping("/register")
    public String showRegistrationPage(Model model) {
        model.addAttribute("admin", new Admin());
        return "adminRegister";
    }

    // Handle registration form submit
    @PostMapping("/register")
    public String registerAdmin(@ModelAttribute("admin") Admin admin, Model model) {

        // Check if username already exists
        Admin existing = adminService.getAllAdmin()
                                     .stream()
                                     .filter(a -> a.getAdminName().equals(admin.getAdminName()))
                                     .findFirst()
                                     .orElse(null);

        if (existing != null) {
            model.addAttribute("error", "Username already exists!");
            return "adminRegister";
        }

        // Save new admin (password will be hashed in service)
        adminService.saveAdmin(admin);
        model.addAttribute("success", "Admin registered successfully!");
        model.addAttribute("admin", new Admin()); // reset form
        return "adminLogin";
    }
    @GetMapping("/login")
    public String showLoginPage() {
        return "adminLogin"; // JSP page
    }

    @PostMapping("/login")
    public String doLogin(@RequestParam String adminName,
                          @RequestParam String password,
                          HttpSession session,
                          Model model) {
        Admin admin = adminService.login(adminName, password);
        if (admin != null) {
            session.setAttribute("loggedInAdmin", admin);
            return "redirect:/dashboard"; // redirect to admin dashboard
        } else {
            model.addAttribute("error", "Invalid username or password");
            return "adminLogin";
        }
    }

    
}