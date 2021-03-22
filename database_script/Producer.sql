/*
Created: 07/11/2020
Modified: 16/11/2020
Project: Projekt zaliczeniowy BDBT
Model: BDBT_przedsiebiorstwo_telewizyjno_radiowe
Company: Politechnika Warszawska
Author: Bartosz K, Mikolaj B
Database: Oracle 19c
*/


-- Create sequences section -------------------------------------------------

CREATE SEQUENCE ProducentSeq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE PracownikSeq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE WlascicielSeq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE AdresySeq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE PocztySeq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE JezykiSeq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE StanowiskaSeq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE ZamowieniaSeq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE FabrykiSeq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE KlienciSeq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE WynagrodzeniaSeq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE ModeleSeq1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

-- Create tables section -------------------------------------------------

-- Table Producent_RTV

CREATE TABLE Producent_RTV(
  ID_producenta Integer NOT NULL,
  Nazwa Varchar2(30 ) NOT NULL,
  Data_zalozenia Date NOT NULL,
  NIP Char(10 ) NOT NULL,
  REGON Char(9 ) NOT NULL,
  ID_adresu Integer NOT NULL
)
/

-- Create indexes for table Producent_RTV

CREATE INDEX IX_Relationship73 ON Producent_RTV (ID_adresu)
/

-- Add keys for table Producent_RTV

ALTER TABLE Producent_RTV ADD CONSTRAINT Przedsiebiorstwo_PK PRIMARY KEY (ID_producenta)
/

-- Table Pracownicy

CREATE TABLE Pracownicy(
  ID_pracownika Integer NOT NULL,
  Imie Varchar2(15 ) NOT NULL,
  Nazwisko Varchar2(30 ) NOT NULL,
  Data_urodzenia Date NOT NULL,
  Data_zatrudnienia Date NOT NULL,
  PESEL Char(11 ),
  Plec Char(1 )
        CONSTRAINT plec CHECK (Plec IN ('K','M'))
        CHECK (Plec IN ('K','M')),
  Nr_konta Varchar2(36 ),
  ID_producenta Integer NOT NULL,
  ID_adresu Integer NOT NULL,
  ID_stanowiska Integer NOT NULL,
  ID_fabryki Integer NOT NULL
)
/

-- Create indexes for table Pracownicy

CREATE INDEX IX_Zatrudnia ON Pracownicy (ID_producenta)
/

CREATE INDEX IX_Relationship6 ON Pracownicy (ID_adresu)
/

CREATE INDEX IX_Relationship13 ON Pracownicy (ID_stanowiska)
/

CREATE INDEX IX_Relationship1 ON Pracownicy (ID_fabryki)
/

-- Add keys for table Pracownicy

ALTER TABLE Pracownicy ADD CONSTRAINT Pracownik_PK PRIMARY KEY (ID_pracownika)
/

-- Table Inzynierzy

CREATE TABLE Inzynierzy(
  ID_pracownika Integer NOT NULL,
  Nr_uprawnien Varchar2(15 ) NOT NULL,
  Data_BHP Date NOT NULL,
  Nr_ubezpieczenia_NNW Varchar2(15 ) NOT NULL
)
/

-- Add keys for table Inzynierzy

ALTER TABLE Inzynierzy ADD CONSTRAINT Unique_Identifier1 PRIMARY KEY (ID_pracownika)
/

-- Table Pracownicy_administracyjni

CREATE TABLE Pracownicy_administracyjni(
  ID_pracownika Integer NOT NULL,
  Data_badania Date NOT NULL,
  Wyksztalcenie_administracyjne Char(1 ) NOT NULL,
  Nr_legitymacji Char(10 ) NOT NULL
)
/

-- Add keys for table Pracownicy_administracyjni

ALTER TABLE Pracownicy_administracyjni ADD CONSTRAINT Unique_Identifier2 PRIMARY KEY (ID_pracownika)
/

-- Table Fabryki

CREATE TABLE Fabryki(
  ID_fabryki Integer NOT NULL,
  Specjalizacja Varchar2(4 ) NOT NULL
        CHECK (Specjalizacja IN ('TV','R','R/TV')),
  Powierzchnia Number(3,2) NOT NULL,
  Nr_ubezpieczenia Varchar2(30 ) NOT NULL,
  ID_producenta Integer NOT NULL,
  ID_adresu Integer NOT NULL
)
/

-- Create indexes for table Fabryki

CREATE INDEX IX_posiada_fabryki ON Fabryki (ID_producenta)
/

CREATE INDEX IX_Relationship9 ON Fabryki (ID_adresu)
/

-- Add keys for table Fabryki

ALTER TABLE Fabryki ADD CONSTRAINT Fabryka_PK PRIMARY KEY (ID_fabryki)
/

-- Table Klienci

CREATE TABLE Klienci(
  ID_klienta Integer NOT NULL,
  Imie Varchar2(15 ) NOT NULL,
  Nazwisko Varchar2(30 ) NOT NULL,
  NazwaFirmy Varchar2(30 ),
  KartaStalegoKlienta Char(1 ) NOT NULL,
  DataRejestracji Date NOT NULL,
  ID_adresu Integer NOT NULL
)
/

-- Create indexes for table Klienci

CREATE INDEX IX_Relationship11 ON Klienci (ID_adresu)
/

-- Add keys for table Klienci

ALTER TABLE Klienci ADD CONSTRAINT Klient_PK PRIMARY KEY (ID_klienta)
/

-- Table Zamowienia

CREATE TABLE Zamowienia(
  ID_zamowienia Integer NOT NULL,
  Data_zamowienia Date NOT NULL,
  Data_realizacji Date,
  Faktura Char(1 ) NOT NULL,
  ID_producenta Integer NOT NULL,
  ID_klienta Integer NOT NULL
)
/

