<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="login.css">
<style>
@import url('https://fonts.googleapis.com/css?family=Raleway:400,100,200,300') ;
* {

margin : 0;
padding : 0;
}

html {
box-sizing : border-box;
}
*, *:before, *:after {
margin : 0;
padding : 0;
box-sizing : inherit;
}
a {
color : #666;
text-decoration : none;
}
a:hover {
color : #4FDA8C;
}
body {
position : relative;
color : #666;
font : 16px/26px "Raleway", sans-serif;
text-align : center;
height : 100%;
background : linear-gradient(180deg, rgb(34, 46, 64, 1) 0%, rgb(81, 195, 184, 1) 100%);
overflow : hidden;
}
a.button {
position : absolute;
left : 20px;
top : 20px;
height : auto;
padding : 0.8rem 1.0rem;
font-size : 0.8rem;
line-height : normal;
text-transform : uppercase;
font-family : 'Proxima Nova', sans-serif;
font-weight : 700;
letter-spacing : 0;
border-radius : 0;
border : #2D515C solid 1px;
text-decoration : none;
color : #fff;
background-color : transparent;
transition : all 0.2s ease-in-out;
}
a.button:hover {
border-color : #2D515C;
color : #fff;
padding : 1.0rem 3.2rem;
}
@media only screen and (min-width: 22em) {
a.button {
padding : 1.0rem 2.8rem;
font-size : 1.0rem;
}
}
.login {
margin : 0;
width : 100%;
height : 100%;
min-height : 100vh;
}
.wrap {
position : static;
margin : auto;
width : 100%;
height : auto;
overflow : hidden;
}
.wrap:after {
content : "";
display : table;
clear : both;
}
.logo {
position : absolute;
z-index : 2;
top : 0;
left : 0;
width : 40px;
height : 40px;
background : #4FC1B7;
}
.logo img {
position : absolute;
margin : auto;
top : 0;
right : 0;
bottom : 0;
left : 0;
width : 30px;
}
.logo a {
width : 100%;
height : 100%;
display : block;
}
.user {
position : relative;
z-index : 0;
margin : auto;
padding-top : 40px;
width : 100%;
height : 100vh;
background : linear-gradient(42deg, rgb(42, 46, 54, 1) 0%, rgb(97, 107, 125, 1) 100%);
box-shadow : none;
border-radius : 0;
border-top : 1px solid #4FC1B7;
overflow-y:scroll;
scrollbar-width:none;
-ms-overflow-style:none;
}
.user::-webkit-scrollbar
{
	display:none;
}
.user .actions {
margin : 1em 0 0;
padding-right : 10px;
width : 100%;
display : block;
text-align : center;
}
.user .actions a {
margin : 1em 0;
width : 90px;
display : inline-block;
padding : 0.2em 0;
background-color : #5C6576;
border : none;
color : #999;
cursor : pointer;
text-align : center;
font-size : 0.8em;
border-radius : 30px 0 0 30px;
box-shadow : 0 0 27px -9px rgb(0, 0, 0, 0.75);
}
.user .actions a:last-child {
color : #fff;
border-radius : 0 30px 30px 0;
background-color : #28A55F;
background : linear-gradient(180deg, rgb(105, 221, 201, 1) 0%, rgb(78, 193, 182, 1) 100%);
}
@keyframes show_terms {
0% {
opacity : 0;
transform : translateY(-110%);
}
100% {
opacity : 1;
transform : translateY(0);
}
}
@keyframes hide_terms {
0% {
transform : translateY(0);
opacity : 1;
}
100% {
transform : translateY(-110%);
opacity : 0;
}
}
.recovery {
position : absolute;
z-index : 3;
margin-left : 27%;
padding : 1.5em 1em;
width : 100%;
height : calc(100% - 40px);
border-radius : 0;
background : #fff;
text-align : left;
overflow : auto;
will-change : transform;
transform : translateY(-110%);
opacity : 0;
border-radius : 10px;
}
.recovery.open {
transform : translateY(0);
animation : show_terms 0.5s 0.2s ease 1 normal forwards;
margin-left : 27%;
}
.recovery.closed {
transform : translateY(0);
opacity : 1;
animation : hide_terms 0.6s 0.2s ease 1 normal forwards;
margin-left : 27%;
}

