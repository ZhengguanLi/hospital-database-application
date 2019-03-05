--define date_admitted type
CREATE TYPE date_admitted_obj AS OBJECT(
    month varchar(2),
    day varchar(2),
    year varchar(4)
);
/

--define date_discharged type
CREATE TYPE date_discharged_obj AS OBJECT(
    month varchar(2),
    day varchar(2),
    year varchar(4)
);
/

--define stay_period type
CREATE TYPE stay_period_obj AS OBJECT(
    date_admitted date_admitted_obj,
    date_discharged date_discharged_obj
);
/

--Define employee type
CREATE TYPE e_address_obj AS OBJECT(
    street varchar(20),
    city varchar(20),
    state varchar(2),
    zipcode varchar(5)
);
/

--define contact_no list type
CREATE TYPE contact_no_list AS varray(10) of varchar(10);
/

CREATE TYPE employee_obj AS OBJECT(
    eid varchar(10),
    ename varchar(20),
    sex varchar(6),
    salary varchar(15),
    e_address e_address_obj,
    contact_no varchar(10)
)NOT FINAL;
/

--define the patient type
CREATE TYPE patient_obj AS OBJECT(
    pid varchar(10),
    name varchar(20),
    sex varchar(6),
    address varchar(25),
    stay_period stay_period_obj,
    contact_no contact_no_list
);
/

CREATE TYPE doctor_obj UNDER employee_obj(
    specialization varchar(50)
);
/

CREATE TYPE cares_obj AS OBJECT(
    patient REF patient_obj,
    doctor REF doctor_obj
);
/

CREATE TYPE medicine_obj AS OBJECT(
    code varchar(15),
    name varchar(20)
);
/

CREATE TYPE nurse_obj UNDER employee_obj(
    llevel varchar(20)
);
/

CREATE TYPE room_obj AS OBJECT(
    room_id varchar(10),
    room_type varchar(10),
    nurse REF nurse_obj,
    patient REF patient_obj
);
/

CREATE TYPE is_given_obj AS OBJECT(
    quantity varchar(10),
    patient REF patient_obj,
    medicine REF medicine_obj
);
/

----------------------------------------
--Now creating the tables
----------------------------------------

--Create a table for employee
CREATE TABLE employee_tab OF employee_obj(eid PRIMARY KEY)
OBJECT ID PRIMARY KEY;
/

-- Create the table for patients
CREATE TABLE patient_tab OF patient_obj(pid PRIMARY KEY)
OBJECT ID PRIMARY KEY;
/

--Create a table for DOCTOR
CREATE TABLE doctor_tab OF doctor_obj(eid PRIMARY KEY)
OBJECT ID PRIMARY KEY;
/

--create a table for nurse
CREATE TABLE nurse_tab OF nurse_obj(eid PRIMARY KEY)
OBJECT ID PRIMARY KEY;
/

--create a table for medicine
CREATE TABLE medicine_tab OF medicine_obj(code PRIMARY KEY)
OBJECT ID PRIMARY KEY;
/

--create a table for room
CREATE TABLE room_tab OF room_obj(PRIMARY KEY(room_id), FOREIGN KEY(nurse) REFERENCES nurse_tab on delete cascade, FOREIGN KEY(patient) REFERENCES patient_tab on delete cascade);
/

--create a table for nurse
CREATE TABLE is_given_tab OF is_given_obj(FOREIGN KEY(patient) REFERENCES patient_tab on delete cascade, FOREIGN KEY(medicine) REFERENCES medicine_tab on delete cascade);
/

--create a table for medicine
CREATE TABLE cares_tab OF cares_obj(FOREIGN KEY(patient) REFERENCES patient_tab on delete cascade, FOREIGN KEY(doctor) REFERENCES doctor_tab on delete cascade)
/

Insert into cares_tab (select ref(patient),ref(doctor) from patient_tab patient, doctor_tab doctor where patient.pid='2' and doctor.eid='4');

INSERT INTO cares_tab select REF(patient), REF(doctor) from patient_tab patient, doctor_tab doctor where patient.pid = 2 and doctor.eid = 5;

select c.doctor.eid from cares_tab c group by c.doctor.eid having count(*) > 2;