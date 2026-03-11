-- Yamile Isabela Montaño Hernandez --

CREATE TABLE Yamiledb.Ordenes (
    Id_cliente INT,
    Id_Orden INT PRIMARY KEY,
    Estado_Destino VARCHAR(10),
    Costo DECIMAL(10,2)
);

INSERT INTO Yamiledb.Ordenes VALUES
(1001, 1, 'JAL', 987),
(1001, 2, 'CDMX', 400),
(1001, 3, 'CDMX', 545),
(1001, 4, 'CDMX', 321),
(2002, 5, 'MTY', 324),
(3003, 6, 'JAL', 931),
(4004, 7, 'JAL', 876),
(5005, 8, 'CDMX', 567);

SELECT o.Id_cliente, o.Id_Orden, o.Estado_Destino, o.Costo
FROM Yamiledb.Ordenes o
WHERE o.Estado_Destino = 'CDMX'
  AND o.Id_cliente IN (
      SELECT Id_cliente
      FROM Yamiledb.Ordenes
      WHERE Estado_Destino = 'JAL'
  );