package com.thonglaptrinhvien.APISpringBoot.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.thonglaptrinhvien.APISpringBoot.models.SizeModel;

@Repository
public interface SizeRepository extends JpaRepository<SizeModel, Integer>{
	List<SizeModel> findByName(String name);
}
