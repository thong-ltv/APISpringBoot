package com.thonglaptrinhvien.APISpringBoot.service.ipml;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import java.lang.reflect.Field;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.thonglaptrinhvien.APISpringBoot.models.CategoryModel;
import com.thonglaptrinhvien.APISpringBoot.models.ProductModel;
import com.thonglaptrinhvien.APISpringBoot.models.ResponseObject;
import com.thonglaptrinhvien.APISpringBoot.repositories.CategoryRepository;
import com.thonglaptrinhvien.APISpringBoot.service.CategoryService;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	private CategoryRepository categoryRepository;
	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	public List<CategoryModel> findAll() {
		// TODO Auto-generated method stub
		return categoryRepository.findAll();
	}

	@Override
	public Optional<CategoryModel> findById(int id) {
		// TODO Auto-generated method stub
		return categoryRepository.findById(id);
	}

//	@Override
//	public ResponseEntity<ResponseObject> insert(CategoryModel categoryModel) {
//		// TODO Auto-generated method stub
//		//check name category
//		List<CategoryModel> countCheckCategorys = categoryRepository.findByName(categoryModel.getName().trim());
//		if(countCheckCategorys.size() > 0) {
//			return ResponseEntity.status(HttpStatus.FAILED_DEPENDENCY).body(
//					new ResponseObject("failed", "name category exits", "")
//					);
//		}
//		// Kiểm tra nếu thuộc tính products có @JsonIgnore
//        boolean hasJsonIgnore = hasJsonIgnoreAnnotation(CategoryModel.class, "products");
//        // Nếu có, xóa @JsonIgnore
//        if (hasJsonIgnore) {
////            removeJsonIgnoreAnnotation(myObject, "property2");
//        }
//        // Nếu không có, thêm @JsonIgnore
//        else {
//          addJsonIgnoreAnnotation(CategoryModel.class, "products");
//        }
//		return ResponseEntity.status(HttpStatus.OK).body(
//				new ResponseObject("OK", "success insert category", categoryRepository.save(categoryModel))
//				);
//	}
	
	private static boolean hasJsonIgnoreAnnotation(Object object, String fieldName) {
        try {
            Field field = object.getClass().getDeclaredField(fieldName);
            return field.isAnnotationPresent(JsonIgnore.class);
        } catch (NoSuchFieldException e) {
            e.printStackTrace();
            return false;
        }
    }

    private static void addJsonIgnoreAnnotation(Object object, String fieldName) {
        try {
            Field field = object.getClass().getDeclaredField(fieldName);
            field.setAccessible(true);
            JsonIgnore jsonIgnoreAnnotation = field.getAnnotation(JsonIgnore.class);
            if (jsonIgnoreAnnotation == null) {
                field.set(object, field.getAnnotation(JsonIgnore.class));
            }
        } catch (NoSuchFieldException | IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    private static void removeJsonIgnoreAnnotation(Object object, String fieldName) {
        try {
            Field field = object.getClass().getDeclaredField(fieldName);
            field.setAccessible(true);
            JsonIgnore jsonIgnoreAnnotation = field.getAnnotation(JsonIgnore.class);
            if (jsonIgnoreAnnotation != null) {
                field.set(object, null);
            }
        } catch (NoSuchFieldException | IllegalAccessException e) {
            e.printStackTrace();
        }
    }

	@Override
	public ResponseEntity<ResponseObject> insert(String jsonString) {
		// TODO Auto-generated method stub
		// Kiểm tra nếu thuộc tính products có @JsonIgnore
        boolean hasJsonIgnore = hasJsonIgnoreAnnotation(CategoryModel.class, "products");
        // Nếu có, xóa @JsonIgnore
        if (hasJsonIgnore) {
//            removeJsonIgnoreAnnotation(myObject, "property2");
        }
        // Nếu không có, thêm @JsonIgnore
        else {
          addJsonIgnoreAnnotation(CategoryModel.class, "products");
        }
     // Chuyển đổi chuỗi JSON thành đối tượng
        Gson gson = new Gson();
        CategoryModel categoryModel = gson.fromJson(jsonString, CategoryModel.class);
        return ResponseEntity.status(HttpStatus.OK).body(
				new ResponseObject("OK", "success insert category", categoryRepository.save(categoryModel))
				);
	}

	@Override
	@Transactional
	public ResponseEntity<ResponseObject> editById(int id, String jsonString) {
		// TODO Auto-generated method stub
		CategoryModel category = entityManager.find(CategoryModel.class, id);
		if(category != null) {
			boolean hasJsonIgnore = hasJsonIgnoreAnnotation(CategoryModel.class, "products");
			if(hasJsonIgnore) {
				
			}else {
				addJsonIgnoreAnnotation(CategoryModel.class, "products");
			}
			Gson gson = new Gson();
			CategoryModel categoryModel = gson.fromJson(jsonString, CategoryModel.class);
			category.setName(categoryModel.getName());
			category.setParentId(categoryModel.getParentId());
			category.setSlug(categoryModel.getSlug());
			entityManager.merge(category);
		}
		return ResponseEntity.status(HttpStatus.OK).body(
				new ResponseObject("OK", "success edit category", category)
				);
	}

	@Override
	public ResponseEntity<ResponseObject> deleteById(int id) {
		// TODO Auto-generated method stub
		Optional<CategoryModel> categoryModel = categoryRepository.findById(id);
		if(!categoryModel.isPresent()) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body(
					new ResponseObject("failed", "id category not found", "")
					);
		}
		categoryRepository.deleteById(id);
		return ResponseEntity.status(HttpStatus.OK).body(
				new ResponseObject("OK", "success delete category by id", "")
				);
	}

	@Override
	public ResponseEntity<ResponseObject> getById(int id) {
		// TODO Auto-generated method stub
		if(!categoryRepository.findById(id).isPresent()) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body(
					new ResponseObject("failed", "id category not found", "")
					);
		}
		return ResponseEntity.status(HttpStatus.OK).body(
				new ResponseObject("OK", "success find category by id", categoryRepository.findById(id).get())
				);
	}
}
