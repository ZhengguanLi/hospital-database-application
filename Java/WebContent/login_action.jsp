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
			DataHandler handler = new DataHandler();

			String username = request.getParameter("username");
			String password = request.getParameter("password");

			boolean success = handler.authenticateUser(username, password);
			request.getSession().setAttribute("handler",handler);
			if (!success) {
		%>
				<h2>There was a problem logging in</h2>
		<%
			} else {
			%>
					<h2>Login succeed!</h2>
			<% 
				}
			%>
			<a href="./web_menu.jsp?param=handler">Main Menu</a>
	</center>
</body>
</html>