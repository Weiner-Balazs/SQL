DROP TABLE diak;
DROP TABLE osztaly;

CREATE TABLE osztaly(
    ID INT PRIMARY KEY,
    Nev VARCHAR(4)
);

CREATE TABLE diak(
    ID INT ,
    Nev VARCHAR(14) DEFAULT 'Béla',
    Kor NUMBER(3) ,
    osztaly_ID INT,
    FOREIGN KEY (osztaly_ID) REFERENCES osztaly(ID) ,
    CONSTRAINT pk_key PRIMARY KEY (ID) ,
    CONSTRAINT chk_age CHECK (Kor>18)
);

ALTER TABLE diak
DROP CONSTRAINT chk_age;

ALTER TABLE osztaly
ADD letszam NUMBER(3);

ALTER TABLE osztaly
DROP COLUMN letszam;