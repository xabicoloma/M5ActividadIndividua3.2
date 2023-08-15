CREATE DATABASE usuarios;
USE usuarios;

CREATE TABLE usuarios_inactivos(
	id INT auto_increment primary key,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    correo_electronico VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    genero VARCHAR(1) NOT NULL
);

CREATE TABLE usuarios_especiales(
	id INT auto_increment primary key,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    correo_electronico VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    genero VARCHAR(1) NOT NULL
);

INSERT INTO usuarios_inactivos VALUES
	(Default, 'Laura', 'Pérez', 'lauraperez@example.com', '543210987', 'F'),
	(Default, 'Luis', 'Sánchez', 'luissanchez@example.com', '432109876', 'M'),
	(Default, 'Elena', 'Ramírez', 'elenaramirez@example.com', '321098765', 'F'),
	(Default, 'Javier', 'López', 'javierlopez@example.com', '210987654', 'M'),
	(Default, 'Sofía', 'Hernández', 'sofiahernandez@example.com', '109876543', 'F');

START TRANSACTION;
	SET autocommit = FALSE;
    INSERT INTO usuarios_especiales (nombre, apellido, correo_electronico, telefono, genero)
	SELECT nombre, apellido, correo_electronico, telefono, genero
	FROM usuarios_inactivos
	WHERE id IN (3, 4, 5);
    
    DELETE FROM usuarios_inactivos
	WHERE id IN (3, 4, 5);

COMMIT;
    INSERT INTO usuarios_inactivos (nombre, apellido, correo_electronico, telefono, genero)
	SELECT nombre, apellido, correo_electronico, telefono, genero
	FROM usuarios_especiales
	WHERE id = 3;
    
    DELETE FROM usuarios_especiales
	WHERE id = 3;
ROLLBACK;