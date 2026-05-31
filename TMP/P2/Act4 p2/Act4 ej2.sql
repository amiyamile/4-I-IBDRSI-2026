-- Yamile Isabela Montaño Hernandez --

-- Promedio de ventas mensuales

CREATE TABLE Amily.Ventas (
    Id_Orden INT AUTO_INCREMENT,
    Id_Cliente INT,
    Fecha VARCHAR(50),
    Total DECIMAL(10,2),
    Estado VARCHAR(50),
    PRIMARY KEY (Id_Orden)
);

INSERT INTO Amily.Ventas (Id_Cliente,Fecha,Total,Estado) VALUES
(1001, '01/01/2025', 100.00, 'JAL'),
(1001, '01/01/2025', 150.00, 'JAL'),
(1001, '01/01/2025', 75.00, 'JAL'),
(1001, '02/01/2025', 100.00, 'JAL'),
(1001, '03/01/2025', 100.00, 'JAL'),
(2002, '02/01/2025', 75.00, 'JAL'),
(2002, '02/01/2025', 150.00, 'JAL'),
(3003, '01/01/2025', 100.00, 'CDMX'),
(3003, '02/01/2025', 100.00, 'CDMX'),
(3003, '03/01/2025', 100.00, 'CDMX'),
(4004, '04/01/2025', 100.00, 'CDMX'),
(4004, '05/01/2025', 50.00, 'CDMX'),
(4004, '05/01/2025', 100.00, 'CDMX');

SELECT Estado FROM Amily.Ventas WHERE Total > 100;

