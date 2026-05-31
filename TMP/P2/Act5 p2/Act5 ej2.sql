-- Yamile Isabela Montaño Hernandez
--- Concatenación de grupos

CREATE TABLE Masi.Concatenación (
    Secuencia INT PRIMARY KEY,
    Sintaxis VARCHAR(100)
);

INSERT INTO Masi.Concatenación (Secuencia, Sintaxis) VALUES
(1, 'SELECT'),
(2, 'Producto,'),
(3, 'Precio,'),
(4, 'Disponibilidad'),
(5, 'FROM'),
(6, 'Productos'),
(7, 'WHERE'),
(8, 'Precio'),
(9, '>100');

SELECT GROUP_CONCAT(Sintaxis ORDER BY Secuencia SEPARATOR ' ') AS ConsultaSQL
FROM Masi.Concatenación;
