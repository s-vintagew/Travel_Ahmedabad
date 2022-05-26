<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="jakarta.servlet.http.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>  
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
Registered Succesfully.<br>
Redirecting in a few seconds.<br>
If not redirected, <a href="login.jsp">click here.</a>
<%response.setHeader("Refresh", "5;url=login.jsp"); %>
</body>
</html>