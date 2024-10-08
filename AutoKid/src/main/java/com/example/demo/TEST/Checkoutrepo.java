package com.example.demo.TEST;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface Checkoutrepo extends JpaRepository<NhanVien,Integer> {
}
