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
import Dao.OrderDao;

/**
 * Servlet implementation class PlaceOrder
 * This servlet implements and handles the HTTP request if Pacing Order from Cart
 */

@WebServlet(asyncSupported = true, urlPatterns = { "/PlaceOrder" })
public class PlaceOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	/**
	 * Constructor of Place Order Servlet
	 */

    public PlaceOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    /**
     * This method handles the GET method for placing the desired order of the user from the cart 
     */

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		// This retrieves the required parameters of the Cart from the request
		int cartId = Integer.parseInt(request.getParameter("cartId"));
		int productId = Integer.parseInt(request.getParameter("productId"));
		int qty = Integer.parseInt(request.getParameter("qty"));
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		
		// This Gets the redirection referer URL
		String referer = request.getHeader("referer");
		
		// This gets the user session
		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("currentCustomer");
		
		int customerId = customer.getID();
		
		// This created an instance of OrderDao class to get all the database operations methods related to Orders
		OrderDao orderDao = new OrderDao();
		
		// This checks the condition to place the order
		if (orderDao.checkOut(productId, customerId, totalPrice, qty)) {
			
			// If cart item is successfully deleted, this redirects the user to the previous page
			AddToCartDao addToCart = new AddToCartDao();
			out.println("product added");
			if (addToCart.deleteCartItem(cartId)) {
				response.sendRedirect(referer);
			} else {
				// error message for Deletion failed
				out.println("product added and cart not deleted");
			}
		} else {
			// If order placement fails, display an error message
			out.println("product not");
		}

		out.print(cartId);
		out.print(productId);
	}

}
