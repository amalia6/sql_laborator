/* Listează ID-ul și numele specializărilor de la facultatea X (alege tu string-ul X). */
SELECT specializare.id_specializare, specializare.denumire, facultate.denumire
FROM specializare
INNER JOIN facultate ON facultate.id_facultate=specializare.id_facultate
WHERE facultate.denumire='Facultatea de teatru';

/* Afișează numele specializării care are cele mai multe cursuri. (opțional, rezolvati prin doua metode) */
SELECT specializare.denumire as denumire_specializare, count(materie.id_materie) as nr_de_cursuri
FROM specializare 
INNER JOIN materie 
ON specializare.id_specializare=materie.id_specializare
GROUP BY specializare.id_specializare
ORDER  BY max(nr_de_cursuri)
LIMIT 1;		

/* Afișează un set de informații care să conțină următoarele: 
numărul matricol al studentului
numele studentului
prenumele studentului
numele specializării
 */
SELECT student.nr_matricol, persoana.nume, persoana.prenume, specializare.denumire
FROM student, persoana, specializare
WHERE persoana.cnp=student.cnp AND student.id_specializare=specializare.id_specializare;

SELECT student.nr_matricol, persoana.nume, persoana.prenume, specializare.denumire AS denumire_specializare
FROM persoana
INNER JOIN student ON persoana.cnp=student.cnp
INNER JOIN specializare ON student.id_specializare=specializare.id_specializare
ORDER BY nume;

/* Afișează un set de informații care să conțină următoarele: 
nota
numele și prenumele studentului (într-o singură coloană)
numele materiei pentru care a fost primită nota
 */
SELECT concat(persoana.nume, ' ', persoana.prenume) AS nume_student, nota.nota, materie.denumire as denumire_materie
FROM persoana
INNER JOIN student ON persoana.cnp=student.cnp
INNER JOIN nota ON student.nr_matricol=nota.id_student
INNER JOIN materie ON nota.id_curs=materie.id_materie;

/* Afișează numele și codul matricol al studentilor din anul 2 care au cel puțin o notă mai mică decât 5. */
SELECT concat(persoana.nume, ' ', persoana.prenume) AS nume_student, student.nr_matricol, nota.nota
FROM persoana
INNER JOIN student ON persoana.cnp=student.cnp
INNER JOIN nota ON student.nr_matricol=nota.id_student
WHERE nota<6 AND an_curent=2;

/* (Opțional) Având noțiunile din acest laborator precum și din laboratoarele trecute, creați un query
 care să vă afișeze rezultatul unui FULL OUTER JOIN (în ciuda faptului că această clauză nu este suportată). ?????*/
SELECT specializare.denumire, facultate.denumire
FROM facultate, specializare
WHERE facultate.id_facultate=specializare.id_facultate AND facultate.id_facultate<>specializare.id_facultate;

