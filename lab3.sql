INSERT INTO universitate.persoana
(cnp,seria,nr,prenume,nume,adresa,nationalitate)
VALUES
('92829','SB', 9898 ,'Amalia','Capatina','Strandului','romana'),
('12345','SB', 7877 ,'Vanessa','Niculae','Faurului','romana'),
('65234','SB', 4545 ,'Ion','Popescu','Anton Pann','romana'),
('96379','SB', 6262 ,'Andrei','Radulescu','Cedonia','romana'),
('17543','SB', 7171 ,'Radu','Popa','Gorjului','romana'),
('92635','SB', 9393 ,'Paul','Bogdan','Livezii','romana'),
('25926','SB', 2729 ,'Eugen','Capata','Malului','romana'),
('18396','SB', 7474 ,'Ana','Popa','Nucului','romana'),
('56382','SB', 1284 ,'Bianca','Topircean','Pacii','romana'),
('23456','SB', 4577 ,'Daniel','Popa','Salajului','romana');

INSERT INTO universitate.facultate
(id_facultate, denumire, adresa, an_fondare, decan)
VALUES
(89,'Facultatea de inginerie','Bulevardul Victoriei',1990-12-04,'Popescu'),
(88,'Facultatea de litere','Bulevardul Victoriei',1990-01-01,'Ionescu'),
(87,'Facultatea de stiinte economice','Calea Dumbravii',1992-04-08,'Dan'),
(86,'Facultatea de teatru','Radu Stanca',1999-01-01,'Alexandrescu');

INSERT INTO universitate.specializare
(id_specializare, id_facultate, denumire)
VALUES
(10,89,'Calculatoare'),
(11,89,'Tehnologia informmatiei'),
(12,89,'ISM'),
(20,88,'Limba si literatura engleza'),
(30,87,'Management'),
(40,86,'Artele spectacolului');

SELECT * FROM specializare;

INSERT INTO universitate.student
(nr_matricol,id_specializare,cnp,an_curent,grupa,semestru,bursa)
VALUES
(135,10,'92829',3,234,1,1),
(129,11,'23456',4,243,1,1),
(582,12,'56382',3,233,1,1),
(432,10,'18396',2,221,1,1),
(273,30,'25926',1,211,1,1),
(173,12,'17543',2,223,1,1),
(190,40,'92635',2,224,1,1),
(278,20,'12345',3,232,1,1),
(634,10,'65234',4,244,1,1),
(133,20,'96379',1,214,1,1);

SELECT * FROM student;

INSERT INTO universitate.materie
(id_materie, id_specializare, denumire, an_de_studiu, semestru, profesor)
VALUES
(101,10,'Programare orientata pe obiect', 2,1,'Macarie Breazu'),
(102,10,'Baze de date', 3,1,'Alex Butean'),
(111,11,'Teoria sistemelor', 2,1,'Rentea Cornel'),
(121,12,'Grafica asistata de calculator', 4,2,'Rodica Baciu'),
(122,12,'Asamblare', 2,2,'Rodica Baciu'),
(201,20,'Literatura clasica', 1,2,'Daniel Volovici'),
(301,30,'Managementul calitatii', 3,2,'Andrei Xulescu'),
(302,30,'Matematica', 2,2,'Ion Popa'),
(401,40,'Drama', 2,2,'Andreea Matei'),
(402,40,'Mimica', 4,2,'Ana Pop');

SELECT * FROM materie;

INSERT INTO universitate.nota
(id_nota, id_student, id_curs, nota)
VALUES
(1,129,101,7),
(2,129,111,5),
(3,129,122,8),
(4,133,122,6),
(5,133,101,5),
(6,135,402,7),
(7,173,401,5),
(8,173,302,6),
(9,190,101,9),
(10,190,111,7),
(11,190,122,7),
(12,273,302,10),
(13,273,122,8),
(14,278,201,9),
(15,432,101,8),
(16,432,401,8),
(17,582,401,5),
(18,582,301,9),
(19,582,201,6),
(20,634,102,10);

SELECT id_facultate, denumire
FROM facultate
WHERE (id_facultate%2)=1;

SELECT nume, nationalitate
FROM persoana
WHERE nume LIKE '%a%';

SELECT grupa
FROM student
WHERE bursa=1 AND semestru=2;

SELECT nume
FROM persoana
ORDER BY nume;

SELECT nume
FROM persoana
ORDER BY nume
LIMIT 5;

SELECT decan
FROM facultate
WHERE an_fondare>1900 AND an_fondare<1995;

SELECT decan
FROM facultate
WHERE an_fondare BETWEEN 1900 AND 1995;

INSERT INTO universitate.specializare
(id_specializare,id_facultate,denumire)
VALUES
(50,86,'Ceva');

INSERT INTO universitate.materie
(id_materie,id_specializare,denumire,an_de_studiu,semestru,profesor)
VALUES
(501,50,'Etica',3,1,'Andrei');

SELECT decan
FROM facultate
WHERE an_fondare<1995
ORDER BY an_fondare ASC;

DELETE FROM materie
WHERE denumire LIKE '%tica%';

SELECT * FROM specializare;










