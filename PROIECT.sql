--------------------------BANCA--------------------------
CREATE TABLE BANCA (
    id_banca NUMBER(10) PRIMARY KEY,
    nume VARCHAR2(60) NOT NULL UNIQUE,
    an_infiintare DATE NOT NULL,
    filiale NUMBER(10)
    CONSTRAINT chk_banca CHECK (filiale > 0)
);

INSERT INTO BANCA (id_banca, nume, an_infiintare, filiale)
VALUES (100, 'Banca Transilvania', to_date('01/12/1993','DD/MM/YYYY'), 10);

INSERT INTO BANCA (id_banca, nume, an_infiintare, filiale)
VALUES (101, 'Raiffeisen Bank', to_date('01/06/2002','DD/MM/YYYY'), 20);

INSERT INTO BANCA (id_banca, nume, an_infiintare, filiale)
VALUES (102, 'Banca BRD', to_date('23/06/1923','DD/MM/YYYY'), 15);

INSERT INTO BANCA (id_banca, nume, an_infiintare, filiale)
VALUES (103, 'Banca BCR', to_date('01/01/1990','DD/MM/YYYY'), 18);

INSERT INTO BANCA (id_banca, nume, an_infiintare, filiale)
VALUES (104, 'Banca BNR', to_date('01/04/1880','DD/MM/YYYY'), 30);

INSERT INTO BANCA (id_banca, nume, an_infiintare, filiale)
VALUES (105, 'Banca ING', to_date('01/04/2002','DD/MM/YYYY'), 30);

SELECT * FROM BANCA;


--------------------------FILIALA--------------------------
CREATE TABLE FILIALA (
    id_filiala NUMBER(10) UNIQUE NOT NULL,
    id_banca NUMBER(10) NOT NULL,
    CONSTRAINT pk_fil PRIMARY KEY(id_filiala, id_banca),
    CONSTRAINT fkey_fil_banca FOREIGN KEY (id_banca) REFERENCES BANCA(id_banca) ON DELETE SET NULL,
    oras VARCHAR2(60) NOT NULL,
    nr_clienti NUMBER(10)
    CONSTRAINT chk_clienti CHECK (nr_clienti >=0)
);

ALTER TABLE FILIALA
ADD CONSTRAINT fkey_fil_banca FOREIGN KEY (id_banca) references BANCA(id_banca);

INSERT INTO FILIALA (id_filiala, id_banca, oras, nr_clienti)
VALUES (1, 100, 'BUCURESTI', 10000);

INSERT INTO FILIALA (id_filiala, id_banca, oras, nr_clienti)
VALUES (2, 100, 'TIMISOARA', 15000);

INSERT INTO FILIALA (id_filiala, id_banca, oras, nr_clienti)
VALUES (3, 101, 'BRASOV', 20000);

INSERT INTO FILIALA (id_filiala, id_banca, oras, nr_clienti)
VALUES (4, 102, 'CLUJ', 30000);

INSERT INTO FILIALA (id_filiala, id_banca, oras, nr_clienti)
VALUES (5, 103, 'ORADEA', 12000);

INSERT INTO FILIALA (id_filiala, id_banca, oras, nr_clienti)
VALUES (6, 104, 'BUCURESTI', 10000);

select * from filiala;


--------------------------PROGRAM--------------------------
CREATE TABLE PROGRAM (
    id_program NUMBER(10) PRIMARY KEY,
    id_filiala NUMBER(10) NOT NULL,
    CONSTRAINT fkey_prog_fil FOREIGN KEY (id_filiala) REFERENCES FILIALA(id_filiala) ON DELETE SET NULL,
    ora_deschidere VARCHAR2(60) NOT NULL,
    ora_inchidere VARCHAR(60) NOT NULL
);
INSERT INTO PROGRAM(id_program, id_filiala, ora_deschidere, ora_inchidere)
VALUES (1, 1, '10:00', '18:00');

INSERT INTO PROGRAM(id_program, id_filiala, ora_deschidere, ora_inchidere)
VALUES (2, 2, '08:00', '16:00');

