CREATE DATABASE [onlinebloodbanksystem];
USE [onlinebloodbanksystem];

CREATE TABLE [users]
(
[id] INT IDENTITY(1,1) NOT NULL,
[First Name] CHAR(50) NOT NULL,
[Last Name] CHAR(50) NOT NULL,
[Age] NUMERIC(2)  NOT NULL,
[Gender] VARCHAR(6) NOT NULL,
[Contact Number] NUMERIC(10) NOT NULL,
[Email] VARCHAR(50) NOT NULL,
[Password] VARCHAR(100) NOT NULL,
[Weight] NUMERIC(3) NOT NULL,
[State] VARCHAR(30) NOt NULL,
[Area] VARCHAR(100) NOt NULL,
[Pin code] NUMERIC(6) NOT NULL,
[Blood Group] VARCHAR(4) NOT NULL
CONSTRAINT user_id_pk PRIMARY KEY(id),
CONSTRAINT user_email_uk UNIQUE(Email),
CONSTRAINT user_contactNumber_uk UNIQUE([Contact Number])
);

CREATE TABLE [blood availability]
(
[id] INT IDENTITY(1,1) NOT NULL,
[Blood Group] VARCHAR(4) NOT NULL,
[State] VARCHAR(30) NOt NULL,
[Area] VARCHAR(100) NOt NULL,
[Pin code] NUMERIC(6) NOT NULL,
[Contact Number] NUMERIC(10) NOT NULL,
[us_id] INT,
CONSTRAINT ba_id_pk PRIMARY KEY(id),
CONSTRAINT ba_id_fk FOREIGN KEY(us_id) REFERENCES [users](id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE [blood posting]
(
[id] INT IDENTITY(1,1) NOT NULL,
[Blood Group] VARCHAR(4) NOT NULL,
[State] VARCHAR(30) NOt NULL,
[Area] VARCHAR(100) NOt NULL,
[Pin code] NUMERIC(6) NOT NULL,
[Contact Number] NUMERIC(10) NOT NULL,
[us_id] INT,
CONSTRAINT bp_id_pk PRIMARY KEY(id),
CONSTRAINT bp_id_fk FOREIGN KEY(us_id) REFERENCES [users](id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE [hospital]
(
[id] INT IDENTITY(1,1) NOT NULL,
[Hospital Name] VARCHAR(15) NOT NULL,
[City] VARCHAR(30) NOT NULL,
[Date] DATE NOT NULL,
[Time] TIME(0) NOT NULL,
[us_id] INT,
[State] VARCHAR(100) NOT NULL,
CONSTRAINT hospital_id_pk PRIMARY KEY(id),
CONSTRAINT hospital_id_fk FOREIGN KEY(us_id) REFERENCES [users](id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE [feedback]
(
[id] INT IDENTITY(1,1) NOT NULL,
[Hospital Name] VARCHAR(15) NOT NULL,
[City] VARCHAR(15) NOT NULL,
[Feedback Comments] VARCHAR(500) NOT NULL,
[us_id] INT,
[State] VARCHAR(100) NOT NULL,
CONSTRAINT feedback_id_pk PRIMARY KEY(id),
CONSTRAINT feedback_id_fk FOREIGN KEY(us_id) REFERENCES [users](id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE [queires]
(
[id] INT IDENTITY(1,1) NOT NULL,
[query] VARCHAR(100) NOT NULL,
[description] VARCHAR(1000) NOT NULL,
[status] VARCHAR(500),
[result] VARCHAR(500),
[us_id] INT,
CONSTRAINT queries_id_pk PRIMARY KEY(id),
CONSTRAINT queries_id_fk FOREIGN KEY(us_id) REFERENCES [users](id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE [states]
(
[id] INT IDENTITY(1,1) NOT NULL,
[state] VARCHAR(100) NOT NULL,
CONSTRAINT states_id_pk PRIMARY KEY(id)
);

CREATE TABLE [areas]
(
[id] INT IDENTITY(1,1) NOT NULL,
[area] VARCHAR(100) NOT NULL,
[state_id] INT,
CONSTRAINT areas_id_pk PRIMARY KEY(id),
CONSTRAINT areas_id_fk FOREIGN KEY(state_id) REFERENCES [states](id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE [HospitalList]
(
[id] INT IDENTITY(1,1) NOT NULL,
[Hospital Name] VARCHAR(1000) NOT NULL,
[area_id] INT,
[state_id] INT,
CONSTRAINT hl_id_pk PRIMARY KEY(id),
CONSTRAINT hl_area_id_fk FOREIGN KEY(area_id) REFERENCES [areas](id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT hl_state_id_fk FOREIGN KEY(state_id) REFERENCES [states](id)
);

sp_help users
select * from [users];
select * from [blood posting];
select * from [blood availability];
select * from [hospital];
select * from [feedback];
select * from [queires];
select * from [states](nolock);
select * from [areas] where state_id=1;
select * from [HospitalList];

insert into [states]([state])
values
('Andhra Pradesh'),('Arunachal Pradesh'),('Assam'),('Bihar'),('Chattisgarh'),
('Goa'),('Gujarat'),('Haryana'),('Himachal Pradesh'),('Jammu and Kashmir'),
('Jharkhand'),('Karnataka'),('Kerla'),('Madhya Pradesh'),('Maharashtra'),
('Manipur'),('Meghalaya'),('Mizoram'),('Nagaland'),('Odisha'),
('Punjab'),('Rajasthan'),('Sikkim'),('Tamil Nadu'),('Telangana'),
('Tripura'),('Uttar Pradesh'),('Uttarakhand'),('West Bengal'),('Andaman and Nicobar Islands'),
('Chandigarh'),('Dadar and Nagar Haveli'),('Daman and Diu'),('Delhi'),('Lakshadweep'),
('Puducherry(Pondicherry)')
;

insert into [HospitalList]
values
('Global-ANTPR', 1, 1),
('Global-CHTR', 2, 1),
('Global-EG', 3, 1),
('Global-GNTR', 4, 1),
('Global-KDP', 5, 1),
('Global-KRS', 6, 1),
('Global-KRN', 7, 1),
('Global-PRkS', 8, 1);

select * from [HospitalList] h join [areas] a on h.area_id=a.id join [states] s on a.state_id=s.id where a.area='Anantapur' and s.state='Andhra Pradesh'

select * from [areas](nolock) a join [states](nolock) s on a.state_id=s.id where s.state='Andhra Pradesh'

select * from [blood posting](nolock) where [Blood Group] in (select [Blood Group] from [users](nolock) where id=1)

alter table feedback add [state] varchar(100)

alter table users add constraint user_contactNumber_ud unique([Contact Number])

select distinct(state) from [hospital] where us_id=16
select distinct(Area) from [hospital] where us_id=16 and state='Andhra Pradesh'
select distinct([Hospital Name]) from [hospital] where us_id=16 and state='Andhra Pradesh' and area='Anantapur'


/*
insert into hospital
values
('a','a','09-29-2019','09:15',1),
('a1','Mumvai','05/29/2019','09:15',7)
;

insert into [user]
values('sai', 'ganesh', 21, 'Male', 9704073336, 'ganesh@gmail.com', 'password', 54, 'Andhra pradesh', 'guntur', 603103, 'B+');

insert into [blood posting]
values('A+','Ap','a',90009,9876543210,1);
insert into [blood posting]
values('A+','Ap','a',90009,9876543210,1);
insert into [blood availability]
values('B-','Tamil Nadu','Coimbatore',900009,9876543210,1);


insert into feedback
values('Appolo','Chennai','Good',1);
insert into feedback
values('HealthCare','Delhi','Went well',1);
insert into feedback
values('Global','Hyderabad','Not bad',1);

select * from hospital h where DATEDIFF(day, h.Date, GETDATE()) >=90 and us_id=1;
*/





