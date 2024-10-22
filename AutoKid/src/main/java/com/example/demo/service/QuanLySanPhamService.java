package com.example.demo.service;

import com.example.demo.model.SanPhamChiTiet;
import com.example.demo.repository.SanPhamChiTietRepo;
import com.example.demo.response.SanPhamChiTietResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class QuanLySanPhamService {
    @Autowired
    SanPhamChiTietRepo spctRepo;

    public List<SanPhamChiTietResponse> getAll(){
        List<SanPhamChiTietResponse> list = new ArrayList<>();
        for(SanPhamChiTiet spct: spctRepo.findAll()){
            list.add(new SanPhamChiTietResponse(spct));
        }
        return list;
    }

    public SanPhamChiTietResponse getById(Integer idSPCT){
        SanPhamChiTietResponse spct = null;
        for(SanPhamChiTiet s: spctRepo.findAll()){
            if(s.getId().equals(idSPCT)){
                spct = new SanPhamChiTietResponse(s);
                break;
            }
        }
        System.out.println(spct.getMaSPCT());
        return spct;
    }

    public List<SanPhamChiTietResponse> getAllRelatedProduct(Integer idSPCT){
        SanPhamChiTiet spct = null;
        for(SanPhamChiTiet s: spctRepo.findAll()){
            if(s.getId().equals(idSPCT)){
                spct = s;
                break;
            }
        }
        Integer idSP = spct.getSanPham().getId();
        List<SanPhamChiTietResponse> list = new ArrayList<>();
        for (SanPhamChiTiet s: spctRepo.findAll()){
            if(s.getSanPham().getId() == idSP){
                list.add(new SanPhamChiTietResponse(s));
            }
        }
        return list;
    }
}
