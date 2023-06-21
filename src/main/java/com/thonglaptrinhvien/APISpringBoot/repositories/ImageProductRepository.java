package com.thonglaptrinhvien.APISpringBoot.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.thonglaptrinhvien.APISpringBoot.models.ImageProductModel;

@Repository
public interface ImageProductRepository extends JpaRepository<ImageProductModel, Integer>{
	List<ImageProductModel> findByImageName(String imageName);
}
