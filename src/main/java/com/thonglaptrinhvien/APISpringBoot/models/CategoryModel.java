package com.thonglaptrinhvien.APISpringBoot.models;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreType;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.transaction.Transactional;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Entity
@Table(name = "categories")
@Transactional
public class CategoryModel {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	
	@Column(name = "parent_id")
	private int parentId;
	private String slug;
	
//	@JsonIgnore
	@OneToMany(mappedBy = "categoryModel", fetch = FetchType.LAZY)
	@JsonManagedReference
	private List<ProductModel> products;
	
	public CategoryModel() {
	}

	public CategoryModel(String name, int parentId, String slug, List<ProductModel> products) {
		super();
		this.name = name;
		this.parentId = parentId;
		this.slug = slug;
		this.products = products;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getParentId() {
		return parentId;
	}

	public void setParentId(int parentId) {
		this.parentId = parentId;
	}

	public String getSlug() {
		return slug;
	}

	public void setSlug(String slug) {
		this.slug = slug;
	}

	public List<ProductModel> getProducts() {
		return products;
	}

	public void setProducts(ProductModel product) {
		List<ProductModel> products = this.getProducts();
		products.add(product);
		this.products = products;
	}
	
}
