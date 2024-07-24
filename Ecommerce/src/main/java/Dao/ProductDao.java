package Dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.dbConnection.DatabaseConnection;
import com.model.Product;

public class ProductDao {
	
	// Static reference to the database connection obtained through DatabaseConnection class
	private static Connection con = DatabaseConnection.getConnection();
	
	// Method to register a new product
	public boolean registerProduct(Product product) {
		boolean flag = false;
		try {
			
			 // SQL query to insert product data into the products table
			String query = "INSERT INTO products(productName, productPrice, productImgUrl) VALUES(?,?,?)";
 
			PreparedStatement st = ProductDao.con.prepareStatement(query);
			
			// Set prepared statement parameters with product data
			st.setString(1, product.getProductName());
			st.setLong(2, product.getProductPrice());
			st.setString(3, product.getProductImgUrl());
			
			// Execute the query to insert data
			st.executeUpdate();
			flag = true;
		} catch (Exception e) {
			// Log or handle any exceptions that might occur during product registration
			e.printStackTrace();
		}
		return flag;
		}
	
	// Method to get a list of all products
	public List<Product> getAllProduct() {
		List<Product> productList = new ArrayList<Product>();
		try {
			// SQL query to select all products from the products table
			String query = "SELECT * FROM products";
 
			PreparedStatement pst = ProductDao.con.prepareStatement(query);
 
			ResultSet set = pst.executeQuery();
 
			while (set.next()) {
				// Create a new Product object to store retrieved data
				Product product = new Product(0, query, 0, query);
				
				// Set individual fields of the Product object with data from the result set
				product.setID(set.getInt(1));
				product.setProductName(set.getString(2));
				product.setProductPrice(set.getInt(3));
				product.setProductImgUrl(set.getString(4));

				productList.add(product);

			}
		} catch (Exception e) {
			// Log or handle any exceptions that might occur during product retrieval
			e.printStackTrace();
		}
		return productList;
	}
	
	// Method to edit a product
	public boolean editProduct(int productId, String productName, int productPrice) {

		boolean flag = false;
		try {
			// SQL query to update product data in the products table
			String query = "UPDATE products SET productName=?, productPrice=? WHERE ID=?";

			PreparedStatement st = ProductDao.con.prepareStatement(query);
			
			// Set prepared statement parameters with updated product data
			st.setString(1, productName);
			st.setInt(2, productPrice);
			st.setInt(3, productId);
			;
			
			// Execute the query to update data
			st.executeUpdate();
			flag = true;
		} catch (Exception e) {
			// Log or handle any exceptions that might occur during product update
			e.printStackTrace();
		}
		return flag;

	}
	
	// Method to delete a product
	public boolean deleteProduct(int id) {

		boolean flag = false;
		try {
			// SQL query to delete a product from the products table
			String query = "delete from products where ID=?";

			PreparedStatement st = ProductDao.con.prepareStatement(query);
			st.setInt(1, id);
			;
			
			// Execute the query to delete data
			st.executeUpdate();
			flag = true;
		} catch (Exception e) {
			// Log or handle any exceptions that might occur during product deletion
			e.printStackTrace();
		}
		return flag;

	}
	
	// Method to search for products based on a search term
	public List<Product> getSerchItem(String serchItem) {
		List<Product> productList = new ArrayList<>();
		try {
			// SQL query to search products by concatenating product name and price for like search
			String query = "SELECT * FROM products WHERE CONCAT(productName, productPrice) LIKE ?";

			PreparedStatement pst = ProductDao.con.prepareStatement(query);
			
			// Set prepared statement parameter with the search term
			pst.setString(1, "%" + serchItem + "%");

			ResultSet set = pst.executeQuery();

			while (set.next()) {
				Product product = new Product(0, query, 0, query);

				product.setID(set.getInt(1));
				product.setProductName(set.getString(2));
				product.setProductPrice(set.getInt(3));
				product.setProductImgUrl(set.getString(4));

				productList.add(product);

			}
		} catch (Exception e) {
			// Log or handle any exceptions that might occur during product search
			e.printStackTrace();
		}
		return productList;
	}
}