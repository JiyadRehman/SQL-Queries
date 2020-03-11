
CREATE TABLE PLAYER
(
Player_ID NUMBER(4),
Player_Name Varchar2(25),
Player_Position char(2),
Height NUMBER(4,1),
DoB Date,
Team_ID Number(4),
Player_Type Char(10),

CONSTRAINT Player_PlayerID_PK Primary KEY (Player_ID),
CONSTRAINT Player_Type_ck CHECK (Player_Type IN ('Goalkeeper', 'Other'))

);

CREATE TABLE TEAM
(
Team_ID Number(4),
Team_Name Varchar2(25),
Home_Ground VARCHAR2(25),
Coach_ID Number(4) NOT NULL,

CONSTRAINT Team_TeamID_PK Primary KEY (Team_ID),
CONSTRAINT Team_CoachID_UK UNIQUE (Coach_ID)


);

CREATE TABLE TEAM_MATCH
(
Team_ID Number(4),
Match_ID Number(4),
Goal_Scored Number(2) DEFAULT 0 NOT NULL,

CONSTRAINT Team_Match_PK Primary KEY (Team_ID, Match_ID)

);


CREATE TABLE MATCH
(
Match_ID Number(4),
Winner Varchar2(25),
Match_Date Date,

CONSTRAINT Match_MatchID_PK Primary KEY (Match_ID)


);

CREATE TABLE COACH
(
Coach_ID Number(4),
Coach_Name Varchar2(25),
Join_Date Date,

CONSTRAINT Coach_CoachID_PK Primary KEY (Coach_ID)

);

CREATE TABLE COACH_CERTIFICATION
(
Coach_ID Number(4),
CERTIFICATION_ID Number(4),

CONSTRAINT Coach_Certification_PK Primary KEY (Coach_ID, CERTIFICATION_ID)

);


CREATE TABLE CERTIFICATION
(
CERTIFICATION_ID Number(4),
CERTIFICATION_Name Varchar2(25),

CONSTRAINT Certification_CertificationID_PK Primary KEY (CERTIFICATION_ID)

);


CREATE TABLE GOALKEEPER
(
Player_ID NUMBER(4),
Diving Number(2),

CONSTRAINT GOALKEEPER_PlayerID_PK Primary KEY (Player_ID)

);

CREATE TABLE OTHER
(
Player_ID NUMBER(4),
Agility Number(2),

CONSTRAINT OTHER_PlayerID_PK Primary KEY (Player_ID)

);


-- ADDING FOREIGN KEYS

--Players
ALTER TABLE PLAYER 
    ADD CONSTRAINT Player_TeamID_FK FOREIGN KEY (Team_ID)
        REFERENCES TEAM (Team_ID);
        
--Team
ALTER TABLE TEAM 
    ADD CONSTRAINT Team_CoachID_FK FOREIGN KEY (Coach_ID)
        REFERENCES COACH (Coach_ID);
        
--Team_Match        
ALTER TABLE TEAM_MATCH 
    ADD CONSTRAINT Team_Match_TeamID_FK FOREIGN KEY (Team_ID)
        REFERENCES TEAM (Team_ID);
        
ALTER TABLE TEAM_MATCH 
    ADD CONSTRAINT Team_Match_MatchID_FK FOREIGN KEY (Match_ID)
        REFERENCES MATCH (Match_ID);

--Coach_Certification
ALTER TABLE Coach_Certification 
    ADD CONSTRAINT Coach_Certification_CoachID_FK FOREIGN KEY (Coach_ID)
        REFERENCES COACH (Coach_ID);

ALTER TABLE Coach_Certification 
    ADD CONSTRAINT Coach_Certification_CertificationID_FK FOREIGN KEY (Certification_ID)
        REFERENCES CERTIFICATION (Certification_ID);
        
--Goalkeeper
ALTER TABLE Goalkeeper 
    ADD CONSTRAINT Goalkeeper_PlayerID_FK FOREIGN KEY (Player_ID)
        REFERENCES PLAYER (Player_ID);
        
--Other
ALTER TABLE Other 
    ADD CONSTRAINT Other_PlayerID_FK FOREIGN KEY (Player_ID)
        REFERENCES PLAYER (Player_ID);


--**********************************************************************************************************
-- INSERT COMMANDS
--**********************************************************************************************************

-- Coach

INSERT INTO COACH VALUES (1000, 'Zidane', '02-Jan-2019');

INSERT INTO COACH VALUES (1001, 'Beckham', '20-Feb-2019');

INSERT INTO COACH VALUES (1002, 'Carlos', '02-May-2019');

INSERT INTO COACH VALUES (1003, 'Fido', '18-Jun-2019');


-- Team

INSERT INTO TEAM VALUES (2000, 'ManU', 'Green', 1000);

INSERT INTO TEAM VALUES (2001, 'Barca', 'Blue', 1001);

