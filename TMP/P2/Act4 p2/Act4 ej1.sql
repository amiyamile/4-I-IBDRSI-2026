-- Yamile Isabela Montaño Hernandez --

-- Precios de demanda

CREATE TABLE Amily.Productoss(
    Id_producto INT,
    Fecha VARCHAR(50),
    Precio Float,
    PRIMARY KEY (Id_producto, Fecha)
);

INSERT INTO Amily.Productoss (Id_producto, Fecha,Precio) VALUES
(1001, '01/01/2025', 19.99),
(1001, '04/15/2025', 59.99),
(1001, '06/08/2025', 79.99),
(2002, '04/17/2025', 39.99),
(2002, '05/19/2025', 59.99);

SELECT p.Id_producto, p.Fecha, p.Precio
FROM Amily.Productoss p
WHERE p.Fecha = (
    SELECT MAX(p2.Fecha)
    FROM Amily.Productoss p2
    WHERE p2.Id_producto = p.Id_producto
);