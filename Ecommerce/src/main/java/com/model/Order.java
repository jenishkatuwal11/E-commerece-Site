/**
 * This class represents an order.
 * It contains attributes such as ID, product name, product ID, customer ID, order date, total price,
 * order status, and quantity.
 */

package com.model; // This package contains the Order class

public class Order {

  // Unique identifier for the order
  private int ID;

  // Name of the product in the order
  private String productName;

  // ID of the product in the order (references product table)
  private int productId;

  // ID of the customer who placed the order (references customer table)
  private int customerId;

  // Date the order was placed
  private String orderDate;

  // Total price of the order
  private int totalPrice;

  // Current status of the order (e.g., "placed", "shipped", "delivered")
  private String orderStatus;

  // Quantity of the product ordered
  private int quantity;

  // Constructor with all fields (might be used for creating new orders)
  public Order(int iD, String productName, int productId, int customerId, String orderDate, int totalPrice,
               String orderStatus, int quantity) {
    super();
    ID = iD;
    this.productName = productName;
    this.productId = productId;
    this.customerId = customerId;
    this.orderDate = orderDate;
    this.totalPrice = totalPrice;
    this.orderStatus = orderStatus;
    this.quantity = quantity;
  }

  // Constructor without order ID (might be used for order details without existing ID)
  public Order(String productName, int productId, int customerId, String orderDate, int totalPrice,
               String orderStatus, int quantity) {
    super();
    this.productName = productName;
    this.productId = productId;
    this.customerId = customerId;
    this.orderDate = orderDate;
    this.totalPrice = totalPrice;
    this.orderStatus = orderStatus;
    this.quantity = quantity;
  }

//Getter and setter methods for order ID	
	public int getID() {
		return ID;
	}
	
	public void setID(int iD) {
		ID = iD;
	}
	
	// Getter and setter methods for product name
	public String getProductName() {
		return productName;
	}
	
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	// Getter and setter methods for product ID
	public int getProductId() {
		return productId;
	}
	
	public void setProductId(int productId) {
		this.productId = productId;
	}
	
	// Getter and setter methods for customer ID
	public int getCustomerId() {
		return customerId;
	}
	
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	
	// Getter and setter methods for order ID
	public String getOrderDate() {
		return orderDate;
	}
	
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	
	// Getter and setter methods for Total Price
	public int getTotalPrice() {
		return totalPrice;
	}
	
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	// Getter and setter methods for Order status
	public String getOrderStatus() {
		return orderStatus;
	}
	
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	
	// Getter and setter methods for order quantity
	public int getQuantity() {
		return quantity;
	}
	
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
}
