--Yamile Isabela Montaño H 4°i--

CREATE TABLE Amy.Ventas (
    amo INT,
    cantidad DECIMAL(10,2) PRIMARY KEY
);


INSERT INTO Amy.Ventas (amo, cantidad) VALUES
(2025, 352645),
(2024, 165565),
(2024, 254654),
(2023, 159521),
(2023, 251696),
(2023, 111894);

SELECT
    SUM(CASE WHEN amo = 2025 THEN cantidad ELSE 0 END) AS '2025',
    SUM(CASE WHEN amo = 2024 THEN cantidad ELSE 0 END) AS '2024',
    SUM(CASE WHEN amo = 2023 THEN cantidad ELSE 0 END) AS '2023'
FROM Amy.Ventas;
