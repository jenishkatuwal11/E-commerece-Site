/**
 * This class represents a Data Access Object (DAO) for managing operations related to customers.
 * It includes methods for registering a new customer, logging in a customer, and updating customer information.
 */

package Dao;

import java.sql.*;

import com.PasswordEncryption.PasswordEncryptionWithAes;  // For password encryption
import com.dbConnection.DatabaseConnection;  // For obtaining database connection
import com.model.Customer;  // model class for customer data

public class CustomerDao {

    // Static reference to the database connection obtained through DatabaseConnection class
    private static Connection con = DatabaseConnection.getConnection();

    // Method to register a new customer
    public boolean registerCustomer(Customer customer) {
        boolean flag = false;
        try {
            // SQL query to insert customer data into the Customer table
            String query = "INSERT INTO Customer(fullName, email, phoneNumber, password, address) VALUES(?,?,?,?,?)";
            PreparedStatement st = CustomerDao.con.prepareStatement(query);

            // Set prepared statement parameters with customer data
            st.setString(1, customer.getFullName());
            st.setString(2, customer.getEmail());
            st.setString(3, customer.getPhoneNumber());
            st.setString(4, customer.getPassword()); 
            st.setString(5, customer.getAddress());

            // Execute the query to insert data
            st.executeUpdate();

            // Set flag to indicate successful registration
            flag = true;
        } catch (Exception e) {
            // Log or handle any exceptions that might occur during registration
            e.printStackTrace();
        }
        return flag;
    }

    // Method to login a customer
    public Customer login(String email, String password) {
        Customer customer = null;
        try {
            // SQL query to select customer data based on email
            String query = "SELECT * FROM customer WHERE email = ?";
            PreparedStatement pst = CustomerDao.con.prepareStatement(query);
            pst.setString(1, email);

            // Execute the query and retrieve results
            ResultSet set = pst.executeQuery();

            if (set.next()) {
                // Create a new Customer object to store retrieved data
                customer = new Customer(0, query, query, query, query);

                // Set individual fields of the Customer object with data from the result set
                customer.setID(set.getInt("ID"));  
                customer.setFullName(set.getString("fullName"));
                customer.setEmail(set.getString("email"));
                customer.setPhoneNumber(set.getString("phoneNumber"));
                customer.setAddress(set.getString("address"));

                // Retrieve encrypted password from database
                String passwordFromDb = set.getString("password");

                // Decrypt the password using PasswordEncryptionWithAes (assuming it's implemented)
                String decryptPassword = PasswordEncryptionWithAes.decrypt(passwordFromDb, email);

                // Validate credentials (assuming decryption is successful)
                if (decryptPassword != null && set.getString("Email").equals(email) && decryptPassword.equals(password)) {
                    return customer;  // Login successful, return customer object
                }
            }
        } catch (Exception e) {
            // Log or handle any exceptions that might occur during login
            e.printStackTrace();
        }
        return null;  // Login failed, return null
    }

    // Method to update customer information
    public boolean updateCustomer(Customer customer) {
        boolean flag = false;
        try {
            // SQL query to update customer data in the Customer table
            String query = "UPDATE customer SET FullName=?, phoneNumber=?, address=? WHERE email=?";
            PreparedStatement pst = CustomerDao.con.prepareStatement(query);

            // Set prepared statement parameters with updated customer data
            pst.setString(1, customer.getFullName());
            pst.setString(2, customer.getPhoneNumber());
            pst.setString(3, customer.getAddress());
            pst.setString(4, customer.getEmail());

            // Execute the query to update data
            pst.executeUpdate();

            // Set flag to indicate successful update
            flag = true;
        } catch (Exception e) {
            // Log or handle any exceptions that might occur during update
            e.printStackTrace();
        }
        return flag;
    }
}