INSERT INTO PROGRAM(id_program, id_filiala, ora_deschidere, ora_inchidere)
VALUES (3, 3, '09:00', '15:00');

INSERT INTO PROGRAM(id_program, id_filiala, ora_deschidere, ora_inchidere)
VALUES (4, 4, '07:00', '20:00');

INSERT INTO PROGRAM(id_program, id_filiala, ora_deschidere, ora_inchidere)
VALUES (5, 5, '12:00', '18:00');

INSERT INTO PROGRAM(id_program, id_filiala, ora_deschidere, ora_inchidere)
VALUES (6, 6, '08:00', '16:00');

SELECT * FROM PROGRAM;
--------------------------CLIENT--------------------------
CREATE TABLE CLIENTT (
    id_client NUMBER(10) UNIQUE NOT NULL,
    nume VARCHAR2(60) NOT NULL,
    prenume VARCHAR(60) NOT NULL
);

INSERT INTO CLIENTT(id_client, nume, prenume)
VALUES (1, 'Voinea', 'Ana');

INSERT INTO CLIENTT(id_client, nume, prenume)
VALUES (2, 'Iosoi', 'Cristiana');

INSERT INTO CLIENTT(id_client, nume, prenume)
VALUES (3, 'Balu', 'Valentin-Ionut');

INSERT INTO CLIENTT(id_client, nume, prenume)
VALUES (4, 'Muscalu', 'Diana');

INSERT INTO CLIENTT(id_client, nume, prenume)
VALUES (5, 'Mocanu', 'Radu');

INSERT INTO CLIENTT(id_client, nume, prenume)
VALUES (6, 'Chiriac', 'Ella');

INSERT INTO CLIENTT(id_client, nume, prenume)
VALUES (7, 'Ionescu', 'Raluca');

INSERT INTO CLIENTT(id_client, nume, prenume)
VALUES (8, 'Barbu', 'Robert');

INSERT INTO CLIENTT(id_client, nume, prenume)
VALUES (9, 'Oltean', 'Delia');

INSERT INTO CLIENTT(id_client, nume, prenume)
VALUES (10, 'Motanu', 'Andrei');

INSERT INTO CLIENTT(id_client, nume, prenume)
VALUES (11, 'YNY', 'Seby');

SELECT * FROM CLIENTT;


--------------------------IMPRUMUT--------------------------
CREATE TABLE IMPRUMUT (
    id_imprumut NUMBER(10) PRIMARY KEY,
    id_banca NUMBER(10) NOT NULL,
    id_client NUMBER(10) NOT NULL,
    CONSTRAINT fkey_impr_ban FOREIGN KEY (id_banca) REFERENCES BANCA(id_banca) ON DELETE SET NULL,
    CONSTRAINT fkey_impr_client FOREIGN KEY (id_client) REFERENCES CLIENTT(id_client) ON DELETE SET NULL,
    tip_imprumut VARCHAR2(60) NOT NULL,
    suma NUMBER(10) 
    CONSTRAINT chk_suma CHECK (suma> 0)
);

INSERT INTO IMPRUMUT(id_imprumut, id_banca, id_client, tip_imprumut, suma)
VALUES (1, 100, 1, 'prima casa', 25000);

INSERT INTO IMPRUMUT(id_imprumut, id_banca, id_client, tip_imprumut, suma)
VALUES (2, 104, 7, 'bancar', 300000);

INSERT INTO IMPRUMUT(id_imprumut, id_banca, id_client, tip_imprumut, suma)
VALUES (3, 100, 10, 'dobanda fixa', 10000);

INSERT INTO IMPRUMUT(id_imprumut, id_banca, id_client, tip_imprumut, suma)
VALUES (4, 102, 11, 'comercial', 250000);

INSERT INTO IMPRUMUT(id_imprumut, id_banca, id_client, tip_imprumut, suma)
VALUES (5, 103, 9, 'ipotecar', 5000);


