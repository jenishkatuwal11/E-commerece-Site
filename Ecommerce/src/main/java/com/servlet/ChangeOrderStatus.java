package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.OrderDao;

/**
 * Servlet implementation class ChangeOrderStatus
 * This servlet handles the Changing Order status after order palcement request 
 * is verified by Admin
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/ChangeOrderStatus" })
public class ChangeOrderStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeOrderStatus() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    /*
     * This method handles the GET request to change the order status by admin
     */

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		// This retrieves order status and order ID from the request parameters
		String status = request.getParameter("status");
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		
		// This gets the redirection referrer URL
		String referer = request.getHeader("referer");
		
		// This instantiates OrderDao class for accessing database operations related to orders.
		OrderDao orderDao = new OrderDao();
		System.out.println(status);
		
		// Check the condition for status and perform appropriate actions
		if("yes".equals(status)) {
			System.out.println(1);
			// If status is "Yes", marks the order as shipped
			orderDao.ShipOrder(orderId);
			// This redirects the user back to the previous Order page.
			response.sendRedirect(referer);
		} else if("no".equals(status)) {
			System.out.println(2);
			// If status is "No", declines the order
			orderDao.DeclineOrder(orderId);
			// redirect the user back to the previous page
			response.sendRedirect(referer);
		}
	}

}
