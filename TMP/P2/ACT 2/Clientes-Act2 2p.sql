-- Yamile Isabela Montaño Hernandez --

-- Clientes
CREATE TABLE Yamiledb.Clientes (
    IdClienteTelefono INT AUTO_INCREMENT PRIMARY KEY,
    Customer_id INT,
    TypePhone VARCHAR(50),
    Number VARCHAR(15)
);

INSERT INTO Yamiledb.Clientes (Customer_id, TypePhone, Number) VALUES
(1001, 'Celular', '333-897-5421'),
(1001, 'Trabajo', '333-897-5421'),
(1001, 'Casa', '333-897-5421'),
(2002, 'Celular', '333-897-5421'),
(2002, 'Trabajo', '333-897-5421'),
(3003, 'Celular', '333-897-5421');

SELECT 
    Customer_id,
    MAX(CASE WHEN TypePhone = 'Celular' THEN Number END) AS Celular,
    MAX(CASE WHEN TypePhone = 'Trabajo' THEN Number END) AS Trabajo,
    MAX(CASE WHEN TypePhone = 'Casa' THEN Number END) AS Casa
FROM Yamiledb.Clientes
GROUP BY Customer_id;
