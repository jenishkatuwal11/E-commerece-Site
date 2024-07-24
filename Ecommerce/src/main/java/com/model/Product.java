/**
 * This class represents a product.
 * It contains attributes such as ID, product name, product price, and product image URL.
 * It also includes methods for getting and setting product attributes, and handling file operations.
 */

package com.model; // This package contains the Product class

import java.io.File; // Import for file operations
import javax.servlet.http.Part; // Import for handling multipart form data (file uploads)

public class Product {

  // Unique identifier for the product
  private int ID;

  // Name of the product
  private String productName;

  // Price of the product
  private int productPrice;

  // URL of the product image
  private String productImgUrl;

  // Constructor with ID (might be used for existing products)
  public Product(int iD, String productName, int productPrice, String productImgUrl) {
    super();
    ID = iD;
    this.productName = productName;
    this.productPrice = productPrice;
    this.productImgUrl = productImgUrl;
  }

  // Constructor without ID (might be used for creating new products)
  public Product(String productName, int productPrice, String productImgUrl) {
    super();
    this.productName = productName;
    this.productPrice = productPrice;
    this.productImgUrl = productImgUrl;
  }

	//Getter and setter methods for Product Id
	public int getID() {
		return ID;
	}
	
	public void setID(int iD) {
		ID = iD;
	}
	
	//Getter and setter methods for Product name
	public String getProductName() {
		return productName;
	}
	
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	//Getter and setter methods for Product price
	public int getProductPrice() {
		return productPrice;
	}
	
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	
	//Getter and setter methods for Product image
	public String getProductImgUrl() {
		return productImgUrl;
	}
	
	public void setProductImgUrl(String productImgUrl) {
		this.productImgUrl = productImgUrl;
	}
	
	  // Defines the directory path for storing product images
	public static final String IMAGE_DIR = "xampp\\tomcat\\webapps\\CW\\ProductImg\\";
	public static final String IMAGE_DIR_SAVE_PATH = "C:" + File.separator + IMAGE_DIR;
	
	// Extracts the original filename from a multi-part form data file part
	public static String getFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition"); // Get content disposition header
		String[] items = contentDisp.split(";"); // Split header by semicolon (;)
		for (String s : items) { // Loop through each item
			if (s.trim().startsWith("filename")) { // Check if item starts with "filename"
				return s.substring(s.indexOf("=") + 2, s.length() - 1); // Extract filename
			}
		}
		return ""; //Return empty string if filename not found
	}
}
