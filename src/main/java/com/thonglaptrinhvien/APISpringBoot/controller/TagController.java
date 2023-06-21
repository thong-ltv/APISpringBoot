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

import com.thonglaptrinhvien.APISpringBoot.models.ResponseObject;
import com.thonglaptrinhvien.APISpringBoot.models.TagModel;
import com.thonglaptrinhvien.APISpringBoot.service.TagService;

@RestController
@RequestMapping("/api/v1/tags")
public class TagController {
	
	@Autowired
	private TagService tagService;
	
	@GetMapping
	public ResponseEntity<ResponseObject> findAll(){
		return tagService.findAll();
	}
	
	@GetMapping("/{id}")
	public ResponseEntity<ResponseObject> getById(@PathVariable int id){
		return tagService.getById(id);
	}
	
	@PostMapping("/insert")
	public ResponseEntity<ResponseObject> insert(@RequestBody TagModel tagModel){
		return tagService.insert(tagModel);
	}
	
	@PutMapping("/edit/{id}")
	public ResponseEntity<ResponseObject> editById(@PathVariable int id, @RequestBody TagModel tagModel){
		return tagService.editById(id, tagModel);
	}
	
	@DeleteMapping("/delete/{id}")
	public ResponseEntity<ResponseObject> deleteById(@PathVariable int id){
		return tagService.deleteById(id);
	}
}