--------------------------ANGAJAT--------------------------
CREATE TABLE ANGAJAT (
    id_angajat NUMBER(10) PRIMARY KEY,
    id_banca NUMBER(10) NOT NULL,
    CONSTRAINT fkey_ang_ban FOREIGN KEY (id_banca) REFERENCES BANCA(id_banca) ON DELETE SET NULL,
    nume VARCHAR2(60) NOT NULL,
    data_angajari VARCHAR2(60) NOT NULL
);

CREATE TABLE DIRECTOR (
id_angajat NUMBER(10) not null REFERENCES ANGAJAT(id_angajat),
PRIMARY KEY(id_angajat),
nr_manageri NUMBER(10)
);

CREATE TABLE MANAGER (
id_angajat NUMBER(10) not null REFERENCES ANGAJAT(id_angajat),
PRIMARY KEY(id_angajat),
nr_consilieri NUMBER(10)
);

CREATE TABLE CONSILIER (
id_angajat NUMBER(10) not null REFERENCES ANGAJAT(id_angajat),
PRIMARY KEY(id_angajat),
nr_clienti NUMBER(10)
);

INSERT INTO ANGAJAT(id_angajat, id_banca, nume, data_angajari)
VALUES (0, 100, 'POPESCU DAN', '12.05.2000');

INSERT INTO ANGAJAT(id_angajat, id_banca, nume, data_angajari)
VALUES (1, 102, 'CAZACU ALINA', '10.07.2020');

INSERT INTO ANGAJAT(id_angajat, id_banca, nume, data_angajari)
VALUES (2, 101, 'MARIN PREDA', '01.01.1995');

INSERT INTO ANGAJAT(id_angajat, id_banca, nume, data_angajari)
VALUES (3, 102, 'CONTE CARINA', '01.06.2022');

INSERT INTO ANGAJAT(id_angajat, id_banca, nume, data_angajari)
VALUES (4, 103, 'JHON MAYER', '31.07.2000');

INSERT INTO ANGAJAT(id_angajat, id_banca, nume, data_angajari)
VALUES (5, 104, 'POPESCU CRISTIAN', '12.12.2012');

INSERT INTO ANGAJAT(id_angajat, id_banca, nume, data_angajari)
VALUES (6, 103, 'LORELAY ADELA', '13.01.1999');

INSERT INTO ANGAJAT(id_angajat, id_banca, nume, data_angajari)
VALUES (7, 100, 'CANTEMIR MARIUS', '02.02.2002');

INSERT INTO ANGAJAT(id_angajat, id_banca, nume, data_angajari)
VALUES (8, 104, 'EMILY DONNER','14.07.2002');


INSERT INTO DIRECTOR (id_angajat) 
  SELECT id_angajat    
  FROM ANGAJAT
  WHERE id_angajat = 0;

UPDATE DIRECTOR SET
  nr_manageri = 5
WHERE id_angajat = 0;

INSERT INTO DIRECTOR (id_angajat) 
  SELECT id_angajat    
  FROM ANGAJAT
  WHERE id_angajat = 2;

UPDATE DIRECTOR SET
  nr_manageri = 10
WHERE id_angajat = 2;

INSERT INTO MANAGER (id_angajat) 
  SELECT id_angajat    
  FROM ANGAJAT
  WHERE id_angajat = 6;

UPDATE MANAGER SET
  nr_consilieri = 4
WHERE id_angajat = 6;

INSERT INTO MANAGER (id_angajat) 
  SELECT id_angajat    
  FROM ANGAJAT
  WHERE id_angajat = 7;

UPDATE MANAGER SET
  nr_consilieri = 5
WHERE id_angajat = 7;

INSERT INTO MANAGER (id_angajat) 
  SELECT id_angajat    
  FROM ANGAJAT
  WHERE id_angajat = 8;

UPDATE MANAGER SET
  nr_consilieri = 10
WHERE id_angajat = 8;

INSERT INTO CONSILIER (id_angajat) 
  SELECT id_angajat    
  FROM ANGAJAT
  WHERE id_angajat = 1;

UPDATE CONSILIER SET
  nr_clienti = 100
