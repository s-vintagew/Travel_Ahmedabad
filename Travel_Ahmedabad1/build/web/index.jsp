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
<title>Travel Ahmedabad</title>

<!-- font awesome cdn link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- custom css file link  -->
<link rel="stylesheet" href="css/style.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">

<!-- custom js file link  -->
<script src="js/script.js" defer></script>

</head>
<body>

	<!-- header section starts  -->

	<header class="header">

		<div id="menu-btn" class="fas fa-bars"></div>

		<a data-aos="zoom-in-left" data-aos-delay="150" href="#" class="logo">
			<i class="fas fa-paper-plane"></i>Travel Ahmedabad
		</a>

		<nav class="navbar">
			<a data-aos="zoom-in-left" data-aos-delay="300" href="#home">home</a>
			<a data-aos="zoom-in-left" data-aos-delay="450" href="#about">about</a>
			<a data-aos="zoom-in-left" data-aos-delay="600" href="#destination">destination</a>
			<a data-aos="zoom-in-left" data-aos-delay="900" href="#gallery">gallery</a>
			<a data-aos="zoom-in-left" data-aos-delay="1150" href="#blogs">Reviews</a>
		</nav>			
		
		<%
		request.getSession();
		response.setContentType("text/html");
		String user = (String) session.getAttribute("user");
		if (user == null) {
			out.print("<a data-aos='zoom-in-left' data-aos-delay='1300' href='login.jsp' class='btn'>Login</a>");
			//out.print("'login.html'");
		} else {
			out.print("<a data-aos='zoom-in-left' data-aos-delay='1300' href='userDashboard.jsp' class='btn'>" + user + "</a>");

		}
		%>

	</header>

	<!-- header section ends -->

	<!-- home section starts  -->

	<section class="home" id="home">

		<div class="content">
			<h3 data-aos="fade-up" data-aos-delay="300">To Ahmedabad</h3>
			<p data-aos="fade-up" data-aos-delay="450">Plan your upcoming
				vacation in the joyous city of Ahmedabad. Rejoice the vacation with
				the warmth and color of this marvellous city.</p>
		</div>

	</section>

	<!-- home section ends -->


	<!-- about section starts  -->

	<section class="about" id="about">

		<div class="video-container" data-aos="fade-right"
			data-aos-delay="300">
			<video src="images/about-vid-1.mp4" muted autoplay loop class="video"></video>
			<div class="controls">
				<span class="control-btn" data-src="images/about-vid-1.mp4"></span>
				<span class="control-btn" data-src="images/about-vid-2.mp4"></span>
				<span class="control-btn" data-src="images/about-vid-3.mp4"></span>
			</div>
		</div>

		<div class="content" data-aos="fade-left" data-aos-delay="150">
			<span>Rejoice in Ahmedabad</span>
			<h3>The city awaits your arrival</h3>
			<p></p>
		</div>

	</section>

	<!-- about section ends -->

	<!-- destination section starts  -->

	<section class="destination" id="destination">

		<div class="heading">
			<h1>Places Around</h1>
		</div>

		<div class="box-container">
				
		<jsp:useBean id="obj" class="com.imageModule.imageBean"></jsp:useBean>
		<% 			
				int i=3;
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
					
					i--;
					if(i==0)break;
				}
		  %>			
		</div>
		<br>
		<br>
		<a href='allDestinations.jsp?pname=allDestinations.jsp' class='btn'>See More</a>
	</section>

	<!-- destination section ends -->
	

	<!-- gallery section starts  -->
	<section class="gallery" id="gallery">

		<div class="heading">
			<h1>Gallery</h1>
		</div>
		<div class='box-container'>
		<% 			
	            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel_ahmedabad","root","9288");
				st = con.createStatement();
				i=6;
				rs = st.executeQuery("select * from gallery;");
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
	                
	                out.print("<div class='box' data-aos='zoom-in-up' data-aos-delay='50'>");
	                out.print("<img src='data:image/jpg;base64,"+obj.getBase64Image()+"' alt='Mountains' style='width:100%' class='ImgThumbnail'>");
	                out.print("</div>");
	                i--;
	                if(i==0)
	                	break;
				}
		  %>

		</div>
		<br>
		<br>
<a href='gallery.jsp?pname=gallery' class='btn'>See More</a>
	</section>

	<!-- gallery section ends -->


	<!-- blogs section starts  -->

	<section class="blogs" id="blogs">

		<div class="heading">
			<h1>Reviews</h1>
		</div>
		
		

			<sql:query dataSource="${db}" var="rs">  
				SELECT DISTINCT place_name from reviews;  
			</sql:query>
			
		<div class="box-container">
			<c:forEach var="table" items="${rs.rows}" begin="0" end="5">
			<sql:query dataSource="${db}" var="rss">  
				SELECT * from reviews where place_name="${table.place_name }";  
				</sql:query>
				<div class="box" data-aos="fade-up" data-aos-delay="150">
					<!--<div class="image">
						<img src="images/des-1.jpg" alt="">
					</div>-->
					<div class="content">
					<c:forEach var="itr" items="${rss.rows }" begin="0" end="0">
						<a href="#" class="link"><c:out value="${itr.place_name}"/></a>
						<p><c:out value="${itr.description}"/></p>
						<div class="icon">
							<a><i class="fas fa-clock"></i> 21st may, 2021</a> <a><i
								class="fas fa-user"></i><c:out value="${itr.username }"/></a>
						</div>
					</c:forEach>
					</div>
				</div>
			</c:forEach>
		</div>

	</section>
	<!-- blogs section ends -->

	<!-- banner section starts  -->

	<div class="banner">

		<div class="content" data-aos="zoom-in-up" data-aos-delay="300">
			<span>start your journey</span>
			<h3>Explore The Marvellous city</h3>
			<a href="#home" class="btn">Home</a>
		</div>

	</div>

	<!-- banner section ends -->

	<!-- footer section starts  -->

	<section class="footer">

		<div class="box-container">

			<div class="box" data-aos="fade-up" data-aos-delay="150">
				<h3>contact info</h3>
				<p>
					<i class="fas fa-envelope"></i> travelahmedabad@gmail.com
				</p>
			</div>

			<div class="box" data-aos="fade-up" data-aos-delay="150">
				<h3>Feedback</h3>
				<form action="">
					<input type="email" name="" placeholder="enter your feedback"
						class="email" id=""> <input type="submit"
						value="Submit" class="btn">

				</form>
			</div>

		</div>

	</section>



	<!-- footer section ends -->



	<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>

	<script>
		AOS.init({
			duration : 800,
			offset : 150,
		});
	</script>

</body>
</html>