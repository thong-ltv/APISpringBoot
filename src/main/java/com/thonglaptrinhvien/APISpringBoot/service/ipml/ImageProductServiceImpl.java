package com.thonglaptrinhvien.APISpringBoot.service.ipml;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.thonglaptrinhvien.APISpringBoot.models.ImageProductModel;
import com.thonglaptrinhvien.APISpringBoot.models.ProductModel;
import com.thonglaptrinhvien.APISpringBoot.models.ResponseObject;
import com.thonglaptrinhvien.APISpringBoot.repositories.ImageProductRepository;
import com.thonglaptrinhvien.APISpringBoot.repositories.ProductRepository;
import com.thonglaptrinhvien.APISpringBoot.requestDto.ImageProductDto;
import com.thonglaptrinhvien.APISpringBoot.service.ImageProductService;

@Service
public class ImageProductServiceImpl implements ImageProductService{
	
	@Autowired
	private ImageProductRepository imageProductRepository;
	@Autowired
	private ProductRepository productRepository;

	@Override
	public ResponseEntity<ResponseObject> findAll() {
		// TODO Auto-generated method stub
		return ResponseEntity.status(HttpStatus.OK).body(
				new ResponseObject("OK", "succes find all", imageProductRepository.findAll())
				);
	}

	@Override
	public ResponseEntity<ResponseObject> findById(int id) {
		// TODO Auto-generated method stub
		Optional<ImageProductModel> imageModel = imageProductRepository.findById(id);
		if(!imageModel.isPresent()) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body(
					new ResponseObject("Failed", "id image not found", "")
					);
		}
		return ResponseEntity.status(HttpStatus.OK).body(
				new ResponseObject("OK", "succes find image by id", imageModel.get())
				);
	}

	@Override
	public Optional<ImageProductModel> getById(int id) {
		// TODO Auto-generated method stub
		return imageProductRepository.findById(id);
	}

	@Override
	public ResponseEntity<ResponseObject> insert(ImageProductDto imageProductDto) {
		// TODO Auto-generated method stub
		//check name image exits -- hàm trim() là loại bỏ khoảng trắng ở đầu và cuối chuỗi
		List<ImageProductModel> countImages = imageProductRepository.findByImageName(imageProductDto.getImageName().trim());
		if(countImages.size() > 0) {
			return ResponseEntity.status(HttpStatus.FAILED_DEPENDENCY).body(
					new ResponseObject("failed", "name image exits", "")
					);
		}
		ImageProductModel imageProductModel = new ImageProductModel();
		imageProductModel.setImageName(imageProductDto.getImageName());
		imageProductModel.setImagePath(imageProductDto.getImagePath());
		Optional<ProductModel> productModel = productRepository.findById((long)imageProductDto.getProductId());
		if(!productModel.isPresent()) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body(
					new ResponseObject("Failed", "product id not found", "")
					);
		}
		imageProductModel.setProduct(productModel.get());
		return ResponseEntity.status(HttpStatus.OK).body(
				new ResponseObject("OK", "success insert data", imageProductRepository.save(imageProductModel))
				);
	}

	@Override
	public ResponseEntity<ResponseObject> deleteById(int id) {
		// TODO Auto-generated method stub
		//check id imgage
		Optional<ImageProductModel> imageProduct = imageProductRepository.findById(id);
		if(!imageProduct.isPresent()) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body(
					new ResponseObject("failed", "id image not found", "")
					);
		}
		imageProductRepository.deleteById(id);
		return ResponseEntity.status(HttpStatus.OK).body(
				new ResponseObject("OK", "success delete data by id", imageProduct)
				);
	}

	@Override
	public ResponseEntity<ResponseObject> editById(int id, ImageProductDto imageProductDto) {
		// TODO Auto-generated method stub
		
		ImageProductModel imageProductModel = imageProductRepository.findById(id).get();
		imageProductModel.setImageName(imageProductDto.getImageName());
		imageProductModel.setImagePath(imageProductDto.getImagePath());
		Optional<ProductModel> productModel = productRepository.findById((long)imageProductDto.getProductId());
		imageProductModel.setProduct(productModel.get());
		return ResponseEntity.status(HttpStatus.OK).body(
				new ResponseObject("OK", "edit success by id", imageProductRepository.save(imageProductModel))
				);
	}

}
