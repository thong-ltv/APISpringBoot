package com.thonglaptrinhvien.APISpringBoot.models;

import java.util.HashSet;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIdentityReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreType;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinColumns;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.NamedAttributeNode;
import jakarta.persistence.NamedEntityGraph;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.transaction.Transactional;

@Entity
@Table(name = "products")
@Transactional
public class ProductModel {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String name;
	
	private Double price;
	
	@Column(name = "feature_image_path")
	private String featureImagePath;

	@Column(columnDefinition = "TEXT")
	private String content;
	
	@Column(name = "feature_image_name")
	private String featureImageName;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "category_id")
	@JsonBackReference
//	@JsonIgnore
	private CategoryModel categoryModel;
	
	@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinTable(name = "product_colors",
			joinColumns = {
					@JoinColumn(name = "product_id", referencedColumnName = "id")
			},
			inverseJoinColumns = {
					@JoinColumn(name = "color_id", referencedColumnName = "id")
			}
			)
	@JsonManagedReference()
	private Set<ColorModel> colors = new HashSet<>();
	
	@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinTable(name = "product_sizes",
			joinColumns = {
					@JoinColumn(name = "product_id", referencedColumnName = "id")
			},
			inverseJoinColumns = {
					@JoinColumn(name = "size_id", referencedColumnName = "id")
			}
			)
	@JsonManagedReference
	private Set<SizeModel> sizes = new HashSet<>();
	
	@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinTable(name = "product_tags",
			joinColumns = {
					@JoinColumn(name = "product_id", referencedColumnName = "id")
			},
			inverseJoinColumns = {
					@JoinColumn(name = "tag_id", referencedColumnName = "id")
			}
			)
	@JsonManagedReference
	private Set<TagModel> tags = new HashSet<>();
	
	@OneToMany(mappedBy = "product", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JsonManagedReference
	private Set<ImageProductModel> images = new HashSet<>();
	
	public ProductModel() {}

	public ProductModel(String name, Double price, String featureImagePath, String content, String featureImageName,
			CategoryModel categoryModel, Set<ColorModel> colors, Set<SizeModel> sizes, Set<TagModel> tags) {
		super();
		this.name = name;
		this.price = price;
		this.featureImagePath = featureImagePath;
		this.content = content;
		this.featureImageName = featureImageName;
		this.categoryModel = categoryModel;
		this.colors = colors;
		this.sizes = sizes;
		this.tags = tags;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public CategoryModel getCategoryModel() {
		return categoryModel;
	}

	public void setCategoryModel(CategoryModel categoryModel) {
		this.categoryModel = categoryModel;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFeatureImagePath() {
		return featureImagePath;
	}

	public void setFeatureImagePath(String featureImagePath) {
		this.featureImagePath = featureImagePath;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFeatureImageName() {
		return featureImageName;
	}

	public void setFeatureImageName(String featureImageName) {
		this.featureImageName = featureImageName;
	}

	public Set<SizeModel> getSizes() {
		return sizes;
	}

	public void setSizes(SizeModel size) {
		Set<SizeModel> sizes = this.getSizes();
		sizes.add(size);
		this.sizes = sizes;
	}

	public Set<ColorModel> getColors() {
		return colors;
	}

	public void setColors(ColorModel color) {
		Set<ColorModel> colors = this.getColors();
		colors.add(color);
		this.colors = colors;
	}

	public Set<TagModel> getTags() {
		return tags;
	}

	public void setTags(TagModel tag) {
		Set<TagModel> tags = this.getTags();
		tags.add(tag);
		this.tags = tags;
	}

	public Set<ImageProductModel> getImages() {
		return images;
	}

	public void setImages(ImageProductModel image) {
		Set<ImageProductModel> images = this.getImages();
		images.add(image);
		this.images = images;
	}
	
	public void removeAllSize() {
		Set<SizeModel> sizes = this.getSizes();
		sizes.removeAll(sizes);
		this.sizes = sizes;
	}
	
	public void removeAllColor() {
		Set<ColorModel> colors = this.getColors();
		colors.removeAll(colors);
		this.colors = colors;
	}
	
	public void removeAllTag() {
		Set<TagModel> tags = this.getTags();
		tags.removeAll(tags);
		this.tags = tags;
	}
}
