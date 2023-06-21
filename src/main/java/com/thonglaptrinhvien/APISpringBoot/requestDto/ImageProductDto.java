package com.thonglaptrinhvien.APISpringBoot.requestDto;

public class ImageProductDto {

	private String imagePath;
	private String imageName;
	private int productId;
	
	public ImageProductDto() {}

	public ImageProductDto(String imagePath, String imageName, int productId) {
		super();
		this.imagePath = imagePath;
		this.imageName = imageName;
		this.productId = productId;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}
	
}
