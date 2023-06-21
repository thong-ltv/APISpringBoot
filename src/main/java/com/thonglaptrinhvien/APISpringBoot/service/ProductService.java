package com.thonglaptrinhvien.APISpringBoot.service;

import java.util.List;

import org.springframework.http.ResponseEntity;

import com.thonglaptrinhvien.APISpringBoot.models.ProductModel;
import com.thonglaptrinhvien.APISpringBoot.models.ResponseObject;
import com.thonglaptrinhvien.APISpringBoot.requestDto.ProductRequestDto;

public interface ProductService {
	List<ProductModel> getAll();
	ResponseEntity<ResponseObject> getById(int id);
	ResponseEntity<ResponseObject> insert(ProductRequestDto productRequestDto);
	ResponseEntity<ResponseObject> editById(int id, ProductRequestDto productRequestDto);
	ResponseEntity<ResponseObject> deleteById(int id);
}
