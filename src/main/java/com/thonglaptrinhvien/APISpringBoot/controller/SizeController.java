package com.thonglaptrinhvien.APISpringBoot.controller;

import java.util.List;

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

import com.thonglaptrinhvien.APISpringBoot.models.ResponseObject;
import com.thonglaptrinhvien.APISpringBoot.models.SizeModel;
import com.thonglaptrinhvien.APISpringBoot.service.ipml.SizeServiceImpl;

@RestController
@RequestMapping("/api/v1/sizes")
public class SizeController {

	@Autowired
	private SizeServiceImpl sizeServiceImpl;
	
	@GetMapping()
	List<SizeModel> getAll(){
		return sizeServiceImpl.findAll();
	}
	
	@GetMapping("/{id}")
	public ResponseEntity<ResponseObject> getById(@PathVariable int id){
		return sizeServiceImpl.getById(id);
	}
	
	@PostMapping("/insert")
	ResponseEntity<ResponseObject> insert(@RequestBody SizeModel sizeModel){
		return sizeServiceImpl.insert(sizeModel);
	}
	
	@PutMapping("/edit/{id}")
	public ResponseEntity<ResponseObject> editById(@PathVariable int id, @RequestBody SizeModel sizeModel){
		return sizeServiceImpl.editById(id, sizeModel);
	}
	
	@DeleteMapping("/delete/{id}")
	ResponseEntity<ResponseObject> delete(@PathVariable int id){
		return sizeServiceImpl.delete(id);
	}
}