-- Create indexes for table Zamowienia

CREATE INDEX IX_realizuje_zamowienia ON Zamowienia (ID_producenta)
/

CREATE INDEX IX_sklada_zamowienia ON Zamowienia (ID_klienta)
/

-- Add keys for table Zamowienia

ALTER TABLE Zamowienia ADD CONSTRAINT ZamowieniaPK PRIMARY KEY (ID_zamowienia)
/

-- Table ModeleRadiow

CREATE TABLE ModeleRadiow(
  ID_modelu Integer NOT NULL,
  Kolor Varchar2(30 ) NOT NULL,
  Wersja Varchar2(8 ) NOT NULL,
  ObslugaCD Char(1 ) NOT NULL,
  Zastosowanie Varchar2(30 ) NOT NULL
)
/

-- Add keys for table ModeleRadiow

ALTER TABLE ModeleRadiow ADD CONSTRAINT Unique_Identifier4 PRIMARY KEY (ID_modelu)
/

-- Table Modele

CREATE TABLE Modele(
  ID_modelu Integer NOT NULL,
  Nazwa Varchar2(20 ) NOT NULL,
  Rok_produkcji Date NOT NULL,
  Koszt Number(10,2)
)
/

-- Add keys for table Modele

ALTER TABLE Modele ADD CONSTRAINT ModelePK PRIMARY KEY (ID_modelu)
/

-- Table ModeleTV

CREATE TABLE ModeleTV(
  ID_modelu Integer NOT NULL,
  Przekatna Integer NOT NULL
        CONSTRAINT CheckConstraintA1 CHECK (Przekatna IN ('32','43','55','65'))
        CHECK (Przekatna IN ('32','43','55','65')),
  Rozdzielczosc Varchar2(10 ) NOT NULL,
  Zakrzywiony_ekran Char(1 ) NOT NULL,
  SmartTV Char(1 ) NOT NULL,
  Waga Float NOT NULL
)
/

-- Add keys for table ModeleTV

ALTER TABLE ModeleTV ADD CONSTRAINT Unique_Identifier3 PRIMARY KEY (ID_modelu)
/

-- Table Fabryka_Zamowienia

CREATE TABLE Fabryka_Zamowienia(
  ID_fabryki Integer NOT NULL,
  ID_zamowienia Integer NOT NULL,
  Data_zamowienia Date NOT NULL,
  Data_realizacji Date
)
/

-- Table Zamowienia_Modele

CREATE TABLE Zamowienia_Modele(
  ID_zamowienia Integer NOT NULL,
  ID_modelu Integer NOT NULL,
  Ilosc Integer NOT NULL,
  Koszt Number(10,2) NOT NULL
)
/

-- Table Adresy

CREATE TABLE Adresy(
  ID_adresu Integer NOT NULL,
  Miasto Varchar2(30 ) NOT NULL,
  Ulica Varchar2(30 ) NOT NULL,
  Numer_budynku Varchar2(5 ) NOT NULL,
  Nr_lokalu Varchar2(5 ) NOT NULL,
  ID_poczty Integer NOT NULL
)
/

-- Create indexes for table Adresy

CREATE INDEX IX_Relationship12 ON Adresy (ID_poczty)
/

-- Add keys for table Adresy

ALTER TABLE Adresy ADD CONSTRAINT PK_Adresy PRIMARY KEY (ID_adresu)
/

-- Table and Columns comments section

COMMENT ON COLUMN Adresy.ID_adresu IS 'Unikaitowy identyfikator adresu'
/
COMMENT ON COLUMN Adresy.Miasto IS 'Miasto'
/
COMMENT ON COLUMN Adresy.Ulica IS 'Nazwa ulicy'
/
COMMENT ON COLUMN Adresy.Numer_budynku IS 'Numer budynku bądź działki'
/
COMMENT ON COLUMN Adresy.Nr_lokalu IS 'Numer lokalu'
/
COMMENT ON COLUMN Adresy.ID_poczty IS 'Unikatowy identyfikator poczty FK'
/

-- Table Wlasiciele

CREATE TABLE Wlasiciele(
  ID_wlasciciela Integer NOT NULL,
  Imie Varchar2(15 ) NOT NULL,
  Nazwisko Varchar2(30 ) NOT NULL,
  ID_adresu Integer NOT NULL,
  ID_producenta Integer NOT NULL
)
/

-- Create indexes for table Wlasiciele

CREATE INDEX IX_Relationship2 ON Wlasiciele (ID_adresu)
/

CREATE INDEX IX_Relationship4 ON Wlasiciele (ID_producenta)
/

-- Add keys for table Wlasiciele

ALTER TABLE Wlasiciele ADD CONSTRAINT PK_Wlasiciele PRIMARY KEY (ID_wlasciciela)
/

-- Table Poczty

CREATE TABLE Poczty(
  ID_poczty Integer NOT NULL,
  Kod_poczty Varchar2(6 ) NOT NULL,
  Lok_poczty Varchar2(30 ) NOT NULL
)
/

-- Add keys for table Poczty

ALTER TABLE Poczty ADD CONSTRAINT PK_Poczty PRIMARY KEY (ID_poczty)
/

ALTER TABLE Poczty ADD CONSTRAINT Kod_poczty UNIQUE (Kod_poczty)
/

-- Table and Columns comments section

COMMENT ON COLUMN Poczty.Lok_poczty IS 'Lokalizacja poczty'
/

-- Table Stanowiska

