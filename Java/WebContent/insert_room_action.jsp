<%@page import="cs5513.DataHandler"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
		String room_id = request.getParameter("room id");
		String room_type = request.getParameter("room type");
		String nurse_id = request.getParameter("nurse id");
		String patient_id = request.getParameter("patient id");
		String quantity = request.getParameter("quantity");
		
		boolean success = handler.addRoom(room_id, room_type, nurse_id, patient_id);
		if(!success){
			%>
			<h2> There was a problem inserting the room </h2>
			<%
		}else{
			%>
			<h2> The room: </h2>
			<ol>
				<li> room id: <%=room_id %></li>
				<li> room type: <%=room_type %></li>
				<li> nurse id: <%=nurse_id %></li>
				<li> patient id: <%=patient_id %></li>
				<li> quantity: <%=quantity %></li>
				
			</ol>
			<%
		}
	%>
	<a href="./web_menu.jsp">Main Menu</a>
	</center>
</body>
</html>