INSERT INTO TEAM VALUES (2002, 'ManC', 'Red', 1002);

INSERT INTO TEAM VALUES (2003, 'Aston', 'White', 1003);

-- Match

INSERT INTO MATCH VALUES (3000,  'ManU', '01-Oct-2019');

INSERT INTO MATCH VALUES (3001,  'Barca', '02-Oct-2019');

-- Certification

INSERT INTO CERTIFICATION VALUES (4000,  'Attack');

INSERT INTO CERTIFICATION VALUES (4001,  'Defend');

INSERT INTO CERTIFICATION VALUES (4002,  'Mid');

-- Team_Match

INSERT INTO TEAM_MATCH VALUES (2000, 3000, 2);

INSERT INTO TEAM_MATCH VALUES (2003, 3000, 1);

INSERT INTO TEAM_MATCH VALUES (2001, 3001, 1);

INSERT INTO TEAM_MATCH VALUES (2002, 3001, 0);

-- Coach_Certification

INSERT INTO COACH_CERTIFICATION VALUES (1000, 4000);

INSERT INTO COACH_CERTIFICATION VALUES (1000, 4001);

INSERT INTO COACH_CERTIFICATION VALUES (1000, 4002);

INSERT INTO COACH_CERTIFICATION VALUES (1001, 4002);

INSERT INTO COACH_CERTIFICATION VALUES (1002, 4001);

INSERT INTO COACH_CERTIFICATION VALUES (1003, 4001);

INSERT INTO COACH_CERTIFICATION VALUES (1003, 4002);

-- Player

--                      T1 2000
INSERT INTO PLAYER VALUES (0001, 'Ronaldo', 'CF', 182, '02-Jan-1982', 2000, 'Other');

INSERT INTO PLAYER VALUES (0002, 'Messi', 'LF', 184, '03-Feb-1982', 2000, 'Other');

INSERT INTO PLAYER VALUES (0003, 'Neymar', 'RM', 188, '22-Mar-1984', 2000, 'Other');

INSERT INTO PLAYER VALUES (0004, 'Kahn', 'GK', 181, '22-Jul-1984', 2000, 'Goalkeeper');

--                      T2 2001

INSERT INTO PLAYER VALUES (0005, 'Pogba', 'LF', 183, '03-Feb-1982', 2001, 'Other');

INSERT INTO PLAYER VALUES (0006, 'Ronaldinho', 'LM', 185, '22-Mar-1984', 2001, 'Other');

INSERT INTO PLAYER VALUES (0007, 'Leno', 'GK', 181, '22-Mar-1988', 2001, 'Goalkeeper');

--                      T3 2002

INSERT INTO PLAYER VALUES (0008, 'Rooney', 'LM', 187, '01-Jan-1980', 2002, 'Other');

INSERT INTO PLAYER VALUES (0009, 'Howard', 'GK', 183, '20-Dec-1990', 2002, 'Goalkeeper');


--                      T4 2003

INSERT INTO PLAYER VALUES (0010, 'Bale', 'CF', 184, '21-Oct-1988', 2003, 'Other');

INSERT INTO PLAYER VALUES (0011, 'Salah', 'LM', 189, '17-Nov-1994', 2003, 'Other');

INSERT INTO PLAYER VALUES (0012, 'Neuer', 'GK', 183, '29-Sep-1995', 2003, 'Goalkeeper');

-- Goalkeeper

INSERT INTO GOALKEEPER VALUES (0004, 95);

INSERT INTO GOALKEEPER VALUES (0007, 92);

INSERT INTO GOALKEEPER VALUES (0009, 98);

INSERT INTO GOALKEEPER VALUES (0012, 88);

-- Other

INSERT INTO OTHER VALUES (0001, 90);

INSERT INTO OTHER VALUES (0002, 91);

INSERT INTO OTHER VALUES (0003, 92);

INSERT INTO OTHER VALUES (0005, 98);

INSERT INTO OTHER VALUES (0006, 85);

INSERT INTO OTHER VALUES (0008, 82);

INSERT INTO OTHER VALUES (0010, 96);

INSERT INTO OTHER VALUES (0011, 96);


--******************************************************************************************************************************
--******************************************************************************************************************************
--          ASSIGNMENT 12
--******************************************************************************************************************************
--******************************************************************************************************************************

--Jiyad ur Rehman
--1

SELECT Player_Name, Height FROM PLAYER WHERE
Height > (SELECT Avg(Height) FROM PLAYER);


--Jiyad ur Rehman
--2

SELECT p.Player_Name, t.tn Team FROM Player p, (SELECT Team_Name tn, Team_Id tid FROM TEAM) t
WHERE
p.team_id = t.tid;


--Jiyad ur Rehman
--3

