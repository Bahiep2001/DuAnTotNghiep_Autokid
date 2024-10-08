package com.example.demo.model;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Date;

@Entity
@Data
@Table(name = "nhan_vien")
public class NhanVien {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_nv")
    private Integer id;

    @Column(name = "ma_nv")
    private String ma_nV;

    @Column(name = "ten_nv")
    private String ten_nV;

    @Column(name = "gioi_tinh")
    private String gioi_tinh;

    @Column(name = "ngay_sinh")
    private Date ngay_sinh;

    @Column(name = "ngay_lam_viec")
    private Date ngay_lam_viec;

    @Column(name = "mat_khau")
    private String mat_khau;

    @Column(name = "sdt")
    private String sdt;

    @Column(name = "email")
    private String email;

    @Column(name = "dia_chi")
    private String diachi;

    @Column(name = "trang_thai_nv")
    private String trang_thai;

    @ManyToOne
    @JoinColumn(name = "id_chuc_vu")
    ChucVu chucVu;

}