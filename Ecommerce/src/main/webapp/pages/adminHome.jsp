<%@page import="com.model.Admin"%>
<%@page import="com.model.Order"%>
<%@page import="Dao.OrderDao"%>
<%@page import="com.model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dao.ProductDao"%>
<%
Admin admin = (Admin) session.getAttribute("Admin");
if (admin == null) {
	response.sendRedirect("register.jsp");
} else {
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        #product-list {
    width: auto;
    table-layout: auto;
}

#product-list th,
#product-list td {
    padding: 8px;
    border: 1px solid #ddd;
    word-wrap: break-word;
    max-width: 300px; /* Optional: Set a maximum width for the cells */
    overflow: hidden;
}

        header {
            background-color: #3498db;
            color: #fff;
            padding: 30px 20px; /* Increased padding */
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        header h1 {
            font-size: 2em;
            margin: 0;
            font-weight: bold;
            text-transform: uppercase;
        }
        header {
            background-color: #3498db;
            color: #fff;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        header h1 {
            font-size: 2em;
            margin: 0;
            font-weight: bold;
            text-transform: uppercase;
        }

        .nav-links {
            display: flex;
            list-style-type: none;
            margin: 0;
            padding: 0;
        }

        .nav-links li {
            margin-right: 20px;
        }

        .nav-links li a {
            color: #fff;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease-in-out;
        }

        .nav-links li a:hover {
            color: #ddd;
        }

        /* User profile dropdown menu styles */
        .user-info {
            position: relative;
        }

        #profile-pic {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            cursor: pointer;
        }

        .dropdown-menu {
            position: absolute;
            top: calc(100% + 10px);
            right: 0;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            display: none;
            z-index: 1;
            min-width: 180px;
            padding: 10px 0;
        }

        .dropdown-menu.show {
            display: block;
        }

        .dropdown-menu p {
            margin: 5px 0;
            padding: 0 20px;
            font-size: 14px;
            color: #333;
        }
        .logout-button {
            background-color: red;
            color: white;
        }
        .dropdown-menu button {
            display: block;
            width: 100%;
            padding: 10px 0;
            background-color: transparent;
            border: none;
            border-top: 1px solid #ccc;
            color: #333;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

        .dropdown-menu button:hover {
            background-color: #f9f9f9;
        }

        .dropdown-menu button:last-child {
            border-bottom-left-radius: 5px;
            border-bottom-right-radius: 5px;
        }

        .nav-links {
            display: flex;
            list-style-type: none;
            margin: 0;
            padding: 0;
        }

        .nav-links li {
            margin-right: 20px;
        }

        .nav-links li a {
            color: #fff;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease-in-out;
        }

        .nav-links li a:hover {
            color: #ddd;
        }

        .user-info {
            position: relative;
            text-align: center; /* Centered */
            display: flex;
            align-items: center;
            margin-right: 90px; /* Decreased margin */
        }

        .user-info p {
            margin: 0 10px;
            color: #fff;
            font-size: 14px;
        }

        .user-info p#user-name,
        .user-info p#user-email {
            font-weight: bold; /* Bold */
        }

        .user-info img {
            width: 50px; /* Increased size */
            height: 50px; /* Increased size */
            border-radius: 50%;
            cursor: pointer;
        }

        .dropdown-menu {
            position: absolute;
            top: calc(100% + 15px); /* Increased top spacing */
            left: 50%;
            transform: translateX(-50%); /* Centered horizontally */
            background-color: #fff;
            border-radius: 15px; /* Rounded edges */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            display: none;
            z-index: 1;
            width: 200px; /* Decreased width */
            padding: 20px;
            text-align: center; /* Centered horizontally */
        }

        .dropdown-menu a {
            display: block;
            padding: 10px 0;
            text-decoration: none;
            color: #333;
            transition: background-color 0.3s ease-in-out;
        }

        .dropdown-menu a:hover {
            background-color: #f1f1f1;
        }

        .dropdown-menu p {
            margin: 10px 0;
            color: #777;
        }

        main {
            padding: 20px;
        }

        .metrics-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .metric {
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            width: calc(30% - 20px);
            margin-bottom: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out;
        }

        .metric:hover {
            transform: translateY(-5px);
        }

        .metric h2 {
            font-size: 1.5em;
            margin-bottom: 10px;
            color: #333;
        }

        .metric p {
            margin-bottom: 5px;
            color: #777;
        }

        .logout-button {
            background-color: red;
            color: red;
            padding: 8px 20px;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

        .logout-button:hover {
            background-color: #c0392b;
        }

        /* Show dropdown menu on click */
        .user-info.show .dropdown-menu {
            display: block;
        }

        /* Additional styles for product management */
        #product-management {
            margin-top: 40px;
            text-align: center;
        }

        #product-management h1 {
            font-size: 1.8em;
            margin-bottom: 20px;
        }

        #product-management img {
            width: 150px;
            height: 150px;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        #add-product-form {
            margin-bottom: 20px;
        }

        #add-product-form label {
            display: block;
            margin-bottom: 5px;
        }

        #add-product-form input[type="text"],
        #add-product-form input[type="file"],
        #add-product-form input[type="number"],
        #add-product-form button {
            width: calc(50% - 5px);
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        #add-product-form button {
            background-color: #3498db;
            color: #fff;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

        #add-product-form button:hover {
            background-color: #2980b9;
        }

        #product-list {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        #product-list th,
        #product-list td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        #product-list th {
            background-color: #f2f2f2;
        }

        #product-list tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        #product-list tr:hover {
            background-color: #ddd;
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
        }
        
    </style>
