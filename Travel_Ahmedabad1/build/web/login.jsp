<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="jakarta.servlet.http.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>  
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<title>Login</title>
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>

        <!-- LOGIN MODULE -->
        <div class="login">
            <div class="wrap">
            <jsp:useBean id="err" class="com.loginmodule.errorMsg"></jsp:useBean>
            
                <!-- TOGGLE -->
                <div id="toggle-wrap">
                    <div id="toggle-terms">
                        <div id="cross">
                            <span></span>
                            <span></span>
                        </div>
                    </div>
                </div>            
               

                <!-- RECOVERY -->
                <div class="recovery">
                    <h2>Password Recovery</h2>
                    <p>Enter either the <strong>email address</strong> or <strong>username</strong> on the account and <strong>click Submit</strong></p>
                    <p>We'll email instructions on how to reset your password.</p>
                    <form class="recovery-form" action="forget" method="post">
                        <input type="text" class="input" id="user_recover" name="name" placeholder="Enter Email or Username Here">
                        <input type="submit" class="hello" value="Submit">
                    </form>
                    
                </div>

 

                <!-- LOGIN FORM -->
                <div class="user">  
                <div class="errorMes">
                    	<p><%if(request.getAttribute("err")==null)out.print("");
                    			else out.print(request.getAttribute("err"));%></p>
                    </div>                 
                    <div class="form-wrap">
                    
                    		
                        <!-- TABS -->
                    	<div class="tabs">
                            <h3 class="login-tab"><a class="log-in active" href="#login-tab-content"><span>Login</span></a></h3>
                    		<h3 class="signup-tab"><a class="sign-up" href="#signup-tab-content"><span>Sign Up</span></a></h3>
                    	</div>
                        <!-- TABS CONTENT -->
                    	<div class="tabs-content">
                            <!-- TABS CONTENT LOGIN -->
                    		<div id="login-tab-content" class="active">
                    			<form class="login-form" action="login" method="post">
                    				<input name="uname" type="text" class="input" id="user_login" autocomplete="off" placeholder="Username">
                    				<input name="pass" type="password" class="input" id="user_pass" name="pass" autocomplete="off" placeholder="Password">
                    				<input type="checkbox" class="checkbox" id="remember_me" onclick="showpass()">
                    				<label for="remember_me">Show Password</label>
                    				<input type="hidden" value='<%=request.getParameter("pname") %>' name="pname">
                    				<input type="submit" class="button" value="Login">
                    			</form>
                    			<div class="help-action">
                    				<p><a class="forgot" href="#">Forgot your password?</a></p>
                    			</div>
                    		</div>
                            <!-- TABS CONTENT SIGNUP -->
                    		<div id="signup-tab-content">
                    			<form class="signup-form" action="register.jsp" method="post">
                                    <input type="text" class="input" id="fname" autocomplete="off" placeholder="Full Name" name="fname" required>
                    				<input type="email" class="input" id="user_email" autocomplete="off" placeholder="Email" name="email" required>                                    
                                    <input type="radio" class="input" id="male" autocomplete="off" name="gender" value="Male">Male
                                    <input type="radio" class="input" id="female" autocomplete="off" name="gender" value="Female">Female
                                    <input type="date" class="input" id="dob" autocomplete="off" name="dob" placeholder="DOB" required pattern="\d{4}-\d{2}-\d{2}">
                                    <input type="text" class="input" id="country" autocomplete="off" name="country" placeholder="Country" required>
                                    <select class="input" name="que" required>
                                        <option value="">Security Questions</option>
                                        <option value="What is your favorite movie ?">What is your favorite movie ?</option>
                                        <option value="What is your first school name ?">What is your first school name ?</option>                           
                                        <option value="What is your hobby ?">What is your hobby ?</option> 
                                    </select>
                                    <input type="hidden" value='<%=request.getParameter("pname") %>' name="pname">
                                    <input type="text" class="input" id="lname" autocomplete="off" placeholder="Your Answer" name="ans" required>
                    				<input type="text" class="input" id="user_name" autocomplete="off" placeholder="Username" name="uname" required>
                    				<input type="text" class="input" id="user_pass" autocomplete="off" placeholder="Password" name="pass" required>
                                    <input type="text" class="input" id="conf_pass" autocomplete="off" placeholder="Confirm Password" name="c_pass" requireds>
                    				<input type="submit" class="button" value="Sign Up">
                    			</form>
                    			
                    		</div>
                    	</div>  
                	</div>
                </div>
            </div>
        </div>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="js/login.js"></script>
</body>
</html>