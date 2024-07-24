<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
</head>
<body>
    <div id="container" class="container">
        <!-- FORM SECTION -->
        <div class="row">
            <!-- SIGN UP -->
            <div class="col align-items-center flex-col sign-up">
                <div class="form-wrapper align-items-center">
                    <div class="form sign-up">
                     	<form action="../SignupServlet" method="post" class="sign-up-form" >
<%--                      		<div class="input-group">
                     			<%
									String errorMsg = (String) session.getAttribute("invalidCustomer");
									if (errorMsg != null) {
								%>
								<p><%=errorMsg%></p>
								<%
									session.removeAttribute("invalidCustomer");
								}
								%>
                     		</div> --%>
	                        <div class="input-group">
	                            <input type="text" placeholder="Full name" name="fullName">
	                        </div>
	                        <div class="input-group">
	                            <input type="email" placeholder="Email" name="email">
	                        </div>
	                        <div class="input-group">
	                            <input type="tel" placeholder="Phone Number" name="phoneNumber">
	                        </div>
	                        <div class="input-group">
	                            <input type="tel" placeholder="Address" name="address">
	                        </div>
	                        <div class="input-group">
	                            <input type="password" placeholder="Password" name="password">
	                        </div>
	                        <button type="submit">
	                            Register
	                        </button>
                        </form>
                        <p>
                            <span>
                                Already have an account?
                            </span>
                            <b onclick="toggle()" class="pointer">
                                Log in here
                            </b>
                        </p>
                    </div>
                </div>
            </div>
            <!-- END SIGN UP -->
            <!-- SIGN IN -->
            <div class="col align-items-center flex-col sign-in">
                <div class="form-wrapper align-items-center">
                    <div class="form sign-in">
                      <form action="../LoginServlet" class="sign-in-form" method="post">
                      	     <div class="input-group">
                     			<%
									String errorMsg1 = (String) session.getAttribute("invalidCustomer");
									if (errorMsg1 != null) {
								%>
								<p style="background-color: #D37676; color: #fff; height: 50px; border-radius: .5rem;
								  font-size: 1rem; align-content: center;"><%=errorMsg1%></p>
								<%
									session.removeAttribute("invalidCustomer");
								}
								%>
                     		</div>
                        <div class="input-group">
                            <input type="text" placeholder="email" name="email">
                        </div>
                        <div class="input-group">
                            <input type="password" placeholder="Password" name="password">
                        </div>
                        <button type="submit">
                            Log in
                        </button>
                        </form>
                        <p>
                            <b>
                                Forgot password?
                            </b>
                        </p>
                        <p>
                            <span>
                                Don't have an account?
                            </span>
                            <b onclick="toggle()" class="pointer">
                                Register here
                            </b>
                        </p>
                    </div>
                </div>
                <div class="form-wrapper"></div>
            </div>
            <!-- END SIGN IN -->
        </div>
        <!-- END FORM SECTION -->
        <!-- CONTENT SECTION -->
        <div class="row content-row">
            <!-- SIGN IN CONTENT -->
            <div class="col align-items-center flex-col">
                <div class="text sign-in">
                    <h2>
                        Welcome to<br>
                        Digital Durbar
                    </h2>
                </div>
                <div class="img sign-in"></div>
            </div>
            <!-- END SIGN IN CONTENT -->
            <!-- SIGN UP CONTENT -->
            <div class="col align-items-center flex-col">
                <div class="img sign-up"></div>
                <div class="text sign-up">
                    <h2>
                        Join with Digital Durbar
                    </h2>
                </div>
            </div>
            <!-- END SIGN UP CONTENT -->
        </div>
        <!-- END CONTENT SECTION -->
    </div>
    <script src="${pageContext.request.contextPath}/js/register.js"></script>
</body>
</html>
