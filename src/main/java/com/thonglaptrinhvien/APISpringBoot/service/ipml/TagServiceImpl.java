package com.thonglaptrinhvien.APISpringBoot.service.ipml;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.thonglaptrinhvien.APISpringBoot.models.ColorModel;
import com.thonglaptrinhvien.APISpringBoot.models.ResponseObject;
import com.thonglaptrinhvien.APISpringBoot.models.TagModel;
import com.thonglaptrinhvien.APISpringBoot.repositories.TagRepository;
import com.thonglaptrinhvien.APISpringBoot.service.TagService;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class TagServiceImpl implements TagService{

	@Autowired
	private TagRepository tagRepository;
	
	@Override
	public ResponseEntity<ResponseObject> findAll() {
		// TODO Auto-generated method stub
		return ResponseEntity.status(HttpStatus.OK).body(
				new ResponseObject("OK", "success find", tagRepository.findAll())
				);
	}

	@Override
	public Optional<TagModel> findById(int id) {
		// TODO Auto-generated method stub
		return tagRepository.findById(id);
	}

	@Override
	public ResponseEntity<ResponseObject> insert(TagModel tagModel) {
		// TODO Auto-generated method stub
		//check tag exits
		List<TagModel> foundTags = tagRepository.findByName(tagModel.getName().trim());
		if(foundTags.size() > 0) {
			return ResponseEntity.status(HttpStatus.NOT_IMPLEMENTED).body(
					new ResponseObject("failed", "Tag name already taken", "")
					);
		};
		TagModel tag = new TagModel();
		tag.setName(tagModel.getName());
		return ResponseEntity.status(HttpStatus.OK).body(
				new ResponseObject("OK", "success insert data!!!", tagRepository.save(tag))
				);
	}

	@Override
	public ResponseEntity<ResponseObject> deleteById(int id) {
		// TODO Auto-generated method stub
		//check id tag
		Optional<TagModel> checkIdTag = tagRepository.findById(id);
		if(!checkIdTag.isPresent()) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body(
					new ResponseObject("Failed", "Id tag not found", "")
					);
		}
		tagRepository.deleteById(id);
		return ResponseEntity.status(HttpStatus.OK).body(
				new ResponseObject("OK", "success delete", checkIdTag)
				);
	}

	@Override
	public ResponseEntity<ResponseObject> getById(int id) {
		// TODO Auto-generated method stub
		boolean checkId = tagRepository.existsById(id);
		if(!checkId) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body(
					new ResponseObject("failed", "not found id size", "")
					);
		}
		return ResponseEntity.status(HttpStatus.OK).body(
				new ResponseObject("OK", "success get size by id", tagRepository.findById(id).get())
				);
	}

	@Override
	public ResponseEntity<ResponseObject> editById(int id, TagModel tagModel) {
		// TODO Auto-generated method stub
		TagModel tag = tagRepository.findById(id).get();
		//check name size
		if(tag.getName().equals(tagModel.getName())) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(
					new ResponseObject("bad request", "the name not change", tag)
					);
		}
		if(tagRepository.findByName(tagModel.getName()).size() >= 1) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(
					new ResponseObject("bad request", "the name exits with name database", "")
					);
		}
		tag.setName(tagModel.getName());
		return ResponseEntity.status(HttpStatus.OK).body(
				new ResponseObject("OK", "edit size success", tagRepository.save(tag))
				);
	}

}
