
-- Servidor: localhost
-- Tiempo de generación: 15-05-2018 
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 7


use agendanextu;

CREATE TABLE Eventos (
  id int(11) NOT NULL,
  titulo varchar(45) NOT NULL,
  fecha_ini date NOT NULL,
  hora_ini time DEFAULT NULL,
  fecha_fin date DEFAULT NULL,
  hora_fin time DEFAULT NULL,
  dia_completo int(11) NOT NULL,
  Usuarios_id int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



INSERT INTO Eventos (id, titulo, fecha_ini, hora_ini, fecha_fin, hora_fin, dia_completo, Usuarios_id) VALUES
(1, 'Reunion de trabajo', '2018-05-02', '10:00:00', '2018-05-02', '12:00:00', 0, 1),
(2, 'Cena con amigos', '2018-05-10', '21:00:00', '2018-05-10', '23:00:00', 0, 1),
(3, 'Reunion Trabajo', '2018-05-21', '09:00:00', '2018-05-21', '11:00:00', 1, 1);

select * from eventos;


INSERT INTO Eventos (id, titulo, fecha_ini, hora_ini, fecha_fin, hora_fin, dia_completo, Usuarios_id) VALUES
(3, 'Reunion Trabajo', '2018-03-21', '09:00:00', '2018-03-21', '11:00:00', 1, 1);

CREATE TABLE Usuarios (
  id int(11) NOT NULL,
  nombre varchar(45) DEFAULT NULL,
  email varchar(45) NOT NULL,
  pasw varchar(255) NOT NULL,
  fechanac date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



INSERT INTO Usuarios (id, nombre, email, pasw, fechanac) VALUES
(1, 'Juan', 'juan@mail.com', '$2y$10$2TLSY5j0N08AiL4UQIK2M.zAipGsbf8NKKPUrP9Kz1kreG3Qu.YY6', '1972-05-09'),
(2, 'Pedro', 'pedro@mail.com', '$2y$10$Q8kI1IQqHi5s9peWepRpyuKXYmST5N6z9ptdD6GE8jRaBAg0uViSW', '1979-08-24'),
(3, 'Andres', 'andres@mail.com', '$2y$10$Q8kI1IQqHi5s9peWepRpyuKXYmST5N6z9ptdD6GE8jRaBAg0uViSW', '1980-10-01');


select * from Usuarios;




--
-- Indices de la tabla `Eventos`
--
ALTER TABLE Eventos
  ADD PRIMARY KEY (id),
  ADD KEY fk_Eventos_Usuarios_idx (Usuarios_id);

--
-- Indices de la tabla `Usuarios`
--
ALTER TABLE Usuarios
  ADD PRIMARY KEY (id),
  ADD UNIQUE KEY login_UNIQUE (email);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Eventos`
--
ALTER TABLE Eventos
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `Usuarios`
--
ALTER TABLE Usuarios
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Eventos`
--
ALTER TABLE Eventos
  ADD CONSTRAINT fk_Eventos_Usuarios FOREIGN KEY (Usuarios_id) REFERENCES Usuarios (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;