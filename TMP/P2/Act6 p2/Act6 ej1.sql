--Yamile Isabela Montaño Hernandez
--Dividir a la mitad

CREATE TABLE Amy.Jugadores (
    Id_jugador INT PRIMARY KEY,
    Marcador INT
);

INSERT INTO Amy.Jugadores (Id_jugador, Marcador) VALUES
(1001, 2343),
(2002, 9432),
(3003, 6548),
(4004, 1054),
(5005, 6832);

SELECT 
    CASE WHEN categoria = 1 THEN 1 ELSE 2 END AS Categoria,
    Id_jugador,
    Marcador
FROM (
    SELECT 
        Id_jugador,
        Marcador,
        NTILE(2) OVER (ORDER BY Marcador DESC) AS categoria
    FROM Amy.Jugadores
) AS sub
ORDER BY Categoria ASC, Marcador DESC;