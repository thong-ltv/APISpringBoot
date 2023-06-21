package com.thonglaptrinhvien.APISpringBoot.service.ipml;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.thonglaptrinhvien.APISpringBoot.models.ColorModel;
import com.thonglaptrinhvien.APISpringBoot.models.ResponseObject;
import com.thonglaptrinhvien.APISpringBoot.models.SizeModel;
import com.thonglaptrinhvien.APISpringBoot.repositories.ColorRepository;
import com.thonglaptrinhvien.APISpringBoot.service.ColorService;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class ColorServiceImpl implements ColorService{

	@Autowired
	private ColorRepository colorRepository;
	
	@Override
	public List<ColorModel> getAll() {
		// TODO Auto-generated method stub
		return colorRepository.findAll();
	}

	@Override
	public ResponseEntity<ResponseObject> insert(ColorModel colorModel) {
		// TODO Auto-generated method stub
		List<ColorModel> foundColors = colorRepository.findByName(colorModel.getName().trim());
		if(foundColors.size() > 0) {
			return ResponseEntity.status(HttpStatus.NOT_IMPLEMENTED).body(
					new ResponseObject("failed", "Color name already taken", "")
					);
		};
		return ResponseEntity.status(HttpStatus.OK).body(
				new ResponseObject("OK", "success insert data!!!", colorRepository.save(colorModel))
				);
	}

	@Override
	public ResponseEntity<ResponseObject> delete(int id) {
		// TODO Auto-generated method stub
		boolean checkId = colorRepository.existsById(id);
		if(checkId) {
				colorRepository.deleteById(id);
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
	public Optional<ColorModel> findById(int id) {
		// TODO Auto-generated method stub
		return colorRepository.findById(id);
	}

	@Override
	public ResponseEntity<ResponseObject> getById(int id) {
		// TODO Auto-generated method stub
		boolean checkId = colorRepository.existsById(id);
		if(!checkId) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body(
					new ResponseObject("failed", "not found id size", "")
					);
		}
		return ResponseEntity.status(HttpStatus.OK).body(
				new ResponseObject("OK", "success get size by id", colorRepository.findById(id).get())
				);
	}

	@Override
	public ResponseEntity<ResponseObject> editById(int id, ColorModel colorModel) {
		// TODO Auto-generated method stub
		ColorModel color = colorRepository.findById(id).get();
		//check name size
		if(color.getName().equals(colorModel.getName())) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(
					new ResponseObject("bad request", "the name not change", color)
					);
		}
		if(colorRepository.findByName(colorModel.getName()).size() >= 1) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(
					new ResponseObject("bad request", "the name exits with name database", "")
					);
		}
		color.setName(colorModel.getName());
		return ResponseEntity.status(HttpStatus.OK).body(
				new ResponseObject("OK", "edit size success", colorRepository.save(color))
				);
	}

}
