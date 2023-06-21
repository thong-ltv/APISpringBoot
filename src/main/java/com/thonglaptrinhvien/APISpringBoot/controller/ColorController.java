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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.thonglaptrinhvien.APISpringBoot.models.ColorModel;
import com.thonglaptrinhvien.APISpringBoot.models.ResponseObject;
import com.thonglaptrinhvien.APISpringBoot.service.ColorService;

@RestController
@RequestMapping("/api/v1/colors")
public class ColorController {

	@Autowired
	private ColorService colorService;
	
	@GetMapping
	List<ColorModel> getAll(){
		return colorService.getAll();
	}
	
	@GetMapping("/{id}")
	public ResponseEntity<ResponseObject> getById(@PathVariable int id){
		return colorService.getById(id);
	}
	
	@PostMapping("/insert")
	ResponseEntity<ResponseObject> insert(@RequestBody ColorModel colorModel){
		return colorService.insert(colorModel);
	}
	
	@PutMapping("/edit/{id}")
	public ResponseEntity<ResponseObject> editById(@PathVariable int id, @RequestBody ColorModel colorModel){
		return colorService.editById(id, colorModel);
	}
	
	@DeleteMapping("/delete/{id}")
	ResponseEntity<ResponseObject> delete(@PathVariable int id){
		return colorService.delete(id);
	}
}
