CREATE DATABASE prueba;
\c prueba
CREATE TABLE categoria(id SERIAL, nombre VARCHAR(50) NOT NULL, descripcion VARCHAR(300) NOT NULL, PRIMARY KEY(id));
CREATE TABLE producto(id SERIAL, nombre VARCHAR(50) NOT NULL, descripcion VARCHAR(300) NOT NULL, valor_unitario INT NOT NULL, categoria_id INT NOT NULL, PRIMARY KEY(id), FOREIGN KEY(categoria_id) REFERENCES categoria(id));
CREATE TABLE listado_productos(id SERIAL, precio_unitario INT NOT NULL, cantidad INT NOT NULL, valor_total INT NOT NULL, product_id INT NOT NULL, PRIMARY KEY(id), FOREIGN KEY(product_id) REFERENCES producto(id));
CREATE TABLE factura(num SERIAL, fecha DATE NOT NULL, subtotal INT NOT NULL, iva INT NOT NULL, precio_total INT NOT NULL, listado_productos_id INT NOT NULL, PRIMARY KEY(num), FOREIGN KEY(listado_productos_id) REFERENCES listado_productos(id));
CREATE TABLE cliente (id SERIAL, nombre VARCHAR(50) NOT NULL, rut VARCHAR(15) NOT NULL, direccion VARCHAR(120) NOT NULL, factura_num INT, FOREIGN KEY(factura_num) REFERENCES factura(num));

INSERT INTO cliente(nombre, rut, direccion) VALUES('juan', '11505897-K', 'algun lugar');
INSERT INTO cliente(nombre, rut, direccion) VALUES('pedro', '15505897-3', 'otro lugar');
INSERT INTO cliente(nombre, rut, direccion) VALUES('diego', '19871654-1', 'nuevo lugar');
INSERT INTO cliente(nombre, rut, direccion) VALUES('pablo', '16595897-3', 'lugar dos');
INSERT INTO cliente(nombre, rut, direccion) VALUES('wilson', '18545897-2', 'ningun lugar');

INSERT INTO producto(nombre, descripcion, valor_unitario) VALUES('lapiz azul', 'bien azul', 100);
INSERT INTO producto(nombre, descripcion, valor_unitario) VALUES('lapiz rojo', 'bien rojo', 150);
INSERT INTO producto(nombre, descripcion, valor_unitario) VALUES('estuche azul', 'estuche grande y azul', 990);
INSERT INTO producto(nombre, descripcion, valor_unitario) VALUES('cuaderno grande', 'cuaderno bien grande', 1499);
INSERT INTO producto(nombre, descripcion, valor_unitario) VALUES('boligrafo edicion limitada', 'hecho de oro maciso', 8600000);
INSERT INTO producto(nombre, descripcion, valor_unitario) VALUES('boligrafo negro', 'de plastico', 3990);
INSERT INTO producto(nombre, descripcion, valor_unitario) VALUES('tijera chica', 'corta bien', 699);
INSERT INTO producto(nombre, descripcion, valor_unitario) VALUES('pegamento natural biodegradable reciclable', 'muy natural', 14990);

INSERT INTO categoria(nombre, descripcion) VALUES('lapices y boligrafos', 'para escribir');
INSERT INTO categoria(nombre, descripcion) VALUES('tijeras y pegamentos', 'para artes plasticas');
INSERT INTO categoria(nombre, descripcion) VALUES('cuadernos y estuches', 'para guardar cosas');






