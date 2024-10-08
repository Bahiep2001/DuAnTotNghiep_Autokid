package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class AdminController {
    @GetMapping("/admin")
    public String home(){
        return "adminAutokid/index";
    }

    @GetMapping("/admin/product")
    public String products(){
        return "adminAutokid/products";
    }
}
