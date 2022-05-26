<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Form</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<style>
body {
	background: -webkit-linear-gradient(left, #0072ff, #00c6ff);
	overflow: hidden;
}

.contact-form {
	background: #fff;
	margin-top: 5%;
	margin-bottom: 5%;
	width: 70%;
}

.contact-form .form-control {
	border-radius: 1rem;
}

.contact-image {
	text-align: center;
}

.contact-image img {
	border-radius: 6rem;
	width: 11%;
	margin-top: -3%;
	transform: rotate(29deg);
}

.contact-form form {
	padding: 14%;
}

.contact-form form .row {
	margin-bottom: -7%;
}

.contact-form h3 {
	margin-bottom: 8%;
	margin-top: -10%;
	text-align: center;
	color: #0062cc;
}

.contact-form .btnContact {
	width: 50%;
	border: none;
	border-radius: 2.5rem;
	width:100px;
	margin:4px;
	background: #dc3545;
	font-weight: 600;
	color: #fff;
	cursor: pointer;
}

.btnContactSubmit {
	width: 50%;
	border-radius: 1rem;
	padding: 1.5%;
	color: #fff;
	background-color: #0062cc;
	border: none;
	cursor: pointer;
}
</style>
	<%@page import="com.admin.dao.PlacesDao,com.admin.bean.Places"%>

	<%
	String pname = request.getParameter("pname");
	Places u = PlacesDao.getRecordById(pname);
	%>
	<div class="container contact-form">
		<h1>Edit Form</h1>
		<form action="editplace.jsp" method="post">
			<input type="hidden" name="pname" value="<%=u.getPname()%>">
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						Name:<input type="text" name="pname" class="form-control"
							value="<%=u.getPname()%>" />
					</div>
					<div class="col-md-6">
						Time:<input type="text" name="time" class="form-control"
							value="<%=u.getTime()%>" />
					</div>
					<div class="col-md-6">
						Location:<input type="text" name="loc" class="form-control"
							value="<%=u.getLoc()%>" />
					</div>
					<div class="col-md-6">
						<input type="submit" class="btnContact" value="Edit Place" />
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						Description:
						<textarea name="desc" class="form-control"
							style="width: 100%; height: 150px;"><%=u.getDesc()%></textarea>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>