SELECT t.Team_Name, Avg(p.height) FROM Player p, team t WHERE
t.team_id = p.team_id
GROUP BY t.Team_Name HAVING Avg(p.height) >
(SELECT Avg(p.height) FROM Player p, team t WHERE
t.team_id = p.team_id AND Team_Name = 'Barca'
GROUP BY t.Team_Name);



--Jiyad ur Rehman
--4

SELECT t.Team_Name, Avg(p.height) FROM PLAYER p, Team t WHERE
p.team_id = t.team_id AND
DOB >ANY (SELECT DOB FROM PLAYER WHERE DOB > '01-JAN-83')
GROUP BY t.Team_Name
HAVING Avg(p.height) <ANY (SELECT Avg(Height) FROM PLAYER p1, Team t1 WHERE p1.team_id = t1.team_id AND t1.Team_name LIKE 'M%' GROUP BY TEAM_NAME);


--Jiyad ur Rehman
--5

SELECT * FROM COACH;

SELECT t.Team_Name, c.Coach_name, Round(Avg(Round(Months_Between(SYSDATE , p.DOB)/12))) Age  FROM PLayer p, Team t, coach c WHERE
p.team_id = t.team_id AND
t.coach_id = c.coach_id AND
c.join_date > (SELECT join_date FROM coach WHERE coach_Name = 'Zidane')

GROUP BY t.team_name, c.coach_name;

--Query extract team name, coach name and avg age of that team (rounded off) for all the teams whose coaches joined the team after zidane joined his team as coach

--Jiyad ur Rehman
--6

Select p.Player_Name, TO_CHAR(DECODE(TEAM_NAME, 'ManU', 1,
                                                                                        'Barca', 3,
                                                                                        'ManC', 4,
                                                                                        'Aston', 2,
                                                                                        0)) "Team Rank"
FROM player p, team t WHERE
p.team_id=t.team_id;

       

--Jiyad ur Rehman
--7

CREATE TABLE faculty (f_id NUMBER(6), f_last VARCHAR2(30) ,f_first VARCHAR2(30), f_mi CHAR(1), loc_id NUMBER(5), f_phone VARCHAR2(10), f_rank VARCHAR2(9), f_super NUMBER(6), CONSTRAINT faculty_f_id_pk PRIMARY KEY(f_id));
INSERT INTO faculty VALUES (1, 'Marx', 'Teresa', 'J', 9, '4075921695', 'Associate', 4);
INSERT INTO faculty VALUES (2, 'Zhulin', 'Mark', 'M', 10, '4073875682', 'Full', NULL);
INSERT INTO faculty VALUES (3, 'Langley', 'Colin', 'A', 12, '4075928719', 'Assistant', 4);
INSERT INTO faculty VALUES (4, 'Brown', 'Jonnel', 'D', 11, '4078101155', 'Full', NULL);

select * from faculty;

--Jiyad ur Rehman
--8
CREATE TABLE Bonus (f_id NUMBER(6), Bonus NUMBER(8,2) DEFAULT 1000, CONSTRAINT Bonus_f_id_pk PRIMARY KEY(f_id));

INSERT INTO Bonus (f_id) SELECT Distinct f_super FROM faculty WHERE f_super IS NOT NULL;

select * from Bonus;



--Jiyad ur Rehman
--9

INSERT INTO faculty VALUES (5, 'Sealy', 'James', 'L', 13, '4079817153', 'Associate', 1);
INSERT INTO faculty VALUES (6, 'Smith', 'John', 'D', 10, '4238102345', 'Full', NULL);

select * from faculty;

--Jiyad ur Rehman
--10

MERGE INTO BONUS b USING
(SELECT Distinct f_super FROM faculty WHERE f_super IS NOT NULL) f
ON (b.f_id = f.f_super)
WHEN MATCHED THEN 
UPDATE SET b.bonus = b.bonus*1.01
WHEN NOT MATCHED THEN
INSERT (f_id) VALUES (f.f_super);

select * from Bonus;

DROP TABLE Bonus CASCADE CONSTRAINTS;
DROP TABLE faculty CASCADE CONSTRAINTS;

--******************************************************************************************************************************
--******************************************************************************************************************************

-- DROP Commands

DROP TABLE PLAYER CASCADE CONSTRAINTS;
DROP TABLE TEAM CASCADE CONSTRAINTS;
DROP TABLE COACH CASCADE CONSTRAINTS;
DROP TABLE TEAM_MATCH CASCADE CONSTRAINTS; 
DROP TABLE MATCH CASCADE CONSTRAINTS;
DROP TABLE COACH_CERTIFICATION CASCADE CONSTRAINTS;
DROP TABLE CERTIFICATION CASCADE CONSTRAINTS;
DROP TABLE GOALKEEPER CASCADE CONSTRAINTS;
DROP TABLE OTHER CASCADE CONSTRAINTS;
