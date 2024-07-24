/**
 * This class manages the database connection for the application.
 * It provides methods to establish and retrieve a database connection instance.
 */

package com.dbConnection; // This package contains the DatabaseConnection class

import java.sql.*; // Imports necessary classes for database connection

public class DatabaseConnection {

    private static Connection con; // Stores the database connection instance

    public static Connection getConnection() { // Method to establish a connection

        try {

            if (con == null) { // Checks if a connection already exists

                Class.forName("com.mysql.cj.jdbc.Driver"); // Loads the MySQL JDBC driver

                String url = "jdbc:mysql://localhost:3306/cwecommerce"; // Database connection URL
                String user = "root"; // Database username
                String pass = ""; // Database password

                con = DriverManager.getConnection(url, user, pass); // Establishes connection
            }
        } catch (Exception e) {
            e.printStackTrace(); // Prints any errors that might occur
        }

        return con; // Returns the connection object
    }
}
