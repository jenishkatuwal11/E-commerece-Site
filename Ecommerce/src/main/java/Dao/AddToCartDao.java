/**
 * This class represents a Data Access Object (DAO) for managing operations related to the shopping cart.
 * It includes methods for adding products to the cart, retrieving all cart items for a specific customer,
 * and deleting a specific cart item.
 */

package Dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.dbConnection.DatabaseConnection;
import com.model.AddToCart;

public class AddToCartDao {

    // Static reference to the database connection obtained through DatabaseConnection class
    public static Connection con = DatabaseConnection.getConnection();

    // Method to add a product to the cart for a specific customer
    public boolean addProductToCart(int customerId, int producrId, int quantity) {
        boolean flag = false;
        try {
            // Main query to insert data into the cart table
            String mainQuery = "Insert into cart(quantity, totalPrice, customerID, productID, productImageUrl) values(?,?,?,?,?)";

            // Subquery to retrieve product price and image URL from products table
            String subQuery = "SELECT productPrice, productImgUrl FROM products WHERE ID = ?";

            // Prepare statement for the subquery
            PreparedStatement subPst = AddToCartDao.con.prepareStatement(subQuery);

            // Set product ID parameter for the subquery
            subPst.setInt(1, producrId);

            // Execute the subquery and retrieve results
            ResultSet set = subPst.executeQuery();

            int productPrice;
            String productImgUrl;

            // Check if a product record is found for the given product ID
            if (set.next()) {
                productPrice = set.getInt(1);
                productImgUrl = set.getString(2);
            } else {
                // No product found, return without adding to cart
                return flag;
            }

            // Calculate total price based on quantity and product price
            int totalPrice = quantity * productPrice;

            // Prepare statement for the main query (adding to cart)
            PreparedStatement mainPst = AddToCartDao.con.prepareStatement(mainQuery);

            // Set parameters for the main query
            mainPst.setInt(1, quantity);
            mainPst.setInt(2, totalPrice);
            mainPst.setInt(3, customerId);
            mainPst.setInt(4, producrId);
            mainPst.setString(5, productImgUrl);

            // Execute the main query to insert data into the cart table
            mainPst.executeUpdate();

            // Set flag to indicate successful addition
            flag = true;

        } catch (Exception e) {
            // Log or handle any exceptions that might occur
            e.printStackTrace();
        }

        return flag;
    }

    // Method to retrieve all cart items for a specific customer
    public List<AddToCart> getAllCartProduct(int customerID) {
        List<AddToCart> cartList = new ArrayList<AddToCart>();
        try {
            // Query to select all cart items for a customer
            String query = "SELECT * FROM cart WHERE customerID = ?";

            // Prepare statement for the query
            PreparedStatement pst = AddToCartDao.con.prepareStatement(query);

            // Set customer ID parameter for the query
            pst.setInt(1, customerID);

            // Execute the query and retrieve results
            ResultSet set = pst.executeQuery();

            // Loop through each cart item record
            while (set.next()) {
                // Create a new AddToCart object to store retrieved data
                AddToCart addToCart = new AddToCart(0, 0, 0, 0, null);

                // Set individual fields of the AddToCart object with data from the result set
                addToCart.setID(set.getInt(1));
                addToCart.setQuantity(set.getInt(2));
                addToCart.setTotalPrice(set.getInt(3));
                addToCart.setCustomerID(set.getInt(4));
                addToCart.setProductID(set.getInt(5));
                addToCart.setProductImageUrl(set.getString(6));

                // Add the populated AddToCart object to the cart list
                cartList.add(addToCart);
            }
        } catch (Exception e) {
            // Log or handle any exceptions that might occur
            e.printStackTrace();
        }
        return cartList;
    }

    // Method to delete a specific cart item based on its ID
    public boolean deleteCartItem(int cartId) {
        boolean flag = false;
        try {
            // Query to delete a cart item by its ID
            String query = "delete from cart where ID=?";

            // Prepare statement for the query
            PreparedStatement st = AddToCartDao.con.prepareStatement(query);

            // Set cart ID parameter for the query
            st.setInt(1, cartId);

            // Execute the query to delete the cart item
            st.executeUpdate();

            // Set flag to indicate successful deletion
            flag = true;
        } catch (Exception e) {
            // Log or handle any exceptions that might occur
            e.printStackTrace();
        }
        return flag;
    }
}

            
