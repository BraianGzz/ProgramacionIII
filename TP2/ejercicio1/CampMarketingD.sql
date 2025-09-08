DROP TABLE IF EXISTS conversion;
DROP TABLE IF EXISTS ejecucion;
DROP TABLE IF EXISTS plataforma;
DROP TABLE IF EXISTS campania;

CREATE TABLE "campania" (
	"id_campania" SERIAL NOT NULL UNIQUE,
	"nombre" VARCHAR(100) NOT NULL,
	"presupuesto" NUMERIC(10,2),
	"fecha_inicio" DATE NOT NULL,
	PRIMARY KEY("id_campania")
);




CREATE TABLE "plataforma" (
	"id_plataforma" SERIAL NOT NULL UNIQUE,
	"nombre" VARCHAR(50) NOT NULL,
	"url" VARCHAR(255),
	PRIMARY KEY("id_plataforma")
);




CREATE TABLE "conversion" (
	"id_conversion" SERIAL NOT NULL UNIQUE,
	"tipo" VARCHAR(50) NOT NULL,
	"valor" NUMERIC(10,2),
	"fecha" TIMESTAMP NOT NULL,
	"id_ejecucion" INTEGER NOT NULL,
	PRIMARY KEY("id_conversion")
);




CREATE TABLE "ejecucion" (
	"id_ejecucion" SERIAL NOT NULL UNIQUE,
	"id_campania" INTEGER NOT NULL,
	"id_plataforma" INTEGER NOT NULL,
	PRIMARY KEY("id_ejecucion")
);



ALTER TABLE "ejecucion"
ADD FOREIGN KEY("id_campania") REFERENCES "campania"("id_campania")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "ejecucion"
ADD FOREIGN KEY("id_plataforma") REFERENCES "plataforma"("id_plataforma")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "conversion"
ADD FOREIGN KEY("id_ejecucion") REFERENCES "ejecucion"("id_ejecucion")
ON UPDATE NO ACTION ON DELETE NO ACTION;


INSERT INTO campania(nombre,presupuesto,fecha_inicio)VALUES
('NikeVerano2025',10000.50,'2025-12-21'),
('AdidasInvierno2026',25000.20,'2026-06-20');

INSERT INTO plataforma(nombre,url)VALUES
('Google ADS','google.com'),
('meta ADS','meta.com');

INSERT INTO ejecucion(id_campania,id_plataforma) VALUES
(1,2),
(2,1),
(2,2);

INSERT INTO conversion(tipo,valor,fecha,id_ejecucion) VALUES
('venta',20.99,'2026-01-04 05:10:24',1),
('registro',NULL,'2026-01-05 08:13:55',1),
('venta',40.99,'2026-07-03 10:12:22',2),
('registro',NULL,'2026-07-13 01:01:19',3);

SELECT * FROM campania;
SELECT * FROM plataforma;
SELECT * FROM ejecucion;
SELECT * FROM conversion;