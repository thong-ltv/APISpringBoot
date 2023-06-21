package com.thonglaptrinhvien.APISpringBoot.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.EntityGraph.EntityGraphType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.thonglaptrinhvien.APISpringBoot.models.ProductModel;

@Repository
public interface ProductRepository extends JpaRepository<ProductModel, Long>{
	List<ProductModel> findByName(String name);
}