</head>
<body>
    <header>
        <h1>Admin Panel</h1>
        <ul class="nav-links">
            <li><a href="#">Dashboard</a></li>
            
        </ul>
        <!-- User profile dropdown menu -->
        <div class="user-info">
            <img src="https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=2564&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="Profile Picture" id="profile-pic" style="object-fit: cover;">
                <a href="${pageContext.request.contextPath}/LogoutServlet" style="text-decoration: none; color: #fff; padding-left: 5px">LogOut
                </a>
                
            <div class="dropdown-menu" id="dropdown-menu">
                <p id="user-name">Name: <strong>Admin</strong></p><hr>
                <p id="user-email">Email: <strong>admin@gmail.com</strong></p>
                <hr>
                <p id="user-phone">Phone: <strong>9805645824</strong></p>
                <button id="logout-button" class="logout-button">Log Out</button>
            </div>
        </div>
    </header>
    <div id="product-management">
        <h1>Add Product</h1>
        <!-- Form for adding new product -->
        <form id="add-product-form" action="../AddProductServlet" method="post" enctype="multipart/form-data" style="border-bottom: 5px solid #4793AF; border-top: 5px solid #4793AF; padding: 1rem;">
            <label for="product-name">Product Name:</label>
            <input type="text" name="productName" required>
            <br/>
            <label for="product-model">Product Price:</label>
            <input type="number" name="productPrice" required>
            <br/>
            <label for="product-image">Product Image:</label>
            <input type="file" name="productImg" required>
            <br/>
            <button type="submit" class="small-button">Add Product</button>
        </form>

        <!-- Button for opening product specification popup -->
        <button id="open-specs-popup" class="small-button">Specification of Product</button>
		
		<!--  -->
		<%
		ProductDao productDao = new ProductDao();
       	ArrayList<Product> getAllProduct = (ArrayList<Product>) productDao.getAllProduct();
		%>
		<!--  -->
		
        <!-- Table for displaying existing products -->
        <table id="product-list">
            <thead>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Product Name</th>
                        <th>Product Price</th>
                        <th>Product Image</th>
                        <th>Edit</th>
                    </tr>
                    <%
                    for(Product p : getAllProduct){
                    %>
                    <form action="../EditProductServlet" method="post">
                    <tr>
                        <td><input name="productId" value="<%=p.getID() %>" readonly="readonly"></td>
                        <td><input name="productName" value="<%=p.getProductName() %>"></td>
                        <td>Rs <input name="productPrice" value="<%=p.getProductPrice() %>"></td>
                        <td>
	                        <img
							src="http://localhost:8080/CW/ProductImg/<%=p.getProductImgUrl()%>"
							alt="Product" class="trending-img" />
						</td>
                        <td><input type="submit" value="Edit" style="text-decoration: none; padding: 6px 30px; background-color: green; color: #fff; border-bottom-left-radius: 8px; border-top-left-radius: 8px; border: none; cursor: pointer;"><a href="../DeleteProduct?id=<%=p.getID()%>" style="text-decoration: none; padding: 5px 30px; background-color: red; color: #fff; border-bottom-right-radius: 8px; border-top-right-radius: 8px;">Delete</a></td>
                    </tr>
                    </form>
                    <%
                    }
					%>
                </thead>
                
            </thead>
            <tbody>
                <!-- Table rows for existing products will be added dynamically -->
            </tbody>
        </table>

        <!-- Popup form for product specifications -->
        <div class="popup-form-container" id="popup-form-container">
            <div class="popup-form">
                <h2>Product Specifications</h2>
                <label for="processor">Processor:</label>
                <input type="text" id="processor" required>
                <label for="memory">Memory:</label>
                <input type="text" id="memory" required>
                <label for="storage">Storage:</label>
                <input type="text" id="storage" required>
                <label for="display">Display:</label>
                <input type="text" id="display" required>
                <label for="graphics">Graphics:</label>
                <input type="text" id="graphics" required>
                <label for="keyboard">Keyboard:</label>
                <input type="text" id="keyboard" required>
                <label for="os">Operating System:</label>
                <input type="text" id="os" required>
                <button id="save-specs" class="small-button">Save</button>
            </div>
        </div>
    </div>
    
        <%
    OrderDao orderDao = new OrderDao();
    ArrayList<Order> getAllOrder = (ArrayList<Order>) orderDao.getAlOrder();
    ArrayList<Order> getAllCompletedOrder = (ArrayList<Order>) orderDao.getAllCompleteOrder();
    ArrayList<Order> getAllDeclineOrder = (ArrayList<Order>) orderDao.getAllDECLINEOrder();
    %>
