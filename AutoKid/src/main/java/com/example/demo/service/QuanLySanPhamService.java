package com.example.demo.service;

import com.example.demo.model.*;
import com.example.demo.repository.*;
import com.example.demo.response.SanPhamChiTietResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class QuanLySanPhamService {
    @Autowired
    SanPhamChiTietRepo repoSPCT;

    @Autowired
    SanPhamRepo sanPhamRepo;

    @Autowired
    SanPhamChiTietRepo sanPhamChiTietRepo;

    @Autowired
    ThuongHieuRepo thuongHieuRepo;

    @Autowired
    MauSacRepo mauSacRepo;

    @Autowired
    KichCoRepo kichCoRepo;

    @Autowired
    ChatLieuRepo chatLieuRepo;

    public List<SanPhamChiTietResponse> getAll(){
        List<SanPhamChiTietResponse> list = new ArrayList<>();
        for(SanPhamChiTiet spct: repoSPCT.findAll()){
            list.add(new SanPhamChiTietResponse(spct));
        }
        return list;
    }

    public List<SanPhamChiTiet> getAllSanPhamChiTiets() {
        return sanPhamChiTietRepo.findAll();
    }

    public List<ThuongHieu> getAllThuongHieu(){
        return thuongHieuRepo.findAll();
    }

    public void AddThuongHieu(ThuongHieu thuongHieu){
        thuongHieuRepo.save(thuongHieu);
    }


    public void DeleteThuongHieu(Integer id){
        thuongHieuRepo.deleteById(id);
    }

    public void DetailThuongHieu(Integer id){
        thuongHieuRepo.findById(id);
    }

    public List<MauSac> getAllMauSac(){
        return mauSacRepo.findAll();
    }

    public void addMauSac(MauSac mauSac){
        mauSacRepo.save(mauSac);
    }

    public void deleteMauSac(Integer id){
        mauSacRepo.deleteById(id);
    }

    public void detailMauSac(Integer id){
        mauSacRepo.findById(id);
    }

    public List<KichCo> getAllKichCo(){
        return kichCoRepo.findAll();
    }

    public void addKichCo(KichCo kichCo){
        kichCoRepo.save(kichCo);
    }

    public void deleteKichCo(Integer id){
        kichCoRepo.deleteById(id);
    }

    public List<ChatLieu> getAllChatLieu(){
        return chatLieuRepo.findAll();
    }

    public void addChatLieu(ChatLieu chatLieu){
        chatLieuRepo.save(chatLieu);
    }

    public void deleteChatLieu(Integer id){
        chatLieuRepo.deleteById(id);
    }



}
