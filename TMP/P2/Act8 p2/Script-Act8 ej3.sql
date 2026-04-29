--Yamile Isabela Montaño H 4°i--
CREATE TABLE Amy.Muestra (
    id INT AUTO_INCREMENT PRIMARY KEY,
    valor INT
);

INSERT INTO Amy.Muestra (valor) VALUES
(1),(1),(2),(3),(3),(4);

SELECT DISTINCT valor
FROM Amy.Muestra;
