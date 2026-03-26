--Yamile Isabela Montaño Hernandez
--Proveedores principales

CREATE TABLE Amy.Pedidos (
    Id_orden INT PRIMARY KEY,
    Id_cliente INT,
    Cantidad INT,
    Proveedor VARCHAR(50)
);

INSERT INTO Amy.Pedidos (Id_orden, Id_cliente, Cantidad, Proveedor) VALUES
(1, 1001, 12, 'IBM'),
(2, 1001, 54, 'IBM'),
(3, 1001, 32, 'Amazon'),
(4, 2002, 7, 'Amazon'),
(5, 2002, 16, 'Amazon'),
(6, 2002, 5, 'IBM');

SELECT Id_cliente, Proveedor
FROM (
    SELECT 
        Id_cliente,
        Proveedor,
        COUNT(*) AS total_pedidos,
        ROW_NUMBER() OVER (PARTITION BY Id_cliente ORDER BY COUNT(*) DESC) AS rn
    FROM Amy.Pedidos
    GROUP BY Id_cliente, Proveedor
) AS sub
WHERE rn = 1;