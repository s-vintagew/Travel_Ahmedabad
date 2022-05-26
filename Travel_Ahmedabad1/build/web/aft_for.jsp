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
	String name=(String)request.getAttribute("name");
System.out.println(request.getParameter("name"));
	String que=request.getParameter("que");
	String ans=request.getParameter("ans");
	try{
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/travel_ahmedabad","root","9288");
		Statement stmt=conn.createStatement();
		ResultSet rs= stmt.executeQuery("select * from userdata where email='"+name+"' or username='"+name+"';");
		while(rs.next()){
			System.out.println("x");
			if(rs.getString("security_answer").equals(ans)){
						//RequestDispatcher rd=request.getRequestDispatcher("pass.jsp");
						System.out.println(rs.getString("security_question"));
						response.sendRedirect("pass.jsp");
						return;
			}
		}
		request.setAttribute("err", "Entered Security Question and Answer mismatch");
		request.getRequestDispatcher("login.jsp").forward(request,response);
		return;
	}
	catch(Exception e){e.printStackTrace();}
%>
</body>
</html>