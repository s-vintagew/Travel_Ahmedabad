<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
 <%@ page import="jakarta.servlet.http.*" %>
 <%@ page import="jakarta.servlet.*" %>
 <%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
 <!-- LOGIN MODULE -->
        <div class="login">
            <div class="wrap">
                <!-- TOGGLE -->
                <div id="toggle-wrap">
                    <div id="toggle-terms">
                        <div id="cross">
                            <span></span>
                            <span></span>
                        </div>
                    </div>
                </div>            

                <div class="user">                   
                    <div class="form-wrap">
                        <!-- TABS -->
                    	<div class="tabs">                            
                    		<h3 class="signup-tab"><a class="sign-up"><span>Password Recovery</span></a></h3>
                    	</div>                  
                    	<div class="tabs-content">
                            <!-- TABS CONTENT LOGIN -->
                    		<div id="login-tab-content" class="active">
                    			<form class="login-form" action="aft_for" method="post">
                    				<p>Email/Username: <%out.print(request.getAttribute("name")); %><br></p>
                    				<br>
                    				<input type="hidden" value='<%out.print(request.getAttribute("name")); %>' name="name">
                    				<select class="input" name="que">
                    				
                                        <option value="">Security Questions</option>
                                        <option value="What is your favorite movie ?">What is your favorite movie ?</option>
                                        <option value="What is your first school name ?">What is your first school name ?</option>                           
                                        <option value="What is your hobby ?">What is your hobby ?</option> 
                                    </select>
                                    <input type="text" class="input" id="lname" autocomplete="off" placeholder="Your Answer" name="ans">                    				
                    				<input type="submit" class="button" value="Submit">
                    			</form>
                    			
                    		</div>
                            
                    	</div>  
                	</div>
                </div>
            </div>
        </div>

</body>
</html>