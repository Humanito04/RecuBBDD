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
CONSTRAINT fk_reserva_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id)

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
	dia_final DATE
);

DESCRIBE torneo;

CREATE TABLE clases(
	id INT PRIMARY KEY AUTO_INCREMENT,
	dia_semana VARCHAR(20),
	horas_disponibles VARCHAR(20),
	duracion VARCHAR(10),
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
("Danny Camargo", "dncamargo@gmail.com", "627690555");

SELECT * FROM persona;

DESCRIBE cliente;

INSERT INTO cliente(id,fecha_inscripcion,cuota,num_clases) VALUES
(1,"2023-05-28",40.00,120),
(2,"2022-01-02",80.00,254),
(3,"2021-08-12",120.00,600),
(4,"2020-12-01",60.00,369),
(5,"2022-02-25",70.00,125),
(6,"2023-04-10",50.00,45);


SELECT * FROM cliente;

DESCRIBE entrenador;


INSERT INTO entrenador(id,num_alumnos,fecha_incorporacion, sueldo) VALUES
(7, 200, "2014-06-14", 2100.00);


SELECT * FROM entrenador;


DESCRIBE pista;


INSERT INTO pista(tipo_pista, horas_disponibles) VALUES
("Cristal", "09:00 -> 23:30"),
("Cristal", "11:00 -> 21:00"),
("Muro", "09:00 -> 23:30"),
("Muro", "09:00 -> 23:00"),
("Muro", "09:00 -> 23:30"),
("Cristal", "09:00 -> 23:30"),
("Cristal", "09:00 -> 23:30"),
("Cristal", "09:00 -> 23:30"),
("Cristal", "09:00 -> 23:30"),
("Cristal", "09:00 -> 23:30");

SELECT * FROM pista;

DESCRIBE reserva;

INSERT INTO reserva(id_pista,id_cliente, fecha_reserva) VALUES
(1,5,"2024-06-13"),
(2,4,"2024-06-10"),
(3,2,"2024-06-11");