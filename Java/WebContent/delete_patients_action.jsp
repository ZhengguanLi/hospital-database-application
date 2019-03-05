<%@page import="cs5513.DataHandler"%>
<%@page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<%
			DataHandler handler = (DataHandler)request.getSession().getAttribute("handler");
			handler.getDBConnection();
			String year = request.getParameter("discharged year");
			boolean success = handler.deletePatients(year);
			if (!success) {
		%>
				<h2>There was a problem deleting the patients</h2>
		<%
			}else{
		%>
				<h2>Delete Succeed!</h2>
		<%
			}
		%>
		<a href="./web_menu.jsp">Main Menu</a>
	</center>
</body>
</html>