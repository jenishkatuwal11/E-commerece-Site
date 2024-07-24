/**
 * This class represents an item added to the shopping cart.
 * It encapsulates information such as quantity, total price, customer ID, product ID, and product image URL.
 */

package com.model; // This package contains the AddToCart class

public class AddToCart {

  // Represents an item added to the shopping cart
  private int ID; // Unique identifier for the cart item (might be auto-generated)
  private int quantity; // Number of units of the product added
  private int totalPrice; // Total price for the added quantity
  private int customerID; // ID of the customer who added the item
  private int productID; // ID of the product added
  private String productImageUrl; // URL of the product image

  // Constructor with all fields (might be used for database interaction)
  public AddToCart(int iD, int quantity, int totalPrice, int customerID, int productID, String productImageUrl) {
    super();
    ID = iD;
    this.quantity = quantity;
    this.totalPrice = totalPrice;
    this.customerID = customerID;
    this.productID = productID;
    this.productImageUrl = productImageUrl;
  }

  // Constructor without ID (might be used for creating new cart items)
  public AddToCart(int quantity, int totalPrice, int customerID, int productID, String productImageUrl) {
    super();
    this.quantity = quantity;
    this.totalPrice = totalPrice;
    this.customerID = customerID;
    this.productID = productID;
    this.productImageUrl = productImageUrl;
  }

  // Getter and setter methods for each field
  public int getID() {
    return ID;
  }

  public void setID(int iD) {
    ID = iD;
  }

  public int getQuantity() {
    return quantity;
  }

  public void setQuantity(int quantity) {
    this.quantity = quantity;
  }

  public int getTotalPrice() {
    return totalPrice;
  }

  public void setTotalPrice(int totalPrice) {
    this.totalPrice = totalPrice;
  }

  public int getCustomerID() {
    return customerID;
  }

  public void setCustomerID(int customerID) {
    this.customerID = customerID;
  }

  public int getProductID() {
    return productID;
  }

  public void setProductID(int productID) {
    this.productID = productID;
  }

  public String getProductImageUrl() {
    return productImageUrl;
  }

  public void setProductImageUrl(String productImageUrl) {
    this.productImageUrl = productImageUrl;
  }
}
