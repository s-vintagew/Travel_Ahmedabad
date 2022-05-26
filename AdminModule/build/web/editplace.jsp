<%@page import="com.admin.dao.PlacesDao"%>
<jsp:useBean id="u" class="com.admin.bean.Places"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
int i=PlacesDao.update(u);
response.sendRedirect("viewplace.jsp");
%>