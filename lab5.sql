explain select * from universitate.persoana;
explain select * from universitate.nota;

-- Afișați toate notele distincte din baza de date și numărul de studenți care au luat notele respective. 
-- ( Ex: 5 (nota), 200 (studenți) ). 
select 10 as nota, count(*) as nr_studenti from nota
where nota=10
union
select 9 as nota, count(*) as nr_studenti from nota
where nota=9
union
select 8 as nota, count(*) as nr_studenti from nota
where nota=8
union
select 7 as nota, count(*) as nr_studenti from nota
where nota=7
union
select 6 as nota, count(*) as nr_studenti from nota
where nota=6
union
select 5 as nota, count(*) as nr_studenti from nota
where nota=5
union
select 4 as nota, count(*) as nr_studenti from nota
where nota=4;

select nota, count(*) as nr_studenti from nota 
group by nota;

-- Enumerați toate facultățile și specializările în același set de rezultate. Afișați denumirea lor și valoarea cheii principale.
--  Ordonați rezultatul într-o manieră alfabetică inversată în funcție de denumirea specializarii.
select denumire,id_specializare from specializare
union
select denumire,id_facultate from facultate
order by denumire DESC;

-- Identificați persoanele care fac parte din aceeași familie (au același nume și locuiesc la aceeași adresa.
--  Grupați înregistrările din tabela persoane după nume și adresă. Afișați doar persoanele care locuiesc în București. 
-- Inserati în tabela persoana înregistrări relevante pentru exemplificarea corectă a scenariului. 
insert into persoana(cnp, seria, nr, prenume, nume, adresa, nationalitate)
values
(73849, 'B', '5523', 'Mihai', 'Faraon', 'Strada Siretului', 'romana'),
(63729, 'B', '8299', 'Radu', 'Faraon', 'Strada Siretului', 'romana'),
(88389, 'B', '7383', 'Denisa', 'Faraon', 'Strada Siretului', 'romana'),
(67387, 'B', '7379', 'Emma', 'Vlad', 'Strada Siretului', 'romana'),
(63683, 'B', '7278', 'Francesca', 'Vlad', 'Strada Podragu', 'romana'),
(63738, 'B', '7202', 'Alex', 'Murariu', 'Strada Mitropoliei', 'romana'),
(61730, 'B', '8390', 'Alexandra', 'Murariu', 'Strada Mitropoliei', 'romana'),
(43018, 'B', '8261', 'Ioana', 'Murariu', 'Strada Mitropoliei', 'romana');

select * from persoana;

select nume, adresa, count(nume) as nr_membri_fam from persoana where seria='B' group by nume, adresa having count(nume)>=2;
