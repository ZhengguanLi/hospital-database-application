<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1252" />
<title>insert a room record</title>
</head>
<body>
	<h2 align="center">CS5513 Web Application</h2>
	<h3 align="center">Insert a New Room Record</h3>
	<h3 align="center">
		<jsp:useBean id="empsbean" class="cs5513.DataHandler" scope="session" />
	</h3>

	<form action="insert_room_action.jsp">
		<div align="center">
			<p>&nbsp;</p>
			<table cellspacing="2" cellpadding="3" border="1" width="369">
				<tr>
					<td width="45%"><strong>Room ID:</strong></td>
					<td width="62%"><input type="text" name="room id" /></td>
				</tr>
				<tr>
					<td width="45%"><strong>Room Type:</strong></td>
					<td width="62%"><input type="text" name="room type" /></td>
				</tr>
				<tr>
					<td width="45%"><strong>Nurse ID:</strong></td>
					<td width="62%"><input type="text" name="nurse id" /></td>
				</tr>
				<tr>
					<td width="45%"><strong>Patient ID:</strong></td>
					<td width="62%"><input type="text" name="patient id" /></td>
				</tr>
			</table>
			<table cellspacing="3" cellpadding="2" border="0">
				<tr>
					<td><input type="submit" value="Insert Room" /></td>
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