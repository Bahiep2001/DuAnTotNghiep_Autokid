package com.example.demo.TEST;

import jakarta.persistence.*;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Entity(name = "NhanVienTEST")
@Table(name = "NhanVien")
@Getter
@Setter
public class NhanVien {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idnv")
    private Integer id;

    @Column(name = "manv")
    private String maNV;

    @Column(name = "tennv")
    private String tenNV;
}
