<%@page import="cs5513.DataHandler"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String salary = request.getParameter("salary");
		String street = request.getParameter("street");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String zip_code= request.getParameter("zip code");
		String contact_number = request.getParameter("contact number");
		String specialization = request.getParameter("specialization");
		String patient_id = request.getParameter("patient id");
		
		boolean success = handler.addDoctor(id, name, sex, salary, street, city, state, zip_code, contact_number,specialization, patient_id);
		if(!success){
			%>
		<h2>There was a problem inserting the doctor</h2>
		<%
		}else{
			%>
		<h2>The doctor:</h2>
		<ol>
			<li>id: <%=id %></li>
			<li>name: <%=name %></li>
			<li>sex: <%=sex %></li>
			<li>salary: <%=salary %></li>
			<li>street: <%=street %></li>
			<li>city: <%=city %></li>
			<li>state: <%=state %></li>
			<li>zip code: <%=zip_code %></li>
			<li>contact number: <%=contact_number%>
			</li>
			<li>specialization: <%=specialization%>
			</li>
			<li>patient id: <%=patient_id%>
			</li>
		</ol>
		<%
		}
	%>
	</center>
	<center>
		<a href="./web_menu.jsp">Main Menu</a>
	</center>
</body>
</html>