WHERE id_angajat = 1;

INSERT INTO CONSILIER (id_angajat) 
  SELECT id_angajat    
  FROM ANGAJAT
  WHERE id_angajat = 3;

UPDATE CONSILIER SET
  nr_clienti = 50
WHERE id_angajat = 3;

INSERT INTO CONSILIER (id_angajat) 
  SELECT id_angajat    
  FROM ANGAJAT
  WHERE id_angajat = 4;

UPDATE CONSILIER SET
  nr_clienti = 75
WHERE id_angajat = 4;

INSERT INTO CONSILIER (id_angajat) 
  SELECT id_angajat    
  FROM ANGAJAT
  WHERE id_angajat = 5;

UPDATE CONSILIER SET
  nr_clienti = 35
WHERE id_angajat = 5;

--------------------------CONT--------------------------
CREATE TABLE CONTT (
    id_cont NUMBER(10) PRIMARY KEY,
    sold NUMBER(10)
);

INSERT INTO CONTT (id_cont, sold)
VALUES (00, 1000);

INSERT INTO CONTT (id_cont, sold)
VALUES (01, 5000);

INSERT INTO CONTT (id_cont, sold)
VALUES (02, 10000);

INSERT INTO CONTT (id_cont, sold)
VALUES (03, 25000);

INSERT INTO CONTT (id_cont, sold)
VALUES (04, 50000);

INSERT INTO CONTT (id_cont, sold)
VALUES (05, 0);


--------------------------TRANZACTIE--------------------------
CREATE TABLE TRANZACTIE (
    id_tranzactie NUMBER(10) PRIMARY KEY,
    id_cont NUMBER(10) NOT NULL,
    CONSTRAINT fkey_tran_cont FOREIGN KEY (id_cont) REFERENCES CONTT(id_cont) ON DELETE SET NULL,
    data_tranzactiei VARCHAR2(60) NOT NULL,
    totalul_tranzactiei NUMBER(10),
    tip_tranzactie VARCHAR2(60) NOT NULL,
    CONSTRAINT chk_total CHECK (totalul_tranzactiei > 0)
);

INSERT INTO TRANZACTIE (id_tranzactie, id_cont, data_tranzactiei, totalul_tranzactiei, tip_tranzactie)
VALUES (1, 00, TO_DATE('01-01-2021','DD-MM-YYYY'), 100, 'depunere');

INSERT INTO TRANZACTIE (id_tranzactie, id_cont, data_tranzactiei, totalul_tranzactiei, tip_tranzactie)
VALUES (2, 01, TO_DATE('02-02-2022','DD-MM-YYYY'), 1500, 'retragere');

INSERT INTO TRANZACTIE (id_tranzactie, id_cont, data_tranzactiei, totalul_tranzactiei, tip_tranzactie)
VALUES (3, 01, TO_DATE('12-12-2021','DD-MM-YYYY'), 100, 'retragere');

INSERT INTO TRANZACTIE (id_tranzactie, id_cont, data_tranzactiei, totalul_tranzactiei, tip_tranzactie)
VALUES (4, 03, TO_DATE('19-06-2022','DD-MM-YYYY'), 25000, 'depunere');

INSERT INTO TRANZACTIE (id_tranzactie, id_cont, data_tranzactiei, totalul_tranzactiei, tip_tranzactie)
VALUES (5, 05, TO_DATE('05-05-2022','DD-MM-YYYY'), 1300, 'depunere');


--------------------------SALARIU--------------------------
CREATE TABLE SALARIUU (
    id_salariu NUMBER(10) PRIMARY KEY,
    id_angajat NUMBER(10) NOT NULL,
    CONSTRAINT fkey_sal_ang FOREIGN KEY (id_angajat) REFERENCES ANGAJAT(id_angajat) ON DELETE SET NULL,
    salariu_brut NUMBER(10),
    salariu_net VARCHAR2(60) NOT NULL,
    CONSTRAINT chk_salariu CHECK (salariu_brut > salariu_net)
);

