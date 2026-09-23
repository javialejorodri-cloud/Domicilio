CREATE DATABASE IF NOT EXISTS Domicilios DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE Domicilios;

-- Creacion de las tablas 
CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(100),
    direccion VARCHAR(100),
    telefono INT
); 

CREATE TABLE repartidor (
    id_repartidor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    telefono VARCHAR(100),
    vehiculo VARCHAR(100), 
    placa VARCHAR(100),
    estado VARCHAR(100)
);

CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT
);

-- Tablas secundarias y de transacciones
CREATE TABLE direccion (
    id_direccion INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL, 
    direccion_comp VARCHAR(150) NOT NULL,   
    complemento VARCHAR(100),              
    ciudad VARCHAR(100),
    departamento VARCHAR(100),
    datos_extra VARCHAR(100),          
    referencia TEXT,              
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE carrito (
    id_carrito INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL, 
    fecha_creacion DATETIME,
    estado VARCHAR(100),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY, 
    id_carrito INT, 
    nombre VARCHAR(100),
    descripcion TEXT,
    precio INT,
    estado VARCHAR(100),
    FOREIGN KEY (id_carrito) REFERENCES carrito(id_carrito)
);

CREATE TABLE detalle_carrito (
    id_detalle_carrito INT AUTO_INCREMENT PRIMARY KEY,
    id_carrito INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT,
    precio INT,
    descuento INT,
    FOREIGN KEY (id_carrito) REFERENCES carrito(id_carrito),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

CREATE TABLE pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,     
    id_direccion INT NOT NULL,  
    id_producto INT,             
    fecha_pedido DATETIME,
    subtotal INT,
    costo_domicilio INT,
    total INT,
    estado_pedido VARCHAR(100),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_direccion) REFERENCES direccion(id_direccion),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

CREATE TABLE detalle_pedido (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,      
    id_producto INT NOT NULL,
    cantidad INT,
    precio INT,
    descuento INT,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

CREATE TABLE pago ( 
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,     
    metodo_pago VARCHAR(100),
    monto_pagado VARCHAR(100),
    estado_pago VARCHAR(100),
    fecha DATE,
    transaccion_ref VARCHAR(100),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
);

CREATE TABLE entrega ( 
    id_entrega INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,       
    id_repartidor INT NOT NULL,   
    estado_entrega VARCHAR(100),
    fecha_entrega DATE,
    fecha_asignacion DATE,
    hora_asignacion TIME,
    observaciones TEXT,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (id_repartidor) REFERENCES repartidor(id_repartidor)
);