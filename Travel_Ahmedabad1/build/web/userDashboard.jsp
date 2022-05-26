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
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet">
<!-- Bootstrap CSS -->
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
<!-- Font Awesome CSS -->
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css'>

<!-- font awesome cdn link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- custom css file link  -->
<link rel="stylesheet" href="css/style.css">

<style>
body {
    background : #111;
overflow-x : hidden;
overflow:unset;
    padding: 0;
    margin: 0;
    font-family: 'Lato', sans-serif;
    color: #FFF;
}
.student-profile .card {
    border-radius: 10px;
    background : #222;
}
.student-profile .card .card-header .profile_img {
    width: 150px;
    height: 150px;
    object-fit: cover;
    margin: 10px auto;
    border: 10px solid #ccc;
    border-radius: 50%;
}
.student-profile .card h3 {
color: #29d9d5;
    font-size: 20px;
    font-weight: 700;
}
.student-profile .card p {
    font-size: 16px;
    color: #FFF;
}
.student-profile .table th,
.student-profile .table td {
    font-size: 14px;
    padding: 5px 10px;
    border:none;
}
</style>


</head>
<body>

	<!-- header section starts  -->

	<header class="header">

		<div id="menu-btn" class="fas fa-bars"></div>

		<a data-aos="zoom-in-left" data-aos-delay="150" href="index.jsp" class="logo">
			<i class="fas fa-paper-plane"></i>Travel Ahmedabad
		</a>

		<nav class="navbar">
			<a data-aos="zoom-in-left" data-aos-delay="300" href="index.jsp">home</a>
        <a data-aos="zoom-in-left" data-aos-delay="600" href="allDestinations.jsp">destination</a>
        <a data-aos="zoom-in-left" data-aos-delay="900" href="gallery.jsp">gallery</a>
		</nav>			
		
		<%
		request.getSession();
		response.setContentType("text/html");
		String user = (String) session.getAttribute("user");
		if (user == null) {
			out.print("<a data-aos='zoom-in-left' data-aos-delay='1300' href='login.jsp' class='btn'>Login</a>");
			//out.print("'login.html'");
		} else {
			out.print("<a data-aos='zoom-in-left' data-aos-delay='1300' href='logout.jsp' class='btn'>" + "Logout" + "</a>");

		}
		%>

	</header>

	<!-- header section ends -->
	
	
<!-- home section starts  -->
	<section class="home" id="home" style="background : linear-gradient(180deg, rgb(34, 46, 64, 1) 0%, rgb(81, 195, 184, 1) 100%);">
<div class="student-profile py-4">
  <div class="container">
    <div class="row col-lg-30">
      <div class="col-lg-4">
        <div class="card shadow-sm">
        <sql:query dataSource="${db}" var="rs">  
				SELECT * from userdata where username="${sessionScope.user}";  
			</sql:query>
			<c:forEach var="table" items="${rs.rows}">
          <div class="card-header bg-transparent text-center">
            <img class="profile_img" src="https://source.unsplash.com/600x300/?student" alt="student dp">
            <h3><c:out value="${table.fullname }"/></h3>
          </div>
          
          <div class="card-body">
            <p class="mb-0"><strong class="pr-1">Username: </strong><c:out value="${table.username }"/></p>
            <p class="mb-0"><strong class="pr-1">Email: </strong><c:out value="${table.email }"/></p>
          </div>
          </c:forEach>
        </div>
      </div>
      <div style="height: 26px"></div>
      <div class="col-lg-8">
      <div class="card shadow-sm">
          <div class="card-header bg-transparent border-0">
            <h3 class="mb-0"><i class="far fa-clone pr-1"></i>General Information</h3>
          </div>
          <div class="card-body pt-0">
          <sql:query dataSource="${db}" var="rs">  
				SELECT * from userdata where username="${sessionScope.user}";  
			</sql:query>
			<c:forEach var="table" items="${rs.rows}">
            <table class="table table-bordered">
              <tr>
                <th width="30%">DOB</th>
                <td width="2%">:</td>
                <td><c:out value="${table.dob }"/></td>
              </tr>
              <tr>
                <th width="30%">Gender</th>
                <td width="2%">:</td>
                <td><c:out value="${table.gender }"/></td>
              </tr>
              <tr>
                <th width="30%">Country</th>
                <td width="2%">:</td>
                <td><c:out value="${table.country }"/></td>
              </tr>
            </table>
            </c:forEach>
          </div>
        </div>
        <div style="height: 26px"></div>
      <sql:query dataSource="${db}" var="rs">  
				SELECT * from reviews where username="${sessionScope.user}";  
			</sql:query>
			
        <div class="card shadow-sm">
          <div class="card-header bg-transparent border-0">
            <h3 class="mb-0"><i class="far fa-clone pr-1"></i>General Information</h3>
          </div>
          <div class="card-body pt-0">
            <table class="table table-bordered">
              <tr>
                <th width="30%">Place Name</th>
                <th width="30%">Review</th>
              </tr>
              <c:forEach var="table" items="${rs.rows}">
              <tr>
                <th width="30%"><c:out value="${table.place_name }"/></th>
                <td width="2%"><c:out value="${table.description }"/></td>
              </tr>
              </c:forEach>
            </table>
          </div>
        </div>
        
        
          <div style="height: 26px"></div>
      </div>
    </div>
  </div>
</div>
	</section>

	<!-- home section ends -->
	</body>
	</html>