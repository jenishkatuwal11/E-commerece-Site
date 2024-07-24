<%@page import="com.model.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
Customer customer = (Customer) session.getAttribute("currentCustomer");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/aboutus.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css">
    <link rel="stylesheet" href="aboutus.css">
    <link rel="stylesheet" href="cart.css">
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
        <a style="margin-left: 100px; text-decoration: none;" href="${pageContext.request.contextPath}/pages/register.jsp" class="register-button">Register</a>
         <li class="dropdown">
                <a href="#" onclick="alert('Please Login')" style="text-decoration: none;"><img src="${pageContext.request.contextPath}/img/icons/shopping-cart.png" alt="">
                </a>
                
            </li>
		<%} %>
    </nav>
   <!-- Cart container -->
   <div id="cartContainer" class="cart-container">
        <div id="cartClose" class="close">X</div>
        <div id ="cartHeading">Cart Items</div>
        <div id="cartItems" class="cart-items">The cart is empty</div>
        <p id="cartTotalAmount">Total: Rs 0</p>
        <button id="checkoutBtn">Checkout</button>
    </div>
    <div class="container">
        <img src="${pageContext.request.contextPath}/img/laptop1.jpg" alt="laptop">
        <div class="text-block">
            <p style="line-height: 35px;">We are dedicated to bridging the digital divide with eco-friendly solutions that empower users worldwide while preserving our planet for future generations.</p>
        </div>
    </div>
    <div class ="heading">
        <h1>Our Services</h1>
    </div>
     <section class="services">
         <!-- This heading is now at the top of the section -->
        <div class="services-content"> <!-- New wrapper for the text and image -->
            <div class="text-content">
                <h3 style="font-size: 40px">Best Quality</h3><br> <!-- Added "Best Quality" heading -->
                <p style="word-spacing: 3px; line-height: 30px;">We continuously strive to enhance our production techniques and services by engaging in ongoing research and development, all while upholding the utmost quality standards. Our aim is to deliver unparalleled service to our clients, ensuring that every task is executed with precision and efficiency.</p>
            </div>
            <img src="${pageContext.request.contextPath}/img/laptop2.jpg" alt="best-quality">
        </div>
        
    </section>
    <section class="services2">
         <!-- This heading is now at the top of the section -->
        <div class="services-content2"> 
            <img src="${pageContext.request.contextPath}/img/customer-service.jpg" alt="customer-service"><!-- New wrapper for the text and image -->
            <div class="text-content2">
                <h3 style="font-size: 40px">Customer Support</h3><br><!-- Added "Best Quality" heading -->
                <p style="word-spacing: 3px; line-height: 30px;">We are relentlessly committed to elevating our customer service experience through constant innovation and the refinement of our approaches. By engaging in ongoing research and development, we maintain the highest standards of quality in every interaction. Our goal is to provide unmatched service to our clients, ensuring every inquiry and request is handled with meticulous care and promptness.</p>
            </div>
        </div>
        
    </section>
      <div class="container2">
    <div class="form-container">
      <h2>Contact Form</h2><br>
      <form id="contact-form">
        <div class="form-group">
          <label for="email">Email Address:</label>
          <input type="email" id="email" name="email" required>
          <span class="error-message"></span>
        </div>
        <div class="form-group">
          <label for="message">Message:</label>
          <textarea id="message" name="message" required></textarea>
          <span class="error-message"></span>
        </div>
        <button type="submit" class="submit-button">Submit</button>
      </form>
    </div>

    <div class="contact-info">
      <h2>Contact Information</h2><br>
      <h3>Our Locations</h3>
      <p>Kathmandu, Nepal</p>
      <p>Bhaktapur, Nepal</p><br>
      <h3>Contact Us</h3>
      <p>+977 9821092367, +977 9856719923</p>
      <p>+977 1 4456278, +977 1 4467234</p><br>
      <h3>Email Us</h3>
      <p>@info.digitaldurbar.com.np</p>
    </div>
  </div>
  <script>
    const form = document.getElementById('contact-form');
const emailInput = document.getElementById('email');
const messageInput = document.getElementById('message');
const emailError = document.querySelector('.form-group:nth-child(1) .error-message');
const messageError = document.querySelector('.form-group:nth-child(2) .error-message');

form.addEventListener('submit', (event) => {
  event.preventDefault();

  let isValid = true;

  // Email validation
  if (!emailInput.value.trim()) {
    isValid = false;
    emailError.textContent = 'Email is required';
  } else if (!/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(emailInput.value)) {
    isValid = false;
    emailError.textContent = 'Please enter a valid email address';
  }

  // Message validation (optional)
  if (!messageInput.value.trim()) {
    isValid = false;
    messageError.textContent = 'Message is required';
  }

  // If validation fails, prevent form submission
  if (!isValid) {
    return;
  }

  // If validation passes, submit the form (implementation depends on your backend)
  console.log('Form submitted successfully!'); // Simulate form submission
});
</script>
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

    <script type="text/javascript" src="cart.js"></script>
    <script type="text/javascript" src="index.js"></script>
</body>
</html>