INSERT INTO SALARIUU(id_salariu, id_angajat, salariu_brut, salariu_net)
VALUES (1, 0, 3500, 2800);

INSERT INTO SALARIUU(id_salariu, id_angajat, salariu_brut, salariu_net)
VALUES (2, 1, 5000, 4500);

INSERT INTO SALARIUU(id_salariu, id_angajat, salariu_brut, salariu_net)
VALUES (3, 2, 1500, 1200);

INSERT INTO SALARIUU(id_salariu, id_angajat, salariu_brut, salariu_net)
VALUES (4, 3, 4000, 3700);

INSERT INTO SALARIUU(id_salariu, id_angajat, salariu_brut, salariu_net)
VALUES (5, 4, 2000, 1800);

INSERT INTO SALARIUU(id_salariu, id_angajat, salariu_brut, salariu_net)
VALUES (6, 5, 2500, 2100);

INSERT INTO SALARIUU(id_salariu, id_angajat, salariu_brut, salariu_net)
VALUES (7, 6, 4700, 4300);

INSERT INTO SALARIUU(id_salariu, id_angajat, salariu_brut, salariu_net)
VALUES (8, 7, 1800, 1500);

INSERT INTO SALARIUU(id_salariu, id_angajat, salariu_brut, salariu_net)
VALUES (9, 8, 1000, 970);


--------------------------CONTACT--------------------------
CREATE TABLE CONTACT (
    id_contact NUMBER(10) PRIMARY KEY,
    id_angajat NUMBER(10) NOT NULL,
    CONSTRAINT fkey_contact_ang FOREIGN KEY (id_angajat) REFERENCES ANGAJAT(id_angajat) ON DELETE SET NULL,
    email VARCHAR(60),
    telefon VARCHAR2(60) NOT NULL
);

INSERT INTO CONTACT (id_contact, id_angajat, email, telefon)
VALUES (0, 0, 'angajat0@banca.ro', '0368415678');

INSERT INTO CONTACT (id_contact, id_angajat, email, telefon)
VALUES (1, 1, 'angajat1@banca.ro', '0368213213');

INSERT INTO CONTACT (id_contact, id_angajat, email, telefon)
VALUES (2, 2, 'angajat2@banca.ro', '0268333444');

INSERT INTO CONTACT (id_contact, id_angajat, email, telefon)
VALUES (3, 3, 'angajat3@banca.ro', '0268556554');

INSERT INTO CONTACT (id_contact, id_angajat, email, telefon)
VALUES (4, 4, 'angajat4@banca.ro', '0368987789');

INSERT INTO CONTACT (id_contact, id_angajat, email, telefon)
VALUES (5, 5, 'angajat5@banca.ro', '0368223431');

INSERT INTO CONTACT (id_contact, id_angajat, email, telefon)
VALUES (6, 6, 'angajat6@banca.ro', '0268995432');

INSERT INTO CONTACT (id_contact, id_angajat, email, telefon)
VALUES (7, 7, 'angajat7@banca.ro', '0734232232');

INSERT INTO CONTACT (id_contact, id_angajat, email, telefon)
VALUES (8, 8, 'angajat8@banca.ro', '0721768971');


--------------------------APARTINERE--------------------------
CREATE TABLE APARTINERE (
id_filiala NUMBER(10) CONSTRAINT pk_fil_ap REFERENCES FILIALA(id_filiala),
id_cont  NUMBER(10) CONSTRAINT pk_cont_ap REFERENCES CONTT(id_cont),
CONSTRAINT pk_apartinere PRIMARY KEY(id_filiala, id_cont)
);

INSERT INTO APARTINERE (id_filiala, id_cont)
VALUES (1, 00);

INSERT INTO APARTINERE (id_filiala, id_cont)
VALUES (2, 01);

INSERT INTO APARTINERE (id_filiala, id_cont)
VALUES (2, 02);

INSERT INTO APARTINERE (id_filiala, id_cont)
VALUES (3, 03);

INSERT INTO APARTINERE (id_filiala, id_cont)
VALUES (4, 04);

