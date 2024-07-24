<%@page import="com.model.AddToCart"%>
<%@page import="Dao.AddToCartDao"%>
<%@page import="com.model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dao.ProductDao"%>
<%@page import="com.*" %>
<%
Customer customer = (Customer) session.getAttribute("currentCustomer");
%>
<!DOCTYPE html>
<%@page import="com.model.Customer"%>
<head>
    <title>Monthly Offer - Top Deals</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <nav>
        <div class="logo">
            <img src="${pageContext.request.contextPath}/img/icons/Durbar.png" alt="Digital Durbar Logo">
        </div>
        <ul class="nav-links1">
            <li class="main-links">
                <a href="${pageContext.request.contextPath}/pages/index.jsp">Home</a>
            </li>
            <li class="main-links">
                <a href="${pageContext.request.contextPath}/pages/aboutus.jsp">About Us</a>
             </li>
            </ul>
        <form action="${pageContext.request.contextPath}/ProductSearchServlet"
				method="get" style="display: flex;">
        <input name="serchItem" type="text" class="search-bar" placeholder="Search Products...">
        <input type="submit" value="search">
        </form>
        <%if(customer != null) {%>
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
        <%} %>
        <%if(customer == null){ %>
        <a style="margin-left: 100px; text-decoration: none;" href="${pageContext.request.contextPath}/pages/register.jsp" class="register-button">Login</a>
         <li class="dropdown">
                <a href="#" onclick="alert('Please Login')" style="text-decoration: none;"><img src="${pageContext.request.contextPath}/img/icons/shopping-cart.png" alt="">
                </a>
                
            </li>
		<%} %>
    </nav>
        <div class="slider-container">
            <img src="${pageContext.request.contextPath}/img/dell-alienware-laptop-price-in-nepal.webp" class="slide active" alt="laptop1">
            <img src="${pageContext.request.contextPath}/img/apple-macbook-price-in-nepal.webp" class="slide" alt="laptop2">
            <img src="${pageContext.request.contextPath}/img/hp-laptop-price-in-nepal.webp" class="slide" alt="laptop3">
            <button class="prev-btn">&#10094;</button> <button class="next-btn">&#10095;</button>
        </div>
        
    </header>
    
		<%
		ProductDao productDao = new ProductDao();
       	ArrayList<Product> getAllProduct = (ArrayList<Product>) productDao.getAllProduct();
		%>
    <main>
        <div class="search-container">
            <h1>Our Products</h1>
            <br/>
        </div>
        <div class="product-grid">
        	<%
        	for(Product p : getAllProduct){
        	%>
             <div class="product">
                <img src="http://localhost:8080/CW/ProductImg/<%=p.getProductImgUrl()%>" alt="Product 1">
                <h5><%=p.getProductName() %></h5>
                <p class="price">Rs <%=p.getProductPrice() %></p>
                <%if(customer != null){ %>
                <a href="${pageContext.request.contextPath}/AddProductToCartServlet?productId=<%=p.getID() %>" style="background-color: #74E291; padding: 7px 50px; color: #fff;" class="add-to-cart">
                	Add to Cart
                </a>
                <%}else{
                	%>
                	<a href="" onclick="alert('Please Login')"  style="background-color: #74E291; padding: 7px 50px; color: #fff;" class="add-to-cart">
                	Add to Cart
                </a>
                	<% 
                	
                } %>
            </div>
            <%
        	}
        	%>
            <!-- Add more product cards here -->
		</div>
    </main>

    <div id="cartContainer" class="cart-container">
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
</div>


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