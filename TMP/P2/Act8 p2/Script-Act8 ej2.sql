--Yamile Isabela Montaño H 4°i--
CREATE TABLE Amy.Huecos (
    fila INT PRIMARY KEY,
    aplicacion VARCHAR(20),
    estado VARCHAR(20)
);


INSERT INTO Amy.Huecos (fila, aplicacion, estado) VALUES
(1,'Web','Aprobado'),
(2,NULL,'Fallo'),
(3,NULL,'Fallo'),
(4,NULL,'Fallo'),
(5,'App','Aprobado'),
(6,NULL,'Fallo'),
(7,NULL,'Fallo'),
(8,NULL,'Aprobado'),
(9,NULL,'Aprobado'),
(10,'RESTAPI','Fallo'),
(11,NULL,'Fallo'),
(12,NULL,'Fallo');

SELECT 
    d1.fila,
    (
        SELECT d2.aplicacion
        FROM Amy.Huecos d2
        WHERE d2.fila <= d1.fila
          AND d2.aplicacion IS NOT NULL
        ORDER BY d2.fila DESC
        LIMIT 1
    ) AS aplicacion,
    d1.estado
FROM Amy.Huecos d1
ORDER BY d1.fila;