CREATE TABLE Stanowiska(
  ID_stanowiska Integer NOT NULL,
  Nazwa_stanowiska Char(20 ) NOT NULL,
  Opis_stanowiska Varchar2(400 ) NOT NULL
)
/

-- Add keys for table Stanowiska

ALTER TABLE Stanowiska ADD CONSTRAINT PK_Stanowiska PRIMARY KEY (ID_stanowiska)
/

-- Table and Columns comments section

COMMENT ON COLUMN Stanowiska.ID_stanowiska IS 'Unikatowy identyfikator stanowiska'
/
COMMENT ON COLUMN Stanowiska.Nazwa_stanowiska IS 'Pełna nazwa stanowiska'
/
COMMENT ON COLUMN Stanowiska.Opis_stanowiska IS 'Opis stanowiska'
/

-- Table Wynagrodzenia

CREATE TABLE Wynagrodzenia(
  ID_wynagordzenia Integer NOT NULL,
  Data Date NOT NULL,
  Kwota_pod Number(8,2) NOT NULL,
  Kwota_dod Number(8,2),
  ID_pracownika Integer NOT NULL
)
/

-- Create indexes for table Wynagrodzenia

CREATE INDEX IX_Relationship14 ON Wynagrodzenia (ID_pracownika)
/

-- Add keys for table Wynagrodzenia

ALTER TABLE Wynagrodzenia ADD CONSTRAINT PK_Wynagrodzenia PRIMARY KEY (ID_wynagordzenia)
/

-- Table and Columns comments section

COMMENT ON COLUMN Wynagrodzenia.Data IS 'Data wypłaty wynagrodzenia'
/
COMMENT ON COLUMN Wynagrodzenia.Kwota_pod IS 'Kwota podstawowa'
/
COMMENT ON COLUMN Wynagrodzenia.Kwota_dod IS 'Kwota dodatkowa'
/

-- Table Jezyki

CREATE TABLE Jezyki(
  ID_jezyka Integer NOT NULL,
  Jezyk Varchar2(30 ) NOT NULL,
  Poziom Varchar2(2 ) NOT NULL
        CHECK (poziom IN ('A1','A2','B1','B2','C1','C2'))
)
/

-- Add keys for table Jezyki

ALTER TABLE Jezyki ADD CONSTRAINT PK_Jezyki PRIMARY KEY (ID_jezyka)
/

-- Table and Columns comments section

COMMENT ON COLUMN Jezyki.Jezyk IS 'Nazwa jezyka'
/
COMMENT ON COLUMN Jezyki.Poziom IS 'Poziom opanowanego jezyka'
/

-- Table Znajomosc_jezykow

CREATE TABLE Znajomosc_jezykow(
  ID_pracownika Integer NOT NULL,
  ID_jezyka Integer NOT NULL
)
/

-- Add keys for table Znajomosc_jezykow

ALTER TABLE Znajomosc_jezykow ADD CONSTRAINT PK_Znajomosc_jezykow PRIMARY KEY (ID_pracownika,ID_jezyka)
/

-- Trigger for sequence ProducentSeq1 for column ID_producenta in table Producent_RTV ---------
CREATE OR REPLACE TRIGGER ts_Producent_RTV_ProducentSeq1 BEFORE INSERT
ON Producent_RTV FOR EACH ROW
BEGIN
  :new.ID_producenta := ProducentSeq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Producent_RTV_ProducentSeq1 AFTER UPDATE OF ID_producenta
ON Producent_RTV FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column ID_producenta in table Producent_RTV as it uses sequence.');
END;
/

-- Trigger for sequence PracownikSeq1 for column ID_pracownika in table Pracownicy ---------
CREATE OR REPLACE TRIGGER ts_Pracownicy_PracownikSeq1 BEFORE INSERT
ON Pracownicy FOR EACH ROW
BEGIN
  :new.ID_pracownika := PracownikSeq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Pracownicy_PracownikSeq1 AFTER UPDATE OF ID_pracownika
ON Pracownicy FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column ID_pracownika in table Pracownicy as it uses sequence.');
END;
/

-- Trigger for sequence FabrykiSeq1 for column ID_fabryki in table Fabryki ---------
CREATE OR REPLACE TRIGGER ts_Fabryki_FabrykiSeq1 BEFORE INSERT
ON Fabryki FOR EACH ROW
BEGIN
  :new.ID_fabryki := FabrykiSeq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Fabryki_FabrykiSeq1 AFTER UPDATE OF ID_fabryki
ON Fabryki FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column ID_fabryki in table Fabryki as it uses sequence.');
END;
/

-- Trigger for sequence KlienciSeq1 for column ID_klienta in table Klienci ---------
CREATE OR REPLACE TRIGGER ts_Klienci_KlienciSeq1 BEFORE INSERT
ON Klienci FOR EACH ROW
BEGIN
  :new.ID_klienta := KlienciSeq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Klienci_KlienciSeq1 AFTER UPDATE OF ID_klienta
ON Klienci FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column ID_klienta in table Klienci as it uses sequence.');
END;
/

-- Trigger for sequence ZamowieniaSeq1 for column ID_zamowienia in table Zamowienia ---------
CREATE OR REPLACE TRIGGER ts_Zamowienia_ZamowieniaSeq1 BEFORE INSERT
ON Zamowienia FOR EACH ROW
BEGIN
  :new.ID_zamowienia := ZamowieniaSeq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Zamowienia_ZamowieniaSeq1 AFTER UPDATE OF ID_zamowienia
ON Zamowienia FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column ID_zamowienia in table Zamowienia as it uses sequence.');
END;
/

