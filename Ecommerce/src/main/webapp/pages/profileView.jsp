<%@page import="com.model.Order"%>
<%@page import="Dao.OrderDao"%>
<%@page import="com.model.AddToCart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dao.AddToCartDao"%>
<%@page import="com.model.Customer"%>
<%
Customer customer = (Customer) session.getAttribute("currentCustomer");
if(customer == null){
	response.sendRedirect("register.jsp");
} else {
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
       
        /* Menu Options of the SideBar */

        .Whole-profile {
            display: flex;
            flex-direction: row;
            margin-bottom: 80px;
        }

        .Menu-options {
            position: static;
            box-shadow: #aaaaaa 10px 6px 14px;
            width: 15%;
            height: 50%;
            border: 1px solid grey;
            padding: 20px 45px 40px 30px;
            margin: 60px;
        }

        .Menu-options>h3 {
            width: max-content;
        }

        .Menu-options>a {
            display: inline-block;
            padding-top: 1.5vh;
            padding-bottom: 4vh;
            width: max-content;
            text-decoration: none;
        }

        /* Profile content */

        .User-Profile {
            text-align: center;
            font-family: sans-serif;
        }

        .profile-container {
            position: relative;
            display: flex;
            justify-content: center;
            width: 600px;
            /* Adjusted width */
            height: 30%;
            /* Adjusted height */
            padding: 20px 20px 20px 80px;
            margin: 60px auto;
            /* Centering the profile container */
            border: 0.5px solid #dddedc;
            border-radius: 20px;
            background-color: #f9f9f9;
            box-shadow: #aaaaaa 10px 6px 14px;
        }

        .profile-img>img {
            flex: 1;
            width: 200px;
            height: 200px;
            object-fit: cover;
            border-radius: 90%;
            overflow: hidden;
            box-shadow: #aaaaaa 10px;
        }

        /* Adjustments for the "Change Profile" button */
        .profile-img {
            position: relative;
            padding-top: 25px;
        }

        .change-profile {
            font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            font-size: 14px;
            /* Increased font size for better visibility */
            position: absolute;
            bottom: 120px;
            /* Adjust as needed */
            left: 50%;
            /* Center horizontally */
            transform: translateX(-50%);
            padding: 10px 30px;
            /* Adjusted padding for better fit */
            background-color: #007bff;
            /* Change to your desired color */
            color: #fff;
            cursor: pointer;
            text-align: center;
            border-radius: 7px;
            transition: background-color 0.3s;
            box-shadow: #aaaaaa 4px 3px 6px;
            white-space: nowrap;
            /* Prevents text wrapping */
        }

        .change-profile:hover {
            background-color: #0056b3;
            /* Change to your desired hover color */
        }

        /* Hide file input text */
        input[type="file"] {
            display: none;
        }

        /* Details after editing profile */
        .details {
            flex: 2;
            display: flex;
            flex-direction: column;
            /* Displaying details in columns */
            justify-content: center;
            /* Centering vertically */
            padding-left: 80px;
            /* Adjusted padding */
        }

        .input-text {
            display: flex;
            flex-direction: row;
            /* Displaying each record in a row */
            align-items: center;
            /* Aligning items vertically */
            margin-bottom: 10px;
            /* Adjusted margin between records */
            padding-top: 20px;
            padding-bottom: 20px;
        }

        .input-text h2 {
            margin: 0;
            font-size: 16px;
        }

        .input-text input {
            font-size: 14px;
            margin-left: 10px;
            width: 200px;
            height: 33px;
            border-radius: 5px;
            border: 1px solid #afafaf;
            outline: none;
        }

        .input-text #gender {
            margin-left: 10px;
            width: 200px;
            height: 33px;
            border-radius: 5px;
            border: 1px solid #afafaf;
            outline: none;
        }

        /* CSS for the buttons */
        .buttons {
            margin-top: 20px;
            /* Adjust as needed */
            text-align: justify;
        }

        .edit-profile,
        .save-changes {
            padding: 10px 20px;
            margin-right: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            box-shadow: #aaaaaa 4px 3px 6px;
            cursor: pointer;
            text-align: center;
        }

        .save-changes {
            display: none;
            /* Initially hide the Save Changes button */
        }

        .edit-profile:hover,
        .save-changes:hover {
            background-color: #0056b3;
        }

        .logout:hover {
            background-color: #c20c0c;
        }

        .logout {
            box-sizing: border-box;
            padding: 10px 20px;
            margin-top: 20px;
            margin-right: 10px;
            width: 35%;
            background-color: red;
            color: #fff;
            border: none;
            border-radius: 5px;
            box-shadow: #aaaaaa 4px 3px 6px;
            cursor: pointer;
            text-align: center;
        }
 #consumer-details {
    margin-top: 40px;
    text-align: center;
}

