<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
body {
background : #111;
overflow-x : hidden;
overflow:unset;
padding-top:200px;
}
.btn{
    margin-left : 1rem;
display : inline-block;
padding : 1rem 4rem;
font-size : 1.7rem;
color : #29d9d5;
border : #29d9d5 solid 0.2rem;
border-radius : 5rem;
cursor : pointer;
background : none;
}

.container{
	width:650px;	
	margin-left:10px;
}
h1{
color:white;
text-align: center;
font-size: 50px;
}
.btn:hover {
background : #29d9d5;
color : #111;
}
a{
text-decoration: none;
}
.hello{
text-align: center;
}
</style>
</head>
<body>

<h1>Admin Page</h1>
<div class="hello">
<a class="btn" href="addplaceform.jsp">Add Places</a>
<a class="btn" href="viewplace.jsp">View Places</a>
</div>
</body>
</html>