-- Trigger for sequence ModeleSeq1 for column ID_modelu in table Modele ---------
CREATE OR REPLACE TRIGGER ts_Modele_ModeleSeq1 BEFORE INSERT
ON Modele FOR EACH ROW
BEGIN
  :new.ID_modelu := ModeleSeq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Modele_ModeleSeq1 AFTER UPDATE OF ID_modelu
ON Modele FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column ID_modelu in table Modele as it uses sequence.');
END;
/

-- Trigger for sequence AdresySeq1 for column ID_adresu in table Adresy ---------
CREATE OR REPLACE TRIGGER ts_Adresy_AdresySeq1 BEFORE INSERT
ON Adresy FOR EACH ROW
BEGIN
  :new.ID_adresu := AdresySeq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Adresy_AdresySeq1 AFTER UPDATE OF ID_adresu
ON Adresy FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column ID_adresu in table Adresy as it uses sequence.');
END;
/

-- Trigger for sequence WlascicielSeq1 for column ID_wlasciciela in table Wlasiciele ---------
CREATE OR REPLACE TRIGGER ts_Wlasiciele_WlascicielSeq1 BEFORE INSERT
ON Wlasiciele FOR EACH ROW
BEGIN
  :new.ID_wlasciciela := WlascicielSeq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Wlasiciele_WlascicielSeq1 AFTER UPDATE OF ID_wlasciciela
ON Wlasiciele FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column ID_wlasciciela in table Wlasiciele as it uses sequence.');
END;
/

-- Trigger for sequence PocztySeq1 for column ID_poczty in table Poczty ---------
CREATE OR REPLACE TRIGGER ts_Poczty_PocztySeq1 BEFORE INSERT
ON Poczty FOR EACH ROW
BEGIN
  :new.ID_poczty := PocztySeq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Poczty_PocztySeq1 AFTER UPDATE OF ID_poczty
ON Poczty FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column ID_poczty in table Poczty as it uses sequence.');
END;
/

-- Trigger for sequence StanowiskaSeq1 for column ID_stanowiska in table Stanowiska ---------
CREATE OR REPLACE TRIGGER ts_Stanowiska_StanowiskaSeq1 BEFORE INSERT
ON Stanowiska FOR EACH ROW
BEGIN
  :new.ID_stanowiska := StanowiskaSeq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Stanowiska_StanowiskaSeq1 AFTER UPDATE OF ID_stanowiska
ON Stanowiska FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column ID_stanowiska in table Stanowiska as it uses sequence.');
END;
/

-- Trigger for sequence WynagrodzeniaSeq1 for column ID_wynagordzenia in table Wynagrodzenia ---------
CREATE OR REPLACE TRIGGER ts_Wynagrodzenia_WynagrodzeniaSeq1 BEFORE INSERT
ON Wynagrodzenia FOR EACH ROW
BEGIN
  :new.ID_wynagordzenia := WynagrodzeniaSeq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Wynagrodzenia_WynagrodzeniaSeq1 AFTER UPDATE OF ID_wynagordzenia
ON Wynagrodzenia FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column ID_wynagordzenia in table Wynagrodzenia as it uses sequence.');
END;
/

-- Trigger for sequence JezykiSeq1 for column ID_jezyka in table Jezyki ---------
CREATE OR REPLACE TRIGGER ts_Jezyki_JezykiSeq1 BEFORE INSERT
ON Jezyki FOR EACH ROW
BEGIN
  :new.ID_jezyka := JezykiSeq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Jezyki_JezykiSeq1 AFTER UPDATE OF ID_jezyka
ON Jezyki FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column ID_jezyka in table Jezyki as it uses sequence.');
END;
/


-- Create foreign keys (relationships) section ------------------------------------------------- 

ALTER TABLE Pracownicy ADD CONSTRAINT Zatrudnia FOREIGN KEY (ID_producenta) REFERENCES Producent_RTV (ID_producenta)
/



ALTER TABLE Zamowienia ADD CONSTRAINT realizuje_zamowienia FOREIGN KEY (ID_producenta) REFERENCES Producent_RTV (ID_producenta)
/



ALTER TABLE Fabryki ADD CONSTRAINT posiada_fabryki FOREIGN KEY (ID_producenta) REFERENCES Producent_RTV (ID_producenta)
/



ALTER TABLE Zamowienia ADD CONSTRAINT sklada_zamowienia FOREIGN KEY (ID_klienta) REFERENCES Klienci (ID_klienta)
/



ALTER TABLE Producent_RTV ADD CONSTRAINT Biuro_ma_adres FOREIGN KEY (ID_adresu) REFERENCES Adresy (ID_adresu)
/



ALTER TABLE Wlasiciele ADD CONSTRAINT Wlasciciel_ma_adres FOREIGN KEY (ID_adresu) REFERENCES Adresy (ID_adresu)
/



ALTER TABLE Wlasiciele ADD CONSTRAINT Biuro_ma_wlscicieli FOREIGN KEY (ID_producenta) REFERENCES Producent_RTV (ID_producenta)
/



ALTER TABLE Pracownicy ADD CONSTRAINT Pracownik_ma_adres FOREIGN KEY (ID_adresu) REFERENCES Adresy (ID_adresu)
/



ALTER TABLE Fabryki ADD CONSTRAINT Fabryka_ma_adres FOREIGN KEY (ID_adresu) REFERENCES Adresy (ID_adresu)
/



ALTER TABLE Klienci ADD CONSTRAINT Klient_ma_adres FOREIGN KEY (ID_adresu) REFERENCES Adresy (ID_adresu)
/



ALTER TABLE Adresy ADD CONSTRAINT Adres_ma_poczte FOREIGN KEY (ID_poczty) REFERENCES Poczty (ID_poczty)
/



