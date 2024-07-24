/**
 * This class represents an admin user.
 * It provides default credentials for accessing the admin panel.
 */

package com.model; // This package contains the Admin class

public class Admin {

  // Stores credentials for the admin user
  private String Email = "admin@gmail.com"; // Default admin email address
  private String Password = "admin"; // Default admin password

  public String getEmail() {
    return Email;
  }

  public String getPassword() {
    return Password;
  }
}