.recovery form .input {
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
color : #666;
}
.hello {
margin : 1em 0;
padding : 0.2em 3em;
width : auto;
display : block;
border : none;
color : #fff;
font-size : 0.8em;
border-radius : 0;
background :0% rgb(62, 181, 169, 1);
}
.form-wrap form .button:hover {
background-color : #4FDA8C;
}


.content {
position : fixed;
z-index : 1;
float : none;
margin : 0 auto;
width : 100%;
height : 40px;
background : linear-gradient(0deg, rgb(62, 181, 169, 1) 0%, rgb(111, 226, 204, 1) 100%);
box-shadow : none;
overflow : hidden;
}
#toggle-wrap {
position : absolute;
z-index : 4;
top : 40px;
right : 17px;
width : 80px;
height : 1px;
}
#toggle-terms span {
background : #fff;
border-radius : 0;
}
#toggle-terms {
position : absolute;
z-index : 4;
right : 0;
top : 0;
width : 40px;
height : 40px;
margin-left : 70%;
display : block;
cursor : pointer;
background : rgb(0, 0, 0, 0.1);
border-radius : 100%;
opacity : 0;
transform : translate(-6px,20px);
}
#toggle-terms:after {
position : absolute;
width : 100%;
height : 100%;
pointer-events : none;
border-radius : 50%;
content : '';
box-sizing : content-box;
}
#toggle-terms:before {
speak : none;
display : block;
}
#toggle-terms {
box-shadow : 0 0 0 0 rgb(0, 0, 0, 0.2);
transition : color 0.3s ease;
}
#toggle-terms:after {
top : 0;
left : 0;
padding : 0;
z-index : -1;
background : rgb(0, 0, 0, 0.2);
transition : transform 0.2s, opacity 0.3s;
}
#toggle-terms.closed {
color : rgb(0, 0, 0, 0.2);
}
#toggle-terms.closed:after {
transform : scale(1.6);
opacity : 0;
}
@keyframes show_close {
0% {
opacity : 0;
transform : translate(-6px,-100px);
}
100% {
opacity : 1;
transform : translate(-6px,20px);
}
}
@keyframes hide_close {
0% {
opacity : 1;
}
100% {
opacity : 0;
}
}
#toggle-terms.open {
animation : show_close 0.4s 0.5s ease 1 normal forwards;
}
#toggle-terms.closed {
animation : hide_close 0.2s 0.0s ease 1 normal forwards;
}
#toggle-terms:hover {
background : rgb(0, 0, 0, 0.4);
}
#toggle-terms #cross {
position : absolute;
z-index : 4;
height : 100%;
width : 100%;
transform : rotate(0deg);
}
#toggle-terms.open #cross {
transition-delay : 0.9s;
transition-duration : 0.2s;
transform : rotate(45deg);
}
#toggle-terms.open #cross span {
position : absolute;
z-index : 4;
transition-delay : 0s;
transition-duration : 0s;
}
#toggle-terms.open #cross span:nth-child(1) {
top : 15%;
left : 19px;
height : 70%;
width : 1px;
}
#toggle-terms.open #cross span:nth-child(2) {
left : 15%;
top : 19px;
width : 70%;
height : 1px;
}
#toggle-terms #cross span:nth-child(1) {
height : 0;
transition-delay : 0.625s;
}
#toggle-terms #cross span:nth-child(2) {
width : 0;
transition-delay : 0.375s;
}
#slideshow {
position : relative;
margin : 0 auto;
width : 100%;
height : 100%;
padding : 10px;
border-radius : 10px 0 0 10px;
}
#slideshow h2 {
margin : 0 auto 0 auto;
text-align : center;
font-size : 1.4em;
color : #fff;
line-height : 0.5em;
}
#slideshow p {
color : #fff;
display : none;
}
#slideshow div {
position : absolute;
top : 0;
left : 0;
right : 0;
bottom : 0;
padding : 1em 3em;
background-repeat : no-repeat;
background-size : cover;
}
#slideshow .one {
background-image : url("http://res.cloudinary.com/dpcloudinary/image/upload/v1506186248/dots.png");
background-repeat : no-repeat;
background-position : 0% 50%;
}
#slideshow .two {
background-image : url("http://res.cloudinary.com/dpcloudinary/image/upload/v1506186248/gears.png");
background-repeat : no-repeat;
background-position : 0% 50%;
}
#slideshow .three {
background-image : url("http://res.cloudinary.com/dpcloudinary/image/upload/v1506186248/splat.png");
background-repeat : no-repeat;
background-position : 0% 5%;
}
#slideshow .four {
background-image : url("http://res.cloudinary.com/dpcloudinary/image/upload/v1506186248/ray.png");
background-repeat : no-repeat;
background-position : 0% 50%;
}
input {
font : 16px/26px "Raleway", sans-serif;
}
.form-wrap {
width : 100%;
margin : 2em auto 0;
}
.form-wrap a {
color : #ccc;
padding-bottom : 4px;
border-bottom : 1px solid #5FD1C1;
}
.form-wrap a:hover {
color : #fff;
}
.form-wrap .tabs {
overflow : hidden;
}
.form-wrap .tabs * {
transition : 0.25s ease-in-out;
}
.form-wrap .tabs h3 {
float : left;
width : 50%;
}
.form-wrap .tabs h3 a {

text-align : center;
font-weight : 400;
display : block;
color : #999;
border : 0;
}
.form-wrap .tabs h3 a.active {
color : #ccc;
}
.form-wrap .tabs h3 a.active span {
padding-bottom : 4px;
border-bottom : 1px solid #5FD1C1;
}
.form-wrap .tabs-content {
padding : 1.5em 3em;
text-align : left;
width : auto;
}
.help-action {
padding : 0.4em 0 0;
font-size : 0.93em;
}
.form-wrap .tabs-content div[id$="tab-content"] {
display : none;
}
.form-wrap .tabs-content .active {
display : block !important ;
}
.form-wrap form .input {
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
.form-wrap form .button {
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
.form-wrap form .button:hover {
background-color : #4FDA8C;
}
.form-wrap form .checkbox {
margin : 1em 0;
padding : 20px;
visibility : hidden;
text-align : left;
}
.form-wrap form .checkbox:checked + label:after {
opacity : 1;
}
.form-wrap form label[for] {
position : relative;
padding-left : 20px;
cursor : pointer;
}
.form-wrap form label[for]:before {
position : absolute;
width : 17px;
height : 17px;
top : 0;
left : -14px;
content : '';
border : #5A6374 solid 1px;
}
.form-wrap form label[for]:after {
position : absolute;
top : 1px;
left : -10px;
width : 15px;
height : 8px;
opacity : 0;
content : '';
background-color : transparent;
border : #67DAC6 solid;
border-width : 0 0 3px 3px;
transform : rotate(-45deg);
}
.form-wrap .help-text {
margin-top : 0.6em;
}
.form-wrap .help-text p {
text-align : left;
font-size : 14px;
}
.fa {
display : none;
}
@media only screen and (min-width: 40em) {
* {
transition : 0.25s ease-in-out;
}
.wrap {
position : fixed;
top : 0;
left : 0;
right : 0;
bottom : 0;
width : 600px;
height : 500px;
margin : auto;
border-radius : 10px;
}
.logo {
top : 10px;
left : 10px;
width : 40px;
height : 40px;
background : none;
}
.logo img {
width : 100%;
}
}
@keyframes show_close {
0% {
opacity : 0;
transform : translate(-6px,-100px);
}
100% {
opacity : 1;
transform : translate(-6px,18px);
}
}
#toggle-wrap {
top : 60px;
right : calc(20% + 50px);
height : 80px;
overflow : hidden;
}
#toggle-wrap.closed {
width : 50%;
}
#toggle-terms {
opacity : 1;
transform : translate(-6px,-100px);
}
#toggle-terms.closed {
opacity : 1;
transform : translate(-6px,18px);
}
#slideshow h2 {
margin : 4.5em 0 1em;
font-size : 2em;
}
#slideshow h2 span {
padding : 5px 0;
border : #B6EDE3 solid;
border-width : 1px 0;
}
#slideshow p {
display : block;
}
#slideshow div {
background-size : auto;
}
#slideshow .one {
background-position : 50% 130%;
}
#slideshow .two {
background-position : 50% 200%;
}
#slideshow .three {
background-position : 50% 300%;
}
#slideshow .four {
background-position : -40% -80%;
}
.content, .content.full {
position : relative;
float : left;
width : 50%;
height : 500px;
box-shadow : -3px 0 45px -6px rgb(56, 75, 99, 0.61);
border-radius : 10px 0 0 10px;
}
.terms, .recovery {
position : absolute;
width : 50%;
height : 440px;
float : left;
margin : 60px 0 0;
box-shadow : -3px 0 45px -6px rgb(56, 75, 99, 0.61);
border-radius : 0 0 0 10px;
}
.user {
padding-top : 0;
float : left;
width : 50%;
height : 500px;
box-shadow : -3px 0 45px -6px rgb(56, 75, 99, 0.61);
border-radius : 10px 10px 10px 10px;
border : 0;
margin-left : 27%;
}
.user .actions {
margin : 0;
text-align : right;
}
.form-wrap {
margin : 3em auto 0;
}
.form-wrap .tabs-content {
padding : 1.5em 2.5em;
}
.tabs-content p {
position : relative;
}
.tabs-content .fa {
position : absolute;
top : 8px;
left : -16px;
display : block;
font-size : 0.8em;
color : #fff;
opacity : 0.3;
transform : translate(0,0);
transition : transform 0.3s 0.3s ease, opacity 0.6s 0.0s ease;
}
.tabs-content .fa.active {
transform : translate(-3px,0);
opacity : 0.8;
}
.tabs-content .fa.inactive {
transform : translate(0,0);
opacity : 0.3;
}
@media only screen and (min-width: 60em) {
.wrap {
width : 900px;
height : 550px;
}
.content, .content.full {
height : 550px;
}
.terms, .recovery {
height : 490px;
}
#slideshow h2 {
margin : 4em 0 1em;
font-size : 3em;
}
#slideshow .four {
background-position : -82% -330%;
}
.user {
height : 550px;
}
.form-wrap {
margin : 5em auto 0;
}
.form-wrap .tabs-content {
padding : 1.5em 4.9em;
}
}
.element {
opacity : 0.0;
transform : scale(0.95) translate3d(0,100%,0);
transition : transform 400ms ease, opacity 400ms ease;
}
.element.active {
opacity : 1.0;
transform : scale(1.0) translate3d(0,0,0);
}
.element.inactive {
opacity : 0.0;
transform : scale(1) translate3d(0,0,0);
}
option{
    color: black;
}
select .input{
    color: #2D515C;
}
#male,#female{
    width: 20%;    
}
</style>
</head>
<body>
<!-- LOGIN MODULE -->
        <div class="login">
            <div class="wrap">
                <!-- TOGGLE -->
                <div id="toggle-wrap">
                    <div id="toggle-terms">
                        <div id="cross">
                            <span></span>
                            <span></span>
                        </div>
                    </div>
                </div>            

                <div class="user">                   
                    <div class="form-wrap">
                        <!-- TABS -->
                    	<div class="tabs">                            
                    		<h3 class="signup-tab"><a class="sign-up"><span>Add New Places</span></a></h3>
                    	</div>                  
                    	<div class="tabs-content">
                            <!-- TABS CONTENT LOGIN -->
                    		<div id="login-tab-content" class="active">
                    			<form action="addplace" method="post" enctype="multipart/form-data" class="login-form">
									<input type="text" name="pname" placeholder="Name" class="input">
									<input type="text" name="time" placeholder="Time" class="input">
									<textarea name="desc" placeholder="Description" class="input"></textarea >
									<input type="text" name="loc" placeholder="Location" class="input">
									<input type="file" name="img" class="input">
									<input type="submit" value="Add Place" class="button">
											
									<a href="viewplace.jsp" style="text-align: center;">View All Records</a>							
									</form>
									                    			
                    		</div>
                            
                    	</div>  
                	</div>
                </div>
            </div>
        </div>

</body>
</html>