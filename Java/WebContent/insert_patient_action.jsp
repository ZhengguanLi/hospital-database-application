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
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String address = request.getParameter("address");
		String date_admitted_month = request.getParameter("date admitted month");
		String date_admitted_day = request.getParameter("date admitted day");
		String date_admitted_year = request.getParameter("date admitted year");
		String date_discharged_month = request.getParameter("date discharged month");
		String date_discharged_day = request.getParameter("date discharged day");
		String date_discharged_year = request.getParameter("date discharged year");
		String[] contact_number = request.getParameter("contact number").split(",");
		String strContact = "";
		for(int i = 0; i < contact_number.length-1; i++){
			strContact += contact_number[i] + ",";
		}
		strContact += contact_number[contact_number.length-1];
		boolean success = handler.addPatient(id, name, sex, address, date_admitted_month, date_admitted_day, date_admitted_year, date_discharged_month, date_discharged_day, date_discharged_year, contact_number);
		if(!success){
			%>
			<h2> There was a problem inserting the patient </h2>
			<%
		}else{
			%>
			<h2> The patient: </h2>
			<ol>
				<li> name: <%=name %></li>
				<li> id: <%=id %></li>
				<li> sex: <%=sex %></li>
				<li> address: <%=address %></li>
				<li> date_admitted_month: <%=date_admitted_month %></li>
				<li> date_admitted_day: <%=date_admitted_day %></li>
				<li> date_admitted_year: <%=date_admitted_year %> </li>
				<li> date_discharged_month: <%=date_discharged_month %></li>
				<li> date_discharged_day: <%=date_discharged_day %></li>
				<li> date_discharged_year: <%=date_discharged_year %> </li>
				<li> contact_number: <%=strContact %> </li>
			</ol>
			<%
		}
	%>
	<a href="./web_menu.jsp">Main Menu</a>
	</center>
</body>
</html>