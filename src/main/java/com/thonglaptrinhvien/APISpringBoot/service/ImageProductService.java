package com.thonglaptrinhvien.APISpringBoot.service;

import java.util.Optional;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.thonglaptrinhvien.APISpringBoot.models.ImageProductModel;
import com.thonglaptrinhvien.APISpringBoot.models.ResponseObject;
import com.thonglaptrinhvien.APISpringBoot.requestDto.ImageProductDto;

@Service
public interface ImageProductService {
	ResponseEntity<ResponseObject> findAll();
	ResponseEntity<ResponseObject> findById(int id);
	Optional<ImageProductModel> getById(int id);
	ResponseEntity<ResponseObject> insert(ImageProductDto imageProductDto);
	ResponseEntity<ResponseObject> editById(int id, ImageProductDto imageProductDto);
	ResponseEntity<ResponseObject> deleteById(int id);
}
