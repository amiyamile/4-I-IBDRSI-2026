-- Yamile Isabela Montaño Hernandez --

-- Misión a Marte

CREATE TABLE Amily.Requisitos (
    Descripción VARCHAR(50),
    PRIMARY KEY (Descripción)
);

CREATE TABLE Amily.Candidatos (
    Id_Candidato INT,
    Descripcion VARCHAR(50),
    PRIMARY KEY (Id_Candidato, Descripcion)
);

INSERT INTO Amily.Requisitos (Descripción) VALUES
('Geólogo'),
('Astrónomo'),
('Técnico');


INSERT INTO Amily.Candidatos (Id_Candidato,Descripcion) VALUES
(1001, 'Geólogo'),
(1001, 'Astrónomo'),
(1001, 'Bioquímico'),
(1001, 'Técnico'),
(2002, 'Cirujano'),
(2002, 'Mecánico'),
(2002, 'Geólogo'),
(3003, 'Astrónomo'),
(4004, 'Ingeniero');

SELECT Id_candidato
FROM Amily.Candidatos
WHERE Descripcion IN (SELECT Descripción FROM Amily.Requisitos)
GROUP BY Id_candidato
HAVING COUNT(DISTINCT Descripcion) = (SELECT COUNT(*) FROM Amily.Requisitos);
