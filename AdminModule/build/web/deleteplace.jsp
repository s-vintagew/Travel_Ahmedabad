<%@page import="com.admin.dao.PlacesDao"%>
<jsp:useBean id="u" class="com.admin.bean.Places"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
PlacesDao.delete(u);
response.sendRedirect("viewplace.jsp");
%>