DROP TABLE IF EXISTS reaccion;
DROP TABLE IF EXISTS publicacion;
DROP TABLE IF EXISTS usuario;

CREATE TABLE "usuario" (
	"id_usuario" SERIAL NOT NULL UNIQUE,
	"nombre" VARCHAR(50) NOT NULL,
	"fecha_registro" DATE NOT NULL,
	PRIMARY KEY("id_usuario")
);




CREATE TABLE "publicacion" (
	"id_publicacion" SERIAL NOT NULL UNIQUE,
	"titulo" VARCHAR(255) NOT NULL,
	"contenido" TEXT,
	"fecha_publicacion" TIMESTAMP NOT NULL,
	"id_usuario" INTEGER NOT NULL,
	PRIMARY KEY("id_publicacion")
);




CREATE TABLE "reaccion" (
	"id_reaccion" SERIAL NOT NULL UNIQUE,
	"tipo" VARCHAR(20) NOT NULL,
	"fecha_reaccion" TIMESTAMP NOT NULL,
	"id_usuario" INTEGER NOT NULL,
	"id_publicacion" INTEGER NOT NULL,
	PRIMARY KEY("id_reaccion")
);



ALTER TABLE "publicacion"
ADD FOREIGN KEY("id_usuario") REFERENCES "usuario"("id_usuario")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "reaccion"
ADD FOREIGN KEY("id_usuario") REFERENCES "usuario"("id_usuario")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "reaccion"
ADD FOREIGN KEY("id_publicacion") REFERENCES "publicacion"("id_publicacion")
ON UPDATE NO ACTION ON DELETE NO ACTION;


INSERT INTO usuario(nombre,fecha_registro)VALUES
('Marcos Paredes','2022-12-18'),
('Juan Perez','2025-07-10'),
('Julian Alvarez','2025-06-26');

INSERT INTO publicacion(titulo,contenido,fecha_publicacion,id_usuario)VALUES
('Primera publicacion','Este es mi primer post.','2022-12-18 10:34:00',1),
('Noticias de la semana','Resumen de las noticias mas importantes.','2025-08-16 09:50:00',2);


INSERT INTO reaccion(tipo,fecha_reaccion,id_usuario,id_publicacion) VALUES
('like','2022-12-18 11:57:00',2,1),
('corazon','2025-08-20 05:46:00',3,2),
('risa','2025-03-05 12:10:00',1,2);

SELECT * FROM usuario;
SELECT * FROM publicacion;
SELECT * FROM reaccion;







