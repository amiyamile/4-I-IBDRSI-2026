-- CREACIÓN DE TABLAS
CREATE TABLE detalle_horarios (
  horario_id INT NOT NULL,
  hora_salida DATE NOT NULL,
  hora_entrada DATE NOT NULL,
  codigo_incapacidad VARCHAR(25) DEFAULT NULL,
  PRIMARY KEY (horario_id, hora_salida)
);

CREATE TABLE plantilla_detalle_horarios (
  plantilla_id INT NOT NULL,
  dia INT NOT NULL,
  codigo_incapacidad VARCHAR(25) DEFAULT NULL,
  turno VARCHAR(25) DEFAULT NULL,
  PRIMARY KEY (plantilla_id, dia)
);

CREATE TABLE horarios (
  horario_id INT NOT NULL AUTO_INCREMENT,
  plantilla_id INT DEFAULT NULL,
  PRIMARY KEY (horario_id)
);

CREATE TABLE usuarios (
  id INT NOT NULL,
  nombres VARCHAR(25) NOT NULL,
  apellidos VARCHAR(25) DEFAULT NULL,
  departamento VARCHAR(25) DEFAULT NULL,
  PRIMARY KEY (id, nombres)
);

-- INSERCIÓN DE DATOS DE PRUEBA
INSERT INTO plantilla_detalle_horarios (plantilla_id, dia, codigo_incapacidad, turno)
VALUES 
  (1, 1, NULL, '1/10'),
  (1, 2, NULL, '1/11,5'),
  (1, 3, NULL, '1/10'),
  (1, 4, NULL, '1/11,5'),
  (1, 5, NULL, '1/10'),
  (1, 6, 'vacaciones', NULL),
  (1, 7, 'vacaciones', NULL),
  (2, 2, NULL, '1/11,5'),
  (2, 3, NULL, '2/11,5'),
  (2, 4, NULL, '1|11.5'),
  (2, 5, NULL, '1/11,5'),
  (2, 6, 'vacaciones', NULL),
  (2, 7, 'vacaciones', NULL),
  (3, 1, NULL, '1#8'),
  (3, 2, NULL, '1.0'),
  (3, 3, 'viaje_negocios', NULL);

INSERT INTO horarios (horario_id, plantilla_id)
VALUES 
  (1, 5),
  (2, 1),
  (4, 2),
  (3, 3),
  (5, 4);

INSERT INTO detalle_horarios (horario_id, hora_salida, hora_entrada, codigo_incapacidad)
VALUES 
  (2, '2026-03-01', '2026-03-01', NULL),
  (3, '2026-03-02', '2026-03-02', 'viaje_negocios');

INSERT INTO usuarios (id, nombres, apellidos, departamento)
VALUES
(1, 'Lucia', 'Navarro Peña', 'Innovación'),
(2, 'Sebastián', 'Ortega Lozano', 'Calidad'),
(3, 'Andrea', 'Santos Villalba', 'Operaciones'),
(4, 'Martín', 'García Cordero', 'Logística'),
(5, 'Paula', 'Reyes Domínguez', 'Investigación'),
(6, 'Tomás', 'Vega Carrillo', 'Desarrollo'),
(7, 'Claudia', 'Mendoza Herrera', 'Planeación'),
(8, 'Iván', 'Ramírez Patiño', 'Producción'),
(9, 'Daniela', 'Flores Salgado', 'Comunicaciones'),
(10, 'Gabriel', 'Castillo Romero', 'Proyectos');

-- CONSULTAS DE VERIFICACIÓN

-- 1. Ver horarios y su plantilla asociada
SELECT h.horario_id, h.plantilla_id
FROM horarios h;

-- 2. Relacionar horarios con detalles de plantilla
SELECT h.horario_id, p.dia, p.turno, p.codigo_incapacidad
FROM horarios h
INNER JOIN plantilla_detalle_horarios p
ON h.plantilla_id = p.plantilla_id;

-- 3. Relacionar detalle_horarios con horarios y plantilla
SELECT d.horario_id, d.hora_entrada, d.hora_salida, p.dia, p.turno
FROM detalle_horarios d
INNER JOIN horarios h ON d.horario_id = h.horario_id
INNER JOIN plantilla_detalle_horarios p ON h.plantilla_id = p.plantilla_id;

-- 4. LEFT JOIN para mostrar horarios aunque no tengan plantilla asociada
SELECT h.horario_id, p.dia, p.turno
FROM horarios h
LEFT JOIN plantilla_detalle_horarios p
ON h.plantilla_id = p.plantilla_id;

-- 5. Listar usuarios por departamento
SELECT departamento, COUNT(*) AS total_usuarios
FROM usuarios
GROUP BY departamento;