ALTER TABLE Pracownicy ADD CONSTRAINT Pracownik_ma_stanowisko FOREIGN KEY (ID_stanowiska) REFERENCES Stanowiska (ID_stanowiska)
/



ALTER TABLE Wynagrodzenia ADD CONSTRAINT Pracownik_otrzymuje_wyngrodzenie FOREIGN KEY (ID_pracownika) REFERENCES Pracownicy (ID_pracownika)
/



ALTER TABLE Znajomosc_jezykow ADD CONSTRAINT Inzynier_zna_jezyk FOREIGN KEY (ID_pracownika) REFERENCES Inzynierzy (ID_pracownika)
/



ALTER TABLE Znajomosc_jezykow ADD CONSTRAINT Jezyk_jest_znany FOREIGN KEY (ID_jezyka) REFERENCES Jezyki (ID_jezyka)
/



ALTER TABLE Pracownicy ADD CONSTRAINT Fabryka_zatrudnia FOREIGN KEY (ID_fabryki) REFERENCES Fabryki (ID_fabryki)
/












-----INSERT data section-----

--TABLE Poczty
INSERT INTO Poczty (Kod_poczty, Lok_poczty) VALUES ('02-349','Oddział 17');
INSERT INTO Poczty (Kod_poczty, Lok_poczty) VALUES ('02-264','Oddział 3');
INSERT INTO Poczty (Kod_poczty, Lok_poczty) VALUES ('04-532','Oddział 9');
INSERT INTO Poczty (Kod_poczty, Lok_poczty) VALUES ('04-119','Oddział 11');
INSERT INTO Poczty (Kod_poczty, Lok_poczty) VALUES ('06-004','Oddział 5');
INSERT INTO Poczty (Kod_poczty, Lok_poczty) VALUES ('06-105','Oddział 6');
INSERT INTO Poczty (Kod_poczty, Lok_poczty) VALUES ('01-966','Oddział 1');
INSERT INTO Poczty (Kod_poczty, Lok_poczty) VALUES ('01-465','Oddział 8');
INSERT INTO Poczty (Kod_poczty, Lok_poczty) VALUES ('03-242','Oddział 27');
INSERT INTO Poczty (Kod_poczty, Lok_poczty) VALUES ('03-053','Oddział 42');

--TABLE Adresy
INSERT INTO Adresy (Miasto, Ulica, Numer_budynku, Nr_lokalu, ID_poczty) VALUES ('Warszawa','Polna','43','1',1);
INSERT INTO Adresy (Miasto, Ulica, Numer_budynku, Nr_lokalu, ID_poczty) VALUES ('Warszawa','Złota','11','34',2);
INSERT INTO Adresy (Miasto, Ulica, Numer_budynku, Nr_lokalu, ID_poczty) VALUES ('Warszawa','Złota','17','9',2);
INSERT INTO Adresy (Miasto, Ulica, Numer_budynku, Nr_lokalu, ID_poczty) VALUES ('Warszawa','Okopowa','221','75',3);
INSERT INTO Adresy (Miasto, Ulica, Numer_budynku, Nr_lokalu, ID_poczty) VALUES ('Warszawa','Niepodległości','109','7',4);
INSERT INTO Adresy (Miasto, Ulica, Numer_budynku, Nr_lokalu, ID_poczty) VALUES ('Warszawa','Odkryta','3C','1',3);
INSERT INTO Adresy (Miasto, Ulica, Numer_budynku, Nr_lokalu, ID_poczty) VALUES ('Warszawa','Okopowa','11','73',3);
INSERT INTO Adresy (Miasto, Ulica, Numer_budynku, Nr_lokalu, ID_poczty) VALUES ('Warszawa','Okopowa','22','76',3);
INSERT INTO Adresy (Miasto, Ulica, Numer_budynku, Nr_lokalu, ID_poczty) VALUES ('Bytom','Bema','2','4',5);
INSERT INTO Adresy (Miasto, Ulica, Numer_budynku, Nr_lokalu, ID_poczty) VALUES ('Bytom','Kraka','3','4',5);
INSERT INTO Adresy (Miasto, Ulica, Numer_budynku, Nr_lokalu, ID_poczty) VALUES ('Bytom','Kraka','15','2',5);
INSERT INTO Adresy (Miasto, Ulica, Numer_budynku, Nr_lokalu, ID_poczty) VALUES ('Bytom','Burakowska','1','9',6);
INSERT INTO Adresy (Miasto, Ulica, Numer_budynku, Nr_lokalu, ID_poczty) VALUES ('Gdańsk','Chmielna','15','90',7);
INSERT INTO Adresy (Miasto, Ulica, Numer_budynku, Nr_lokalu, ID_poczty) VALUES ('Piła','Kondratowicza','11','34',8);
INSERT INTO Adresy (Miasto, Ulica, Numer_budynku, Nr_lokalu, ID_poczty) VALUES ('Opole','Jana Pawła II','43','66',9);
INSERT INTO Adresy (Miasto, Ulica, Numer_budynku, Nr_lokalu, ID_poczty) VALUES ('Katowice','Helmowego Jaru','4','1',10);


--TABLE PRODUCENT_RTV
INSERT INTO Producent_RTV (Nazwa, Data_zalozenia,NIP, REGON, ID_adresu) VALUES('TELERADIO',TO_DATE('17/12/2015', 'DD/MM/YYYY'),'7251801126','472836141',1);

--TABLE WLASCICIELE
INSERT INTO Wlasiciele (Imie,Nazwisko,ID_adresu,ID_producenta) VALUES ('Mateusz','Pawlowski',2,1);
INSERT INTO Wlasiciele (Imie,Nazwisko,ID_adresu,ID_producenta) VALUES ('Maciej','Kalinowski',3,1);
INSERT INTO Wlasiciele (Imie,Nazwisko,ID_adresu,ID_producenta) VALUES ('Melchior','Dzbanowicz',4,1);

