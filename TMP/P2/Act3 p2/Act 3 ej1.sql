-- Yamile Isabela Montaño Hernandez --

--Permutaciones--

CREATE TABLE Amily.Casosdeprueba (
	caso VARCHAR(5),
	PRIMARY KEY (caso)
);


INSERT INTO Amily.Casosdeprueba (caso) VALUES
('A'),
('B'),
('C');

SELECT CONCAT(a.caso, ',', b.caso, ',', c.caso) AS Permutacion
FROM Amily.Casosdeprueba a
JOIN Amily.Casosdeprueba b ON b.caso <> a.caso
JOIN Amily.Casosdeprueba c ON c.caso <> a.caso AND c.caso <> b.caso
ORDER BY a.caso ASC, b.caso ASC, c.caso ASC;