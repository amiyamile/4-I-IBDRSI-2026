-- Yamile Isabela Montaño Hernandez --

-- Etapas de desarrollo

CREATE TABLE Yamiledb.Desarrollo (
    Desarrollo VARCHAR(50),
    Etapa INT, 
    Finalizado VARCHAR (20),
    PRIMARY KEY (Desarrollo, Etapa)
);

INSERT INTO Yamiledb.Desarrollo (Desarrollo,Etapa,Finalizado) VALUES 
('RestAPI', 1, '2024-02-01'),
('RestAPI', 2, '2024-05-30'),
('RestAPI', 3, '2024-06-29'),
('Web', 1, '2024-10-28'),
('Web', 2, '2024-11-20'),
('Web', 3, '' ),
('App', 1, '2025-01-30'),
('App', 2, '');

SELECT Desarrollo
FROM (
    SELECT Desarrollo, MAX(Etapa) AS EtapaPendiente
    FROM Yamiledb.Desarrollo
    WHERE Finalizado = ''
    GROUP BY Desarrollo
) AS t
ORDER BY EtapaPendiente DESC;
 
