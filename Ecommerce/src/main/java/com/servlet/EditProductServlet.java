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
 * Servlet implementation class EditProductServlet
 * This servlet handles the Editing details of the existing product in the database.
 */

@WebServlet(asyncSupported = true, urlPatterns = { "/EditProductServlet" })
public class EditProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	/**
	 * Constructor of Editproduct Servlet
	 */

    public EditProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    
    /**
     * This method handles the POST request for editing existing product details 
     */

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// This initializes PrintWriter to send response to the user
		PrintWriter out = response.getWriter();
		
		// This retrieves the product details from request parameters
		int productId = Integer.parseInt(request.getParameter("productId"));
		String productName = request.getParameter("productName");
		int productPrice = Integer.parseInt(request.getParameter("productPrice"));
		
		// This instantiates ProductDao class for accessing database operations related to Product
		ProductDao productDao = new ProductDao();
		
		// Checks condition to edit the product in the database
		if(productDao.editProduct(productId, productName, productPrice)) {
			
			// If editing is successful, redirect to the admin panel page
			response.sendRedirect("pages/adminHome.jsp");
		} else {
			
			// If editing fails, display an error message.
			out.println("Something went wrong. Try again!!!");
		}
	}

}
