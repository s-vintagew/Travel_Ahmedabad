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
                    		<h3 class="signup-tab"><a class="sign-up"><span>Forgot Password</span></a></h3>
                    	</div>                  
                    	<div class="tabs-content">
                            <!-- TABS CONTENT LOGIN -->
                    		<div id="login-tab-content" class="active">
                    			<form class="login-form" action="pass_back.jsp" name="passForm" method="post" onSubmit="return myfunc(event);">
                    			<p>Email/Username: <%=(String)request.getAttribute("name") %><br></p>
                    				<br>
                    				<input type="password" class="input" id="user_pass"  autocomplete="off" placeholder="New Password" name="pass">
                                    <input type="password" class="input" id="conf_pass"  autocomplete="off" placeholder="Confirm Password" name="c_pass">
                                    <input type="hidden" value='<%out.print(request.getAttribute("name")); %>' name="name">
                    				<input type="submit" id="bt" class="button" value="Submit">
                    				<p id="vari"></p>
                    			</form>
                    			
                    		</div>
                            
                    	</div>  
                	</div>
                </div>
            </div>
        </div>

</body>
<script>

function myfunc(event){
	var x=document.getElementById('user_pass').value;
	var y=document.getElementById('conf_pass').value;
	if(x.length<6)
		{
			document.getElementById('vari').innerHTML="Password is too short";
			return false;
		}
	else if(x!=y)
		{
			document.getElementById('vari').innerHTML="Password's don't match";
			return false;
		}
	else
		{
			document.passForm.submit();
		}
}
</script>
</html>