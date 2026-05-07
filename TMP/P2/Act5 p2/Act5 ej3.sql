-- Yamile Isabela Montaño Hernandez
-- Marcadores globales

CREATE TABLE Masi.Marcadores (
    JugadorA INT,
    JugadorB INT,
    Marcador INT,
	PRIMARY KEY (JugadorA, JugadorB, Marcador)
);

INSERT INTO Masi.Marcadores (JugadorA, JugadorB, Marcador) VALUES
(1001, 2002, 150),
(3003, 4004, 15),
(4004, 3003, 125);

SELECT LEAST(JugadorA, JugadorB) AS JugadorA,
       GREATEST(JugadorA, JugadorB) AS JugadorB,
       SUM(Marcador) AS MarcadorTotal
FROM Masi.Marcadores
GROUP BY LEAST(JugadorA, JugadorB), GREATEST(JugadorA, JugadorB);