INSERT INTO APARTINERE (id_filiala, id_cont)
VALUES (6, 05);

INSERT INTO APARTINERE (id_filiala, id_cont)
VALUES (1, 05);

INSERT INTO APARTINERE (id_filiala, id_cont)
VALUES (2, 04);

INSERT INTO APARTINERE (id_filiala, id_cont)
VALUES (5, 00);

INSERT INTO APARTINERE (id_filiala, id_cont)
VALUES (4, 05);

SELECT * FROM APARTINERE;


--------------------------CLIENT_CONT--------------------------
CREATE TABLE CLIENT_CONT (
id_client NUMBER(10) CONSTRAINT pk_client_cc REFERENCES CLIENTT(id_client),
id_cont  NUMBER(10) CONSTRAINT pk_cont_cc REFERENCES CONTT(id_cont),
CONSTRAINT pk_cc PRIMARY KEY(id_client, id_cont)
);

INSERT INTO CLIENT_CONT (id_client, id_cont)
VALUES (1, 00);

INSERT INTO CLIENT_CONT (id_client, id_cont)
VALUES (2, 01);

INSERT INTO CLIENT_CONT (id_client, id_cont)
VALUES (3, 02);

INSERT INTO CLIENT_CONT (id_client, id_cont)
VALUES (4, 03);

INSERT INTO CLIENT_CONT (id_client, id_cont)
VALUES (5, 04);

INSERT INTO CLIENT_CONT (id_client, id_cont)
VALUES (6, 05);

INSERT INTO CLIENT_CONT (id_client, id_cont)
VALUES (7, 00);

INSERT INTO CLIENT_CONT (id_client, id_cont)
VALUES (8, 01);

INSERT INTO CLIENT_CONT (id_client, id_cont)
VALUES (9, 02);

INSERT INTO CLIENT_CONT (id_client, id_cont)
VALUES (10, 03);

INSERT INTO CLIENT_CONT (id_client, id_cont)
VALUES (11, 04);

SELECT * FROM BANCA;
SELECT * FROM FILIALA;
SELECT * FROM PROGRAM;
SELECT * FROM IMPRUMUT;
SELECT * FROM CONTT;
SELECT * FROM CLIENTT;
SELECT * FROM TRANZACTIE;
SELECT * FROM ANGAJAT;
SELECT * FROM DIRECTOR;
SELECT * FROM MANAGER;
SELECT * FROM CONSILIER;
SELECT * FROM SALARIUU;
SELECT * FROM CONTACT;
SELECT * FROM APARTINERE;
SELECT * FROM CLIENT_CONT;

---------------------------------------------------- EXERCITIUL 11 ----------------------------------------------------
--1.
-- JOIN pe 4 tabele + filtrare la nivel de linii
-- Sa se afiseze numele angajatului, numele bancii la care este acesta angajat, 
-- email-ul si salaraiul brut pe are il primeste
SELECT a.nume, b.nume AS BANCA, c.email, s.salariu_brut
FROM ANGAJAT a JOIN BANCA b USING (id_banca)
               JOIN CONTACT c USING (id_angajat)
               JOIN SALARIUU s USING (id_angajat);
               
--2.
-- Clauza WITH + CASE
-- Suma tranzactiilor, iar daca suma este mai mare decat 10000, sa afisam un mesaj
-- iar daca nu e alt mesaj.
WITH SUMA AS (SELECT SUM(totalul_tranzactiei) TOTAL FROM TRANZACTIE)
SELECT TOTAL,
CASE 
WHEN TOTAL >= 10000 THEN 'Tranzactiile au depasit totalul de 10000'
                    ELSE 'Tranzactiile nu au depasit totalul de 10000'
END AS "Informatii tranzactii"
FROM SUMA;

