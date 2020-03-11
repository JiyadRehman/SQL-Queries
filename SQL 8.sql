
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
