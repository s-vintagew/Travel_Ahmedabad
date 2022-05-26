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
<sql:query dataSource="${db}" var="rs">SELECT distinct place_name from gallery;</sql:query>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        * {
font-family : 'Poppins', sans-serif;
margin : 0;
padding : 10px;
box-sizing : border-box;
outline : none;
border : none;
text-decoration : none;
text-transform : capitalize;
transition : all 0.2s linear;
}
html {
font-size : 62.5%;
overflow-x : hidden;
scroll-behavior : smooth;
scroll-padding-bottom : 9rem;
}
html::-webkit-scrollbar {
width : 1rem;
}
html::-webkit-scrollbar-track {
background : #111;
}
html::-webkit-scrollbar-thumb {
background : #29d9d5;
border-radius : 5rem;
}
body {
background : #111;
overflow-x : hidden;
overflow:unset;
}
        * {
          box-sizing: border-box;
        }
        
        /* body {
          background-color: #f1f1f1;
          padding: 20px;
          font-family: Arial;
        } */
        
        /* Center website */
        .main {
          max-width: 90%;
          margin: auto;
        }
        
        h1 {
          font-size: 50px;
          word-break: break-all;
        }
        
        .row {
        display: grid;
	    grid-template-columns: repeat(auto-fit,minmax(35rem,1fr));
	    gap: 1.0rem;
         flex-direction: row;
         flex:30%;
          margin: 10px -16px;
        }
        
        /* Add padding BETWEEN each column */
        .row,
        .row > .column {
          padding: 8px;
        }
        
        /* Create three equal columns that floats next to each other */
        .column {
          display: none; /* Hide all elements by default */
        }
        
        /* Clear floats after rows */ 
        .row:after {
          content: "";
          display: table;
          clear: both;
        }
        
        /* Content */
        .content {
          /* background-color: rgba(52, 255, 245, 0.849); */
          padding: 3px;
          width:100%;
        }
        
        /* The "show" class is added to the filtered elements */
        .show {
          display: block;
        }
        
        /* Style the buttons */
        .btn {
          border: none;          
          border-radius: 20px;
          outline: none;
          margin:4px;
          padding: 12px 16px;
          background-color: white;
          cursor: pointer;
          font-size: 12px;
          font-weight: bold;
          
        }
        
        .btn:hover {
          background-color: #ddd;
        }
        
        .btn.active {
          background-color: #29d9d5;
          color: black;
          font-size: 15px;
          font-weight: bold;
        }

        .ImgThumbnail {
   border-radius: 5px;
   cursor: pointer;
   transition: 0.3s;
   height: 300px;
   object-fit:cover;
}
.ImgThumbnail:hover{
    opacity: 0.7;
}
.modal {
   display: none;
   position: fixed;
   z-index: 1;
   padding-top: 100px;
   left: 0;
   top: 100px;
   width: 100%;
   height: 100%;
   overflow: auto;
   background-color: rgb(0, 0, 0);
   background-color: rgba(0, 0, 0, 0.9);
}
.modalImage {
   margin: auto;
   display: block;
   width: 50%;
   height: 60%;
   max-width: 700px;
}
#caption {
   margin: auto;
   display: block;
   width: 80%;
   max-width: 700px;
   text-align: center;
   color: #ccc;
   padding: 10px 0;
   height: 150px;
}
.close {
   position: absolute;
   top: 15px;
   right: 35px;
   color: #f1f1f1;
   font-size: 30px;
  
   transition: 0.3s;
}
.close:hover,
.close:focus {
    color: #29d9d5;
  text-decoration: none;
  cursor: pointer;
}
@media only screen and (max-width: 700px) {
   .modalImage {
      width: 100%;
      
   }
   .column .content{
   width:100%;
   }
   img{
   object-fit:cover;
   }
}


        </style>
        <link rel="stylesheet" href="css/style.css">
