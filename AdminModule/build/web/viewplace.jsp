<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Places</title>
<style>
body{

height : auto;
background : linear-gradient(180deg, rgb(34, 46, 64, 1) 0%, rgb(81, 195, 184, 1) 100%);
background-size:cover;

}
table {
    width: 70%;
    text-align: center;
    border: 1px solid #fff;
    border-spacing: 1px;
    font-family: 'Cairo', sans-serif;
  margin: auto;
}

caption {
    font-weight: bold;
    font-size: 30px;
    color:white;
    line-height: 70px;
}

table td {
    padding: 10px;
    background-color: #eee;
}

table th {
    background-color: #333;
    color: #fff;
    padding: 10px;
}

img {
    width: 90px;
    height: 90px;
}

.view,
.delete {
    border: none;
    padding: 5px 10px;
    color: #fff;
    font-weight: bold;
}

.view {
    background-color: #03A9F4;
}

.delete {
    background-color: #E91E63;
}

.tablefoot {
    padding: 0;
    border-bottom: 3px solid #009688;
}
a{
text-decoration: none;
display : inline-block;
padding : 10px;
font-size : 20px;
color : black;
border : #29d9d5 solid 0.2rem;
border-radius : 5rem;
cursor : pointer;
background : none;
}
a:hover {
background : #29d9d5;
color : #111;
}
</style>
</head>
<body>

<%@page import="com.admin.dao.PlacesDao,com.admin.bean.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
List<Places> list=PlacesDao.getAllRecords();
request.setAttribute("list",list);
%>
<table>
<caption>Place List</caption>       
        <tr>
            <th>Name</th>
            <th>Time</th>
            <th>Description</th>
            <th>Location</th>
            <th>Image</th>
        </tr>
        <c:forEach items="${list}" var="u">
			<tr>
			<td>${u.getPname()}</td>
			<td>${u.getTime()}</td>
			<td>${u.getDesc()}</td>
			<td>${u.getLoc()}</td>
			<td><img src="data:image/jpg;base64,${u.getBase64Image()}" width="50" height="50"/></td>
			<td><a href="editform.jsp?pname=${u.getPname()}">Edit</a></td>
			<td><a href="deleteplace.jsp?pname=${u.getPname()}">Delete</a></td>
			</tr>
		</c:forEach>
</table>		
<br/>
<center><a href="addplaceform.jsp">Add New Places</a></center>

</body>
</html>



