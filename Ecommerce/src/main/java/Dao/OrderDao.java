/**
 * This class represents a Data Access Object (DAO) for managing operations related to orders.
 * It includes methods for checking out orders, retrieving orders for a specific customer,
 * retrieving orders with different statuses, updating order statuses, and more.
 */
package Dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.dbConnection.DatabaseConnection;
import com.model.Order;

public class OrderDao {

    // Static reference to the database connection obtained through DatabaseConnection class
    public static Connection con = DatabaseConnection.getConnection();

    // Method to checkout an order (place an order)
    public boolean checkOut(int productId, int customerId, int totalPrice, int quantity) {
        boolean flag = false;
        try {
            
            String query1 = "Insert into orders(productName, productId, customerId, totalPrice, orderStatus, quantity) Values(?,?,?,?,?,?)";
            String query2 = "SELECT productName from products WHERE ID=?";
            
         // Query 2 to retrieve product name from products table
            PreparedStatement pst1 = OrderDao.con.prepareStatement(query2);

            // Set product ID parameter for query 1
            pst1.setInt(1, productId);

            String productName;
            ResultSet set = pst1.executeQuery();
            if (set.next()) {
                productName = set.getString(1);
            } else {
                return flag;
            }

            // Query 1 to insert order data into orders table
            PreparedStatement pst2 = OrderDao.con.prepareStatement(query1);

            // Set parameters for query 2
            pst2.setString(1, productName);
            pst2.setInt(2, productId);
            pst2.setInt(3, customerId);
            pst2.setInt(4, totalPrice);
            pst2.setString(5, "PENDING");  // Order status set to "PENDING" by default
            pst2.setInt(6, quantity);

            // Execute query to insert order data
            pst2.executeUpdate();

            flag = true;

        } catch (Exception e) {
            // Log or handle any exceptions that might occur during checkout
            e.printStackTrace();
        }
        return flag;
    }

    // Method to get a list of orders for a specific customer
    public List<Order> getOrderForUser(int customerId) {
        List<Order> orderlist = new ArrayList<Order>();
        try {
            // Query to select all orders for a customer
            String query = "SELECT * FROM orders WHERE customerId = ?";

            PreparedStatement pst = AddToCartDao.con.prepareStatement(query);  //using connection from AddToCartDao

            // Set customer ID parameter for the query
            pst.setInt(1, customerId);

            ResultSet set = pst.executeQuery();

            while (set.next()) {
                // Create a new Order object to store retrieved data
                Order order = new Order(0, null, 0, 0, null, 0, null, 0);

                // Set individual fields of the Order object with data from the result set
                order.setID(set.getInt(1));
                order.setProductName(set.getString(2));
                order.setProductId(set.getInt(3));
                order.setCustomerId(set.getInt(4));
                order.setOrderDate(set.getString(5));
                order.setTotalPrice(set.getInt(6));
                order.setOrderStatus(set.getString(7));
                order.setQuantity(set.getInt(8));

                orderlist.add(order);
            }
        } catch (Exception e) {
            // Log or handle any exceptions that might occur during order retrieval
            e.printStackTrace();
        }
        return orderlist;
    }

    // Method to get a list of all pending orders
    public List<Order> getAlOrder() {
        List<Order> orderlist = new ArrayList<Order>();
        try {
            // Query to select all orders with "PENDING" status
            String query = "SELECT * FROM orders WHERE orderStatus='PENDING'";

            PreparedStatement pst = AddToCartDao.con.prepareStatement(query);  // using connection from AddToCartDao

            ResultSet set = pst.executeQuery();

            while (set.next()) {
                // Create a new Order object to store retrieved data
                Order order = new Order(0, null, 0, 0, null, 0, null, 0);

                // Set individual fields of the Order object with data from the result set
                order.setID(set.getInt(1));
                order.setProductName(set.getString(2));
                order.setProductId(set.getInt(3));
                order.setCustomerId(set.getInt(4));
                order.setOrderDate(set.getString(5));
                order.setTotalPrice(set.getInt(6));
                order.setOrderStatus(set.getString(7));
                order.setQuantity(set.getInt(8));

                orderlist.add(order);
            }
        } catch (Exception e) {
            // Log or handle any exceptions that might occur during order retrieval
            e.printStackTrace();
        }
        return orderlist;
    }

    // Method to get a list of all completed orders
    public List<Order> getAllCompleteOrder() {
        List<Order> orderlist = new ArrayList<Order>();
        try {
            // Query to select all orders with "SHIP" status
            String query = "SELECT * FROM orders WHERE orderStatus='SHIP'";

            PreparedStatement pst = AddToCartDao.con.prepareStatement(query);

            ResultSet set = pst.executeQuery();

            while (set.next()) {
                Order order = new Order(0, null, 0, 0, null, 0, null, 0);

                order.setID(set.getInt(1));
                order.setProductName(set.getString(2));
                order.setProductId(set.getInt(3));
                order.setCustomerId(set.getInt(4));
                order.setOrderDate(set.getString(5));
                order.setTotalPrice(set.getInt(6));
                order.setOrderStatus(set.getString(7));
                order.setQuantity(set.getInt(8));

                orderlist.add(order);
            }
        } catch (Exception e) {
            // Log or handle any exceptions that might occur during order retrieval
            e.printStackTrace();
        }
        return orderlist;
    }

    // Method to get a list of all declined orders
    public List<Order> getAllDECLINEOrder() {
        List<Order> orderlist = new ArrayList<Order>();
        try {
            // Query to select all orders with "DECLINE" status
            String query = "SELECT * FROM orders WHERE orderStatus='DECLINE'";

            PreparedStatement pst = AddToCartDao.con.prepareStatement(query);

            ResultSet set = pst.executeQuery();

            while (set.next()) {
                Order order = new Order(0, null, 0, 0, null, 0, null, 0);

                order.setID(set.getInt(1));
                order.setProductName(set.getString(2));
                order.setProductId(set.getInt(3));
                order.setCustomerId(set.getInt(4));
                order.setOrderDate(set.getString(5));
                order.setTotalPrice(set.getInt(6));
                order.setOrderStatus(set.getString(7));
                order.setQuantity(set.getInt(8));

                orderlist.add(order);
            }
        } catch (Exception e) {
            // Log or handle any exceptions that might occur during order retrieval
            e.printStackTrace();
        }
        return orderlist;
    }

    // Method to ship an order (update order status to "SHIP")
    public boolean ShipOrder(int orderId) {
        boolean flag = false;
        try {
            // Query to update order status
            String query = "UPDATE orders SET orderStatus='SHIP' WHERE ID=?";

            PreparedStatement pst = OrderDao.con.prepareStatement(query);

            // Set order ID parameter for the query
            pst.setInt(1, orderId);

            // Execute query to update order status
            pst.executeUpdate();

            flag = true;
        } catch (Exception e) {
            // Log or handle any exceptions that might occur during order shipment
            e.printStackTrace();
        }
        return flag;
    }

    // Method to decline an order (update order status to "DECLINE")
    public boolean DeclineOrder(int orderId) {
        boolean flag = false;
        try {
            // Query to update order status
            String query = "UPDATE orders SET orderStatus='DECLINE' WHERE ID=?";

            PreparedStatement pst = OrderDao.con.prepareStatement(query);

            // Set order ID parameter for the query
            pst.setInt(1, orderId);

            // Execute query to update order status
            pst.executeUpdate();

            flag = true;
        } catch (Exception e) {
            // Log or handle any exceptions that might occur during order
		} return flag;
		
	}
}
