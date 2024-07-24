package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Admin;
import com.model.Customer;

import Dao.CustomerDao;

/**
 * Servlet implementation class LoginServlet
 * This servlet handles user login functionality.
 */

@WebServlet(asyncSupported = true, urlPatterns = { "/LoginServlet" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
     * @see HttpServlet#HttpServlet()
     * Default constructor of LoginServlet class
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    
    /**
     * This method Handles the POST request when user submits login form.
     */

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		// This Retrieves email and password from the login form UI.
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		// This creates an Admin type object
		Admin admin = new Admin();
		
		// This Instantiates CustomerDao class for accessing database operations related to Customer.
		CustomerDao customerDao = new CustomerDao();
		
		// This calls login method of CustomerDao class to authenticate user credentials.
		Customer customer = customerDao.login(email, password);
		
		// Prints email and password 
		System.out.println(email);
		System.out.println(password);
		
		// This Checks if customer is null and if admin credentials matches or not
		if ((customer == null) && !(admin.getEmail().equals(email) && admin.getPassword().equals(password))) {
			
			// This redirects anyone to registration page with error message, if customer is null and admin credentials don't match.
			System.out.println(1);
			HttpSession errorSession = request.getSession();
		    errorSession.setAttribute("invalidCustomer", "Invalid Credentials");
		    response.sendRedirect("pages/register.jsp");
		} else if (customer != null) {
			
			// This Create a session and redirects user to home pags, if customer is not null.
			System.out.println(2);
		    HttpSession session = request.getSession();
		    session.setAttribute("currentCustomer", customer);
		    session.setMaxInactiveInterval(1800);//for home page
		    response.sendRedirect("pages/index.jsp");
		} else if (admin.getEmail().equals(email) && admin.getPassword().equals(password)) {
			
			// This creates a session and redirects admin to admin panel, if the admin credentials matches.
			System.out.println(3);
		    HttpSession session = request.getSession();
		    session.setMaxInactiveInterval(1800); //for admin panel
		    session.setAttribute("Admin", admin);
		    response.sendRedirect("pages/adminHome.jsp");
		}

	}

}
