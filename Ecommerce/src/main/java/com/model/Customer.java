/**
 * This class represents a customer.
 * It contains attributes such as ID, full name, email, phone number, password, and address.
 */

package com.model; // This package contains the Customer class

public class Customer {

  // Unique identifier for the customer
  private int ID;

  // Customer's full name
  private String fullName;

  // Customer's email address
  private String email;

  // Customer's phone number
  private String phoneNumber;

  // Customer's password (**WARNING: storing password in plain text is a security risk!**)
  private String password;

  // Customer's address
  private String address;

  // Constructor for creating a customer without an ID (might be used for new registrations)
  public Customer(String fullName, String email, String phoneNumber, String password, String address) {
    super();
    this.fullName = fullName;
    this.email = email;
    this.phoneNumber = phoneNumber;
    this.password = password;
    this.address = address;
  }

  // Constructor for creating a customer with an ID (might be used for retrieving existing customers)
  public Customer(int iD, String fullName, String email, String phoneNumber, String password) {
    super();
    ID = iD;
    this.fullName = fullName;
    this.email = email;
    this.phoneNumber = phoneNumber;
    this.password = password;
    this.address = address;
  }

  // Getter and setter methods for customer address
  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

   //Getter and setter methods for customer ID
	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	// Getter and setter methods for customer full name
	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	// Getter and setter methods for customer email
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	// Getter and setter methods for customer phone number
	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	// Getter and setter methods for customer password
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
