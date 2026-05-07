-- Yamile Isabela Montaño Hernandez
-- Registross de procesos indeterminados

CREATE TABLE Masi.Procesos (
    Flujo VARCHAR(50),
    Paso INT,
    Estado VARCHAR(20),
    PRIMARY KEY (Flujo, Paso)
);


INSERT INTO Masi.Procesos (Flujo, Paso, Estado) VALUES
('Alpha', 1, 'Error'),
('Alpha', 2, 'Finalizado'),
('Alpha', 3, 'Corriendo'),
('Bravo', 1, 'Finalizado'),
('Bravo', 2, 'Finalizado'),
('Charlie', 1, 'Corriendo'),
('Charlie', 2, 'Corriendo'),
('Delta', 1, 'Error'),
('Delta', 2, 'Error'),
('Echo', 1, 'Corriendo'),
('Echo', 2, 'Finalizado');

SELECT Flujo,
       CASE
           WHEN COUNT(DISTINCT Estado) = 1 THEN MAX(Estado)
           WHEN SUM(CASE WHEN Estado = 'Error' THEN 1 ELSE 0 END) > 0
                AND SUM(CASE WHEN Estado IN ('Finalizado','Corriendo') THEN 1 ELSE 0 END) > 0
                THEN 'Indeterminado'
           WHEN SUM(CASE WHEN Estado = 'Finalizado' THEN 1 ELSE 0 END) > 0
                AND SUM(CASE WHEN Estado = 'Corriendo' THEN 1 ELSE 0 END) > 0
                THEN 'Corriendo'
       END AS EstadoGeneral
FROM Masi.Procesos
GROUP BY Flujo;