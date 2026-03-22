-- Yamile Isabela Montaño Hernandez --

--Promedio días--

CREATE TABLE Amily.Promedio_dias (
    Desarrollo VARCHAR(50),
    Terminacion VARCHAR (20),
    PRIMARY KEY (Desarrollo, Terminacion)
);

INSERT INTO Amily.Promedio_dias (Desarrollo, Terminacion) VALUES
    ('RestAPI', '06/01/2024'),
    ('RestAPI', '06/14/2024'),
    ('RestAPI', '06/15/2024'),
    ('Web', '06/01/2024'),
    ('Web', '06/02/2024'),
    ('Web', '06/19/2024'),
 	('App', '06/01/2024'), 
	('App', '05/15/2024'), 
	('App', '06/30/2024');


WITH Diferencias AS (
    SELECT 
        Desarrollo,
        DATEDIFF(
            STR_TO_DATE(Terminacion, '%m/%d/%Y'),
            LAG(STR_TO_DATE(Terminacion, '%m/%d/%Y')) OVER (
                PARTITION BY Desarrollo 
                ORDER BY STR_TO_DATE(Terminacion, '%m/%d/%Y')
            )
        ) AS DiasEntreIteraciones
    FROM Amily.Promedio_dias
)
SELECT 
    Desarrollo,
    AVG(DiasEntreIteraciones) AS Promedio
FROM Diferencias
WHERE DiasEntreIteraciones IS NOT NULL
GROUP BY Desarrollo
ORDER BY Promedio ASC;