// Comes under package named 'Com'
package com.servlet;

//Imported package libraries
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.PasswordEncryption.PasswordEncryptionWithAes;
import com.model.Customer;

import Dao.CustomerDao;

/**
 * Servlet implementation class SignupServlet
 * This servlet handles new user register functionality.
 */

@WebServlet(asyncSupported = true, urlPatterns = { "/SignupServlet" })
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
     * @see HttpServlet#HttpServlet()
     * Constructor of Signup Servlet
     */

    public SignupServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    /**
     * This method handles the GET request for this servlet.
     */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter printWriter = response.getWriter();
		response.setContentType("text/html");
		printWriter.print("Hello World");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	/**
	 * This method handles POST request of when the user submits registration form
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		
		// This retrieves the user details from the registration form page.
		String fullName = request.getParameter("fullName");
		String email = request.getParameter("email");
		String phoneNumber = request.getParameter("phoneNumber");
		String address = request.getParameter("address");
		String password = PasswordEncryptionWithAes.encrypt(email, request.getParameter("password"));
		
		// This encrypts the password before storing it in the database
		Customer customer = new Customer(fullName, email, phoneNumber, password, address);
		
		// This instantiates CustomerDao class for accessing database operations related to Customer.
		CustomerDao customerDao = new CustomerDao();
		
		// On successful registration redirects the user the Register page.
		if(customerDao.registerCustomer(customer)) {
			//out.println("You have registered successfully.");
			response.sendRedirect("pages/register.jsp");
		}else {
			// Incase registartion fails, this redirects the user back to Register page.
			//out.println("Something went wrong. Try again!!!");
			HttpSession errorSession = request.getSession();
		    errorSession.setAttribute("invalidCustomer", "Something went wrong");
			response.sendRedirect(request.getHeader("referer"));
		}

	}

}