--3.
-- subcereri
-- filtrare la nivel de grup
-- Angajatii care lucreaza in banca care are numarul minim de angajati.
SELECT a.*
FROM ANGAJAT a
WHERE a.id_banca IN (SELECT b.id_banca
                     FROM ANGAJAT a, BANCA b
                     WHERE a.id_banca = b.id_banca
                     GROUP BY b.nume, b.id_banca
                     HAVING COUNT(*) = (SELECT MIN(COUNT(*))
                                        FROM ANGAJAT a, BANCA b
                                        WHERE b.id_banca = a.id_banca
                                        GROUP BY b.nume, b.id_banca)
);

--4. 
-- NVL
-- Sa se selecteze numele si prenumele clientului si daca clientul are cont, astfel:
-- daca acestia au cont, se va afisa "DA"

select nume, prenume, NVL(are_cont,'DA') as cont_bancar
from CLIENTT;

--5.
-- functii pe date
-- Sa se afiseze datele despre o tranzactie care a fost facuta in mai putin de 10 luni.
SELECT id_tranzactie, data_tranzactiei, totalul_tranzactiei, tip_tranzactie
FROM TRANZACTIE
WHERE MONTHS_BETWEEN(TO_DATE(SYSDATE, 'DD-MM-YYYY'),data_tranzactiei)<=10;

---------------------------------------------------- EXERCITIUL 12 ----------------------------------------------------
-- Adaugarea unei coloane in tabelul CLIENT
ALTER TABLE CLIENTT
ADD are_cont VARCHAR(255);

SELECT * FROM CONTT;

-- Sa se mareasca soldul conturilor care au mai putin de 500 cu 100
UPDATE CONTT
SET sold = sold + 100
WHERE sold < 500;
SELECT * FROM CONTT;

-- Sa se stearga toate tranzactiile de tipul retragere
DELETE FROM TRANZACTIE
WHERE id_tranzactie IN( SELECT id_tranzactie
from TRANZACTIE
where tip_tranzactie = 'retragere'
);

-- Sa se modifice salariul net ca fiind cu 10% mai putin decat cel brut
-- la salariul cu id-ul 2
UPDATE SALARIUU
SET salariu_net = salariu_net - 0.1 * salariu_brut
WHERE id_salariu = 2;


---------------------------------------------------- EXERCITIUL 13 ----------------------------------------------------
CREATE SEQUENCE sec_banca
START WITH 10
INCREMENT BY 5
MAXVALUE 100000
NOCYCLE;
-- se insereaza
INSERT INTO BANCA
VALUES(sec_banca.nextval, 'OTP BANK', to_date('01/01/1949','DD/MM/YYYY'),30);
SELECT * FROM BANCA;


---------------------------------------------------- EXERCITIUL 14 ----------------------------------------------------
CREATE OR REPLACE VIEW vizualizare AS
SELECT b.nume, f.oras, p.ora_deschidere
FROM BANCA b, FILIALA f, PROGRAM p;

SELECT * FROM vizualizare; --exemplu operatie permisa
DELETE vizualizare; --exemplu operatie nepermisa


---------------------------------------------------- EXERCITIUL 16 ----------------------------------------------------
-- outer join, sa se afiseze orasul filialei, soldul conturilor ce apartin de aceasta si numele bancii
-- pentru toate filialele
SELECT f.oras, c.sold, b.nume
FROM FILIALA f RIGHT OUTER JOIN APARTINERE ap ON(ap.id_filiala = f.id_filiala)
LEFT OUTER JOIN CONTT c ON(c.id_cont = ap.id_cont)
FULL OUTER JOIN BANCA b ON (b.id_banca = f.id_banca);

--sa se obtina codurile imprumuturilor care au fost facute de clientului cu id-ul 11 sau 7

SELECT * FROM IMPRUMUT;
SELECT * FROM CLIENTT;

SELECT id_imprumut
FROM IMPRUMUT
MINUS
SELECT id_imprumut
FROM (SELECT id_imprumut, id_client 
      FROM (SELECT DISTINCT id_imprumut FROM IMPRUMUT) i1,
           (SELECT id_client FROM CLIENTT WHERE id_client = 11 or id_client = 7) i2
            MINUS
            SELECT id_imprumut, id_client 
            FROM IMPRUMUT) i3;

