CREATE TABLE Masi.asientos(
    num_asiento INT PRIMARY KEY
);

INSERT INTO Masi.asientos VALUES
(7),(13),(14),(15),(27),(28),(29),(30),(31),(32),(33),(34),(35),(52),(53),(54);

-- espacios libres
WITH ordenados AS (
    SELECT num_asiento,
           LAG(num_asiento) OVER (ORDER BY num_asiento) AS anterior
    FROM Masi.asientos
)
SELECT COALESCE(anterior + 1, 1) AS espacio_inicio,
       num_asiento - 1 AS espacio_final
FROM ordenados
WHERE num_asiento - COALESCE(anterior, 0) > 1;

-- asientos disponibles
SELECT (MAX(num_asiento) - MIN(num_asiento) + 1) - COUNT(*) AS disponibles
FROM Masi.asientos;

-- Clasificar pares e impares
SELECT CASE
           WHEN num_asiento % 2 = 0 THEN 'pares'
           ELSE 'impares'
       END AS tipo,
       COUNT(*) AS total
FROM Masi.asientos
GROUP BY tipo;

