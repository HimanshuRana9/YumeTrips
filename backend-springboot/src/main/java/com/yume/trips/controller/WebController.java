package com.yume.trips.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;

@Controller
public class WebController {

    @GetMapping("/")
    public String index(Model model) {
        // DB-backed data will be empty until MySQL is connected
        model.addAttribute("destinations", new ArrayList<>());
        model.addAttribute("packages", new ArrayList<>());
        return "index";
    }

    @GetMapping("/destinations")
    public String destinations(Model model) {
        model.addAttribute("destinations", new ArrayList<>());
        return "destinations";
    }

    @GetMapping("/hotels")
    public String hotels(Model model) {
        model.addAttribute("hotels", new ArrayList<>());
        return "hotels";
    }

    @GetMapping("/planner")
    public String planner() {
        return "planner";
    }

    @GetMapping("/route-map")
    public String routeMap() {
        return "routemap";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/register")
    public String register() {
        return "register";
    }
}
