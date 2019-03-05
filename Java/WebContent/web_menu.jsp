<%@page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"	content="text/html; charset=windows-1252" />
<title>web menu</title>
</head>
<body>
	<h2 align="center">CS5513 Web Application</h2>
	<h3 align="center">Web Menu</h3>
	<h3 align="center">
		<jsp:useBean id="empsbean" class="cs5513.DataHandler" scope="session" />
	</h3>
	<form action="web_menu_action.jsp">
		<div align="left">			
			<a href="./insert_patient.jsp">	1. Insert the complete information for a patient.</a><br>
			<a href="./insert_nurse.jsp">2. Insert the complete information for a nurse.</a><br>
			<a href="./insert_doctor.jsp">3. Insert the complete information for a doctor and associate him/her with a patient.</a><br>
			<a href="./insert_room.jsp">4. Insert the complete information for a room and associate it with a patient and a nurse.</a><br>
			<a href="./insert_medicine.jsp">5. Insert the complete information for a medicine and associate it with a patient.</a><br>
			<a href="./find_patients.jsp">6. Find the complete information for all the patients who were in the hospital during a particular month of a particular year.</a><br>
			<a href="./find_doctors.jsp">7. Find the complete information for all the doctors who care for more than two patients.</a><br>
			<a href="./find_nurses.jsp">8. Find the complete information for all the nurses who tend to patients that are given a certain medicine </a><br>
			<a href="./delete_patients.jsp">9. Delete all the patients who were discharged before a particular year.</a><br>
			<a href="./delete_patients2.jsp">10. Delete all the patients who have not been assigned a room.</a><br>
		</div>
	</form>
</body>
</html>