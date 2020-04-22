create database Assign3_ConfRev;
USE Assign3_ConfRev;



----------------------------------------------------------------------------------------------------------------
CREATE TABLE AUTHOR
(
A_EmailAddr varchar(50) NOT NULL primary key,
Aut_FNAME varchar(20),
Aut_LNAME varchar(20)
);

INSERT INTO AUTHOR VALUES('vinaykasa1@gmail.com','v1','k1');
INSERT INTO AUTHOR VALUES('vinaykasa2@gmail.com','v2','k2');
INSERT INTO AUTHOR VALUES('vinaykasa3@gmail.com','v3','k3');
INSERT INTO AUTHOR VALUES('vinaykasa4@gmail.com','v4','k4');
INSERT INTO AUTHOR VALUES('vinaykasa5@gmail.com','v5','k5');
INSERT INTO AUTHOR VALUES('vinaykasa6@gmail.com','v6','k6');
/* delete from author where A_EmailAddr='vinaykasa1@gmail.com'; */

select * from AUTHOR;

DROP TABLE AUTHOR;

---------------------------------------------------------------------------------------------------------------
CREATE TABLE PAPER
(
PAP_ID DECIMAL(3,0) primary key,
PAP_TITLE VARCHAR(50),
PAP_ABSTRACT VARCHAR(50),
PAP_FILENAME VARCHAR(40),
FK_PAP_AUTHMAIL varchar(50),
FOREIGN KEY (FK_PAP_AUTHMAIL) REFERENCES author(A_EmailAddr) ON UPDATE CASCADE ON DELETE RESTRICT
);

/*INSERT INTO PAPER VALUES('1','ROBOTS','ROBOTICS & USES','ROBO'    ,'vinaykasa1@gmail.com');*/
INSERT INTO PAPER VALUES('2','ROBOTS1','ROBOTICS & USES1','ROBO1' ,'vinaykasa2@gmail.com');
INSERT INTO PAPER VALUES('3','ROBOTS2','ROBOTICS & USES2','ROBO2' ,'vinaykasa3@gmail.com');
INSERT INTO PAPER VALUES('4','ROBOTS3','ROBOTICS & USES3','ROBO3' ,'vinaykasa4@gmail.com');
INSERT INTO PAPER VALUES('5','ROBOTS5','ROBOTICS & USES4','ROBO4' ,'vinaykasa5@gmail.com');
INSERT INTO PAPER VALUES('6','ROBOTS6','ROBOTICS & USES5','ROBO5' ,'vinaykasa6@gmail.com');

select * from PAPER;

drop table PAPER;

-------------------------------------------------------------------------------------------------------
Create table Reviwer
(
EmailAddr varchar(50) NOT NULL PRIMARY KEY,
F_NAME varchar(20),
L_NAME varchar(20),
Auth_Feedback varchar(100),
Comm_Feedback varchar(100),
PhoneNum Decimal(10,0),
Affiliation varchar(100)
);

/* INSERT INTO Reviwer values ('vinaykasam9@gmail.com','Vinay','Kasam','Ok_Ok','Resonable','4231324343','Central_Gov');*/
INSERT INTO Reviwer values ('vinaykasam7@gmail.com','Vinay1','Kasam1','GOOD','TOO_BAD','4231324342','STATE_Gov');
INSERT INTO Reviwer values ('vinaykasam5@gmail.com','Vinay2','Kasam2','BAD','TOO_GOOD','4231324341','CITY_Gov');
INSERT INTO Reviwer values ('vinaykasam4@gmail.com','Vinay3','Kasam3','NICE','LAZY','4231324340','STREET_Gov');
INSERT INTO Reviwer values ('vinaykasam3@gmail.com','Vinay4','Kasam4','JUST_Ok','BEST','4231324345','STATE_Gov');
INSERT INTO Reviwer values ('vinaykasam2@gmail.com','Vinay5','Kasam5','PERFECT','BETTER','4231324346','CITY_Gov');
/* DELETE * FROM REVIEWER WHERE L_NAME='Kasam';*/
SELECT * FROM REVIWER;

DROP TABLE REVIWER;

-----------------------------------------------------------------------------------

CREATE TABLE REVIEW
(
REL_SCR DECIMAL(3,0),
ORG_SCR DECIMAL(3,0),
REDA_SCR DECIMAL(3,0),
REV_ID DECIMAL(3,0),
MERT_SCR DECIMAL(3,0),
REV_REVW_ID VARCHAR(50),
FOREIGN KEY (REV_REVW_ID) REFERENCES REVIWER(EmailAddr) ON UPDATE CASCADE ON DELETE RESTRICT ,
REV_PAP_ID DECIMAL(3,0),
FOREIGN KEY (REV_PAP_ID) references PAPER(PAP_ID) ON UPDATE CASCADE ON DELETE RESTRICT
);

/* INSERT INTO REVIEW VALUES('30','35','40','10','36','vinaykasam9@gmail.com','1');*/
INSERT INTO REVIEW VALUES('30','35','40','11','37','vinaykasam7@gmail.com','2');
INSERT INTO REVIEW VALUES('30','35','40','12','38','vinaykasam5@gmail.com','3');
INSERT INTO REVIEW VALUES('30','35','40','13','39','vinaykasam4@gmail.com','4');
INSERT INTO REVIEW VALUES('30','35','40','14','40','vinaykasam3@gmail.com','5');
INSERT INTO REVIEW VALUES('30','35','40','15','41','vinaykasam2@gmail.com','6');

SELECT * FROM REVIEW;

DROP TABLE REVIEW;


----------------------------------------------------------------------------------------

create table topic
(
TID VARCHAR(50),
FOREIGN KEY (TID) REFERENCES Reviwer(EmailAddr) ON UPDATE CASCADE ON DELETE RESTRICT ,
TOPIC_NAME VARCHAR(50)
);

/*INSERT INTO topic values('vinaykasam9@gmail.com','robotics');*/
INSERT INTO topic values('vinaykasam7@gmail.com','cs');
INSERT INTO topic values('vinaykasam5@gmail.com','ms');
INSERT INTO topic values('vinaykasam4@gmail.com','chem');
INSERT INTO topic values('vinaykasam3@gmail.com','bio');
INSERT INTO topic values('vinaykasam2@gmail.com','socio');

select * from topic;

drop table topic;


--------------------------------------------------------------------------------

create table pap_reviewr
(
PAPER_IDR DECIMAL(3,0),
FOREIGN KEY (PAPER_IDR) REFERENCES PAPER(PAP_ID) ON UPDATE CASCADE ON DELETE RESTRICT ,
REVIEWER_IDR VARCHAR(50),
FOREIGN KEY (REVIEWER_IDR) REFERENCES Reviwer(EmailAddr) ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT product_store_unique UNIQUE (PAPER_IDR, REVIEWER_IDR)
);


/* INSERT INTO pap_reviewr values('1','vinaykasam9@gmail.com');*/
INSERT INTO pap_reviewr values('2','vinaykasam7@gmail.com');
INSERT INTO pap_reviewr values('3','vinaykasam5@gmail.com');
INSERT INTO pap_reviewr values('4','vinaykasam4@gmail.com');
INSERT INTO pap_reviewr values('5','vinaykasam3@gmail.com');
INSERT INTO pap_reviewr values('6','vinaykasam2@gmail.com');

select * from pap_reviewr;

drop table pap_reviewr;

---------------------------------------------------------------------------------























