package cs5513; // import all necessary libraries import java.io.FileNotFoundException; import java.sql.Connection; import java.sql.PreparedStatement; import java.sql.SQLException; import oracle.jdbc.pool.OracleDataSource; import java.sql.Statement; import java.sql.ResultSet; import java.text.ParseException; import java.text.SimpleDateFormat; import java.util.Date; import java.util.Locale;
import javax.servlet.http.HttpSession;
import java.io.FileNotFoundException;
import java.sql.Connection; 
import java.sql.PreparedStatement; 
import java.sql.SQLException; 
import oracle.jdbc.pool.OracleDataSource; 
import java.sql.Statement; 
import java.sql.ResultSet; 
import java.text.ParseException; 
import java.text.SimpleDateFormat; 
import java.util.Date; 
import java.util.Locale;
import javax.servlet.http.HttpSession;

public class DataHandler {
	//specify the database connection string and log in information
	String jdbcUrl = "jdbc:oracle:thin:@//oracle.cs.ou.edu:1521/pdborcl.cs.ou.edu"; 
	String userid = "username"; //your Oracle username 
	String password = "password";	//your Oracle password 
	Connection conn; 
	Statement stmt; 
	ResultSet rset; 
	String query; 
	String sqlString, sqlString2;

	//create a new database connection
	public void getDBConnection() throws SQLException{ 
		OracleDataSource ds; 
		ds = new OracleDataSource(); 
		ds.setURL(jdbcUrl); 
		conn = ds.getConnection(userid, password);
		System.out.println("Get connection!");
	}

	//authenticate user; if valid then connect to the database otherwise display //error message
	@SuppressWarnings("null")
	public boolean authenticateUser(String userid, String password) throws SQLException {
		this.userid = userid; 
		this.password = password; 
		try {
			OracleDataSource ds;
			ds = new OracleDataSource(); 
			ds.setURL(jdbcUrl); 
			conn = ds.getConnection(userid, password); //connect to DB 
			return true;
		}
		catch ( SQLException ex ) { 
			System.out.println("Invalid user credentials"); 
			HttpSession session = null;
			session.setAttribute("loginerrormsg", "Invalid Login. Try Again...");
			this.jdbcUrl = null; 
			this.userid = null; 
			this.password = null;
			return false;
		}
	}
	
	//1.Insert the complete information for a patient
	public boolean addPatient(String id, String name, String sex, String address, String date_admitted_month, String date_admitted_day, String date_admitted_year, String date_discharged_month, String date_discharged_day, String date_discharged_year, String[] contact_number) throws SQLException,FileNotFoundException { 
		getDBConnection();
		int updateRows = 0;
		String strContact = "contact_no_list(";
		for(int i = 0; i < contact_number.length-1 ;i++) {
			strContact += "?,";
		}
		strContact += "?)";

		String sqlInsertPatient = "INSERT INTO patient_tab VALUES (?, ?, ?, ?, stay_period_obj(date_admitted_obj(?, ?, ?), date_discharged_obj(?, ?, ?)),"+ strContact + ")"; 

		try(PreparedStatement stmt = conn.prepareStatement(sqlInsertPatient);){
			stmt.setString(1, id);
			stmt.setString(2, name);
			stmt.setString(3, sex);
			stmt.setString(4, address);
			stmt.setString(5, date_admitted_month);
			stmt.setString(6, date_admitted_day);
			stmt.setString(7, date_admitted_year);
			stmt.setString(8, date_discharged_month);
			stmt.setString(9, date_discharged_day);
			stmt.setString(10, date_discharged_year);
			for(int i = 0; i < contact_number.length;i++) {
				stmt.setString(11 + i, contact_number[i]);
			}
			updateRows = stmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		} 
		return updateRows != 0;
	}

	//2.Insert the complete information for a nurse
	public boolean addNurse(String id, String name, String sex, String salary, String street, String city, String state, String zip_code, String contact_number, String level) throws SQLException,FileNotFoundException { 
		getDBConnection();
		int updateRows = 0;
		String sqlInsertNurse = "INSERT INTO nurse_tab VALUES (?, ?, ?, ?, e_address_obj(?, ?, ?, ?), ?, ?)"; 

		try(PreparedStatement stmt = conn.prepareStatement(sqlInsertNurse);){
			stmt.setString(1, id);
			stmt.setString(2, name);
			stmt.setString(3, sex);
			stmt.setString(4, salary);
			stmt.setString(5, street);
			stmt.setString(6, city);
			stmt.setString(7, state);
			stmt.setString(8, zip_code);
			stmt.setString(9, contact_number);
			stmt.setString(10, level);
			updateRows = stmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		} 
		return updateRows != 0;
	}
	
