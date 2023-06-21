package com.thonglaptrinhvien.APISpringBoot.controller;

import java.util.List;
import java.util.Optional;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.thonglaptrinhvien.APISpringBoot.models.ProductModel;
import com.thonglaptrinhvien.APISpringBoot.models.ResponseObject;
import com.thonglaptrinhvien.APISpringBoot.repositories.ProductRepository;
import com.thonglaptrinhvien.APISpringBoot.requestDto.ProductRequestDto;
import com.thonglaptrinhvien.APISpringBoot.service.ProductService;

@RestController
@RequestMapping("/api/v1/products")
public class ProductController {

	@Autowired
	private ProductService productService;
	
	@GetMapping("")
	List<ProductModel> getAllProducts(){
		return productService.getAll();
	}
	
	@GetMapping("/{id}")
	ResponseEntity<ResponseObject> getById(@PathVariable int id){
		return productService.getById(id);
	}
	
	@PostMapping("/insert")
	ResponseEntity<ResponseObject> insert(@RequestBody ProductRequestDto productRequestDto){
		return productService.insert(productRequestDto);
	}
	
	@PutMapping("/edit/{id}")
	public ResponseEntity<ResponseObject> editById(@PathVariable int id, @RequestBody ProductRequestDto productRequestDto){
		return productService.editById(id, productRequestDto);
	}
	
	@DeleteMapping("/delete/{id}")
	public ResponseEntity<ResponseObject> deleteById(@PathVariable int id){
		return productService.deleteById(id);
	}
//	//get detail product by id
//	@GetMapping("/{id}")
//	ResponseEntity<ResponseObject> findById(@PathVariable Long id) {
//		Optional<ProductModel> foundProduct = productRepository.findById(id);
//		if(foundProduct.isPresent()) {
//			return ResponseEntity.status(HttpStatus.OK).body(
//						new ResponseObject("Ok", "Success query!!!", foundProduct)
//					);
//		}else {
//			return ResponseEntity.status(HttpStatus.NOT_FOUND).body(
//						new ResponseObject("failed", "Cannot product with id: " + id, "")
//					);
//		}
////		return productRepository.findById(id).orElseThrow(()->new RuntimeException("Cannot find product with id: " + id));
//	}
	
//	//insert data
//	@PostMapping("/insert")
//	ResponseEntity<ResponseObject> insert(@RequestBody ProductModel productModel){
//		List<ProductModel> foundProducts = productRepository.findByNameProduct(productModel.getNameProduct().trim());
//		if(foundProducts.size() > 0) {
//			return ResponseEntity.status(HttpStatus.NOT_IMPLEMENTED).body(
//					new ResponseObject("failed", "Product name already taken", "")
//					);
//		}
//		return ResponseEntity.status(HttpStatus.OK).body(
//				new ResponseObject("OK", "success insert data!!!", productRepository.save(productModel))
//				);
//	}
//	
//	//insert lots of data
//	@PostMapping("/insertAll")
//	ResponseEntity<ResponseObject> insertAll(@RequestBody ProductModel[] productModels){
//		//create thread 
//		ExecutorService executor = Executors.newFixedThreadPool(30);
//		
//		for (ProductModel productModel : productModels) {
//			List<ProductModel> foundProducts = productRepository.findByNameProduct(productModel.getNameProduct().trim());
//			if(foundProducts.size() > 0) {
//				return ResponseEntity.status(HttpStatus.NOT_IMPLEMENTED).body(
//						new ResponseObject("failed", "Product name already taken", "")
//						);
//			}
//		}
//		for (ProductModel productModel : productModels) {
//			synchronized (this) {executor.submit(()->{
//				productRepository.save(productModel);
//			});
//			
//		}}
//		executor.shutdown();
//		try {
//			executor.awaitTermination(Long.MAX_VALUE, TimeUnit.NANOSECONDS);
//		} catch (InterruptedException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return ResponseEntity.status(HttpStatus.OK).body(
//				new ResponseObject("OK", "success insert data!!!", "")
//				);
//	}
//	
//	//update data
//	@PutMapping("update/{id}")
//	ResponseEntity<ResponseObject> update(@PathVariable Long id, @RequestBody ProductModel productModel){
//		//check id in data
//		Optional<ProductModel> foundProductId = productRepository.findById(id);
//		if(foundProductId.isPresent()) {
//			ProductModel productId = foundProductId.get();
//			if(productRepository.findByNameProduct(productModel.getNameProduct().trim()).size() > 0) {
//				return ResponseEntity.status(HttpStatus.OK).body(
//						new ResponseObject("failed", "Product name already taken", "")
//						);
//			}
//			productId.setNameProduct(productModel.getNameProduct());
//			productId.setPrice(productModel.getPrice());
//			productId.setYear(productModel.getYear());
//			productId.setUrl(productModel.getUrl());
////			productId.setCategory_id(productId.getCategory_id());
//			return ResponseEntity.status(HttpStatus.OK).body(
//					new ResponseObject("OK", "Update success!!!", productRepository.save(productId))
//					);
//		}
//		return ResponseEntity.status(HttpStatus.OK).body(
//				new ResponseObject("failed", "No id in database", "")
//				);
//	}
//	
//	//delete product
//	@DeleteMapping("/delete/{id}")
//	ResponseEntity<ResponseObject> delete(@PathVariable Long id){
//		Optional<ProductModel> foundProduct = productRepository.findById(id);
//		if(foundProduct.isPresent()) {
//			productRepository.deleteById(id);
//			return ResponseEntity.status(HttpStatus.OK).body(
//					new ResponseObject("OK", "Delete successfully!!!", foundProduct)
//					);
//		}
//		return ResponseEntity.status(HttpStatus.NOT_FOUND).body(
//				new ResponseObject("failed", "No id in database", "")
//				);
//	}
}
