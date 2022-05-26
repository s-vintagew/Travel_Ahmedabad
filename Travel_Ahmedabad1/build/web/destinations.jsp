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
<sql:query dataSource="${db}" var="rs">SELECT * from destination where place_name="${param.pname }";</sql:query>


<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Destination</title>

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="css/style.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
	
    <!-- custom js file link  -->
    <script src="js/script.js" defer></script>
<style type="text/css">
 .modal {        
 			font : 16px/26px "Raleway", sans-serif;
          display: none; /* Hidden by default */
          position: fixed; /* Stay in place */
          z-index: 1; /* Sit on top */
          padding-top: 100px; /* Location of the box */
          left: 0;
          top: 0;
          width: 100%; /* Full width */
          height: 100%; /* Full height */
          overflow: auto; /* Enable scroll if needed */
          background-color: rgb(0,0,0); /* Fallback color */
          background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
        
        /* Modal Content */
        .modal-content {
          background-color: #222;
          color: white;
          margin: auto;
          padding: 20px;
          border: 1px solid #888;
          width: 80%;
        }
        
        /* The Close Button */
        .close {
          color: #aaaaaa;
          float: right;
          font-size: 28px;
          font-weight: bold;
        }
        
        .close:hover,
        .close:focus {
          color: white;
          text-decoration: none;
          cursor: pointer;
        }
        input {
			font : 16px/26px "Raleway", sans-serif;
			}
        .review-form .input {
			margin : 0 0 0.8em 0;
			padding : 0.8em 2em 10px 0;
			width : 100%;
			display : inline-block;
			background : transparent;
			border : 0;
			border-bottom : 1px solid #5A6374;
			outline : 0;
			box-sizing : border-box;
			color : inherit;
			font-family : inherit;
			color : #fff;
			}
		.review-form .review-sub {
		margin : 1em 0;
		padding : 0.2em 3em;
		width : auto;
		display : block;
		background-color : #28A55F;
		border : none;
		color : #fff;
		cursor : pointer;
		font-size : 0.8em;
		border-radius : 30px;
		background : linear-gradient(180deg, rgb(105, 221, 201, 1) 0%, rgb(78, 193, 182, 1) 100%);
		box-shadow : 0 0 37px -9px rgb(0, 0, 0, 0.75);
		}
		.review-form .review-sub:hover {
		background-color : #4FDA8C;
		}
        </style>
</head>
<body style="overflow: hidden;">
    
<!-- header section starts  -->

<header class="header">

    <div id="menu-btn" class="fas fa-bars"></div>	

    <a data-aos="zoom-in-left" data-aos-delay="150" href="index.jsp" class="logo"> <i class="fas fa-paper-plane"></i>Travel Ahmedabad </a>

    <nav class="navbar">
        <a data-aos="zoom-in-left" data-aos-delay="300" href="index.jsp">home</a>
        <a data-aos="zoom-in-left" data-aos-delay="600" href="allDestinations.jsp">destination</a>
        <a data-aos="zoom-in-left" data-aos-delay="900" href="gallery.jsp">gallery</a>
        <a data-aos="zoom-in-left" data-aos-delay="1150" href="#blogs">Reviews</a>
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


<!-- home section starts  -->
<jsp:useBean id="obj" class="com.imageModule.imageBean"></jsp:useBean>


		<% 			
	               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel_ahmedabad","root","9288");
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select * from destination where place_name='"+request.getParameter("pname")+"';");
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
				}
		  %>
		  <c:forEach var="table" items="${rs.rows}">
<section class="home" id="home"  style="background : linear-gradient(rgb(17, 17, 17, 0.7), rgb(17, 17, 17, 0.7)),url(data:image/jpg;base64,<c:out value="${obj.base64Image}"/>) no-repeat;background-size:cover">

    <div class="content">
        <h3 data-aos="fade-up" data-aos-delay="300">
        <%=request.getParameter("pname") %></h3>
    </div>

</section>
</c:forEach>
<!-- home section ends -->


<!-- about section starts  -->

<section class="about" id="about">

    
	<c:forEach var="table" items="${rs.rows}">  
    <div class="content" data-aos="fade-left" data-aos-delay="150">
        <h3>About Place</h3>
        <p><c:out value="${table.description}"/>located beside the sabarmati river.</p>
    </div>
  	</c:forEach>

</section>

<!-- about section ends -->

