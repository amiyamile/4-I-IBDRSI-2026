/* 
Implementacion de una base de datos en un sistema de informacion
2026/03/04 4-I
Juan Antonio Ortega Sandoval
Nombre de la practica
*/

CREATE TABLE Yamiledb.departamentos (
  id int NOT NULL,
  name varchar(25) NOT NULL,
  location date NOT NULL,
  PRIMARY KEY (id, name)
);

CREATE TABLE Yamiledb.empleados (
  id INT NOT NULL PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  edad INT NOT NULL,
  salario DECIMAL(10,2) NOT NULL
);

INSERT INTO Yamiledb.empleados (id, nombre, edad, salario) VALUES
(1, 'Linkin Park', 22, 12000.50),
(2, 'Danna Paola', 45, 52000.00),
(3, 'Roberto Gomez', 28, 19000.75),
(4, 'José José', 35, 28000.00),
(5, 'Luis Miguel', 40, 27000.25);

ALTER TABLE Yamiledb.empleados ADD departamento VARCHAR(50);

ALTER TABLE Yamiledb.empleados MODIFY COLUMN salario INT;

ALTER TABLE Yamiledb.empleados DROP COLUMN departamento;

DROP TABLE Yamiledb.departamentos;

DELETE FROM Yamiledb.empleados;

RENAME TABLE Yamiledb.empleados TO Yamiledb.staff;

ALTER TABLE Yamiledb.staff ALTER COLUMN salario SET DEFAULT 0;

CREATE SCHEMA rh_db;

RENAME TABLE Yamiledb.staff TO rh_db.staff;

-- Crear una tabla llamaba "empleados" con las columnas  id, nombre, edad, and salario.AAAAA

-- Insertar 5 registros en la tabla "empleados".AAAAAAAAA

-- Agregar una nueva columna "departamento" a la tabla "empleados".AAAAAA

-- Cambiar el tipo de dato de la columna "salario" a Integer.AAAAAAA

-- Eliminar la columna "departamento de la tabla "empleados".AAAAAAAAA

-- Eliminar la tabla "departamentos" permanentemente.AAAAAAAAAA

-- Eliminar todos los registros de la tabla "empleados" pero mantener la tabla.AAAAAAAA

-- Renombrar la tabla "empleados" a "staff".AAAAAA

-- Definir 0 como valor predeterminado en la comlumna "salario".

-- Crear un nuevo esquema llamado "rh_db".

-- Mover la tabla "empleados" al esquema "rh_db".

-- Yamile Isabela Montaño Hernandez 4-i 04/03/26
