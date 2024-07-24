package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Customer;

import Dao.AddToCartDao;

/**
 * Servlet implementation class AddProductToCartServlet
 * This Servlet handles the Product add to cart feature used by user
 */

@WebServlet(asyncSupported = true, urlPatterns = { "/AddProductToCartServlet" })
public class AddProductToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	/*
	 * Constructor of AddProductToCart Servlet
	 */

    public AddProductToCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * This method handles the GET request for Product Add to cart feature 
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		// This retreives the Product ID form request parameter
		int productId = Integer.parseInt(request.getParameter("productId"));
		
		// This gets the referrer URL
		String referer = request.getHeader("referer");
		
		// Sets the default quantity of product to 1
		int quantity = 1;
		
		/// This gets the current customer form session
		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("currentCustomer");
		
		int customerID = 0;
		if (customer != null) {
			// This gets the current customer ID from customer Object.
		    customerID = customer.getID();
		} else {
		    // Handle the case where the customer is null (e.g., log the error, redirect to the login page)
		    out.println("Invalid session. Please log in again.");
		    // You can also redirect to the login page here
		}
		
		AddToCartDao addToCartDao = new AddToCartDao();
		
		// Checking to add the product to cart
		if (addToCartDao.addProductToCart(customerID, productId, quantity)) {
			out.println("Product added to cart");
			// out.println(referer);

			// This redirects the user back to the previous page
			response.sendRedirect(referer);
		} else {
			out.println("Product not added to cart");
		}
	}

}
