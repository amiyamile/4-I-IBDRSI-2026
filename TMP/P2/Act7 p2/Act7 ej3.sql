CREATE TABLE Masi.periodos(
    Inicio VARCHAR(10),
    Final VARCHAR(10),
    PRIMARY KEY (Inicio)
);

INSERT INTO Masi.periodos(Inicio, Final) VALUES
('01/01/2025','01/05/2025'),
('01/03/2025','01/09/2025'),
('01/10/2025','01/11/2025'),
('01/12/2025','01/16/2025'),
('01/15/2025','01/19/2025');

WITH ordenados AS (
    SELECT 
        STR_TO_DATE(Inicio,'%d/%m/%Y') AS inicio,
        STR_TO_DATE(Final,'%d/%m/%Y') AS final
    FROM Masi.periodos
    ORDER BY STR_TO_DATE(Inicio,'%d/%m/%Y')
),
grupos AS (
    SELECT 
        inicio,
        final,
        MAX(final) OVER (ORDER BY inicio ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS max_final
    FROM ordenados
),
marcados AS (
    SELECT 
        inicio,
        final,
        max_final,
        CASE 
            -- 🔑 Aquí el cambio: solo si inicio > max_final anterior
            WHEN inicio > LAG(max_final) OVER (ORDER BY inicio) 
            THEN 1 ELSE 0 
        END AS nuevo_grupo
    FROM grupos
),
acumulado AS (
    SELECT 
        inicio,
        max_final,
        SUM(nuevo_grupo) OVER (ORDER BY inicio) AS grupo
    FROM marcados
)
SELECT 
    DATE_FORMAT(MIN(inicio), '%d/%m/%Y') AS inicio,
    DATE_FORMAT(MAX(max_final), '%d/%m/%Y') AS final
FROM acumulado
GROUP BY grupo
ORDER BY inicio;
