<%@page import="cs5513.DataHandler"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			String month = request.getParameter("month");
			String year = request.getParameter("year");
			ResultSet patients = handler.findPatients(year, month);
		%>
		<table cellspacing="2" cellpadding="2" border="1">
			<tr>
				<td align="center">
					<h4>pid:</h4>
				</td>
				<td align="center">
					<h4>patient_name:</h4>
				</td>
				<td align="center">
					<h4>sex</h4>
				</td>
				<td align="center">
					<h4>address:</h4>
				</td>
				<td align="center">
					<h4>year1:</h4>
				</td>
				<td align="center">
					<h4>month1:</h4>
				</td>
				<td align="center">
					<h4>day1:</h4>
				</td>
				<td align="center">
					<h4>year2:</h4>
				</td>
				<td align="center">
					<h4>month2:</h4>
				</td>
				<td align="center">
					<h4>day2:</h4>
				</td>
				<td align="center">
					<h4>contact_no:</h4>
				</td>
			</tr>
			<%
				while (patients.next()) {
					// Print the months as a comma, separated.
					String pid = patients.getString("pid");
					String patient_name = patients.getString("patient_name");
					String sex = patients.getString("sex");
					String address = patients.getString("address");
					String year1 = patients.getString("year1");
					String month1 = patients.getString("month1");
					String day1 = patients.getString("day1");
					String year2 = patients.getString("year2");
					String month2 = patients.getString("month2");
					String day2 = patients.getString("day2");
					//stay_period_obj stay_period= patients.getString("stay_period");
					Array contact_no_array = patients.getArray("contact_no");
					String ctArray[] = (String[]) contact_no_array.getArray();
					String strContact = "";
					for(int i = 0; i < ctArray.length - 1; i++){
						strContact = strContact + ctArray[i] +',';
					}
					strContact+= ctArray[ctArray.length-1];
					// Print each attribute
					out.println("<tr>");
					out.println("<td align=\"center\">" + pid + "</td><td align=\"center\"> " + patient_name
							+ "</td><td align=\"center\"> " + sex + "</td><td align=\"center\"> " + address
							+ "</td><td align=\"center\"> " + year1 + "</td><td align=\"center\"> " + month1
							+ "</td><td align=\"center\"> " + day1 + "</td><td align=\"center\"> " + year2
							+ "</td><td align=\"center\"> " + month2 + "</td><td align=\"center\"> " + day2
							+ "</td><td align=\"center\"> " + strContact);
					out.println("</tr>");
				}
			%>
		</table>
		<a href="./web_menu.jsp">Main Menu</a>
	</center>
</body>
</html>