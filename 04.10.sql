/*Méltánhíres Zedországban miniszertelnök választást tartanak. A miniszterelnökjelöltséghez az egyetlen feltétel, hogy az átlag épelméjű közel nagykorú felnőtt férfiak számára kedvelt kitalált alakok jelentkezhetnek, tehát például Barbie és Hello Kitty*/
 
/*Ehhez szükséges néhány tábla és lekérdezés*/
/*A Táblák Jelölt(ID,Név,Kor,Faj, Szavazatokszáma,SzármazásihelyID) PL. (1,Barbie, 19, Ember,1)
Származásihely(ID,Név,Lakosság) PL. (1,Barbieland,150000)
Szükséges minden kapcsolatot megfelelően kezelni*/

DROP TABLE Jelolt;
DROP TABLE Szarmazasihely;
CREATE TABLE Szarmazasihely(
    ID INT PRIMARY KEY,
    Nev VARCHAR(30),
    Lakossag NUMBER(20)
);

CREATE TABLE Jelolt(
    ID INT PRIMARY KEY,
    Nev VARCHAR(30),
    Kor NUMBER(3),
    Faj VARCHAR(30),
    Szavazatokszama NUMBER(30),
    SzarmazasihelyID INT,
    FOREIGN KEY(SzarmazasihelyID) REFERENCES Szarmazasihely(ID)
);


INSERT INTO Szarmazasihely(ID, Nev, Lakossag)
VALUES (1, 'Barbieland', 1000000);
 
INSERT INTO Szarmazasihely(ID, Nev, Lakossag)
VALUES (2, 'Hello Kitty Island', 500000);
 
INSERT INTO Jelolt(ID, Nev, Kor, Faj, SzavazatokSzama, SzarmazasihelyID)
VALUES (1, 'Barbie', 30, 'Ember', 120000, 1);
 
INSERT INTO Jelolt(ID, Nev, Kor, Faj, SzavazatokSzama, SzarmazasihelyID)
VALUES (2, 'Silló Laura', 32, 'Ember', 80000, 1);
 
INSERT INTO Jelolt(ID, Nev, Kor, Faj, SzavazatokSzama, SzarmazasihelyID)
VALUES (3, 'Hello Kitty', 5, 'Macska', 150000, 2);
 
INSERT INTO Jelolt(ID, Nev, Kor, Faj, SzavazatokSzama, SzarmazasihelyID)
VALUES (4, 'Zalán', 6, 'Macska', 90000, 2);
 
 
 
/*Vizsgáljuk meg Barbielandből kik indultak*/
SELECT Jelolt.NEV FROM Jelolt INNER JOIN Szarmazasihely ON Jelolt.SzarmazasihelyID = Szarmazasihely.ID
WHERE Szarmazasihely.Nev LIKE 'Barbieland';
/*Melyik származási helyen jelölték Hello Kittyt*/
SELECT Szarmazasihely.NEV FROM JELOLT INNER JOIN SZARMAZASIHELY
on JELOLT.SZARMAZASIHELYID = SZARMAZASIHELY.ID
WHERE JELOLT.NEV LIKE 'Hello Kitty';
/*Hello Kitty gonosz ikertestvére ByeAlex átvette a hatalmat tőle. Frissítsük Hello Kitty nevét ByeAlexre*/
UPDATE JELOLT SET NEV = 'ByeAlex' WHERE ID = 3;
SELECT * FROM JELOLT;
/*Mennyi szavazatot kapott ByeAlex*/
SELECT SZAVAZATOKSZAMA FROM JELOLT WHERE JELOLT.NEV LIKE 'ByeAlex';
/*Készítsünk egy alelnük táblát melyben a jelöltek alelnök jelöltjei találhatóak Alelnök(ID, Név,Titulus, JelöltID)
PL. (1,Viszlát Betti, Tábornok, 2)*/
CREATE TABLE Alelnok(
    ID INT,
    NEV VARCHAR(30),
    Titulus VARCHAR(30),
    JeloltID INT,
    FOREIGN KEY(JeloltID) REFERENCES Jelolt(ID)
);

INSERT INTO Alelnok(ID, Nev, Titulus, JeloltID)
VALUES (1,'Viszlát Betti', 'Tábornok', 2);

INSERT INTO Alelnok(ID, Nev, Titulus, JeloltID)
VALUES (2, 'Kovács Lajos', 'Stratéga', 3);

INSERT INTO Alelnok(ID, Nev, Titulus, JeloltID)
VALUES (3, 'Hegyi Emese', 'Diplomata', 4);

INSERT INTO Alelnok(ID, Nev, Titulus, JeloltID)
VALUES (4, 'Szilágyi Zoltán', 'Közgazdász', 1);
/*Kik azok, akik vesélyeztetik Zedországot, azzal, hogy Tábornok titulúsú alelnököt választottak?*/
SELECT * FROM JELOLT INNER JOIN Alelnok
ON JELOLT.ID = Alelnok.JeloltID
WHERE Alelnok.Titulus LIKE 'Tábornok';
 
/*Mi a jelöltek népszerűségi sorrendje?*/

SELECT * FROM JELOLT ORDER BY SZAVAZATOKSZAMA DESC;