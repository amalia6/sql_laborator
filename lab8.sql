/*1*/ 
 SELECT persoana.nume, persoana.prenume, SUBSTRING_INDEX(profesor,' ', -1) AS nume_profesor
 FROM persoana
 INNER JOIN student
 ON student.cnp=persoana.cnp
 INNER JOIN materie
 ON materie.id_specializare=student.id_specializare
 WHERE nume=SUBSTRING_INDEX(profesor,' ', -1);
 
 INSERT INTO persoana(cnp, seria, nr, prenume, nume, adresa, nationalitate)
 VALUES
 ('83762', 'SB', 4206, 'Razvan','Breazu', 'Strada Garii', 'romana');
 
  INSERT INTO student(nr_matricol, id_specializare, cnp, an_curent, grupa, semestru, bursa)
 VALUES
 ('729', 10, '83762', 2, 221, 1, 1);
 
 /*2
  o listă din baza de date cu toți studenții care nu au fost sau nu au luat nici un examen.
 Afișează codul matricol și id-ul facultății al acelor studenți. Rezultatul trebuie sortat după denumirea facultăților.
*/
 SELECT id_student, persoana.nume, persoana.prenume, facultate.denumire, facultate.id_facultate, nota
 FROM nota
 INNER JOIN student
 ON student.nr_matricol=nota.id_student
 INNER JOIN persoana
 ON persoana.cnp=student.cnp
 INNER JOIN materie
 ON materie.id_materie=nota.id_curs
 INNER JOIN specializare
 ON specializare.id_specializare=materie.id_specializare
 INNER JOIN facultate
 ON facultate.id_facultate=specializare.id_facultate
 WHERE nota<6 OR nota=NULL
 ORDER BY facultate.denumire;
 
 /*3
 Afișează numele, prenumele, facultatea și media notelor primilor 10 studenți din fiecare facultate. 
 Afișează rezultatul sortat după criterii: 
denumire facultății
denumire specializarii		
*/

-- primii 10 studenți din fiecare facultate 
(SELECT student.cnp, facultate.denumire FROM specializare
INNER JOIN facultate
ON specializare.id_facultate=facultate.id_facultate
INNER JOIN student
ON student.id_specializare=specializare.id_specializare
WHERE facultate.denumire='Facultatea de inginerie' 
LIMIT 3)
UNION ALL
(SELECT student.cnp, facultate.denumire FROM specializare
INNER JOIN facultate
ON specializare.id_facultate=facultate.id_facultate
INNER JOIN student
ON student.id_specializare=specializare.id_specializare
WHERE facultate.denumire='Facultatea de litere' 
LIMIT 3)
UNION ALL
(SELECT student.cnp, facultate.denumire FROM specializare
INNER JOIN facultate
ON specializare.id_facultate=facultate.id_facultate
INNER JOIN student
ON student.id_specializare=specializare.id_specializare
WHERE facultate.denumire='Facultatea de teatru' 
LIMIT 3);

-- rezolvare completa
SELECT id_student, avg(nota) AS medie_note, persoana.nume, persoana.prenume, facultate.denumire, specializare.denumire
FROM nota 
INNER JOIN student
ON student.nr_matricol=nota.id_student
INNER JOIN persoana
ON persoana.cnp=student.cnp
INNER JOIN materie
ON materie.id_materie=nota.id_curs
INNER JOIN specializare
ON specializare.id_specializare=materie.id_specializare
INNER JOIN facultate
ON facultate.id_facultate=specializare.id_facultate
GROUP BY id_student
HAVING (facultate.denumire='Facultatea de inginerie' AND count(id_student)<3) 
OR (facultate.denumire='Facultatea de litere' AND count(id_student)<3);


/*4*/
SELECT DISTINCT profesor FROM nota
INNER JOIN materie
ON nota.id_curs=materie.id_materie
WHERE (YEAR(data_examen)>2017) AND 
(DATE_FORMAT(data_examen, '%m-%d') NOT BETWEEN '02-01' AND '03-10') OR (DATE_FORMAT(data_examen, '%m-%d') NOT BETWEEN '06-10' AND '07-08'); 


/*6*/
SELECT * FROM persoana
WHERE (DATE_FORMAT(CURRENT_DATE(), '%m-%d')='03-08') AND ((prenume LIKE '%a' OR cnp LIKE '6%') AND (cnp IN (SELECT cnp FROM student)));


