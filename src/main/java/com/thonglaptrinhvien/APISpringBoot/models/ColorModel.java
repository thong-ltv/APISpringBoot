package com.thonglaptrinhvien.APISpringBoot.models;

import java.util.HashSet;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIdentityReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreType;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;
import jakarta.transaction.Transactional;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "colors")
@Transactional
public class ColorModel {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	
	@Column(name = "english_color")
	private String englishColor;
	
	@JsonIgnore
	@ManyToMany(mappedBy = "colors", fetch = FetchType.LAZY)
	@JsonBackReference()
	private Set<ProductModel> products = new HashSet<>();
	
	public ColorModel() {}
	
	public ColorModel(String name, String englishColor, Set<ProductModel> products) {
		super();
		this.name = name;
		this.englishColor = englishColor;
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

	public String getEnglishColor() {
		return englishColor;
	}

	public void setEnglishColor(String englishColor) {
		this.englishColor = englishColor;
	}

	public Set<ProductModel> getProducts() {
		return products;
	}

	public void setProducts(Set<ProductModel> products) {
		this.products = products;
	}
	
}
