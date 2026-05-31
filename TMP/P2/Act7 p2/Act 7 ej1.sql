CREATE TABLE Masi.Datoss (
    idx INT AUTO_INCREMENT PRIMARY KEY,
    Producto VARCHAR(50),
    Cantidad INT
);

INSERT INTO Masi.Datoss (Producto, Cantidad) VALUES
('Lápiz', 3),
('Borrador', 4),
('Cuaderno', 2);

WITH RECURSIVE numeros AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1
    FROM numeros
    WHERE n < (SELECT MAX(Cantidad) FROM Masi.Datoss)
)
SELECT p.Producto, 1 AS Cantidad
FROM Masi.Datoss p
JOIN numeros n ON n.n <= p.Cantidad
ORDER BY p.idx, n;

