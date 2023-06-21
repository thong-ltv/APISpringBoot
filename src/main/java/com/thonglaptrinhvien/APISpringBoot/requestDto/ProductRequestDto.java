package com.thonglaptrinhvien.APISpringBoot.requestDto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductRequestDto {
	
	private String name;
	private Double price;
	private String featureImagePath;
	private String content;
	private String featureImageName;
	private int categoryId;
	private int[] sizeIds;
	private int[] colorIds;
	private int[] tagIds;
	
	public ProductRequestDto() {}
	
	public ProductRequestDto(String name, Double price, String featureImagePath, String content,
			String featureImageName, int categoryId, int[] sizeIds, int[] colorIds, int[] tagIds) {
		super();
		this.name = name;
		this.price = price;
		this.featureImagePath = featureImagePath;
		this.content = content;
		this.featureImageName = featureImageName;
		this.categoryId = categoryId;
		this.sizeIds = sizeIds;
		this.colorIds = colorIds;
		this.tagIds = tagIds;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
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

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public int[] getSizeIds() {
		return sizeIds;
	}

	public void setSizeIds(int[] sizeIds) {
		this.sizeIds = sizeIds;
	}

	public int[] getColorIds() {
		return colorIds;
	}

	public void setColorIds(int[] colorIds) {
		this.colorIds = colorIds;
	}

	public int[] getTagIds() {
		return tagIds;
	}

	public void setTagIds(int[] tagIds) {
		this.tagIds = tagIds;
	}
	
}
