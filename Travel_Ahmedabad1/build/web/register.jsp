<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="jakarta.servlet.http.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>  
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="ob" class="com.loginmodule.errorMsg"></jsp:useBean>

	<%!String err;
	String fname;
	String email;
	String gender;
	String dob;
	String country;
	String s_que;
	String ans;
	String uname;
	String pass;
	String c_pass;
	%>
	
	<%  fname=request.getParameter("fname");
		email=request.getParameter("email").toLowerCase();
		gender=request.getParameter("gender");
		dob=request.getParameter("dob");
		country=request.getParameter("country");
		s_que=request.getParameter("que");
		ans=request.getParameter("ans");
		uname=request.getParameter("uname");
		pass=request.getParameter("pass");
		c_pass=request.getParameter("c_pass"); 
%>
<%
	
		if(validate()) {
			try{
				Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/travel_ahmedabad","root","9288");
				PreparedStatement pstmt=conn.prepareStatement("insert into userdata values(?,?,?,?,?,?,?,?,?)");
				pstmt.setString(1,fname);
				pstmt.setString(2,email);
				pstmt.setString(3,gender);
				pstmt.setString(4,dob);
				pstmt.setString(5,country);
				pstmt.setString(6,s_que);
				pstmt.setString(7,ans);
				pstmt.setString(8,uname);
				pstmt.setString(9,pass);
				int i=pstmt.executeUpdate();
				if(i==1){
					err="Registered Succesfully";
					request.setAttribute("err", err);
					response.sendRedirect("redirect.jsp");
				}
				
			}
			catch(Exception e){}
		}		
		else
		{
			request.setAttribute("err", err);
		}
		
	
%>
<%!protected boolean validate() {
	
	if(fname.trim().length()==0)
	{
		err="Name cannot be Blank";
		return false;
	}
	else if(!emailUnique())
	{
		err="Email already Exists";
		return false;
	}
	else if(!primaryUsername())
	{
		err="Username already Exists";
		return false;
	}
	else if(pass.length()<6)
	{
		err="Password Should be more than 6 characters";
		return false;
	}
	else if(!pass.equals(c_pass))
	{
		err="Confirm password does not match";
		return false;
	}
	return true;
}
protected boolean emailUnique()
{
	try
	{
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/travel_ahmedabad","root","9288");
		Statement st = conn.createStatement();
		ResultSet rs= st.executeQuery("select * from userdata where username='"+uname+"';");
		while(rs.next())
			if(rs.getString("email").equals(email))
				return false;
				
		return true;
	}
	catch(SQLException e)
	{e.printStackTrace();}
	
	return false;
}
protected boolean primaryUsername()
{
	try
	{
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/travel_ahmedabad","root","9288");
		Statement st = conn.createStatement();
		ResultSet rs= st.executeQuery("select * from userdata where username='"+uname+"';");
		while(rs.next())
			if(rs.getString("username").equals(uname))
				return false;
				
		return true;
	}
	catch(SQLException e)
	{e.printStackTrace();}
	
	return false;
} %>
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
                    <form class="recovery-form" action="Forget.jsp" method="post">
                        <input type="text" class="input" id="user_recover" name="uname" placeholder="Enter Email or Username Here">
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
                    		<div id="login-tab-content">
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
                    		<div id="signup-tab-content" class="active">
                    			<form class="signup-form" action="register.jsp" method="post">
                                    <input type="text" class="input" id="fname" autocomplete="off" placeholder="Full Name" name="fname" value="<%=fname %>" required>
                    				<input type="email" class="input" id="user_email" autocomplete="off" placeholder="Email" name="email" value="<%=email %>" required>                                    
                                    <input type="radio" class="input" id="male" autocomplete="off" name="gender" value="Male">Male
                                    <input type="radio" class="input" id="female" autocomplete="off" name="gender" value="Female">Female
                                    <input type="date" class="input" id="dob" autocomplete="off" name="dob" placeholder="DOB"  value="<%=dob %>"  required pattern="\d{4}-\d{2}-\d{2}">
                                    <input type="text" class="input" id="country" autocomplete="off" name="country" placeholder="Country" value="<%=country %>" required>
                                    <select class="input" name="que" required>
                                        <option value="">Security Questions</option>
                                        <option value="What is your favorite movie ?">What is your favorite movie ?</option>
                                        <option value="What is your first school name ?">What is your first school name ?</option>                           
                                        <option value="What is your hobby ?">What is your hobby ?</option> 
                                    </select>
                                    <input type="hidden" value='<%=request.getParameter("pname") %>' name="pname">
                                    <input type="text" class="input" id="lname" autocomplete="off" placeholder="Your Answer" name="ans"  value="<%=ans %>" required>
                    				<input type="text" class="input" id="user_name" autocomplete="off" placeholder="Username" name="uname"  value="<%=uname %>" required>
                    				<input type="text" class="input" id="user_pass" autocomplete="off" placeholder="Password" name="pass" value="<%=pass %>"  required>
                                    <input type="text" class="input" id="conf_pass" autocomplete="off" placeholder="Confirm Password" name="c_pass" required>
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