--TABLE Fabryki
INSERT INTO Fabryki (Specjalizacja,Powierzchnia,Nr_ubezpieczenia,ID_producenta,ID_adresu) VALUES ('TV',1.5,111222333,1,11);
INSERT INTO Fabryki (Specjalizacja,Powierzchnia,Nr_ubezpieczenia,ID_producenta,ID_adresu) VALUES ('R',3,111222444,1,12);
INSERT INTO Fabryki (Specjalizacja,Powierzchnia,Nr_ubezpieczenia,ID_producenta,ID_adresu) VALUES ('R/TV',9.9,111222555,1,13);


--TABLE Stanowiska
INSERT INTO Stanowiska (Nazwa_stanowiska, Opis_stanowiska) VALUES ('Ml. specjalista','Początkujące stanowisko inżynierskie, wykonuje proste prace manualne i dokumentacyjne');
INSERT INTO Stanowiska (Nazwa_stanowiska, Opis_stanowiska) VALUES ('Specjalista','Regularny pracownik, wykonuje większość prac w fabryce');
INSERT INTO Stanowiska (Nazwa_stanowiska, Opis_stanowiska) VALUES ('St. Specjalista','Zaawansowany i doświadczony pracownik, poza pracami jest włączony w procesy tworzenia i wymyślania rozwiązań');
INSERT INTO Stanowiska (Nazwa_stanowiska, Opis_stanowiska) VALUES ('Specjalista ds adm.','Pracownik biurowy, zajmuje się obsługą pism, zgłoszeń, zamówień, zwrotów itp');
INSERT INTO Stanowiska (Nazwa_stanowiska, Opis_stanowiska) VALUES ('Księgowy/wa','Pracownik zajmujący się finansami przedsiębiorstwa, wypłatami, budżetem');
INSERT INTO Stanowiska (Nazwa_stanowiska, Opis_stanowiska) VALUES ('Dyrektor Fabryki','Kierownik fabryki, zarządza placówką, jej utrzymaniem, odpowiada za bezpieczeństwo pracowników i rekrutacje');


--TABLE Pracownicy
INSERT INTO Pracownicy (Imie,Nazwisko,Data_urodzenia,Data_zatrudnienia,PESEL,Plec,Nr_konta,ID_producenta,ID_adresu,ID_stanowiska,ID_fabryki) 
	VALUES ('Adam','Abacki',TO_DATE('01/12/1978', 'DD/MM/YYYY'),TO_DATE('14/04/2002', 'DD/MM/YYYY'),78120158311,'M',2245861349257485425524123625,1,5,3,2);
INSERT INTO Pracownicy (Imie,Nazwisko,Data_urodzenia,Data_zatrudnienia,PESEL,Plec,Nr_konta,ID_producenta,ID_adresu,ID_stanowiska,ID_fabryki)	
	VALUES ('Bartosz','Babacki',TO_DATE('05/10/1985', 'DD/MM/YYYY'),TO_DATE('08/08/2010', 'DD/MM/YYYY'),85100585421,'M',46521385429564287546241524,1,6,1,2);
INSERT INTO Pracownicy (Imie,Nazwisko,Data_urodzenia,Data_zatrudnienia,PESEL,Plec,Nr_konta,ID_producenta,ID_adresu,ID_stanowiska,ID_fabryki)	
	VALUES ('Cezary','Cabacki',TO_DATE('20/05/1980', 'DD/MM/YYYY'),TO_DATE('25/07/2006', 'DD/MM/YYYY'),80052077658,'M',99653212454675958642351245,1,7,3,1);
INSERT INTO Pracownicy (Imie,Nazwisko,Data_urodzenia,Data_zatrudnienia,PESEL,Plec,Nr_konta,ID_producenta,ID_adresu,ID_stanowiska,ID_fabryki)
	VALUES ('Dorota','Dabacka',TO_DATE('15/02/1995', 'DD/MM/YYYY'),TO_DATE('05/03/2019', 'DD/MM/YYYY'),95021577896,'K',3265326532653265326532653265,1,8,1,1);
INSERT INTO Pracownicy (Imie,Nazwisko,Data_urodzenia,Data_zatrudnienia,PESEL,Plec,Nr_konta,ID_producenta,ID_adresu,ID_stanowiska,ID_fabryki)
	VALUES ('Elżbieta','Eabacka',TO_DATE('09/06/1970', 'DD/MM/YYYY'),TO_DATE('14/03/1993', 'DD/MM/YYYY'),70060911423,'K',778899665544112233665544888,1,9,4,3);
INSERT INTO Pracownicy (Imie,Nazwisko,Data_urodzenia,Data_zatrudnienia,PESEL,Plec,Nr_konta,ID_producenta,ID_adresu,ID_stanowiska,ID_fabryki)
	VALUES ('Filip','Fabacki',TO_DATE('11/09/1990', 'DD/MM/YYYY'),TO_DATE('04/12/2016', 'DD/MM/YYYY'),90091144563,'M',85296385296385296385296345,1,10,4,3);

