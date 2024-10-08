package com.example.demo.controller;


import com.example.demo.repository.GioHangChiTietRepo;
import com.example.demo.repository.LoaiSanPhamRepo;
import com.example.demo.service.QuanLySanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/autokid")
public class CustommerController {

    @Autowired
    GioHangChiTietRepo gioHangChiTietRepo;

    @Autowired
    QuanLySanPhamService quanLySanPhamService;

    @Autowired
    LoaiSanPhamRepo loaiSanPhamRepo;

    @GetMapping("home")
    public String home(Model model){
        model.addAttribute("ghct", gioHangChiTietRepo.findAll());
        model.addAttribute("sanpham", quanLySanPhamService.getAll());
        model.addAttribute("loaisp", loaiSanPhamRepo.findAll());
    return "/autokid/index";
    }

    @GetMapping("/shop")
    public String showShop(){
        return "/autokid/shop-grid";
    }

    @GetMapping("/shop-detail")
    public String showShopDetail(){
        return "/autokid/shop-details";
    }

    @GetMapping("/shoping-cart")
    public String showShoppingCart(){
        return "/autokid/shoping-cart";
    }

    @GetMapping("/checkout")
    public String showCheckout(){
        return "/autokid/checkout";
    }

    @GetMapping("/contact")
    public String showContact(){
        return "/autokid/contact";
    }
}
