package com.thonglaptrinhvien.APISpringBoot.service.ipml;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.thonglaptrinhvien.APISpringBoot.models.CategoryModel;
import com.thonglaptrinhvien.APISpringBoot.models.ColorModel;
import com.thonglaptrinhvien.APISpringBoot.models.ProductModel;
import com.thonglaptrinhvien.APISpringBoot.models.ResponseObject;
import com.thonglaptrinhvien.APISpringBoot.models.SizeModel;
import com.thonglaptrinhvien.APISpringBoot.models.TagModel;
import com.thonglaptrinhvien.APISpringBoot.repositories.ProductRepository;
import com.thonglaptrinhvien.APISpringBoot.requestDto.ProductRequestDto;
import com.thonglaptrinhvien.APISpringBoot.service.ProductService;

@Service
public class ProductServiceIpml implements ProductService{

	@Autowired
	private ProductRepository productRepository;
	@Autowired
	private CategoryServiceImpl categoryServiceImpl;
	@Autowired
	private SizeServiceImpl sizeServiceImpl;
	@Autowired
	private ColorServiceImpl colorServiceImpl;
	@Autowired
	private TagServiceImpl tagServiceImpl;
	
	@Override
	public List<ProductModel> getAll() {
		// TODO Auto-generated method stub
		return productRepository.findAll();
	}

	@Override
	public ResponseEntity<ResponseObject> getById(int id) {
		// TODO Auto-generated method stub
		//check id exits?
		boolean idCheck = productRepository.existsById((long)id);
		if(idCheck) {
			return ResponseEntity.status(HttpStatus.OK).body(
					new ResponseObject("OK", "success to find product!!!", productRepository.findById((long)id))
					);
		}else {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body(
					new ResponseObject("failed", "no product founded", "")
					);
		}
		
	}

	@Override
	public ResponseEntity<ResponseObject> insert(ProductRequestDto productRequestDto) {
		// TODO Auto-generated method stub
		//check name of product to insert
		List<ProductModel> countCheckNameProducts = productRepository.findByName(productRequestDto.getName());
		if(countCheckNameProducts.size() > 0) {
			return ResponseEntity.status(HttpStatus.FAILED_DEPENDENCY).body(
					new ResponseObject("failed", "product already exits!!!", "")
					);
		}else {
			int categoryId = productRequestDto.getCategoryId();
			int[] sizeIds = productRequestDto.getSizeIds();
			int[] colorIds = productRequestDto.getColorIds();
			int[] tagIds = productRequestDto.getTagIds();
			Optional<CategoryModel> categoryModel = categoryServiceImpl.findById(categoryId);
			boolean checkSizeModel = true;
			for (int sizeId : sizeIds) {
				Optional<SizeModel> sizeModel = sizeServiceImpl.findById(sizeId);
				if(!sizeModel.isPresent()) {
					checkSizeModel = false;
				}
			}
			boolean checkColorModel = true;
			for (int colorId : colorIds) {
				Optional<ColorModel> colorModel = colorServiceImpl.findById(colorId);
				if(!colorModel.isPresent()) {
					checkColorModel = false;
				}
			}
			boolean checkTagModel = true;
			for (int tagId : tagIds) {
				Optional<TagModel> tagModel = tagServiceImpl.findById(tagId);
				if(!tagModel.isPresent()) {
					checkTagModel = false;
				}
			}
			if(!categoryModel.isPresent() || !checkSizeModel || !checkColorModel || !checkTagModel) {
				return ResponseEntity.status(HttpStatus.FAILED_DEPENDENCY).body(
						new ResponseObject("Failed", "data not valid", "")
						);
			}
			ProductModel productModel = new ProductModel();
			productModel.setName(productRequestDto.getName());
			productModel.setPrice(productRequestDto.getPrice());
			productModel.setFeatureImagePath(productRequestDto.getFeatureImagePath());
			productModel.setContent(productRequestDto.getContent());
			productModel.setFeatureImageName(productRequestDto.getFeatureImageName());
			productModel.setCategoryModel(categoryModel.get());
			for (int sizeId : sizeIds) {
				productModel.setSizes(sizeServiceImpl.findById(sizeId).get());
			}
			for (int colorId : colorIds) {
				productModel.setColors(colorServiceImpl.findById(colorId).get());
			}
			for (int tagId : tagIds) {
				productModel.setTags(tagServiceImpl.findById(tagId).get());
			}
			return ResponseEntity.status(HttpStatus.OK).body(
					new ResponseObject("Ok", "success insert prouduct", productRepository.save(productModel))
					);
		}
	
	}

	@Override
	public ResponseEntity<ResponseObject> editById(int id, ProductRequestDto productRequestDto) {
		// TODO Auto-generated method stub
		ProductModel productModel = productRepository.findById((long)id).get();
		int categoryId = productRequestDto.getCategoryId();
		int[] sizeIds = productRequestDto.getSizeIds();
		int[] colorIds = productRequestDto.getColorIds();
		int[] tagIds = productRequestDto.getTagIds();
		Optional<CategoryModel> categoryModel = categoryServiceImpl.findById(categoryId);
		
		productModel.setName(productRequestDto.getName());
		productModel.setPrice(productRequestDto.getPrice());
		productModel.setFeatureImagePath(productRequestDto.getFeatureImagePath());
		productModel.setContent(productRequestDto.getContent());
		productModel.setFeatureImageName(productRequestDto.getFeatureImageName());
		productModel.setCategoryModel(categoryModel.get());
		productModel.removeAllColor();
		productModel.removeAllSize();
		productModel.removeAllTag();
		for (int sizeId : sizeIds) {
			productModel.setSizes(sizeServiceImpl.findById(sizeId).get());
		}
		for (int colorId : colorIds) {
			productModel.setColors(colorServiceImpl.findById(colorId).get());
		}
		for (int tagId : tagIds) {
			productModel.setTags(tagServiceImpl.findById(tagId).get());
		}
		return ResponseEntity.status(HttpStatus.OK).body(
				new ResponseObject("Ok", "success edit prouduct by id", productRepository.save(productModel))
				);
	}

	@Override
	public ResponseEntity<ResponseObject> deleteById(int id) {
		// TODO Auto-generated method stub
		//check id product
		Optional<ProductModel> productModel = productRepository.findById((long)id);
		if(!productModel.isPresent()) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body(
					new ResponseObject("Failed", "id product not found", "")
					);
		}
		productRepository.deleteById((long)id);
		return ResponseEntity.status(HttpStatus.OK).body(
				new ResponseObject("Ok", "success delete prouduct by id", productModel.get())
				);
	}

}
