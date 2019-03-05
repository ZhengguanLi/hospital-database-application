<%@page import="cs5513.DataHandler"%>
<%@page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Array"%>
<%@page import="java.util.Set"%>
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
			ResultSet doctors = handler.findDoctors();
		%>
		<table cellspacing="2" cellpadding="2" border="1">
			<tr>
				<td align="center">
					<h4>id:</h4>
				</td>
				<td align="center">
					<h4>name:</h4>
				</td>
				<td align="center">
					<h4>sex</h4>
				</td>
				<td align="center">
					<h4>salary</h4>
				</td>
				<td align="center">
					<h4>street:</h4>
				</td>
				<td align="center">
					<h4>city:</h4>
				</td>
				<td align="center">
					<h4>state:</h4>
				</td>
				<td align="center">
					<h4>zip code:</h4>
				</td>
				<td align="center">
					<h4>contact number:</h4>
				</td>
				<td align="center">
					<h4>specialization:</h4>
				</td>
			</tr>
			<%
				while (doctors.next()) {
					// Print the months as a comma, separated.
					String id = doctors.getString("id");
					String name = doctors.getString("name");
					String sex = doctors.getString("sex");
					String salary = doctors.getString("salary");
					String street = doctors.getString("street");
					String city = doctors.getString("city");
					String state = doctors.getString("state");
					String zip_code = doctors.getString("zipcode");
					String contact_number = doctors.getString("contact_no");
					String specialization = doctors.getString("specialization");
					out.println("<tr>");
					out.println("<td align=\"center\">" + id + "</td><td align=\"center\"> " + name
							+ "</td><td align=\"center\"> " + sex + "</td><td align=\"center\"> " + salary
							+ "</td><td align=\"center\"> " + street + "</td><td align=\"center\"> " + city
							+ "</td><td align=\"center\"> " + state + "</td><td align=\"center\"> " + zip_code
							+ "</td><td align=\"center\"> " + contact_number 
							+ "</td><td align=\"center\"> " + specialization);
					out.println("</tr>");
				}
			%>
		</table>
		<a href="./web_menu.jsp">Main Menu</a>
	</center>
</body>
</html>