package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.ProductDao;

/**
 * Servlet implementation class DeleteProduct
 * This Servlet applies the product deletion feature used by admin
 */

@WebServlet(asyncSupported = true, urlPatterns = { "/DeleteProduct" })
public class DeleteProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	/*
	 * Constructor of DeleteProduct Servlet
	 */

    public DeleteProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    /*
     * This method handles the GET request for deleting a product.
     */

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// This retrieves the Product ID to be deleted from request parameter.
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		int id = Integer.parseInt(request.getParameter("id"));
		
		// This instantiates ProductDao class for accessing database operations related to Product
		ProductDao dao = new ProductDao();
		boolean f = dao.deleteProduct(id);
		
		// This checks condition to delete the product from the database
		if (f) {
			// If deletion is successful, redirect to the previous page
			String referer = request.getHeader("referer");
			response.sendRedirect(referer);
			out.println("You have successfully Deleted.");
		} else {
			// If deletion fails, display an error message
			out.println("Something went wrong. Try again!!!");
		}
		
	}

}