	//3. Insert the complete information for a doctor and associate him/her with a patient.
	public boolean addDoctor(String id, String name, String sex, String salary, String street, String city, String state, String zip_code, String contact_number, String specialization, String patient_id) throws SQLException,FileNotFoundException { 
		getDBConnection();
		int updateRows = 0;

		//check if patient id is valid
		String sqlFindPatient = "SELECT pid from patient_tab where pid = " + patient_id;
		Statement stmt = conn.createStatement();
		ResultSet reset = stmt.executeQuery(sqlFindPatient);
		if(!reset.next()){
			System.out.println("Patient ID Not found!");
			return false;
		}
		System.out.println("Patient ID found!");

		//if valid, then insert doctor
		String sqlInsertDoctor = "INSERT INTO doctor_tab VALUES (?, ?, ?, ?, e_address_obj(?, ?, ?, ?), ?, ?)"; 
		try(PreparedStatement stmt1 = conn.prepareStatement(sqlInsertDoctor);){
			stmt1.setString(1, id);
			stmt1.setString(2, name);
			stmt1.setString(3, sex);
			stmt1.setString(4, salary);
			stmt1.setString(5, street);
			stmt1.setString(6, city);
			stmt1.setString(7, state);
			stmt1.setString(8, zip_code);
			stmt1.setString(9, contact_number);
			stmt1.setString(10, specialization);
			updateRows = stmt1.executeUpdate();
			System.out.println("Insert Doctor Succeed!");
		}catch(SQLException e){
			e.printStackTrace();
		} 

		//insert doctor correctly, insert cares_tab
		if(updateRows != 0){
			String sqlInsertCares = "INSERT INTO cares_tab select REF(patient), REF(doctor) from patient_tab patient, doctor_tab doctor where patient.pid = ? and doctor.eid = ?"; 
			try(PreparedStatement stmt1 = conn.prepareStatement(sqlInsertCares);){
				stmt1.setString(1, patient_id);
				stmt1.setString(2, id);
				updateRows = stmt1.executeUpdate();
				System.out.println("Insert Cares Succeed!");
			}catch(SQLException e){
				e.printStackTrace();
			} 
		}
		return updateRows!= 0;
	}

	//4. Insert the complete information for a room and associate it with a patient and a nurse.
	public boolean addRoom(String room_id, String room_type, String nurse_id, String patient_id) throws SQLException,FileNotFoundException { 
		getDBConnection();
		int updateRows = 0;
		//check if patient id is valid
		String sqlFindPatient = "SELECT pid from patient_tab where pid = " + patient_id;
		Statement stmt = conn.createStatement();
		ResultSet reset = stmt.executeQuery(sqlFindPatient);
		if(!reset.next()){
			System.out.println("Patient ID Not found!");
			return false;
		}
		System.out.println("Patient ID found!");

		//check if nurse id is valid
		String sqlFindNurse = "SELECT eid from nurse_tab where eid = " + nurse_id;
		stmt = conn.createStatement();
		reset = stmt.executeQuery(sqlFindNurse);
		if(!reset.next()){
			System.out.println("Nurse ID Not found!");
			return false;
		}
		System.out.println("Nurse ID found!");

		//insert room
		String sqlInsertNurse = "INSERT INTO room_tab select ?, ?, REF(nurse), REF(patient) from nurse_tab nurse, patient_tab patient where nurse.eid = ? and patient.pid = ?"; 

		try(PreparedStatement stmt1 = conn.prepareStatement(sqlInsertNurse);){
			stmt1.setString(1, room_id);
			stmt1.setString(2, room_type);
			stmt1.setString(3, nurse_id);
			stmt1.setString(4, patient_id);
			updateRows = stmt1.executeUpdate();
			System.out.println("Insert Room Succeed!");
		}catch(SQLException e){
			e.printStackTrace();
		} 
		return updateRows != 0;
	}
	
	//5.Insert the complete information for a medicine and associate it with a patient.
	public boolean addMedicine(String code, String name, String patient_id, String quantity) throws SQLException,FileNotFoundException { 
		getDBConnection();
		int updateRows = 0;

		//check if patient id is valid
		String sqlFindPatient = "SELECT pid from patient_tab where pid = " + patient_id;
		Statement stmt = conn.createStatement();
		ResultSet reset = stmt.executeQuery(sqlFindPatient);
		if(!reset.next()){
			System.out.println("Patient ID Not found!");
			return false;
		}
		System.out.println("Patient ID found!");

		//if valid, then insert doctor
		String sqlInsertMedicine = "INSERT INTO medicine_tab VALUES (?, ?)"; 
		System.out.println("\nInserting: " + sqlInsertMedicine);
		try(PreparedStatement stmt1 = conn.prepareStatement(sqlInsertMedicine);){
			stmt1.setString(1, code);
			stmt1.setString(2, name);
			updateRows = stmt1.executeUpdate();
			System.out.println("Insert Medicine Succeed!");
		}catch(SQLException e){
			e.printStackTrace();
		} 

		//insert doctor correctly, insert cares_tab
		if(updateRows != 0){
			String sqlInsertIsGiven = "INSERT INTO is_given_tab select ?, REF(patient), REF(medicine) from patient_tab patient, medicine_tab medicine where patient.pid = ? and medicine.code = ?"; 
			System.out.println("\nInserting: " + sqlInsertIsGiven);
			try(PreparedStatement stmt1 = conn.prepareStatement(sqlInsertIsGiven);){
				stmt1.setString(1, quantity);
				stmt1.setString(2, patient_id);
				stmt1.setString(3, code);
				updateRows = stmt1.executeUpdate();
				System.out.println("Insert is_given Succeed!");
			}catch(SQLException e){
				e.printStackTrace();
			} 
		}
		return updateRows!= 0;
	}

