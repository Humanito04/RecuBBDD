DROP DATABASE IF EXISTS siting;
CREATE DATABASE siting;
USE siting;

CREATE TABLE persona(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre_completo VARCHAR(100),
	email VARCHAR(50),
	telefono CHAR(9)
);

DESCRIBE persona;


CREATE TABLE entrenador(
	id INT PRIMARY KEY,
    num_alumnos INT,
    fecha_incorporacion DATE,
    sueldo DECIMAL(6,2),

CONSTRAINT fk_entrenador FOREIGN KEY (id) REFERENCES persona(id)
);

DESCRIBE entrenador;

CREATE TABLE cliente(
	id INT PRIMARY KEY,
    fecha_inscripcion DATE,
    cuota DECIMAL(6,2),
    num_clases INT,
    

CONSTRAINT fk_cliente FOREIGN KEY (id) REFERENCES persona(id)
);


DESCRIBE cliente;

CREATE TABLE pista(
	id INT PRIMARY KEY AUTO_INCREMENT,
	tipo_pista VARCHAR(20),
	horas_disponibles VARCHAR(20)
);

DESCRIBE pista;

CREATE TABLE reserva(
	id_pista INT ,
	id_cliente INT,
	fecha_reserva DATE,

CONSTRAINT pk_reserva PRIMARY KEY(id_pista,id_cliente,fecha_reserva),
CONSTRAINT fk_reserva_pista FOREIGN KEY (id_pista) REFERENCES pista(id),
CONSTRAINT fk_reserva_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id) ON UPDATE CASCADE

);


DESCRIBE reserva;


CREATE TABLE club(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50),
	direccion VARCHAR(100),
	num_pistas INT
);

DESCRIBE club;	


CREATE TABLE torneo(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(100),
	num_jugadores INT,
	dia_inicio DATE, 
	dia_final DATE,
    id_club INT,
    
CONSTRAINT fk_torneo_club FOREIGN KEY (id_club) REFERENCES club(id)
);

DESCRIBE torneo;

CREATE TABLE clases(
	id INT PRIMARY KEY AUTO_INCREMENT,
	dia_semana VARCHAR(20),
	horas_disponibles VARCHAR(20),
	duracion_clase VARCHAR(10),
	id_entrenador INT,

CONSTRAINT pk_clase_entrenador FOREIGN KEY (id_entrenador) REFERENCES entrenador(id)
);

DESCRIBE clases;

DESCRIBE persona;
INSERT INTO persona(nombre_completo, email, telefono) VALUES
("Pablo Humanes Gandul", "pablohumanesgandul04@gmail.com", "730831832"),
("Galo Casal Álvarez", "gcasalvez@gmail.com", "653550293"),
("Javier Martínez Gonzalez", "javimarti@gmail.com", "785638343"),
("Ángel Chamorro", "agchamorro@gmail.com", "673179059"),
("Álvaro Rubira", "avrubira@gmail.com", "685235720"),
("Maria Guillen Mateos", "mguillenmateos@gmail.com", "610979237"),
("Danny Camargo", "dncamargo@gmail.com", "627690555"),
("Carlos Pérez García", "cperez@gmail.com", "612345678"),
("Ana López Hernández", "alopez@gmail.com", "622345678"),
("Luis Martín Ruiz", "lmartin@gmail.com", "632345678"),
("Elena Sánchez Torres", "esanchez@gmail.com", "642345678"),
("Miguel Fernández Díaz", "mfernandez@gmail.com", "652345678");

SELECT * FROM persona;

DESCRIBE cliente;

INSERT INTO cliente(id,fecha_inscripcion,cuota,num_clases) VALUES
(1,"2023-05-28",40.00,120),
(2,"2022-01-02",80.00,254),
(3,"2021-08-12",120.00,600),
(4,"2020-12-01",60.00,369),
(5,"2022-02-25",70.00,125),
(6,"2023-04-10",50.00,45),
(8, "2023-06-15", 55.00, 100),
(9, "2023-07-01", 65.00, 150),
(10, "2023-07-15", 75.00, 200),
(12, "2023-08-15", 95.00, 300);



SELECT * FROM cliente;

DESCRIBE entrenador;


INSERT INTO entrenador(id,num_alumnos,fecha_incorporacion, sueldo) VALUES
(7, 200, "2014-06-14", 2100.00),
(11, 120, "2019-04-25", 1800.00);


SELECT * FROM entrenador;


DESCRIBE pista;


INSERT INTO pista(tipo_pista, horas_disponibles) VALUES
("Cristal", "09:00/10:30"),
("Cristal", "11:00/12:30"),
("Muro", "08:00/09:30"),
("Muro", "09:00/10:30"),
("Muro", "09:30/11:00"),
("Cristal", "13:00/14:30"),
("Cristal", "18:00/19:30"),
("Cristal", "08:00/09:30"),
("Cristal", "19:00/20:30"),
("Cristal", "22:00/23:30");

SELECT * FROM pista;

DESCRIBE reserva;

INSERT INTO reserva(id_pista,id_cliente, fecha_reserva) VALUES
(1,5,"2024-06-13"),
(2,4,"2024-06-10"),
(3,2,"2024-06-11"),
(4, 10, "2024-06-17"),
(5, 12, "2024-06-18");


SELECT * FROM reserva;

DESCRIBE club;
INSERT INTO club(nombre,direccion,num_pistas) VALUES 
("Siting Padel Club","C. de la Red Diecisiete,26",10),
("Club Deportivo El Bosque", "Camino Verde 5", 6);

SELECT * FROM club;


INSERT INTO torneo(nombre, num_jugadores, dia_inicio, dia_final, id_club) VALUES
("Torneo Primavera", 16, "2024-04-01", "2024-04-15",1),
("Torneo Verano", 32, "2024-07-01", "2024-07-30",2);


SELECT * FROM torneo;

INSERT INTO clases(dia_semana, horas_disponibles, duracion_clase, id_entrenador) VALUES
("Lunes", "09:00 -> 23:00", "1h", 7),
("Martes", "10:00 -> 22:00", "1h", 7),
("Miércoles", "09:00 -> 22:00", "1h", 7),
("Jueves", "10:00 -> 23:00", "1h", 7),
("Lunes", "09:00 -> 23:00", "1h", 11),
("Martes", "10:00 -> 22:00", "1h", 11),
("Miércoles", "09:00 -> 22:00", "1h", 11),
("Jueves", "10:00 -> 23:00", "1h", 11);

SELECT * FROM clases;



