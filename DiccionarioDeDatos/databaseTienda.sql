drop database if exists tienda;
create database tienda;
use tienda;

drop table if exists provincias;
drop table if exists calle;
drop table if exists localidades_barrios;
drop table if exists categoria;
drop table if exists marca;
drop table if exists formas_pago;
drop table if exists sucursales;
drop table if exists subcategoria;
drop table if exists productos;
drop table if exists proveedores;
drop table if exists inventario;
drop table if exists empleados;
drop table if exists ventas;
drop table if exists empleados;

CREATE TABLE provincias (
    id_provincia INT PRIMARY KEY auto_increment,
    nombre VARCHAR(100) NOT NULL,
    pbi NUMERIC(15,2)
);

CREATE TABLE calle (
    id_calle INT PRIMARY KEY auto_increment,
    nombre VARCHAR(150) NOT NULL,
    altura INT,
    descripcion VARCHAR(255)
);

CREATE TABLE localidades_barrios (
    id_localidad INT PRIMARY KEY auto_increment,
    nombre VARCHAR(100) NOT NULL,
    poblacion INT,
    codigo_postal VARCHAR(20)
);

CREATE TABLE categoria (
    id_categoria INT PRIMARY KEY auto_increment,
    nombre VARCHAR(100) NOT NULL,
    cant_subcategorias INT
);

CREATE TABLE marca (
    id_marca INT PRIMARY KEY auto_increment,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE formas_pago (
    id_forma INT PRIMARY KEY auto_increment,
    forma VARCHAR(80) NOT NULL,
    empresa VARCHAR(100)
);

CREATE TABLE sucursales (
    id_sucursal INT PRIMARY KEY auto_increment,
    nombre VARCHAR(120) NOT NULL,
    id_calle INT,
    id_localidad INT,
    CONSTRAINT fk_sucursal_calle
        FOREIGN KEY (id_calle) REFERENCES calle(id_calle),
    CONSTRAINT fk_sucursal_localidad
        FOREIGN KEY (id_localidad) REFERENCES localidades_barrios(id_localidad)
);

CREATE TABLE subcategoria (
    id_subcategoria INT PRIMARY KEY auto_increment,
    nombre VARCHAR(100) NOT NULL,
    id_categoria INT,
    CONSTRAINT fk_subcategoria_categoria
        FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

CREATE TABLE productos (
    id_producto INT PRIMARY KEY auto_increment,
    modelo VARCHAR(100),
    codigo VARCHAR(50) UNIQUE,
    descripcion varchar(500),
    precio_venta int not null,
    id_subcategoria INT,
    id_marca INT,
    CONSTRAINT fk_producto_subcategoria
        FOREIGN KEY (id_subcategoria) REFERENCES subcategoria(id_subcategoria),
    CONSTRAINT fk_producto_marca
        FOREIGN KEY (id_marca) REFERENCES marca(id_marca)
);

CREATE TABLE proveedores (
    id_proveedor INT PRIMARY KEY auto_increment,
    nombre VARCHAR(150) NOT NULL,
    id_calle INT,
    correo VARCHAR(150),
    CONSTRAINT fk_proveedor_calle
        FOREIGN KEY (id_calle) REFERENCES calle(id_calle)
);

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY auto_increment,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    dni VARCHAR(20) UNIQUE NOT NULL,
    id_calle INT,
    correo VARCHAR(150),
    CONSTRAINT fk_cliente_calle
        FOREIGN KEY (id_calle) REFERENCES calle(id_calle)
);

CREATE TABLE empleados (
    id_empleado INT PRIMARY KEY auto_increment,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    sueldo int not null,
    id_sucursal INTEGER NOT NULL,
    puesto VARCHAR(100),
    CONSTRAINT fk_empleado_sucursal
        FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal)
);

CREATE TABLE inventario (
    id_inventario INT PRIMARY KEY auto_increment,
    id_producto INT,
    cantidad INT not null,
    id_sucursal int,
    CONSTRAINT fk_inventario_producto
        FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    CONSTRAINT fk_inventario_sucursal
        FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal),
    CONSTRAINT uq_inventario_producto_sucursal
        UNIQUE (id_producto, id_sucursal)
);

CREATE TABLE ventas (
    id_venta INT PRIMARY KEY auto_increment,
    id_sucursal int,
    id_cliente int,
    id_forma INT,
    fecha varchar(50) not null,
    tipo VARCHAR(50),
    id_empleado INT,
    id_producto INT,
    cantidad INT not null,
    precio_total int not null,
    CONSTRAINT fk_venta_sucursal
        FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal),
    CONSTRAINT fk_venta_cliente
        FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    CONSTRAINT fk_venta_forma_pago
        FOREIGN KEY (id_forma) REFERENCES formas_pago(id_forma),
    CONSTRAINT fk_venta_empleado
        FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado),
    CONSTRAINT fk_venta_producto
        FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

CREATE TABLE historial_precios (
    id_historial INT PRIMARY KEY auto_increment,
    id_producto INT,
    precio_anterior int not null,
    fecha_cambio varchar(50) not null,
    CONSTRAINT fk_historial_producto
        FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);