	//6. Find the patients during a particular month of particular year
	public ResultSet findPatients(String year, String month) throws SQLException,FileNotFoundException { 
		getDBConnection();
		String sqlFindPatients="select p.pid as pid,p.name as patient_name,p.sex as sex,p.address as address,"
				+ "p.stay_period.date_admitted.year as year1, p.stay_period.date_admitted.month as month1,p.stay_period.date_admitted.day as day1,"
				+"p.stay_period.date_discharged.year as year2,p.stay_period.date_discharged.month as month2,"
				+ "p.stay_period.date_admitted.day as day2, p.contact_no from patient_tab p "
				+ "where p.stay_period.date_admitted.year>=? and p.stay_period.date_admitted.month>=? and p.stay_period.date_discharged.year>=? and p.stay_period.date_discharged.month>=?";

		// Prepare the SQL query.
		PreparedStatement stmt= conn.prepareStatement(sqlFindPatients);
		stmt.setString(1, year);
		stmt.setString(2, month);
		stmt.setString(3, year);
		stmt.setString(4, month);
		// Run the query
		ResultSet result = stmt.executeQuery();
		return result;
	}


	//7. Find the doctors who cares for more than two patients
	public ResultSet findDoctors() throws SQLException, FileNotFoundException { 
		getDBConnection();
		String sqlFindDoctors="select d.eid as id, d.ename as name, d.sex as sex, d.salary as salary, d.e_address.street as street, d.e_address.city as city, d.e_address.state as state, d.e_address.zipcode as zipcode, d.contact_no as contact_no, d.specialization as specialization from doctor_tab d where d.eid in (select c.doctor.eid from cares_tab c group by c.patient.pid, c.doctor.eid having count(*) = 2)";
		// Prepare the SQL query
		PreparedStatement stmt= conn.prepareStatement(sqlFindDoctors);
		// Run the query
		ResultSet result = stmt.executeQuery();
		return result;
	}

	//8. Find the nurses who tend to patients that are given a certain medicine
	public ResultSet findNurses(String code) throws SQLException, FileNotFoundException { 
		getDBConnection();
		String sqlFindNurses="select n.eid as id, n.ename as name, n.sex as sex, n.salary as salary, n.e_address.street as street, n.e_address.city as city, n.e_address.state as state, n.e_address.zipcode as zipcode, n.contact_no as contact_no, n.llevel as llevel from nurse_tab n where n.eid in (select r.nurse.eid from room_tab r where r.patient.pid in (select i.patient.pid from is_given_tab i where i.medicine.code = ?))";
		// Prepare the SQL query
		PreparedStatement stmt= conn.prepareStatement(sqlFindNurses);
		// Run the query
		stmt.setString(1, code);
		ResultSet result = stmt.executeQuery();
		return result;
	}

	//9. Delete all the patients who were discharged before a particular year.
	public boolean deletePatients(String year) throws SQLException, FileNotFoundException { 
		getDBConnection();
		// Prepare the SQL query
		int updateRows = 0;
		String sqlDeletePatient = "delete from patient_tab patient where patient.stay_period.date_discharged.year < ?"; 

		try(PreparedStatement stmt = conn.prepareStatement(sqlDeletePatient);){
			stmt.setString(1, year);
			updateRows = stmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		} 
		return updateRows != 0;
	}

	//10. Delete all the patients who have not been assigned a room
	public boolean deletePatients2() throws SQLException, FileNotFoundException { 
		getDBConnection();
		// Prepare the SQL query
		int updateRows = 0;
		String sqlDeletePatient = "delete from patient_tab patient where patient.pid not in (select room.patient.pid from room_tab room)"; 

		try(PreparedStatement stmt = conn.prepareStatement(sqlDeletePatient);){
			updateRows = stmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		} 
		return updateRows != 0;
	}

}
