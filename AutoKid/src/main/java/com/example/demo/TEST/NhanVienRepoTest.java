package com.example.demo.TEST;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NhanVienRepoTest extends JpaRepository<NhanVien, Integer> {
//    @Query("SELECT n.id, n.maNV, n.tenNV FROM nhanvien n")
//    List<NhanVien> findAllNhanVien();
}
