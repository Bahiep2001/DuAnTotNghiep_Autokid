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
    SanPhamChiTietRepo repoSPCT;

    public List<SanPhamChiTietResponse> getAll(){
        List<SanPhamChiTietResponse> list = new ArrayList<>();
        for(SanPhamChiTiet spct: repoSPCT.findAll()){
            list.add(new SanPhamChiTietResponse(spct));
        }
        return list;
    }
}
