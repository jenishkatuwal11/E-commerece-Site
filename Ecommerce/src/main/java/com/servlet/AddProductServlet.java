package com.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.model.Product;

import Dao.ProductDao;

/**
 * Servlet implementation class AddProductServlet
 * This servlet handles the New product addition by Admin
 */

@WebServlet(asyncSupported = true, urlPatterns = { "/AddProductServlet" })
@MultipartConfig
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 /**
     * @see HttpServlet#HttpServlet()
     * Constructor for Add Product Servlet
     */

    public AddProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    
    /**
     *  This method handles the POST request for new product addition 
     */

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		// gets all the attributes of the product to be added 
		String productName = request.getParameter("productName");
		String productPrice = request.getParameter("productPrice");
		Part part = request.getPart("productImg");
		
		// This creates a directory for the image uploaded to be saved
		File fileSaveDir = new File(Product.IMAGE_DIR_SAVE_PATH);
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}
		
		// This generates the unique name for the uploaded image 
		String originalFileName = Product.getFileName(part);
		
		// This extractst the file extension and creates a new file name 
		String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
		String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(Calendar.getInstance().getTime());
		String newFileName = timeStamp + fileExtension;
		
		// This saves the uploaded image to the specified directory
		part.write(Product.IMAGE_DIR_SAVE_PATH + File.separator + newFileName);
		
		// This creates a new product object with the provided details.
		Product product = new Product(productName, Integer.parseInt(productPrice), newFileName);
		
		// This instantiates ProductDao class for accessing database operations related to Product.
		ProductDao productDao = new ProductDao();
		
		// Checking to register the new product in the database
		if (productDao.registerProduct(product)) {
			
			// If product registration is successful, this redirects admin to the admin home page.
			response.sendRedirect("pages/adminHome.jsp");
		} else {
			
			// If product registration fails, this displays an error message.
			out.println("Something went wrong. Try again!!!");
		}
	}

}