#consumer-details h1 {
    font-size: 1.8em;
    margin-bottom: 20px;
}

#consumer-list {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

#consumer-list th,
#consumer-list td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
}

#consumer-list th {
    background-color: #f2f2f2;
}

#consumer-list tr:nth-child(even) {
    background-color: #f2f2f2;
}

#consumer-list tr:hover {
    background-color: #ddd;
}
#consumer-details {
    margin-top: 40px;
    text-align: left; /* Align heading to the left */
}

#consumer-details h1 {
    font-size: 1.8em;
    margin-bottom: 20px;
}

#consumer-list {
    max-width: 100%; /* Ensure table doesn't exceed viewport */
    font-size: 14px; /* Reduce font size for better readability */
}

#consumer-list th,
#consumer-list td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
}

#consumer-list th {
    background-color: #f2f2f2;
}

#consumer-list tr:nth-child(even) {
    background-color: #f2f2f2;
}

#consumer-list tr:hover {
    background-color: #ddd;
}
#product-management {
    margin-top: 40px;
    text-align: left; /* Align content to the left */
    margin-right: auto; /* Add margin to the right for centering */
    margin-left: 20px; /* Adjust margin to move section to the left */
}


.delivery-status {
    width: 100%;
    padding: 6px; /* Reduce padding for compactness */
    border-radius: 5px;
    border: 1px solid #ccc;
    box-sizing: border-box;
    background-color: #fff;
}

