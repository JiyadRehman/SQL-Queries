
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

-- TABLE STRUCTURE

--JIYAD UR REHMAN
Describe Player;
Select * from user_constraints where table_name='PLAYER';

--JIYAD UR REHMAN
Describe Team;
Select * from user_constraints where table_name='TEAM';

--JIYAD UR REHMAN
Describe Team_Match;
Select * from user_constraints where table_name='TEAM_MATCH';

--JIYAD UR REHMAN
Describe coach;
Select * from user_constraints where table_name='COACH';

--JIYAD UR REHMAN
Describe Match;
Select * from user_constraints where table_name='MATCH';

--JIYAD UR REHMAN
Describe coach_certification;
Select * from user_constraints where table_name='COACH_CERTIFICATION';

--JIYAD UR REHMAN
Describe certification;
Select * from user_constraints where table_name='CERTIFICATION';

--JIYAD UR REHMAN
Describe Goalkeeper;
Select * from user_constraints where table_name='GOALKEEPER';

--JIYAD UR REHMAN
Describe Other;
Select * from user_constraints where table_name='OTHER';

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


-- SELECT COMMANDS

-- JIYAD UR REHMAN
SELECT * FROM player;

-- JIYAD UR REHMAN
SELECT * FROM certification;

-- JIYAD UR REHMAN
SELECT * FROM coach;

-- JIYAD UR REHMAN
SELECT * FROM coach_certification;

-- JIYAD UR REHMAN
SELECT * FROM goalkeeper;

-- JIYAD UR REHMAN
SELECT * FROM match;

-- JIYAD UR REHMAN
SELECT * FROM other;

-- JIYAD UR REHMAN
SELECT * FROM team;

-- JIYAD UR REHMAN
SELECT * FROM team_match;


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
