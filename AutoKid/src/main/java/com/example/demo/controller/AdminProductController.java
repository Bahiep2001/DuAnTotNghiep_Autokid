package com.example.demo.controller;

import com.example.demo.model.KichCo;
import com.example.demo.model.MauSac;
import com.example.demo.model.SanPhamChiTiet;
import com.example.demo.model.ThuongHieu;
import com.example.demo.service.QuanLySanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminProductController {

    @Autowired
    QuanLySanPhamService service;

    @GetMapping("/home")
    public String home(){
        return "admin/index";
    }

    @GetMapping("/products")
    public String products(Model model) {
        List<SanPhamChiTiet> sanPhamChiTiets = service.getAllSanPhamChiTiets();
        model.addAttribute("spcts", sanPhamChiTiets);
        return "admin/products";
    }

    @GetMapping("/statistical")
    public String statistical() {
        return "admin/statistical";
    }

    @GetMapping("/thuong-hieu")
    public String thuongHieu(Model model){
        List<ThuongHieu> list = service.getAllThuongHieu();
        model.addAttribute("ths", list);
        return "admin/thuong-hieu";
    }

    @GetMapping("/mau-sac")
    public String mauSac(Model model){
        List<MauSac> list = service.getAllMauSac();
        model.addAttribute("ms", list);
        return "admin/mau-sac";
    }

    @GetMapping("/kich-co")
    public String kichCo(Model model){
        List<KichCo> list = service.getAllKichCo();
        model.addAttribute("kichco", list);
        return "admin/kich-co";
    }

    @PostMapping("/add/thuong-hieu")
    public String addThuongHieu(@ModelAttribute ThuongHieu thuongHieu){
        service.AddThuongHieu(thuongHieu);
        return "redirect:/admin/thuong-hieu";
    }

    @GetMapping("/thuong-hieu/delete")
    public String deleteThuongHieu(@RequestParam("id") Integer id){
        service.DeleteThuongHieu(id);
        return "redirect:/admin/thuong-hieu";
    }

    @GetMapping("/thuong-hieu/detail")
    public String detailThuongHieu(@RequestParam("id") Integer id){
        service.DetailThuongHieu(id);
        return "admin/thuong-hieu";
    }

}

