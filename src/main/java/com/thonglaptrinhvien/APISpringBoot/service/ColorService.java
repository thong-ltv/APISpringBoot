package com.thonglaptrinhvien.APISpringBoot.service;

import java.util.List;
import java.util.Optional;

import org.springframework.http.ResponseEntity;

import com.thonglaptrinhvien.APISpringBoot.models.ColorModel;
import com.thonglaptrinhvien.APISpringBoot.models.ResponseObject;
import com.thonglaptrinhvien.APISpringBoot.models.SizeModel;

public interface ColorService {
	List<ColorModel> getAll();
	Optional<ColorModel> findById(int id);
	ResponseEntity<ResponseObject> getById(int id);
	ResponseEntity<ResponseObject> insert(ColorModel colorModel);
	ResponseEntity<ResponseObject> editById(int id, ColorModel colorModel);
	ResponseEntity<ResponseObject> delete(int id);
}