<section id="consumer-details" style="margin-bottom: 5rem;">
        <h1>Pending Order Details</h1>
        <table id="consumer-list">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Product Name</th>
                    <th>Customer ID</th>
                    <th>Order Date</th>
                    <th>Total Price</th>
                    <th>Qrder Status</th>
                    <th>QTY</th>
                    <th>EDIT</th>
                </tr>
            </thead>
            <tbody>
                                                    <%
                    for(Order p : getAllOrder){
                    %>
                <tr>
                    <td><%=p.getID() %></td>
                    <td><%=p.getProductName() %></td>
                    <td><%=p.getCustomerId() %></td>
                    <td><%=p.getOrderDate() %></td>
                    <td>Rs <%=p.getTotalPrice() %></td>
                    <td><%=p.getOrderStatus() %></td>
					<td><%=p.getQuantity() %></td>
					<td style="text-align: center;"><a href="${pageContext.request.contextPath}/ChangeOrderStatus?status=yes&orderId=<%=p.getID() %>" style="text-decoration: none; padding: 4px 30px; background-color: green; color: #fff; border-bottom-left-radius: 8px; border-top-left-radius: 8px;">Ship</a><a href="${pageContext.request.contextPath}/ChangeOrderStatus?status=no&orderId=<%=p.getID() %>" style="text-decoration: none; padding: 4px 30px; background-color: red; color: #fff; border-bottom-right-radius: 8px; border-top-right-radius: 8px;">Decline</a></td>
                </tr>
                    <%
                    }
					%>
            </tbody>
        </table>
    </section>
    
    <section id="consumer-details" style="margin-bottom: 5rem;">
        <h1>Ship Order Details</h1>
        <table id="consumer-list">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Product Name</th>
                    <th>Customer ID</th>
                    <th>Order Date</th>
                    <th>Total Price</th>
                    <th>Qrder Status</th>
                    <th>QTY</th>
                </tr>
            </thead>
            <tbody>
                                                    <%
                    for(Order c : getAllCompletedOrder){
                    %>
                <tr>
                    <td><%=c.getID() %></td>
                    <td><%=c.getProductName() %></td>
                    <td><%=c.getCustomerId() %></td>
                    <td><%=c.getOrderDate() %></td>
                    <td>Rs <%=c.getTotalPrice() %></td>
                    <td><%=c.getOrderStatus() %></td>
					<td><%=c.getQuantity() %></td>
                    <%
                    }
					%>
            </tbody>
        </table>
    </section>
    
    <section id="consumer-details" style="margin-bottom: 5rem;">
        <h1>Decline Order Details</h1>
        <table id="consumer-list">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Product Name</th>
                    <th>Customer ID</th>
                    <th>Order Date</th>
                    <th>Total Price</th>
                    <th>Qrder Status</th>
                    <th>QTY</th>
                </tr>
            </thead>
            <tbody>
                                                    <%
                    for(Order d : getAllDeclineOrder){
                    %>
                <tr>
                    <td><%=d.getID() %></td>
                    <td><%=d.getProductName() %></td>
                    <td><%=d.getCustomerId() %></td>
                    <td><%=d.getOrderDate() %></td>
                    <td>Rs <%=d.getTotalPrice() %></td>
                    <td><%=d.getOrderStatus() %></td>
					<td><%=d.getQuantity() %></td>
                    <%
                    }
					%>
            </tbody>
        </table>
    </section>
    
