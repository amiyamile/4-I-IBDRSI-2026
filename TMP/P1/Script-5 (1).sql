/* 
Implementacion de una base de datos en un sistema de informacion
2025/02/19 4-I
Juan Antonio Ortega Sandoval
Nombre de la practica
*/

/* CREACIÓN DE TABLAS */
CREATE TABLE CATEGORIES (
    ID INT PRIMARY KEY,
    NAME VARCHAR(50) NOT NULL
); 

CREATE TABLE AUTHORS (
    ID INT PRIMARY KEY,
    NAME VARCHAR(50) NOT NULL
);

CREATE TABLE BOOKS (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(50) NOT NULL,
    PRICE INT,
    CATEGORYID INT,
    AUTHORID INT,
    FOREIGN KEY (CATEGORYID) REFERENCES CATEGORIES(ID),
    FOREIGN KEY (AUTHORID) REFERENCES AUTHORS(ID)
);

/* INSERCIÓN DE DATOS */
INSERT INTO CATEGORIES (ID, NAME) VALUES
    (1, 'Cat-A'),
    (2, 'Cat-B'),
    (3, 'Cat-C'),
    (7, 'Cat-D'),
    (8, 'Cat-E'),
    (4, 'Cat-F'),
    (10, 'Cat-G'),
    (12, 'Cat-H'),
    (6, 'Cat-I');

INSERT INTO AUTHORS (ID, NAME) VALUES
    (1, 'Author-A'),
    (2, 'Author-B'),
    (3, 'Author-C'),
    (10, 'Author-D'),
    (12, 'Author-E');

INSERT INTO BOOKS (NAME, PRICE, CATEGORYID, AUTHORID) VALUES
    ('Book-A', 100, 1, 2),
    ('Book-B', 200, 2, 2),
    ('Book-C', 150, 3, 2),
    ('Book-D', 100, 3, 1),
    ('Book-E', 200, 3, 1),
    ('Book-F', 150, 4, 1),
    ('Book-G', 100, 3, 2),  
    ('Book-H', 200, 4, 1),  	
    ('Book-I', 150, 7, 10); 	

/* CONSULTAS */

/* 1. INNER JOIN */
SELECT B.NAME AS Book, C.NAME AS Category, A.NAME AS Author
FROM BOOKS B
INNER JOIN CATEGORIES C ON B.CATEGORYID = C.ID
INNER JOIN AUTHORS A ON B.AUTHORID = A.ID;

/* 2. LEFT OUTER JOIN */
SELECT B.NAME AS Book, C.NAME AS Category, A.NAME AS Author
FROM BOOKS B
LEFT JOIN CATEGORIES C ON B.CATEGORYID = C.ID
LEFT JOIN AUTHORS A ON B.AUTHORID = A.ID;

/* 3. RIGHT OUTER JOIN */
SELECT B.NAME AS Book, C.NAME AS Category
FROM BOOKS B
RIGHT JOIN CATEGORIES C ON B.CATEGORYID = C.ID;

/* 4. NATURAL JOIN (simulado en MySQL con igualdad de columnas) */
SELECT B.NAME AS Book, C.NAME AS Category
FROM BOOKS B
JOIN CATEGORIES C ON B.CATEGORYID = C.ID;

/* 5. LEFT EXCLUDING JOIN (categorías sin libros) */
SELECT C.ID, C.NAME
FROM CATEGORIES C
LEFT JOIN BOOKS B ON C.ID = B.CATEGORYID
WHERE B.ID IS NULL;

/* 6. RIGHT EXCLUDING JOIN (autores sin libros) */
SELECT A.ID, A.NAME
FROM AUTHORS A
RIGHT JOIN BOOKS B ON A.ID = B.AUTHORID
WHERE B.ID IS NULL;