-- Yamile Isabela Montaño Hernandez --

-- Ocurrencias

CREATE TABLE Masi.Registro (
    Proceso VARCHAR(50),
    Mensaje VARCHAR(50),
    Ocurrencia INT,
    PRIMARY KEY (Proceso, Ocurrencia)
);

INSERT INTO Masi.Registro (Proceso, Mensaje, Ocurrencia) VALUES 
    ('Web', 'Error: No se puede dividir por 0', 3),
    ('RestAPI', 'Error: Fallo la conversión', 5),
    ('App', 'Error: Fallo la conversión', 7),
    ('RestAPI', 'Error: Error sin identificar', 9),
    ('Web', 'Error: Error sin identificar', 1),
    ('App', 'Error: Error sin identificar', 10),
    ('Web', 'Estado Completado', 8),
    ('RestAPI', 'Estado Completado', 6);

SELECT Proceso, Mensaje, Ocurrencia
FROM (
    SELECT 
        Proceso,
        Mensaje,
        Ocurrencia,
        ROW_NUMBER() OVER (
            PARTITION BY Mensaje 
            ORDER BY Ocurrencia DESC
        ) AS rn
    FROM Masi.Registro
) t
WHERE rn = 1;

