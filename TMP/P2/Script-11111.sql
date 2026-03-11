-- Yamile Isabela Montaño Hernandez --

CREATE TABLE Yamiledb.Empleados (
    Id_empleado INT PRIMARY KEY,
    Id_gerente INT,
    Puesto VARCHAR(50)
);

INSERT INTO Yamiledb.Empleados VALUES
(1001, NULL, 'Presidente'),
(2002, 1001, 'Director'),
(3003, 1001, 'Gerente'),
(4004, 2002, 'Ingeniero'),
(5005, 2002, 'Contador'),
(6006, 2002, 'Administrador');

WITH RECURSIVE Organigrama AS (
    SELECT Id_empleado, Id_gerente, Puesto, 0 AS Nivel
    FROM Yamiledb.Empleados
    WHERE Id_gerente IS NULL
    UNION ALL
    SELECT e.Id_empleado, e.Id_gerente, e.Puesto, o.Nivel + 1
    FROM Yamiledb.Empleados e
    INNER JOIN Organigrama o ON e.Id_gerente = o.Id_empleado
)
SELECT * FROM Organigrama;