</head>
<body>
  <br><br><br>
  <br><br><br>
  <header class="header">

    <div id="menu-btn" class="fas fa-bars"></div>

    <a data-aos="zoom-in-left" data-aos-delay="150" href="index.jsp" class="logo"> <i class="fas fa-paper-plane"></i>Travel Ahmedabad </a>

    <nav class="navbar">
        <a data-aos="zoom-in-left" data-aos-delay="300" href="index.jsp">home</a>
        <a data-aos="zoom-in-left" data-aos-delay="600" href="allDestinations.jsp">destination</a>
        <a data-aos="zoom-in-left" data-aos-delay="900" href="#">gallery</a>
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
<section class="destination" id="destination">

		<div class="heading" style="font-family: 'Poppins', sans-serif;">
			<h1>Gallery</h1>
		</div>
</section>
    <div class="main">     
        <div id="myBtnContainer">
        		  
          <button class="btn active" onclick="filterSelection('all')"> Show all</button>
          <c:forEach var="table" items="${rs.rows}">
          <button class="btn" onclick="filterSelection('<c:out value="${table.place_name}"/>')"><c:out value="${table.place_name}"/></button>
          <!-- <button class="btn" onclick="filterSelection('Riverfront')"> RiverFront</button>
          <button class="btn" onclick="filterSelection('cars')"> Sabarmati Asharam</button>
          <button class="btn" onclick="filterSelection('people')"> Kankaria Lake</button>-->
          </c:forEach>
        </div>
        <div class="modal">
            <span class="close">&times;</span>
            <img class="modalImage" id="img01"/>
        </div>
        <!-- Portfolio Gallery Grid -->
        <div class="row">
         
         <jsp:useBean id="obj" class="com.imageModule.imageBean"></jsp:useBean>


		<% 			
	            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel_ahmedabad","root","9288");
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select * from gallery;");
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
	                
	                out.print("<div class='column "+rs.getString("place_name")+"'>");
	                out.print("<div class='content'>");
	                out.print("<img src='data:image/jpg;base64,"+obj.getBase64Image()+"' alt='Mountains' style='width:100%' class='ImgThumbnail'>");
	                out.print("</div>");
	             
	                out.print("</div>");
				}
		  %>
        <!-- END GRID -->
        </div>
        
        <!-- END MAIN -->
        </div>
</body>
</html>
<script>
    filterSelection("all")
    function filterSelection(c) {
      var x, i;
      x = document.getElementsByClassName("column");
      if (c == "all") c = "";
      for (i = 0; i < x.length; i++) {
        w3RemoveClass(x[i], "show");
        if (x[i].className.indexOf(c) > -1) w3AddClass(x[i], "show");
      }
    }
    
    function w3AddClass(element, name) {
      var i, arr1, arr2;
      arr1 = element.className.split(" ");
      arr2 = name.split(" ");
      for (i = 0; i < arr2.length; i++) {
        if (arr1.indexOf(arr2[i]) == -1) {element.className += " " + arr2[i];}
      }
    }
    
    function w3RemoveClass(element, name) {
      var i, arr1, arr2;
      arr1 = element.className.split(" ");
      arr2 = name.split(" ");
      for (i = 0; i < arr2.length; i++) {
        while (arr1.indexOf(arr2[i]) > -1) {
          arr1.splice(arr1.indexOf(arr2[i]), 1);     
        }
      }
      element.className = arr1.join(" ");
    }
    
    
    // Add active class to the current button (highlight it)
    var btnContainer = document.getElementById("myBtnContainer");
    var btns = btnContainer.getElementsByClassName("btn");
    for (var i = 0; i < btns.length; i++) {
      btns[i].addEventListener("click", function(){
        var current = document.getElementsByClassName("active");
        current[0].className = current[0].className.replace(" active", "");
        this.className += " active";
      });
    }


    var modalEle = document.querySelector(".modal");
var modalImage = document.querySelector(".modalImage");
Array.from(document.querySelectorAll(".ImgThumbnail")).forEach(item => {
   item.addEventListener("click", event => {
      modalEle.style.display = "block";
      modalImage.src = event.target.src;
   });
});
document.querySelector(".close").addEventListener("click", () => {
   modalEle.style.display = "none";
});
    </script>