</main>

<!-- Script remains unchanged -->

    <script>
        
        
        document.addEventListener("DOMContentLoaded", () => {
    const userImg = document.getElementById('profile-pic');
    const dropdownMenu = document.getElementById('dropdown-menu');

    // Event listener for "Change Profile Photo" button
    document.getElementById('change-photo').addEventListener('click', () => {
        // Open file dialog to allow the user to select an image file
        const input = document.createElement('input');
        input.type = 'file';
        input.accept = 'image/*';
        input.onchange = (event) => {
            const file = event.target.files[0];
            // Check if a file was selected
            if (file) {
                // Read the selected file as a data URL
                const reader = new FileReader();
                reader.readAsDataURL(file);
                reader.onload = () => {
                    // Update the src attribute of the profile picture with the data URL
                    userImg.src = reader.result;
                };
            }
        };
        input.click(); // Click the input element to trigger the file dialog
    });

    // Rest of your JavaScript code...
});

        
        document.addEventListener("DOMContentLoaded", () => {
            // JavaScript code remains unchanged
            const userImg = document.getElementById('profile-pic');
            const dropdownMenu = document.getElementById('dropdown-menu');

            userImg.addEventListener('click', () => {
                dropdownMenu.classList.toggle('show');
            });

            const logoutButton = document.getElementById('logout-button');
            logoutButton.addEventListener('click', () => {
                console.log('Logged out');
            });

            const changePhotoLink = document.getElementById('change-photo');
            changePhotoLink.addEventListener('click', () => {
                console.log('Changing user photo');
            });

            const editProfileLink = document.getElementById('edit-profile');
            editProfileLink.addEventListener('click', () => {
                console.log('Editing profile information');
            });
        });
      
    

    addProductForm.addEventListener('submit', (event) => {
        event.preventDefault();

        const productName = document.getElementById('product-name').value;
        const productModel = document.getElementById('product-model').value;
        const productImage = document.getElementById('product-image').files[0];

        const newRow = productList.insertRow();
        const imageCell = newRow.insertCell(0);
        const nameCell = newRow.insertCell(1);
        const modelCell = newRow.insertCell(2);
        const dateCell = newRow.insertCell(3);
        const editCell = newRow.insertCell(4);
        const deleteCell = newRow.insertCell(5);

        const reader = new FileReader();
        reader.onload = function (e) {
            const img = document.createElement("img");
            img.src = e.target.result;
            img.style.maxWidth = "100px"; // Adjust image size as needed
            imageCell.appendChild(img);
        }
        reader.readAsDataURL(productImage);

        nameCell.textContent = productName;
        modelCell.textContent = productModel;
        dateCell.textContent = new Date().toISOString().slice(0, 10);
        editCell.innerHTML = '<span class="edit-icon">&#9998;</span>';
        deleteCell.innerHTML = '<button class="delete-button">Delete</button>';

        deleteCell.querySelector('.delete-button').addEventListener('click', confirmDelete);

        addProductForm.reset();
    });

    productList.addEventListener('click', (event) => {
        if (event.target.classList.contains('delete-button')) {
            confirmDelete(event);
        }
    });

    document.getElementById('open-specs-popup').addEventListener('click', () => {
        popupFormContainer.style.display = 'flex';
    });
    document.addEventListener("DOMContentLoaded", () => {
    // Existing JavaScript code remains unchanged
    
    // Function to handle editing product details
    function editProduct(event) {
        const row = event.target.closest('tr');
        const cells = row.querySelectorAll('td');

        // Extracting existing product details from the table row
        const productName = cells[1].textContent;
        const productModel = cells[2].textContent;
        const processor = cells[6].textContent;
        const memory = cells[7].textContent;
        const storage = cells[8].textContent;
        const display = cells[9].textContent;
        const graphics = cells[10].textContent;
        const keyboard = cells[11].textContent;
        const os = cells[12].textContent;

        // Populating the edit form with existing details
        document.getElementById('product-name').value = productName;
        document.getElementById('product-model').value = productModel;
        document.getElementById('processor').value = processor;
        document.getElementById('memory').value = memory;
        document.getElementById('storage').value = storage;
        document.getElementById('display').value = display;
        document.getElementById('graphics').value = graphics;
        document.getElementById('keyboard').value = keyboard;
        document.getElementById('os').value = os;

    // Adding event listener to all edit buttons
    const editButtons = document.querySelectorAll('.edit-icon');
    editButtons.forEach(button => {
        button.addEventListener('click', editProduct);
    });

    // Rest of your JavaScript code...
});




    document.getElementById('save-specs').addEventListener('click', () => {
    // Retrieve specifications including image
    const productImage = document.getElementById('product-image').files[0]; // Retrieve product image
    const productName = document.getElementById('product-name').value;
    const productModel = document.getElementById('product-model').value;
    const processor = document.getElementById('processor').value;
    const memory = document.getElementById('memory').value;
    const storage = document.getElementById('storage').value;
    const display = document.getElementById('display').value;
    const graphics = document.getElementById('graphics').value;
    const keyboard = document.getElementById('keyboard').value;
    const os = document.getElementById('os').value;

    // Clear input fields after one set is entered
    document.getElementById('product-image').value = ''; // Clear input for file
    document.getElementById('product-name').value = ''; // Clear input for product name
    document.getElementById('product-model').value = ''; // Clear input for product model
    document.getElementById('processor').value = '';
    document.getElementById('memory').value = '';
    document.getElementById('storage').value = '';
    document.getElementById('display').value = '';
    document.getElementById('graphics').value = '';
    document.getElementById('keyboard').value = '';
    document.getElementById('os').value = '';

    // Create a new table row for the added product with specifications
    const newRow = productList.insertRow();
    const imageCell = newRow.insertCell(0); // First cell for image
    const nameCell = newRow.insertCell(1);
    const modelCell = newRow.insertCell(2);
    const dateCell = newRow.insertCell(3);
    const editCell = newRow.insertCell(4);
    const deleteCell = newRow.insertCell(5);
    const processorCell = newRow.insertCell(6);
    const memoryCell = newRow.insertCell(7);
    const storageCell = newRow.insertCell(8);
    const displayCell = newRow.insertCell(9);
    const graphicsCell = newRow.insertCell(10);
    const keyboardCell = newRow.insertCell(11);
    const osCell = newRow.insertCell(12);

    const reader = new FileReader();
    reader.onload = function (e) {
        const img = document.createElement("img");
        img.src = e.target.result;
        img.style.maxWidth = "100px"; // Adjust image size as needed
        imageCell.appendChild(img);
    }
    reader.readAsDataURL(productImage);

    nameCell.textContent = productName;
    modelCell.textContent = productModel;
    dateCell.textContent = new Date().toISOString().slice(0, 10);
    editCell.innerHTML = '<span class="edit-icon">&#9998;</span>';
    deleteCell.innerHTML = '<button class="delete-button">Delete</button>';
    processorCell.textContent = processor;
    memoryCell.textContent = memory;
    storageCell.textContent = storage;
    displayCell.textContent = display;
    graphicsCell.textContent = graphics;
    keyboardCell.textContent = keyboard;
    osCell.textContent = os;

    deleteCell.querySelector('.delete-button').addEventListener('click', confirmDelete);

    popupFormContainer.style.display = 'none';
});

   

});

        document.addEventListener("DOMContentLoaded", () => {
            // Existing JavaScript code remains unchanged
            
            // Additional JavaScript for handling delivery status dropdown
            const deliveryStatusDropdowns = document.querySelectorAll('.delivery-status');

            deliveryStatusDropdowns.forEach(dropdown => {
                dropdown.addEventListener('change', () => {
                    const selectedStatus = dropdown.value;
                    // Update the delivery status on the shell
                    console.log(`Delivery status changed to: ${selectedStatus}`);
                });
            });
        });
        
    
    </script>
</body>
</html>
<%
}
%>