package com.thonglaptrinhvien.APISpringBoot.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.thonglaptrinhvien.APISpringBoot.models.TagModel;

@Repository
public interface TagRepository extends JpaRepository<TagModel, Integer>{

	List<TagModel> findByName(String name);

}
