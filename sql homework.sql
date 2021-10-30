
CREATE TABLE Enter_depart (
E_ID INT NOT NULL PRIMARY KEY ,
E_department varchar(20) NOT NULL,
E_budget INT NOT NULL  );

 
CREATE TABLE official_sponsors (
S_ID INT NOT NULL PRIMARY KEY ,
S_email varchar(20) NOT NULL,
S_FDate DATE NOT NULL ,
S_names varchar(20),
S_finance,VARCHAR(20),
E_ID INT,
foreign key (E_ID) references Enter_depart(E_ID) on delete cascade );

CREATE TABLE Managers (
M_ID INT NOT NULL PRIMARY KEY ,
M_names VARCHAR(20) NOT NULL,
M_salary INT NOT NULL,
M_Pnum INT ,
E_ID INT,
foreign key (E_ID) references Enter_depart(E_ID) on delete cascade 
);

    
create table Volunteers(
V_ID int primary key,
V_names varchar(20) not null,
V_Pnum INT ,
E_ID INT,
M_ID INT,
A_ID INT,
foreign key (A_ID) references Activity(A_ID) on delete cascade ,
foreign key (M_ID) references Managers(M_ID) on delete cascade ,
foreign key (E_ID) references Enter_depart(E_ID) on delete cascade );


CREATE TABLE Crew (
C_ID INT NOT NULL PRIMARY KEY,
C_names VARCHAR(20) NOT NULL ,
C_job VARCHAR(20),
C_Pnum INT,
C_salary INT NOT NULL,
O_ID INT ,
V_ID INT,
foreign key (O_ID) references Organizers(O_ID) on delete cascade,
foreign key (V_ID) references Volunteers(V_ID) on delete cascade);

     
CREATE TABLE Present (
P_ID INT NOT NULL PRIMARY KEY,
P_date DATE,
P_numcard INT ,
A_ID INT,
foreign key (A_ID) references Activity(A_ID) on delete cascade );
  

CREATE TABLE Activity (
A_ID INT NOT NULL ,
A_name INT NOT NULL ,
A_toll VARCHAR(30) ,
A_numallcard VARCHAR(20),
E_ID INT ,
O_ID INT,
foreign key (O_ID) references Organizers(O_ID) on delete cascade,
foreign key (E_ID) references Enter_depart(E_ID) on delete cascade );
   

CREATE TABLE Organizers (
O_ID INT NOT NULL PRIMARY KEY,
O_names VARCHAR(20) NOT NULL ,
O_salary INT,
O_Pnum int ,
M_ID INT NOT NULL,
E_ID INT,
foreign key (E_ID) references Enter_depart(E_ID) on delete cascade ,
foreign key (M_ID) references Managers(M_ID) on delete cascade );
   


CREATE TABLE depart_sponsors(
S_ID INT ,
E_ID INT ,
PRIMARY KEY (S_ID , E_ID)
foreign key (E_ID) references Enter_depart(E_ID) on delete cascade ,
foreign key (S_ID) references official_sponsors(S_ID) on delete cascade );

CREATE TABLE ACTIV_PRESENT(
A_ID INT ,
P_ID INT ,
PRIMARY KEY (A_ID , P_ID)
foreign key (A_ID) references Activity(A_ID) on delete cascade ,
foreign key (P_ID) references Present(P_ID) on delete cascade );
  

CREATE view vbookstatus as
select A_ID, A_name, A_toll, A_numallcard, E_ID, O_ID
from Activity


create user USERNAME
IDENTIFIED by 123
default tablespace users
temporary tablespace temp
QUOTA 500K on users;


grant connect to USERNAME;
grant SELECT ON vbookstatus to USERNAME;

