package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.AddToCartDao;
import Dao.ProductDao;

/**
 * Servlet implementation class DeleteCartServlet
 * This servlet implements the Product deletion from cart feature to empty cart 
 */

@WebServlet(asyncSupported = true, urlPatterns = { "/DeleteCartServlet" })
public class DeleteCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	/*
	 * Constructor of Delete Cart Servlet
	 */

    public DeleteCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    /**
     * This method handles the GET request for deletion of cart items of products.
     */

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		// This retrieves the cart ID of the Cart from the request parameter
		int cartId = Integer.parseInt(request.getParameter("cartId"));
		
		// This instantiates AddToCartDao class for accessing database operations related to the cart
		AddToCartDao dao = new AddToCartDao();
		
		// Attempts to delete the item from the cart
		boolean f = dao.deleteCartItem(cartId);
		
		// If deletion is successful, this redirects admin to the previous page
		if (f) {
			String referer = request.getHeader("referer");
			response.sendRedirect(referer);
			out.println("You have successfully Deleted.");
		} else {
			// If deletion fails, display an error message
			out.println("Something went wrong. Try again!!!");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	/*
	 * This method handles the POST request for the response of Delete Cart item.
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Calls doGet method to handle POST requests
		doGet(request, response);
	}

}
