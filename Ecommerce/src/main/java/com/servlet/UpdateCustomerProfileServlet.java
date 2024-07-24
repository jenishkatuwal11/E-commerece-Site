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

import Dao.CustomerDao;

/**
 * Servlet implementation class UpdateCustomerProfileServlet
 * This servlet handles the customer profile information update operation.
 */

@WebServlet(asyncSupported = true, urlPatterns = { "/UpdateCustomerProfileServlet" })
public class UpdateCustomerProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
     * @see HttpServlet#HttpServlet()
     */
	
	/**
	 * Constructor class of the UpdateCustomerServlet
	 */

    public UpdateCustomerProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 * This method Handles the POST request when the user submitss updated profile information.
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		// This retrieves the updated profile information from the requested parameters.
		String fullName = request.getParameter("fullName");
		String phoneNumber = request.getParameter("phoneNumber");
		String address = request.getParameter("address");
		
		System.out.println(address);
		
		// get user from session
		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("currentCustomer");
		
		// This instantiates CustomerDao class for accessing database operations related to Customer. 
		CustomerDao customerDao = new CustomerDao();
		
		// This updates the customer's information in the database.
		customer.setFullName(fullName);
		customer.setPhoneNumber(phoneNumber);
		customer.setAddress(address);
		if (customerDao.updateCustomer(customer)) {
			
			// Redirects user tp profile view page if the update operation is successful.
			customer.setFullName(fullName);
			customer.setPhoneNumber(phoneNumber);
			customer.setAddress(address);
			response.sendRedirect("pages/profileView.jsp");
		} else {
			
			// This displays the error message, if the update operation is successful.
			out.println("<h1>Profile Not Updated</h1>");
		}
	}

}
