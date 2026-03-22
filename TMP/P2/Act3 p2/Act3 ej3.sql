-- Yamile Isabela Montaño Hernandez --

--Seg. inv--

CREATE TABLE Amily.Inventario (
    Fecha VARCHAR (20),
	Ajuste VARCHAR(50),
    PRIMARY KEY (Fecha, Ajuste)
);

INSERT INTO Amily.Inventario (Fecha,Ajuste) VALUES
('03/01/2025', '100'),
('04/01/2025', '75'),
('05/01/2025', '-150'),
('06/01/2025', '50'),
('07/01/2025', '-70');

SELECT 
    Fecha,
    CAST(Ajuste AS SIGNED) AS Ajuste,
    SUM(CAST(Ajuste AS SIGNED)) OVER (
        ORDER BY STR_TO_DATE(Fecha, '%d/%m/%Y')
    ) AS Inventario
FROM Amily.Inventario
ORDER BY STR_TO_DATE(Fecha, '%d/%m/%Y');