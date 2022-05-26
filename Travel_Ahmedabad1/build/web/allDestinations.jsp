<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="jakarta.servlet.http.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>  
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
				url="jdbc:mysql://localhost/travel_ahmedabad" user="root" password="9288" />

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Destination</title>

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="css/style.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">

    <!-- custom js file link  -->
    <script src="js/script.js" defer></script>

</head>
<body style="overflow: hidden;">
    
<!-- header section starts  -->

<header class="header">

    <div id="menu-btn" class="fas fa-bars"></div>

    <a data-aos="zoom-in-left" data-aos-delay="150" href="index.jsp" class="logo"> <i class="fas fa-paper-plane"></i>Travel Ahmedabad </a>

    <nav class="navbar">
        <a data-aos="zoom-in-left" data-aos-delay="300" href="index.jsp">home</a>
        <a data-aos="zoom-in-left" data-aos-delay="600" href="#destination">destination</a>
        <a data-aos="zoom-in-left" data-aos-delay="900" href="gallery.jsp">gallery</a>
    </nav>
	
    <%
		request.getSession();
		response.setContentType("text/html");
		String pname=request.getParameter("pname");
		String user = (String) session.getAttribute("user");
		if (user == null) {
			response.sendRedirect("login.jsp?pname="+pname);
			out.print("<a data-aos='zoom-in-left' data-aos-delay='1300' href='login.jsp' class='btn'>Login</a>");
			//out.print("'login.html'");
		} else {
			out.print("<a data-aos='zoom-in-left' data-aos-delay='1300' href='userDashboard.jsp' class='btn'>" + user + "</a>");

		}
		%>

</header>

<!-- header section ends -->

<section class="destination" id="destination">
</section>

	<!-- destination section starts  -->

	<section class="destination" id="destination">

		<div class="heading">
			<h1>Places Around</h1>
		</div>

		<div class="box-container">
				
		<jsp:useBean id="obj" class="com.imageModule.imageBean"></jsp:useBean>
		<% 			
	               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel_ahmedabad","root","9288");
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select * from destination;");
				while(rs.next())
				{
	                Blob blob = rs.getBlob("image");
	                InputStream InputStream = blob.getBinaryStream();
	                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
	                byte[] buffer = new byte[16777216];
	                int bytesRead = -1;
	                 
	                while ((bytesRead = InputStream.read(buffer)) != -1) {
	                    outputStream.write(buffer, 0, bytesRead);                  
	                }
	                 
	                byte[] imageBytes = outputStream.toByteArray();
	                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
	                 
	                obj.setBase64Image(base64Image);
	                
	                out.print("<div class='box' data-aos='fade-up' data-aos-delay='150'>");
					out.print("<div class='image'>");
						out.print("<img src='data:image/jpg;base64,"+base64Image+"'>");
					out.print("</div>");
					out.print("<div class='content'>");

						out.print("<h3>");
							out.print("<a href='destinations.jsp?pname="+rs.getString("place_name")+"'>"+rs.getString("place_name")+"</a>");
						out.print("</h3>");
					out.print("</div>");
					out.print("</div>");
					System.out.println(rs.getString("place_name"));
				}
		  %>			
		</div>
		<br>
		<br>
	</section>

	<!-- destination section ends -->


<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>

<script>

    AOS.init({
        duration: 800,
        offset:150,
    });

</script>

</body>
</html>