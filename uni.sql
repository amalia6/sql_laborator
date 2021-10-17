CREATE DATABASE universitate;
use `universitate`;
CREATE TABLE facultate(
	id_facultate INT NOT NULL,
	denumire VARCHAR(50) NOT NULL,
    adresa VARCHAR(50) NOT NULL,
    an_fondare YEAR NOT NULL,
    decan VARCHAR (55) NOT NULL,
    PRIMARY KEY (id_facultate)
);
CREATE TABLE persoana(
	cnp VARCHAR(13) NOT NULL,
    seria VARCHAR(4) NULL,
    nr INT NULL,
    prenume VARCHAR (30) NOT NULL,
    nume VARCHAR (30) NOT NULL,
    adresa VARCHAR (50) NOT NULL,
    nationalitate VARCHAR (50) NOT NULL,
    PRIMARY KEY (cnp)
);
CREATE TABLE specializare(
	id_specializare INT NOT NULL,
    id_facultate INT NOT NULL,
    denumire VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_specializare)
);
CREATE TABLE student(
	nr_matricol INT NOT NULL,
    id_specializare INT NOT NULL,
    cnp VARCHAR(13) NOT NULL,
    an_curent INT NOT NULL,
    grupa VARCHAR(10) NOT NULL,
    semestru INT NOT NULL,
    bursa TINYINT NULL,
    PRIMARY KEY (nr_matricol)
);
CREATE TABLE materie(
	id_materie INT NOT NULL,
    id_specializare INT NOT NULL,
    denumire VARCHAR(50) NOT NULL,
    an_de_studiu INT NOT NULL,
    semestru TINYINT NOT NULL,
    profesor VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_materie)
);
CREATE TABLE nota(
	id_nota INT NOT NULL,
    id_student INT NOT NULL,
    id_curs INT NOT NULL,
    nota INT NOT NULL,
    data_examen DATE NULL,
    PRIMARY KEY (id_nota)
);
ALTER TABLE specializare
ADD FOREIGN KEY (id_facultate) REFERENCES facultate(id_facultate);
ALTER TABLE student
ADD FOREIGN KEY (id_specializare) REFERENCES specializare(id_specializare),
ADD FOREIGN KEY (cnp) REFERENCES persoana(cnp);
ALTER TABLE materie
ADD FOREIGN KEY (id_specializare) REFERENCES specializare(id_specializare);
ALTER TABLE nota
ADD FOREIGN KEY (id_student) REFERENCES student(nr_matricol),
ADD FOREIGN KEY (id_curs) REFERENCES materie(id_materie);







    