<!-- destination section starts  -->
<section class="review">


    <div class="box-container" data-aos="fade-left" data-aos-delay="150">
		<c:forEach var="table" items="${rs.rows}">
        <div class="box">
        
            <div class="user">
                <img src="images/time1.png" alt="">
                <div class="info">
                    <h3>Time: <span><c:out value="${table.time }"/></span></h3>
                    
                </div>
            </div>
        	
        </div>
       <div class="box">
       <div class="user">
                <img src="images/location.jpg" alt="">
                <div class="info">
                    <h3>Location: <span><a href = "<c:out value="${table.location }"/>"><c:out value="${table.location }"/></a></span></h3>
                    
                </div>
            </div>
       </div>
        </c:forEach>

    </div>

</section>

	<!-- gallery section starts  -->
	<section class="gallery" id="gallery">

		<div class="heading">
			<h1>Gallery</h1>
		</div>
		<div class='box-container'>
		<% 			
	            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel_ahmedabad","root","9288");
				st = con.createStatement();
				int i=6;
				rs = st.executeQuery("select * from gallery where place_name='"+request.getParameter("pname")+"';");
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
	                
	                out.print("<div class='box' data-aos='zoom-in-up' data-aos-delay='150'>");
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
	<a class='btn'  id="myBtn1" onClick="">Upload Picture</a>
		<div id="myModalGal" class="modal">
		<!-- Modal content -->
		        <div class="modal-content">
		          <span class="close">&times;</span>
		          <div id="login-tab-content" class="active">
	          			<span class="review-span">Upload Picture of this place</span>
               			<form class="review-form" action="gallery" method = "post" enctype = "multipart/form-data">
               				<input type="file" class="input" name="img" accept=".jpg" placeholder="Upload your Picture" required>
               				<input type="hidden" value='<%=session.getAttribute("user") %>' name="uname">
               				<input type="hidden" value='<%=request.getParameter("pname") %>' name="pname">
               				<input type="submit" class="review-sub" value="Submit">
               			</form>
               		</div>
		          
		        </div>
		      
		</div>
	</section>

	<!-- gallery section ends -->


<!-- blogs section starts  -->

<section class="blogs" id="blogs">

		<div class="heading">
			<h1>Reviews</h1>
		</div>
		
			<sql:query dataSource="${db}" var="rs">  
				SELECT * from reviews where place_name="${param.pname }";  
			</sql:query>
			
		<div class="box-container">
			<c:forEach var="table" items="${rs.rows}" begin="0" end="3">
				<div class="box" data-aos="fade-up" data-aos-delay="150">
					
					<div class="content">
						<a href="#" class="link"><c:out value="${table.place_name}"/></a>
						<p><c:out value="${table.description}"/></p>
						<div class="icon">
							<a><i class="fas fa-clock"></i>Review by</a> <a><i
								class="fas fa-user"></i><c:out value="${table.username }"/></a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<br>
		<br>
	<a class='btn'  id="myBtn" onClick="">Enter Your Review</a>
		<div id="myModalRev" class="modal">
		<!-- Modal content -->
		        <div class="modal-content">
		          <span class="close">&times;</span>
		          <div id="login-tab-content" class="active">
               			<form class="review-form" action="review" method="post">
               				<textarea name="desc" class="input" id="user_login" autocomplete="off" placeholder="Enter your review"></textarea>
               				<input type="hidden" value='<%=session.getAttribute("user") %>' name="uname">
               				<input type="hidden" value='<%=request.getParameter("pname") %>' name="pname">
               				<input type="submit" class="review-sub" value="Submit">
               			</form>
               		</div>
		          
		        </div>
		      
		</div>
	</section>

<!-- blogs section ends -->


<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>

<script>

    AOS.init({
        duration: 500,
        offset:150,
    });
    // Get the modal
    var modalRev = document.getElementById("myModalRev");
    var modalGal = document.getElementById("myModalGal");
    
    // Get the button that opens the modal
    var btn = document.getElementById("myBtn");
    var btn1= document.getElementById("myBtn1");
    
    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];
    var span1 = document.getElementsByClassName("close")[1];
    
    // When the user clicks the button, open the modal 
    btn.onclick = function() {
      modalRev.style.display = "block";
    }
    btn1.onclick = function() {
    	modalGal.style.display= "block";
    }
    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
      modalGal.style.display = "none";
    }
    span1.onclick = function() {
        modalRev.style.display = "none";
      }
    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
      if (event.target == modalGal) {
    	  modalGal.style.display = "none";
      }
    }
    window.onclick = function(event) {
        if (event.target == modalRev) {
      	  modalRev.style.display = "none";
        }
      }
</script>

</body>
</html>