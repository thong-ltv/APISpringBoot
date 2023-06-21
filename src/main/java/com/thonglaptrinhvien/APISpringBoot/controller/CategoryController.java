package com.thonglaptrinhvien.APISpringBoot.controller;

import java.io.BufferedReader;
import java.io.IOException;
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

import com.thonglaptrinhvien.APISpringBoot.models.CategoryModel;
import com.thonglaptrinhvien.APISpringBoot.models.ProductModel;
import com.thonglaptrinhvien.APISpringBoot.models.ResponseObject;
import com.thonglaptrinhvien.APISpringBoot.service.ipml.CategoryServiceImpl;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.websocket.server.PathParam;

@RestController
@RequestMapping("/api/v1/categories")
public class CategoryController {
	
	@Autowired
	private CategoryServiceImpl categoryServiceImpl;
	
	@GetMapping()
	List<CategoryModel> getAll() {
		return categoryServiceImpl.findAll();
	}
	
	@GetMapping("/{id}")
	ResponseEntity<ResponseObject> getById(@PathVariable int id){
		return categoryServiceImpl.getById(id);
	}
	
	@PostMapping("/insert")
	public ResponseEntity<ResponseObject> insert(HttpServletRequest request) throws IOException {
//		String json = request.getReader().lines().reduce("", (accumulator, actual) -> accumulator + actual);
		// Đọc dữ liệu từ request body
		BufferedReader reader = request.getReader();
		String jsonString = "";
		String line;
		while ((line = reader.readLine()) != null) {
		    jsonString += line;
		}
		return categoryServiceImpl.insert(jsonString);
	}
	
	@PutMapping("/edit/{id}")
	public ResponseEntity<ResponseObject> editById(@PathVariable int id, HttpServletRequest request) throws IOException{
		BufferedReader reader = request.getReader();
		String jsonString = "";
		String line;
		while((line = reader.readLine()) != null) {
			jsonString += line;
		}
		return categoryServiceImpl.editById(id, jsonString);
	}

	@DeleteMapping("/delete/{id}")
	public ResponseEntity<ResponseObject> deleteById(@PathVariable int id){
		return categoryServiceImpl.deleteById(id);
	}
}
