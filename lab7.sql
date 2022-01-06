/*Listează ID-ul și denumirea specializărilor care aparțin facultăților fondate înainte de anul 1980.*/
SELECT * FROM facultate;
SELECT id_specializare, denumire
FROM specializare
WHERE id_facultate IN (SELECT id_facultate FROM facultate WHERE an_fondare<1980);

/*Setează data examenului anul viitor, de ziua Europei, pentru toate notele corespunzătoare materiilor predate în anul 2 de studiu.*/
SELECT * FROM nota;
UPDATE nota
SET data_examen='2022-05-09'
WHERE id_curs IN (SELECT id_materie FROM materie WHERE an_de_studiu=2);

/*Șterge toate persoanele care nu au adresa completată corect (NULL sau mai mică de 10 caractere)
 și nu sunt studenți înmatriculați. */
DELETE FROM persoana
WHERE cnp NOT IN (SELECT cnp FROM student) AND (adresa=NULL OR LENGTH(adresa)<2); 

/*Afișează un set de informații care să conțină următoarele: 
numărul matricol al studentului
numele studentului
prenumele studentului
numele specializării
*/
SELECT nr_matricol, nume, prenume, denumire
FROM student, persoana, specializare
WHERE persoana.cnp=student.cnp AND student.id_specializare=specializare.id_specializare;

/*alta varianta*/
SELECT student.nr_matricol, persoana.nume, persoana.prenume, specializare.denumire
FROM persoana
INNER JOIN student ON student.cnp=persoana.cnp
INNER JOIN specializare ON specializare.id_specializare=student.id_specializare;

/*5
Afișează numele și codul matricol al studentilor din anul 2 care au cel puțin o notă mai mică decât 5.
*/
SELECT persoana.nume, student.nr_matricol, nota.nota
FROM persoana
INNER JOIN student ON persoana.cnp=student.cnp
INNER JOIN nota ON nota.id_student=student.nr_matricol
WHERE nota<7 AND an_curent=2;