--TABLE Inzynierzy
INSERT INTO Inzynierzy (ID_pracownika,Nr_uprawnien,Data_BHP,Nr_ubezpieczenia_NNW) VALUES (1,'123X',TO_DATE('14/05/2021', 'DD/MM/YYYY'),111112222233333);
INSERT INTO Inzynierzy (ID_pracownika,Nr_uprawnien,Data_BHP,Nr_ubezpieczenia_NNW) VALUES (2,'456Y',TO_DATE('15/05/2021', 'DD/MM/YYYY'),222223333344444);
INSERT INTO Inzynierzy (ID_pracownika,Nr_uprawnien,Data_BHP,Nr_ubezpieczenia_NNW) VALUES (3,'789Z',TO_DATE('16/05/2021', 'DD/MM/YYYY'),555556666677777);

	
--TABLE Pracownicy_Administracyjni
INSERT INTO Pracownicy_Administracyjni (ID_pracownika,Data_badania,Wyksztalcenie_administracyjne,Nr_legitymacji) VALUES (4,TO_DATE('05/03/2019', 'DD/MM/YYYY'),'T','AvdtvDDe');
INSERT INTO Pracownicy_Administracyjni (ID_pracownika,Data_badania,Wyksztalcenie_administracyjne,Nr_legitymacji) VALUES (5,TO_DATE('14/03/2003', 'DD/MM/YYYY'),'T','BTTDVsdt');
INSERT INTO Pracownicy_Administracyjni (ID_pracownika,Data_badania,Wyksztalcenie_administracyjne,Nr_legitymacji) VALUES (6,TO_DATE('04/12/2016', 'DD/MM/YYYY'),'N','ASDFRTSd');	

--TABLE Wynagrodzenia
INSERT INTO Wynagrodzenia (Data,Kwota_pod,Kwota_dod,ID_pracownika) VALUES (TO_DATE('10/03/2020', 'DD/MM/YYYY'),10000.00,null,3);
INSERT INTO Wynagrodzenia (Data,Kwota_pod,Kwota_dod,ID_pracownika) VALUES (TO_DATE('10/03/2020', 'DD/MM/YYYY'),7000.00,null,1);
INSERT INTO Wynagrodzenia (Data,Kwota_pod,Kwota_dod,ID_pracownika) VALUES (TO_DATE('10/03/2020', 'DD/MM/YYYY'),8500.00,null,2);
INSERT INTO Wynagrodzenia (Data,Kwota_pod,Kwota_dod,ID_pracownika) VALUES (TO_DATE('10/03/2020', 'DD/MM/YYYY'),6000.00,350.50,4);
INSERT INTO Wynagrodzenia (Data,Kwota_pod,Kwota_dod,ID_pracownika) VALUES (TO_DATE('10/03/2020', 'DD/MM/YYYY'),6800.00,null,5);
INSERT INTO Wynagrodzenia (Data,Kwota_pod,Kwota_dod,ID_pracownika) VALUES (TO_DATE('10/03/2020', 'DD/MM/YYYY'),4200.00,200.00,6);



--TABLE Jezyki
INSERT INTO Jezyki (Jezyk, Poziom) VALUES ('Angielski','A1');
INSERT INTO Jezyki (Jezyk, Poziom) VALUES ('Angielski','A2');
INSERT INTO Jezyki (Jezyk, Poziom) VALUES ('Angielski','B1');
INSERT INTO Jezyki (Jezyk, Poziom) VALUES ('Angielski','B2');
INSERT INTO Jezyki (Jezyk, Poziom) VALUES ('Angielski','C1');
INSERT INTO Jezyki (Jezyk, Poziom) VALUES ('Angielski','C2');
INSERT INTO Jezyki (Jezyk, Poziom) VALUES ('Niemiecki','A1');
INSERT INTO Jezyki (Jezyk, Poziom) VALUES ('Niemiecki','A2');
INSERT INTO Jezyki (Jezyk, Poziom) VALUES ('Niemiecki','B1');
INSERT INTO Jezyki (Jezyk, Poziom) VALUES ('Niemiecki','B2');
INSERT INTO Jezyki (Jezyk, Poziom) VALUES ('Niemiecki','C1');
INSERT INTO Jezyki (Jezyk, Poziom) VALUES ('Niemiecki','C2');

--TABLE ZNAJOMOSC_JEZYKOW
INSERT INTO Znajomosc_jezykow (ID_pracownika, ID_jezyka) VALUES (1,1);
INSERT INTO Znajomosc_jezykow (ID_pracownika, ID_jezyka) VALUES (2,2);
INSERT INTO Znajomosc_jezykow (ID_pracownika, ID_jezyka) VALUES (3,3);




--TABLE Klienci
INSERT INTO Klienci (Imie, Nazwisko, NazwaFirmy, KartaStalegoKlienta, DataRejestracji, ID_adresu) VALUES ('Donald','Tusk','RPO','N',TO_DATE('17/11/2020', 'DD/MM/YYYY'),7);
INSERT INTO Klienci (Imie, Nazwisko, NazwaFirmy, KartaStalegoKlienta, DataRejestracji, ID_adresu) VALUES ('Mateusz','Morawiecki','KPRM','T',TO_DATE('28/07/2019', 'DD/MM/YYYY'),2);
INSERT INTO Klienci (Imie, Nazwisko, NazwaFirmy, KartaStalegoKlienta, DataRejestracji, ID_adresu) VALUES ('Andrzej','Duda','KPRP','N',TO_DATE('04/02/2020', 'DD/MM/YYYY'),4);
INSERT INTO Klienci (Imie, Nazwisko, NazwaFirmy, KartaStalegoKlienta, DataRejestracji, ID_adresu) VALUES ('Agata','Christi',null,'N',TO_DATE('12/06/2009', 'DD/MM/YYYY'),9);
INSERT INTO Klienci (Imie, Nazwisko, NazwaFirmy, KartaStalegoKlienta, DataRejestracji, ID_adresu) VALUES ('Olga','Tokarczuk','GetNobel s.a.','N',TO_DATE('22/01/2012', 'DD/MM/YYYY'),3);



