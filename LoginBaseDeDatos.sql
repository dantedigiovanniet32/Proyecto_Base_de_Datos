drop database if exists login_sql;
create database login_sql;
use login_sql;

drop table if exists usuarios;

create table usuarios (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
localidad VARCHAR(100) NOT NULL,
contrasenia VARCHAR(100) NOT NULL,
numeroTLF VARCHAR(100) NOT NULL,
fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);