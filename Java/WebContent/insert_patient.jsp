<%@page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1252" />
<title>insert a patient record</title>
</head>
<body>
	<h2 align="center">CS5513 Web Application</h2>
	<h3 align="center">Insert A New Patient Record</h3>
	<h3 align="center">
		<jsp:useBean id="empsbean" class="cs5513.DataHandler" scope="session" />
	</h3>
	<form action="insert_patient_action.jsp">
		<div align="center">
			<p>&nbsp;</p>
			<table cellspacing="2" cellpadding="3" border="1" width="369">
				<tr>
					<td width="45%"><strong>Patient id:</strong></td>
					<td width="62%"><input type="text" name="id" /></td>
				</tr>
				<tr>
					<td width="45%"><strong>Name:</strong></td>
					<td width="62%"><input type="text" name="name" /></td>
				</tr>
				<tr>
					<td width="45%"><strong>Sex:</strong></td>
					<td width="62%"><input type="text" name="sex" /></td>
				</tr>
				<tr>
					<td width="45%"><strong>Address:</strong></td>
					<td width="62%"><input type="text" name="address" /></td>
				</tr>
				<tr>
					<td width="45%"><strong>Date Admitted Month:</strong></td>
					<td width="62%"><input type="text" name="date admitted month" /></td>
				</tr>
				<tr>
					<td width="45%"><strong>Date Admitted Day:</strong></td>
					<td width="62%"><input type="text" name="date admitted day" /></td>
				</tr>
				<tr>
					<td width="45%"><strong>Date Admitted Year:</strong></td>
					<td width="62%"><input type="text" name="date admitted year" /></td>
				</tr>
				<tr>
					<td width="45%"><strong>Date Discharged Month:</strong></td>
					<td width="62%"><input type="text"
						name="date discharged month" /></td>
				</tr>
				<tr>
					<td width="45%"><strong>Date Discharged Day:</strong></td>
					<td width="62%"><input type="text" name="date discharged day" /></td>
				</tr>
				<tr>
					<td width="45%"><strong>Date Discharged Year:</strong></td>
					<td width="62%"><input type="text" name="date discharged year" /></td>
				</tr>
				<tr>
					<td width="45%"><strong>Contact number:</strong></td>
					<td width="62%"><input type="text" name="contact number" /></td>
				</tr>
			</table>
			<table cellspacing="3" cellpadding="2" border="0">
				<tr>
					<td><input type="submit" value="Insert patient" /></td>
				</tr>
			</table>
			<p>&nbsp;</p>
		</div>
	</form>
	<center>
		<a href="./web_menu.jsp">Main Menu</a>
	</center>
</body>
</html>