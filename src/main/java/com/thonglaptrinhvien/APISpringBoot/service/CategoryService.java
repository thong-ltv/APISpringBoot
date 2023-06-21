package com.thonglaptrinhvien.APISpringBoot.service;

import java.util.List;
import java.util.Optional;

import org.springframework.http.ResponseEntity;

import com.thonglaptrinhvien.APISpringBoot.models.CategoryModel;
import com.thonglaptrinhvien.APISpringBoot.models.ResponseObject;

public interface CategoryService {
	List<CategoryModel> findAll();
	Optional<CategoryModel> findById(int id);
	ResponseEntity<ResponseObject> getById(int id);
	ResponseEntity<ResponseObject> insert(String jsonString);
	ResponseEntity<ResponseObject> editById(int id, String jsonString);
	ResponseEntity<ResponseObject> deleteById(int id);
}
