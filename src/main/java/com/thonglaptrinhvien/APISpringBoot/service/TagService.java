package com.thonglaptrinhvien.APISpringBoot.service;

import java.util.Optional;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.thonglaptrinhvien.APISpringBoot.models.ResponseObject;
import com.thonglaptrinhvien.APISpringBoot.models.SizeModel;
import com.thonglaptrinhvien.APISpringBoot.models.TagModel;

@Service
public interface TagService {
	ResponseEntity<ResponseObject> findAll();
	Optional<TagModel> findById(int id);
	ResponseEntity<ResponseObject> getById(int id);
	ResponseEntity<ResponseObject> insert(TagModel tagModel);
	ResponseEntity<ResponseObject> editById(int id, TagModel tagModel);
	ResponseEntity<ResponseObject> deleteById(int id);
}
