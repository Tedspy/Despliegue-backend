CREATE DATABASE IF NOT EXISTS futbol_colombia;
USE futbol_colombia;

CREATE TABLE IF NOT EXISTS equipos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    estadio VARCHAR(100) NOT NULL,
    fundacion INT NOT NULL,
    color_principal VARCHAR(20) NOT NULL,
    color_secundario VARCHAR(20) NOT NULL
);

-- Vaciar la tabla por si ya la tiene
TRUNCATE TABLE equipos;

INSERT INTO equipos (nombre, ciudad, estadio, fundacion, color_principal, color_secundario) VALUES
('Millonarios FC', 'Bogotá', 'El Campín', 1946, '#0033A0', '#FFFFFF'),
('Atlético Nacional', 'Medellín', 'Atanasio Girardot', 1947, '#007A33', '#FFFFFF'),
('América de Cali', 'Cali', 'Pascual Guerrero', 1927, '#E3001B', '#FFFFFF'),
('Independiente Santa Fe', 'Bogotá', 'El Campín', 1941, '#D00000', '#FFFFFF'),
('Deportivo Cali', 'Cali', 'Deportivo Cali', 1912, '#006400', '#FFFFFF'),
('Junior de Barranquilla', 'Barranquilla', 'Metropolitano', 1924, '#E3001B', '#0033A0'),
('Independiente Medellín', 'Medellín', 'Atanasio Girardot', 1913, '#D00000', '#0033A0'),
('Once Caldas', 'Manizales', 'Palogrande', 1961, '#FFFFFF', '#000000');
