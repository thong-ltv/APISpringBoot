package com.thonglaptrinhvien.APISpringBoot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.thonglaptrinhvien.APISpringBoot.models.ImageProductModel;
import com.thonglaptrinhvien.APISpringBoot.models.ResponseObject;
import com.thonglaptrinhvien.APISpringBoot.requestDto.ImageProductDto;
import com.thonglaptrinhvien.APISpringBoot.service.ImageProductService;

@RestController
@RequestMapping("/api/v1/images")
public class ImageProductController {

	@Autowired
	private ImageProductService imageProductService;
	
	@GetMapping
	public ResponseEntity<ResponseObject> findAll(){
		return imageProductService.findAll();
	}
	
	@GetMapping("/{id}")
	public ResponseEntity<ResponseObject> findById(@PathVariable int id){
		return imageProductService.findById(id);
	}
	
	@PostMapping("/insert")
	public ResponseEntity<ResponseObject> insert(@RequestBody ImageProductDto imageProductDto){
		return imageProductService.insert(imageProductDto);
	}
	
	@PutMapping("/edit/{id}")
	public ResponseEntity<ResponseObject> editById(@PathVariable int id, @RequestBody ImageProductDto imageProductDto){
		return imageProductService.editById(id, imageProductDto);
	}
	
	@DeleteMapping("/delete/{id}")
	public ResponseEntity<ResponseObject> deleteById(@PathVariable int id){
		return imageProductService.deleteById(id);
	}
}
