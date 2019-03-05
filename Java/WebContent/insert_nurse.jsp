<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1252" />
<title>insert a nurse record</title>
</head>
<body>
	<h2 align="center">CS5513 Web Application</h2>
	<h3 align="center">Insert a New Nurse Record</h3>
	<h3 align="center">
		<jsp:useBean id="empsbean" class="cs5513.DataHandler" scope="session" />
	</h3>
	<form action="insert_nurse_action.jsp">
		<div align="center">
			<p>&nbsp;</p>
			<table cellspacing="2" cellpadding="3" border="1" width="369">
				<tr>
					<td width="45%"><strong>ID:</strong></td>
					<td width="62%"><input type="text" name="id" /></td>
				</tr>
				<tr>
					<td width="45%"><strong>Name:</strong></td>
					<td width="62%"><input type="text" name="name" /></td>
				</tr>
				<tr>
					<td width="45%"><strong>Salary:</strong></td>
					<td width="62%"><input type="text" name="salary" /></td>
				</tr>
				<tr>
					<td width="45%"><strong>Street:</strong></td>
					<td width="62%"><input type="text" name="street" /></td>
				</tr>
				<tr>
					<td width="45%"><strong>City:</strong></td>
					<td width="62%"><input type="text" name="city" /></td>
				</tr>
				<tr>
					<td width="45%"><strong>State:</strong></td>
					<td width="62%"><input type="text" name="state" /></td>
				</tr>
				<tr>
					<td width="45%"><strong>Zip Code:</strong></td>
					<td width="62%"><input type="text" name="zip code" /></td>
				</tr>
				<tr>
					<td width="45%"><strong>Sex:</strong></td>
					<td width="62%"><input type="text" name="sex" /></td>
				</tr>
				<tr>
					<td width="45%"><strong>Contact number:</strong></td>
					<td width="62%"><input type="text" name="contact number" /></td>
				</tr>
				<tr>
					<td width="45%"><strong>Level:</strong></td>
					<td width="62%"><input type="text" name="level" /></td>
				</tr>
			</table>
			<table cellspacing="3" cellpadding="2" border="0">
				<tr>
					<td><input type="submit" value="Insert Nurse" /></td>
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