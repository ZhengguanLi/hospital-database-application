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
			String code = request.getParameter("code");
			String name = request.getParameter("name");
			String patient_id = request.getParameter("patient id");
			String quantity = request.getParameter("quantity");
			boolean success = handler.addMedicine(code, name, patient_id, quantity);
			if (!success) {
		%>
				<h2>There was a problem inserting the medicine</h2>
		<%
			}else{
		%>
				<h2>The medicine:</h2>
				<ol>
					<li>code: <%=code%></li>
					<li>name: <%=name%></li>
					<li>patient id: <%=patient_id%></li>
					<li>quantity: <%=quantity%></li>
				</ol>
		<%
			}
		%>
		<a href="./web_menu.jsp">Main Menu</a>
	</center>

</body>
</html>