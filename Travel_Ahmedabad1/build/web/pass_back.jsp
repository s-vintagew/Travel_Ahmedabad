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
</head>
<body>
<% 
String name=request.getParameter("name");
String pass=request.getParameter("pass");
String c_pass=request.getParameter("c_pass");
if(pass.equals(c_pass)){
	try{
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/travel_ahmedabad","root","9288");
		Statement stmt=conn.createStatement();
		String query="update userdata set passcode='"+pass+"' where username='"+name+"' or email='"+name+"';";
		int x=stmt.executeUpdate(query);
		if(x==1){
			//RequestDispatcher rd=request.getRequestDispatcher("login.html");
			request.setAttribute("err", "Password Changed Succesfully");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
	}
	catch(Exception e){
		e.printStackTrace();
	}
}
%>
</body>
</html>