.delivery-status {
    width: 100%;
    padding: 8px;
    border-radius: 5px;
    border: 1px solid #ccc;
    box-sizing: border-box;
    background-color: #fff;
}


        .delete-button,
        .small-button {
            background-color: red;
            color: #fff;
            padding: 6px 12px;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
            margin: 0 5px;
        }

        .delete-button:hover,
        .small-button:hover {
            background-color: #c0392b;
        }

        /* Pop-up form styles */
        .popup-form-container {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent background */
            justify-content: center;
            align-items: center;
        }

        .popup-form {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            width: 300px;
        }

        .popup-form label {
            display: block;
            margin-bottom: 10px;
        }

        .popup-form input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .popup-form button {
            background-color: #3498db;
            color: #fff;
            border: none;
            cursor: pointer;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s ease-in-out;
        }

        .popup-form button:hover {
            background-color: #2980b9;
      
    </style>
</head>

<body>
    <!-- Navigation Bar code is written here-->
    <nav>
      <div class="logo">
          <img src="${pageContext.request.contextPath}/img/icons/Durbar.png" alt="Digital Durbar Logo">
      </div>
      <ul class="nav-links1">
          <li class="main-links">
              <a href="${pageContext.request.contextPath}/pages/index.jsp">Home</a>
           <li class="main-links">
              <a href="/about us.html">About Us</a>
           </li>
          </li>
          </ul>
      <input type="text" class="search-bar" placeholder="Search Products...">
      <buttons id="searchButton"></buttons>
        <ul class="nav-links2">
            <li class="dropdown">
                <a href="${pageContext.request.contextPath}/pages/profileView.jsp"><img src="${pageContext.request.contextPath}/img/icons/account (1).png" alt=""></a>
            </li>
            <li class="dropdown">
                <a href="#"><img src="${pageContext.request.contextPath}/img/icons/shopping-cart.png" alt="" id="cart-link">
                </a>
                
            </li>
            <li class="dropdown">
                <a href="${pageContext.request.contextPath}/LogoutServlet">LogOut
                </a>
                
            </li>
        </ul>
      
  
  </nav>

    <!-- Profile View Page-->
    <div class="Whole-profile">
<%
Customer customer1 = (Customer) session.getAttribute("currentCustomer");
%>
        <!-- Main profile component container-->
        <div class="profile-container">
            <!-- Profile Image-->
            <div class="profile-img">
                <img id="profileImage" src="https://img.freepik.com/free-vector/user-circles-set_78370-4704.jpg?w=996&t=st=1714484821~exp=1714485421~hmac=2ed71f93759318e275af303d3c07814641c6283a27f15e3051e487d61c17ea3d">
            </div>
            <!-- The Details of a user's profile-->
            <div class="details">
            	<form action="${pageContext.request.contextPath}/UpdateCustomerProfileServlet" method="post">
	                <!-- Name of the user -->
	                <div class="input-text">
	                    <h2>Full Name:</h2>
	                    <input type="text" value="<%=customer1.getFullName() %>" name="fullName" placeholder="Enter your Name"><br><br>
	                </div>
	
	                <!-- Phone Number of the user -->
	                <div class="input-text">
	                    <h2>Phone Number:</h2>
	                    <input type="text" value="<%=customer1.getPhoneNumber() %>" name="phoneNumber" placeholder="Enter your PhoneNumber"><br><br>
	                </div>
	
	                <!-- Mail Address of the user -->
	                <div class="input-text">
	                    <h2>Email Address:</h2>
	                    <input type="email" value="<%=customer1.getEmail() %>" name="email" readonly="readonly"><br><br>
	                </div>
	                
	                <div class="input-text">
	                    <h2>Address:</h2>
	                    <input type="text" value="<%=customer1.getAddress()%>" name="address"><br><br>
	                </div>
				
                <!-- Edit Profile and Save changes button and LogOut button -->
                <div class="buttons">
                    <!-- Edit Profile -->
                    <button type="submit" style="width: 200px" id="editProfileBtn" class="edit-profile">Save Changes</button>
                </div>
                </form>
            </div>
        </div>
    </div>
    
    <%
    OrderDao orderDao = new OrderDao();
    ArrayList<Order> getAllOrder = (ArrayList<Order>) orderDao.getOrderForUser(customer.getID());
    %>
    
    <section id="consumer-details" style="margin-bottom: 5rem;">
        <h1>Order Details</h1>
        <table id="consumer-list">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Product Name</th>
                    <th>Order Date</th>
                    <th>Total Price</th>
                    <th>Qrder Status</th>
                    <th>QTY</th>
                </tr>
            </thead>
            <tbody>
                                    <%
                    for(Order p : getAllOrder){
                    %>
                <tr>
                    <td><%=p.getID() %></td>
                    <td><%=p.getProductName() %></td>
                    <td><%=p.getOrderDate() %></td>
                    <td>Rs <%=p.getTotalPrice() %></td>
                    <td><%=p.getOrderStatus() %></td>
					<td><%=p.getQuantity() %></td>
                </tr>
                                    <%
                    }
					%>
            </tbody>
        </table>
    </section>



<%-- <div id="cartContainer" class="cart-container">
    <div id="cartClose" class="close">X</div>
    <div id="cartHeading">Cart Items</div>
    <div id="cartItemsContainer" class="cart-items-container">
        <% if (customer != null) {
            int customerID = customer.getID();
            AddToCartDao addToCartDao = new AddToCartDao();
            ArrayList<AddToCart> cartItems = (ArrayList<AddToCart>) addToCartDao.getAllCartProduct(customerID);
            if (cartItems.isEmpty()) { %>
                <div class="cart-item">The cart is empty</div>
            <% } else {
                for (AddToCart cartItem : cartItems) { %>
                    <div class="cart-item">
                        <img src="http://localhost:8080/CW/ProductImg/<%= cartItem.getProductImageUrl() %>" alt="Product Name" style="width: 50px;">
                        <div class="quantity-container">
                            <p class="quantity-display" style="margin: 0 6px;">Qty: <%= cartItem.getQuantity() %></p>
                        </div>
                        <span>Rs <%=cartItem.getTotalPrice() %></span>
                        <a style="background-color: red; color: #fff; border: 1px solid #fffff; cursor: pointer; border-radius: 5px; padding: 6px 20px; border-top-right-radius: 0; border-bottom-right-radius: 0; text-decoration: none;" href="${pageContext.request.contextPath}/DeleteCartServlet?cartId=<%=cartItem.getID()%>">
                            Delete
                        </a>
                        <a style="background-color: green; color: #fff; border: 1px solid #fffff; cursor: pointer; border-radius: 5px; padding: 6px 20px; border-top-left-radius: 0; border-bottom-left-radius: 0; text-decoration: none;" href="${pageContext.request.contextPath}/PlaceOrder?cartId=<%=cartItem.getID()%>&productId=<%=cartItem.getProductID()%>&qty=<%=cartItem.getQuantity()%>&totalPrice=<%=cartItem.getTotalPrice()%>">
                            PlaceOrder
                        </a>
                    </div>
                <% }
            }
        } %>
    </div>
    <%if(customer!= null){ %>
    <button id="checkoutBtn">Checkout</button>
    <%} %>
</div> --%>


    <div class="benefits">
        <div class="policy">
            <div class="policy-item">
                <img src="${pageContext.request.contextPath}/img/icons/free-delivery.png" alt="Free Shipping">
                <h3>Free Shipping</h3>
                <p>Free Shipping All Over Nepal</p>
            </div>
            <div class="policy-item">
                <img src="${pageContext.request.contextPath}/img/icons/genuine.png" alt="100% Genuine">
                <h3>100% Genuine</h3>
                <p>100% Genuine Products</p>
            </div>
            <div class="policy-item">
                <img src="${pageContext.request.contextPath}/img/icons/exchange.png" alt="Easy Return">
                <h3>Easy Return Policy</h3>
                <p>3 Days Easy Return Policy</p>
            </div>
            <div class="policy-item">
                <img src="${pageContext.request.contextPath}/img/icons/secure-payment.png" alt="Shop Online">
                <h3>Secure Payment</h3>
                <p>Shop Online Without Hesitation</p>
            </div>
        </div>
    </div>
    <footer class="footer">
        <div class="footer-logo">
            <img src="${pageContext.request.contextPath}/img/icons/Durbar.png" alt="Digital Durbar Logo">
            <div class="footer-company-info">
                <p>Digital Durbar is your one-stop shop for all your laptop needs. We provide high-quality laptops at affordable prices.</p>
                <p>Contact us: info@digitaldurbar.com</p>
            </div>
        </div>
        <div class="footer-quick-links">
            <h3>Quick Links</h3>
            <ul>
                <li><a href="#">Gaming Laptops</a></li>
                <li><a href="#">Business Laptops</a></li>
                <li><a href="#">Student Laptops</a></li>
                <li><a href="#">Workstation Laptops</a></li>
                <li><a href="#">About</a></li>
                <li><a href="#">Blogs</a></li>
                <li><a href="#">More</a></li>
            </ul>
        </div>
        <div class="footer-about">
            <h3>About</h3>
            <p>We are committed to providing the best customer experience and top-notch products. Learn more about our company and our mission.</p>
        </div>
        <div class="footer-sign-in">
            <h3>Sign In</h3>
            <p>Please sign in to access your account or create one to start shopping.</p>
            <div class="footer-sign-in-form">
                <input type="email" placeholder="Enter your email address">
                <input type="submit" value="Submit">
            </div>
        </div>
    </footer>
    
    <script src="${pageContext.request.contextPath}/js/index.js"></script>
    <script src="${pageContext.request.contextPath}/js/cart.js"></script>
</body>

</html>
<%
}
%>