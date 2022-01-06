-- Afișează media notelor tuturor studentilor.
SELECT AVG (nota) AS media_notelor FROM nota;

-- Afișați pentru fiecare notă din tabelul nota timpul trecut de la acordarea notei până în prezent.
SELECT data_examen, curdate(), datediff(curdate(),data_examen) as nr_zile FROM nota;

-- Afișați din tabelul persoană numele complet al studentului într-o singură coloană,
--  și seria cu numărul de buletin în altă coloană. ( rezolvati prin doua moduri)
SELECT CONCAT(nume," ",prenume) AS nume_complet, CONCAT(seria,nr) AS serie_buletin FROM persoana;

SELECT CONCAT_WS(' ',seria,nr) AS serie_noua, CONCAT_WS(' ',nume,prenume) AS nume_nou FROM persoana;

-- Afișați din tabelul student numărul de studenți înmatriculați și numărul total de persoane înmatriculate.
SELECT COUNT(nr_matricol) AS nr_studenti_inmatriculati, COUNT(DISTINCT cnp) AS nr_total_persoane FROM student;

-- Afișează numele decanilor de facultate cu caractere mari : Ex: POPESCU. (Fără să modifici în baza de date)
SELECT UPPER(decan) as decan_cu_litera_mare FROM facultate;

-- Afișează CNP-ul, numele persoanei, luna nașterii (numeric, ex: 08), luna nașterii( text, ex: August) 
-- pentru toate persoanele. (Extrage luna nasterii din CNP.
SELECT cnp, nume, prenume, SUBSTRING(cnp,4,1) AS luna_nr, MonthName(03) AS luna_nume FROM persoana; 

-- Afișează în format ASCII numele profesorilor care au in componenta numelui litera ‘a’. (opțional)
SELECT ASCII(profesor) AS nume_prof_cu_litera_a FROM materie WHERE profesor LIKE '%a%'; 

SELECT CONCAT(ASCII(SUBSTRING(profesor,1,1)),ASCII(SUBSTRING(profesor,2,1)),ASCII(SUBSTRING(profesor,3,1)),ASCII(SUBSTRING(profesor,4,1)),
ASCII(SUBSTRING(profesor,5,1)),ASCII(SUBSTRING(profesor,6,1)),ASCII(SUBSTRING(profesor,7,1))) as nume_prof_ascii 
FROM materie WHERE profesor LIKE '%a%'; 

-- Adaugă litera ‘x’ în fața numelui decanilor care conduc facultăți ce au denumirea formată din mai puțin de 5 caractere.(opțional)
SELECT INSERT(decan, 1, 0, "x") AS decan_x_regula FROM facultate WHERE LENGTH(denumire)<5;





