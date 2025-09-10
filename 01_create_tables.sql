-- Alumnos
CREATE TABLE alumnos (
    matricula VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Maestros
CREATE TABLE maestros (
    id_maestro SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Grupos
CREATE TABLE grupos (
    periodo VARCHAR(10) NOT NULL,
    seccion VARCHAR(10) NOT NULL,
    materia VARCHAR(100) NOT NULL,
    id_maestro INTEGER NOT NULL,
    PRIMARY KEY (periodo, seccion),
    FOREIGN KEY (id_maestro) REFERENCES maestros(id_maestro)
);

-- Inscripciones
CREATE TABLE inscripciones (
    matricula VARCHAR(20) NOT NULL,
    periodo VARCHAR(10) NOT NULL,
    seccion VARCHAR(10) NOT NULL,
    fecha_inscripcion DATE NOT NULL,
    PRIMARY KEY (matricula, periodo, seccion),
    FOREIGN KEY (matricula) REFERENCES alumnos(matricula),
    FOREIGN KEY (periodo, seccion) REFERENCES grupos(periodo, seccion)
);

-- Asistencia
CREATE TABLE asistencia (
    matricula VARCHAR(20) NOT NULL,
    periodo VARCHAR(10) NOT NULL,
    seccion VARCHAR(10) NOT NULL,
    fecha_hora TIMESTAMP NOT NULL,
    presente BOOLEAN NOT NULL,
    PRIMARY KEY (matricula, periodo, seccion, fecha_hora),
    FOREIGN KEY (matricula) REFERENCES alumnos(matricula),
    FOREIGN KEY (periodo, seccion) REFERENCES grupos(periodo, seccion)
);