--TABLE Zamowienia
INSERT INTO Zamowienia (Data_zamowienia,Data_realizacji,Faktura,ID_producenta,ID_klienta) VALUES (TO_DATE('12/12/2019', 'DD/MM/YYYY'),null,'T',1,1);
INSERT INTO Zamowienia (Data_zamowienia,Data_realizacji,Faktura,ID_producenta,ID_klienta)
    VALUES (TO_DATE('12/12/2019', 'DD/MM/YYYY'),TO_DATE('15/12/2019', 'DD/MM/YYYY'),'N',1,2);
INSERT INTO Zamowienia (Data_zamowienia,Data_realizacji,Faktura,ID_producenta,ID_klienta) 
    VALUES (TO_DATE('5/03/2019', 'DD/MM/YYYY'),TO_DATE('4/03/2019', 'DD/MM/YYYY'),'T',1,3);
INSERT INTO Zamowienia (Data_zamowienia,Data_realizacji,Faktura,ID_producenta,ID_klienta) 
    VALUES (TO_DATE('02/02/2018', 'DD/MM/YYYY'),TO_DATE('04/02/2018', 'DD/MM/YYYY'),'N',1,4);
INSERT INTO Zamowienia (Data_zamowienia,Data_realizacji,Faktura,ID_producenta,ID_klienta)
    VALUES (TO_DATE('12/12/2018', 'DD/MM/YYYY'),TO_DATE('15/12/2018', 'DD/MM/YYYY'),'T',1,2);    

--TABLE Fabryka_zamowienia
INSERT INTO Fabryka_Zamowienia (ID_fabryki,ID_zamowienia,Data_zamowienia,Data_realizacji) VALUES (1,1,TO_DATE('13/05/2019', 'DD/MM/YYYY'),null);
INSERT INTO Fabryka_Zamowienia (ID_fabryki,ID_zamowienia,Data_zamowienia,Data_realizacji) VALUES (2,2,TO_DATE('17/06/2019', 'DD/MM/YYYY'),TO_DATE('16/07/2019', 'DD/MM/YYYY'));
INSERT INTO Fabryka_Zamowienia (ID_fabryki,ID_zamowienia,Data_zamowienia,Data_realizacji) VALUES (3,3,TO_DATE('18/04/2019', 'DD/MM/YYYY'),TO_DATE('22/04/2019', 'DD/MM/YYYY'));
INSERT INTO Fabryka_Zamowienia (ID_fabryki,ID_zamowienia,Data_zamowienia,Data_realizacji) VALUES (1,4,TO_DATE('01/02/2019', 'DD/MM/YYYY'),TO_DATE('04/03/2019', 'DD/MM/YYYY'));



--TABLE Modele
INSERT INTO Modele (Nazwa, Rok_produkcji, Koszt) VALUES ('Samsunk Galaxy S217',TO_DATE('2020','YYYY'),1200.00);
INSERT INTO Modele (Nazwa, Rok_produkcji, Koszt) VALUES ('Odbiornik FM2.137',TO_DATE('2005','YYYY'),null);
INSERT INTO Modele (Nazwa, Rok_produkcji, Koszt) VALUES ('Odbiornik AM5x12',TO_DATE('2016','YYYY'),635.90);
INSERT INTO Modele (Nazwa, Rok_produkcji, Koszt) VALUES ('Sony DJ21',TO_DATE('2011','YYYY'),199.99);
INSERT INTO Modele (Nazwa, Rok_produkcji, Koszt) VALUES ('Radio LUX R4',TO_DATE('2017','YYYY'),214.99);
INSERT INTO Modele (Nazwa, Rok_produkcji, Koszt) VALUES ('SmartTV QLED A2',TO_DATE('2020','YYYY'),2340.00);
INSERT INTO Modele (Nazwa, Rok_produkcji, Koszt) VALUES ('SmartTV QLED C3',TO_DATE('2018','YYYY'),1600.00);



--TABLE ModeleRadiow
INSERT INTO ModeleRadiow (ID_modelu,Kolor,Wersja,ObslugaCD,Zastosowanie) VALUES (2,'Czarny','1','N','Samochodowe');
INSERT INTO ModeleRadiow (ID_modelu,Kolor,Wersja,ObslugaCD,Zastosowanie) VALUES (5,'Bialy','2','T','Domowe');

--TABLE ModeleTV
INSERT INTO ModeleTV (ID_modelu,Przekatna,Rozdzielczosc,Zakrzywiony_ekran,SmartTV,Waga) VALUES (6,'55','1920x1080','N','T',5.5);
INSERT INTO ModeleTV (ID_modelu,Przekatna,Rozdzielczosc,Zakrzywiony_ekran,SmartTV,Waga) VALUES (7,'65','3840x2160','T','T',19.5);
INSERT INTO ModeleTV (ID_modelu,Przekatna,Rozdzielczosc,Zakrzywiony_ekran,SmartTV,Waga) VALUES (1,'43','1280x720','N','N',3.5);


--TABLE Zamowienia_modele
INSERT INTO Zamowienia_Modele (ID_zamowienia,ID_modelu,Ilosc,Koszt) VALUES (1,1,2,'150');
INSERT INTO Zamowienia_Modele (ID_zamowienia,ID_modelu,Ilosc,Koszt) VALUES (2,2,1,'1000');
INSERT INTO Zamowienia_Modele (ID_zamowienia,ID_modelu,Ilosc,Koszt) VALUES (3,3,2,'190');
INSERT INTO Zamowienia_Modele (ID_zamowienia,ID_modelu,Ilosc,Koszt) VALUES (4,4,1,'220');





