package com.thonglaptrinhvien.APISpringBoot.service;

import java.util.List;
import java.util.Optional;

import org.springframework.http.ResponseEntity;

import com.thonglaptrinhvien.APISpringBoot.models.ResponseObject;
import com.thonglaptrinhvien.APISpringBoot.models.SizeModel;

public interface SizeService {
	
	List<SizeModel> findAll();
	Optional<SizeModel> findById(int id);
	ResponseEntity<ResponseObject> getById(int id);
	ResponseEntity<ResponseObject> insert(SizeModel sizeModel);
	ResponseEntity<ResponseObject> editById(int id, SizeModel sizeModel);
	ResponseEntity<ResponseObject> delete(int id);
}
