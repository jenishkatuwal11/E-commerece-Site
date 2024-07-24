package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.ProductDao;

/**
 * Servlet implementation class ProductSearchServlet
 * Thos servlet handles the product search feature
 */

@WebServlet(asyncSupported = true, urlPatterns = { "/ProductSearchServlet" })
public class ProductSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 /**
     * @see HttpServlet#HttpServlet()
     * Constructor of Product Search Servlet.
     */

    public ProductSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * This method Handles the GET request for product searching 
	 */

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		// This retrieves the search item from request parameter.
		String serchItem = request.getParameter("serchItem");
		
		// This gets the name of the previous page for redirection.
		String pageName = request.getHeader("referer");

		String forward;
//		if (serchItem == null || serchItem.trim().isEmpty()) {
////			forward = pageName;
////			RequestDispatcher patcher = request.getRequestDispatcher(forward);
////			patcher.forward(request, response);
//			response.sendRedirect(pageName);
//		}
		// This forward the user to searchProduct.jsp Page.
		forward = "pages/searchProduct.jsp";
		RequestDispatcher patcher = request.getRequestDispatcher(forward);
		
		// This launches ProductDao class to gain access to Product-related database functions.
		ProductDao productDao = new ProductDao();
		
		// This Sets the attribute 'productList' to the search results
		request.setAttribute("productList", productDao.getSerchItem(serchItem));
		
		// This sends the request and answer to the page searchProduct.jsp.
		patcher.forward(request, response);

	}



}
