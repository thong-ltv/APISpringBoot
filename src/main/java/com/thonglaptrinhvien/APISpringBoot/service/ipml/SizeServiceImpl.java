package com.thonglaptrinhvien.APISpringBoot.service.ipml;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.thonglaptrinhvien.APISpringBoot.models.ResponseObject;
import com.thonglaptrinhvien.APISpringBoot.models.SizeModel;
import com.thonglaptrinhvien.APISpringBoot.repositories.SizeRepository;
import com.thonglaptrinhvien.APISpringBoot.service.SizeService;

@Service
public class SizeServiceImpl implements SizeService{

	@Autowired
	private SizeRepository sizeRepository;
	
	@Override
	public List<SizeModel> findAll() {
		// TODO Auto-generated method stub
		return sizeRepository.findAll();
	}

	@Override
	public ResponseEntity<ResponseObject> insert(SizeModel sizeModel) {
		List<SizeModel> foundSizes = sizeRepository.findByName(sizeModel.getName().trim());
		if(foundSizes.size() > 0) {
			return ResponseEntity.status(HttpStatus.NOT_IMPLEMENTED).body(
					new ResponseObject("failed", "Size name already taken", "")
					);
		};
		return ResponseEntity.status(HttpStatus.OK).body(
				new ResponseObject("OK", "success insert data!!!", sizeRepository.save(sizeModel))
				);
	}

	@Override
	public ResponseEntity<ResponseObject> delete(int id) {
		// TODO Auto-generated method stub
		//check id in database
		boolean checkId = sizeRepository.existsById(id);
		if(checkId) {
				sizeRepository.deleteById(id);
				return ResponseEntity.status(HttpStatus.OK).body(
				new ResponseObject("OK", "delete data success!", "")
				);
		}else {
				return ResponseEntity.status(HttpStatus.OK).body(
				new ResponseObject("failed", "id of size not exit!", "")
				);
		}
	}

	@Override
	public Optional<SizeModel> findById(int id) {
		// TODO Auto-generated method stub
		return sizeRepository.findById(id);
	}

	@Override
	public ResponseEntity<ResponseObject> getById(int id) {
		//check id exits
		boolean checkId = sizeRepository.existsById(id);
		if(!checkId) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body(
					new ResponseObject("failed", "not found id size", "")
					);
		}
		return ResponseEntity.status(HttpStatus.OK).body(
				new ResponseObject("OK", "success get size by id", sizeRepository.findById(id).get())
				);
	}

	@Override
	public ResponseEntity<ResponseObject> editById(int id, SizeModel sizeModel) {
		SizeModel size = sizeRepository.findById(id).get();
		//check name size
		if(size.getName().equals(sizeModel.getName())) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(
					new ResponseObject("bad request", "the name not change", size)
					);
		}
		if(sizeRepository.findByName(sizeModel.getName()).size() >= 1) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(
					new ResponseObject("bad request", "the name exits with name database", "")
					);
		}
		size.setName(sizeModel.getName());
		return ResponseEntity.status(HttpStatus.OK).body(
				new ResponseObject("OK", "edit size success", sizeRepository.save(size))
				);
	}

}
