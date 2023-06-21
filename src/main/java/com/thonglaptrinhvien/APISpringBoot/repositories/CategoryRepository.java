package com.thonglaptrinhvien.APISpringBoot.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.thonglaptrinhvien.APISpringBoot.models.CategoryModel;

public interface CategoryRepository extends JpaRepository<CategoryModel, Integer>{
	List<CategoryModel> findByName(String name);
}
