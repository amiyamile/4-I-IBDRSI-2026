-- Yamile Isabela Montaño Hernandez --

-- Carrito 1
CREATE TABLE Yamiledb.Carrito1 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Articulo VARCHAR(50)
);
INSERT INTO Yamiledb.Carrito1 (Articulo) VALUES 
('Azucar'), ('Pan'), ('Jugo'), ('Refresco'), ('Harina');

-- Carrito 2
CREATE TABLE Yamiledb.Carrito2 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Articulo VARCHAR(50)
);
INSERT INTO Yamiledb.Carrito2 (Articulo) VALUES 
('Azucar'), ('Pan'), ('Mantequilla'), ('Queso'), ('Manzana');

SELECT c1.Articulo AS Carrito1, c2.Articulo AS Carrito2
FROM Yamiledb.Carrito1 c1
LEFT JOIN Yamiledb.Carrito2 c2 ON c1.Articulo = c2.Articulo
UNION
SELECT c1.Articulo AS Carrito1, c2.Articulo AS Carrito2
FROM Yamiledb.Carrito1 c1
RIGHT JOIN Yamiledb.Carrito2 c2 ON c1.Articulo = c2.Articulo;