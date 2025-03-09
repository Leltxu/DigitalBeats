DROP DATABASE IF EXISTS DigitalBeats;
CREATE DATABASE DigitalBeats;
USE DigitalBeats;

CREATE TABLE USUARIOS (
    ID_CLIENTE INT PRIMARY KEY AUTO_INCREMENT,
    NOMBRE VARCHAR(50) NOT NULL,
    APELLIDOS VARCHAR(100) NOT NULL,
    TELEFONO INT NOT NULL,
    CORREO_ELECTRONICO VARCHAR(100) NOT NULL UNIQUE,
    FECHA_NACIMIENTO DATE NOT NULL,
    ADMIN BOOLEAN NOT NULL,
    PASSWORD VARCHAR(255) NOT NULL,
    DIRECCION VARCHAR(255) NOT NULL
);

CREATE TABLE CATEGORIAS (
    ID_CATEGORIA INT PRIMARY KEY AUTO_INCREMENT,
    NOMBRE VARCHAR(50) NOT NULL,
    DESCRIPCION VARCHAR(255) NOT NULL,
    CATEGORIA_PADRE INT,
    FOREIGN KEY (CATEGORIA_PADRE) REFERENCES CATEGORIAS(ID_CATEGORIA)
);

CREATE TABLE PRODUCTOS (
    ID_PRODUCTO INT PRIMARY KEY AUTO_INCREMENT,
    NOMBRE VARCHAR(100) NOT NULL,
    DESCRIPCION VARCHAR(2000) NOT NULL,
    PRECIO DECIMAL(10,2) NOT NULL,
    PRECIO_DESCUENTO DECIMAL(10,2),
    CARACTERISTICAS VARCHAR(500) NOT NULL,
    DESTACADO BOOLEAN NOT NULL,
    NOVEDAD BOOLEAN NOT NULL,
    VECES_VENDIDO INT NOT NULL DEFAULT 0,
    FOTO VARCHAR(255) NOT NULL,
    ID_CATEGORIA INT NOT NULL,
    FOREIGN KEY (ID_CATEGORIA) REFERENCES CATEGORIAS(ID_CATEGORIA)
);

CREATE TABLE PEDIDOS (
    ID_PEDIDO INT PRIMARY KEY AUTO_INCREMENT,
    FECHA_HORA DATETIME NOT NULL,
    FECHA_ENTREGA DATE NOT NULL,
    DIRECCION VARCHAR(255) NOT NULL,
    ID_CLIENTE INT NOT NULL,
    ESTADO ENUM('Entregado', 'En reparto', 'Procesando') NOT NULL,
    FOREIGN KEY (ID_CLIENTE) REFERENCES USUARIOS(ID_CLIENTE)
);

CREATE TABLE LINEA_PEDIDO (
    ID_LINEA INT PRIMARY KEY AUTO_INCREMENT,
    ID_PEDIDO INT NOT NULL,
    ID_PRODUCTO INT NOT NULL,
    CANTIDAD INT NOT NULL,
    PRECIO_UNIDAD DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (ID_PEDIDO) REFERENCES PEDIDOS(ID_PEDIDO),
    FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTOS(ID_PRODUCTO)
);

CREATE TABLE OPINIONES (
    ID_OPINION INT PRIMARY KEY AUTO_INCREMENT,
    VALORACION INT CHECK (VALORACION BETWEEN 1 AND 10),
    FECHA_HORA DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    COMENTARIO VARCHAR(300),
    ID_CLIENTE INT NOT NULL,
    ID_PRODUCTO INT NOT NULL,
    FOREIGN KEY (ID_CLIENTE) REFERENCES USUARIOS(ID_CLIENTE),
    FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTOS(ID_PRODUCTO)
);

CREATE TABLE MENSAJES (
    ID_MENSAJE INT PRIMARY KEY AUTO_INCREMENT,
    CORREO_ELECTRONICO VARCHAR(100) NOT NULL,
    DESCRIPCION VARCHAR(1500) NOT NULL,
    NOMBRE VARCHAR(100) NOT NULL,
    MOTIVO_CONTACTO VARCHAR(255) NOT NULL,
    NUMERO_PEDIDO INT
);



-- Categorías principales
INSERT INTO CATEGORIAS (NOMBRE, DESCRIPCION, CATEGORIA_PADRE) VALUES
('Componentes', 'Partes internas para ensamblar y mejorar ordenadores.', NULL),
('Ordenadores', 'Equipos de computación para uso personal y profesional.', NULL),
('Sonido', 'Equipos de audio, micrófonos y sistemas de sonido.', NULL),
('Periféricos', 'Dispositivos adicionales para ordenadores y otros equipos.', NULL);

-- Subcategorías de Componentes
INSERT INTO CATEGORIAS (NOMBRE, DESCRIPCION, CATEGORIA_PADRE) VALUES
('Placas Base', 'Placas base para la instalación de componentes.', 1),
('Procesadores', 'Unidades centrales de procesamiento para ordenadores.', 1),
('Memoria RAM', 'Memoria de acceso aleatorio para equipos informáticos.', 1),
('Tarjetas Gráficas', 'Tarjetas para la salida de video y gráficos de alta calidad.', 1),
('Fuentes de Alimentación', 'Dispositivos para convertir energía eléctrica para el funcionamiento de los ordenadores.', 1),
('Refrigeración', 'Sistemas para enfriar componentes del ordenador, como CPU y GPU.', 1);

-- Subcategorías de Ordenadores
INSERT INTO CATEGORIAS (NOMBRE, DESCRIPCION, CATEGORIA_PADRE) VALUES
('Portátiles', 'Ordenadores portátiles de diversas especificaciones.', 2),
('Sobremesa', 'Ordenadores de escritorio para uso personal y profesional.', 2),
('Estaciones de Trabajo', 'Ordenadores especializados para tareas profesionales y de alto rendimiento.', 2),
('All-in-One', 'Computadoras todo en uno, integradas en una sola pantalla.', 2),
('Mini PCs', 'Ordenadores compactos y de bajo consumo.', 2);

-- Subcategorías de Sonido
INSERT INTO CATEGORIAS (NOMBRE, DESCRIPCION, CATEGORIA_PADRE) VALUES
('Altavoces', 'Dispositivos de audio para la emisión de sonido.', 3),
('Micrófonos', 'Dispositivos para la captura de sonido.', 3),
('Auriculares', 'Dispositivos de audio para escuchar música o comunicarte.', 3),
('Amplificadores', 'Equipos para aumentar la señal de audio.', 3),
('Sistemas de Home Theater', 'Equipos de sonido y video para cine en casa.', 3),
('Interfaces de Audio', 'Dispositivos que permiten la conexión entre instrumentos y ordenadores.', 3);

-- Subcategorías de Periféricos
INSERT INTO CATEGORIAS (NOMBRE, DESCRIPCION, CATEGORIA_PADRE) VALUES
('Teclados', 'Dispositivos para la entrada de datos en ordenadores y otros equipos.', 4),
('Ratones', 'Dispositivos de entrada para la manipulación del puntero en el sistema.', 4),
('Mouses Gaming', 'Ratones diseñados específicamente para juegos, con sensores de alta precisión.', 4);


-- Productos de Componentes

-- Placas Base
INSERT INTO PRODUCTOS (NOMBRE, DESCRIPCION, PRECIO, PRECIO_DESCUENTO, CARACTERISTICAS, DESTACADO, NOVEDAD, FOTO, ID_CATEGORIA) VALUES
('Gigabyte B550 AORUS Elite', 'Placa base ATX con chipset B550, compatible con procesadores AMD Ryzen, ofrece múltiples puertos USB y ranuras PCIe.', 120.00, 109.99, 'Chipset B550, soporte para PCIe 4.0, diseño de alimentación robusto.', TRUE, FALSE, 'https://m.media-amazon.com/images/I/81eMNsNlSAL._AC_UF894,1000_QL80_.jpg', 5),
('MSI MAG B550 TOMAHAWK', 'Placa base ATX con chipset B550, diseñada para gaming, soporte para overclocking y audio de alta definición.', 110.00, NULL, 'Diseño térmico avanzado, soporte para Wi-Fi 6, múltiples puertos USB 3.2.', TRUE, FALSE, 'https://ultimainformatica.com/2421417/msi-mag-b550-tomahawk-amd-b550-zocalo-am4-atx.jpg', 5),
('ASUS ROG Strix B550-F Gaming', 'Placa base ATX con chipset B550, enfocada en gamers, con iluminación RGB y conectividad Wi-Fi 6.', 130.00, NULL, 'Iluminación Aura Sync RGB, soporte para PCIe 4.0, diseño de alimentación de 12+2 fases.', TRUE, FALSE, 'https://thumb.pccomponentes.com/w-530-530/articles/29/299957/4260-asus-rog-strix-b550-f-gaming-especificaciones.jpg', 5),
('ASRock B550M Pro4', 'Placa base micro-ATX con chipset B550, ofrece una buena relación calidad-precio para sistemas de gama media.', 90.00, 79.99, 'Soporte para RAM de alta frecuencia, múltiples salidas de video, diseño compacto.', TRUE, FALSE, 'https://mercadoactual.es/295599-large_default/asrock-b550m-pro4-zocalo-am4-micro-atx-amd-b550-90-mxbdk0-a0uayz.jpg', 5),
('MSI MAG Z890 TOMAHAWK WIFI', 'Placa base ATX con chipset Intel Z890, preparada para inteligencia artificial, soporte para DDR5 y múltiples opciones de almacenamiento.', 150.00, 139.99, 'Chipset Z890, soporte para DDR5 hasta 256 GB, conectividad Wi-Fi 7.', TRUE, TRUE, 'https://thumb.pccomponentes.com/w-530-530/articles/1085/10856521/3348-msi-mag-z890-tomahawk-wifi-mejor-precio.jpg', 5);

-- Procesadores
INSERT INTO PRODUCTOS (NOMBRE, DESCRIPCION, PRECIO, PRECIO_DESCUENTO, CARACTERISTICAS, DESTACADO, NOVEDAD, FOTO, ID_CATEGORIA) VALUES
('AMD Ryzen 5 5600X', 'Procesador de 6 núcleos y 12 hilos, ideal para gaming y tareas multitarea.', 200.00, 180.99, 'Arquitectura Zen 3, frecuencia base de 3.7 GHz, desbloqueado para overclocking.', TRUE, FALSE, 'https://m.media-amazon.com/images/I/51D1zTXIxjL.jpg', 6),
('Intel Core i7-11700K', 'Procesador de 8 núcleos y 16 hilos, ofrece un rendimiento sólido en aplicaciones y juegos.', 300.00, NULL, 'Arquitectura Rocket Lake, frecuencia base de 3.6 GHz, soporte para PCIe 4.0.', TRUE, FALSE, 'https://img.pccomponentes.com/articles/36/362354/123-intel-core-i7-11700k-35-ghz.jpg', 6),
('AMD Ryzen 7 5800X', 'Procesador de 8 núcleos y 16 hilos, excelente para tareas intensivas y gaming.', 400.00, 355.56, 'Arquitectura Zen 3, frecuencia base de 3.8 GHz, desbloqueado para overclocking.', TRUE, FALSE, 'https://img.pccomponentes.com/articles/32/328473/168-amd-ryzen-7-5800x-38ghz.jpg', 6),
('Intel Core i9-11900K', 'Procesador de 8 núcleos y 16 hilos, ofrece un rendimiento superior en todas las aplicaciones.', 500.00, NULL, 'Arquitectura Rocket Lake, frecuencia base de 3.5 GHz, soporte para PCIe 4.0.', TRUE, FALSE, 'https://m.media-amazon.com/images/I/71diouNMRHL.jpg', 6),
('AMD Ryzen 9 7900X', 'Procesador de 12 núcleos y 24 hilos, diseñado para entusiastas y profesionales.', 700.00, 642.25, 'Arquitectura Zen 4, frecuencia base de 3.8 GHz, soporte para PCIe 5.0.', TRUE, TRUE, 'https://m.media-amazon.com/images/I/51OEiWrUtqL._AC_UF894,1000_QL80_.jpg', 6);

-- Memoria RAM
INSERT INTO PRODUCTOS (NOMBRE, DESCRIPCION, PRECIO, PRECIO_DESCUENTO, CARACTERISTICAS, DESTACADO, NOVEDAD, FOTO, ID_CATEGORIA) VALUES
('Corsair Vengeance LPX 16GB (2x8GB) DDR4 3200MHz', 'Kit de memoria RAM de alto rendimiento, ideal para gaming y multitarea.', 80.00, 59.99, 'Perfil bajo, disipadores de calor de aluminio, XMP 2.0.', TRUE, FALSE, 'https://img.pccomponentes.com/articles/26/262822/corsair-vengeance-lpx-ddr4-3200-pc4-25600-16gb-2x8gb-cl16-negro.jpg', 7),
('G.Skill Ripjaws V 16GB (2x8GB) DDR4 3600MHz', 'Memoria RAM rápida y confiable, perfecta para sistemas de alto rendimiento.', 90.00, NULL, 'Diseño compacto, soporte para XMP 2.0, voltaje de 1.35V.', TRUE, FALSE, 'https://thumb.pccomponentes.com/w-530-530/articles/60/608183/1800-gskill-ripjaws-v-ddr4-3600mhz-16gb-2x8gb-cl16.jpg', 7),
('Kingston HyperX Fury 16GB (2x8GB) DDR4 2666MHz', 'Memoria RAM de calidad, ofrece estabilidad y velocidad en aplicaciones exigentes.', 70.00, 61.99, 'Diseño de perfil bajo, plug and play, soporte para XMP.', TRUE, FALSE, 'https://img.pccomponentes.com/articles/23/233969/hyperx-fury-ddr4-9-fan-kit-of-2.jpg', 7),
('Crucial Ballistix 16GB (2x8GB) DDR4 3200MHz', 'Memoria RAM de alto rendimiento, diseñada para entusiastas y gamers.', 85.00, 80.00, 'Disipadores de calor integrados, soporte para XMP 2.0, voltaje de 1.35V.', TRUE, FALSE, 'https://img.pccomponentes.com/articles/27/275675/crucial-ballistix-3200-ddr4-16gb-2x8gb-cl16-negro.jpg',7);

-- Fuentes de Alimentación
INSERT INTO PRODUCTOS (NOMBRE, DESCRIPCION, PRECIO, PRECIO_DESCUENTO, CARACTERISTICAS, DESTACADO, NOVEDAD, FOTO, ID_CATEGORIA) VALUES
('Corsair RM750x', 'Fuente de alimentación de 750W con certificación 80 Plus Gold, modular y silenciosa.', 120.00, 99.99, 'Certificación 80 Plus Gold, cables modulares, ventilador de 135mm con modo de bajo ruido.', TRUE, FALSE, 'https://img.pccomponentes.com/articles/39/390900/19-corsair-rmx-series-rm750x-750w-80-plus-gold-modular.jpg', 9),
('EVGA SuperNOVA 650 G5', 'Fuente de 650W con certificación 80 Plus Gold, compacta y eficiente.', 100.00, NULL, 'Certificación 80 Plus Gold, diseño compacto, cables modulares.', TRUE, FALSE, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1bTkhax746RVQNCTNM9eazQG7agGuHgU-mw&s', 9),
('Seasonic Focus GX-850', 'Fuente de 850W con certificación 80 Plus Gold, compacta y eficiente.', 130.00, 120.63, 'Certificación 80 Plus Gold, diseño compacto, cables modulares.', TRUE, FALSE, 'https://img.caseking.es/products/FOCUS-GX-850-V4.jpg', 9),
('MSI MAG A650BN', 'Fuente de alimentación de 650W con certificación 80 Plus Bronze, confiable y económica.', 80.00, NULL, 'Certificación 80 Plus Bronze, diseño compacto, cables no modulares.', TRUE, FALSE, 'https://m.media-amazon.com/images/I/81eLlIQ5PsL._AC_UF1000,1000_QL80_.jpg', 9),
('Gigabyte P850GM', 'Fuente de 850W con certificación 80 Plus Gold, confiable y eficiente.', 110.00, NULL, 'Certificación 80 Plus Gold, diseño compacto, cables modulares.', TRUE, FALSE, 'https://gfx3.senetic.com/akeneo-catalog/1/e/0/5/1e055821b8fc0cbc0b5505534cadbd5f6a2e8912_1627581_GP_P850GM_image3.jpg', 9);

-- Refrigeración
INSERT INTO PRODUCTOS (NOMBRE, DESCRIPCION, PRECIO, PRECIO_DESCUENTO, CARACTERISTICAS, DESTACADO, NOVEDAD, FOTO, ID_CATEGORIA) VALUES
('Noctua NH-D15', 'Sistema de refrigeración por aire de alto rendimiento, con dos ventiladores NF-A15.', 90.00, NULL, 'Diseño de doble torre, compatibilidad con múltiples sockets, ventiladores silenciosos.', TRUE, FALSE, 'https://m.media-amazon.com/images/I/91t48GBv8TL.jpg', 10),
('Corsair iCUE H100i Elite Capellix', 'Sistema de refrigeración líquida AIO de 240mm, con iluminación RGB.', 150.00, 130.52, 'Radiador de 240mm, bombas de alta eficiencia, iluminación RGB dinámica.', TRUE, FALSE, 'https://m.media-amazon.com/images/I/71Z5ZUesKfL.jpg', 10),
('Cooler Master Hyper 212 EVO', 'Refrigerador por aire de 4 tubos de calor, conocido por su rendimiento y precio accesible.', 50.00, 29.99, 'Diseño de 4 heatpipes, ventilador de 120mm, compatible con múltiples sockets.', TRUE, FALSE, 'https://img.pccomponentes.com/articles/4/46452/cooler-master-hyper-212-evo.jpg', 10),
('NZXT Kraken Z73', 'Refrigeración líquida AIO de 360mm, con pantalla LCD personalizada.', 200.00, NULL, 'Radiador de 360mm, pantalla LCD de 2.77", iluminación RGB.', TRUE, FALSE, 'https://m.media-amazon.com/images/I/71xtDBbXZyL.jpg', 10),
('be quiet! Dark Rock Pro 4', 'Sistema de refrigeración por aire de alto rendimiento, con diseño silencioso.', 110.00, 100.00, 'Diseño de doble torre, ventiladores silenciosos, alta capacidad de enfriamiento.', TRUE, FALSE, 'https://img.pccomponentes.com/articles/26/264413/be-quiet-dark-rock-pro-tr4.jpg', 10);


-- Tarjetas Gráficas
INSERT INTO PRODUCTOS (NOMBRE, DESCRIPCION, PRECIO, PRECIO_DESCUENTO, CARACTERISTICAS, DESTACADO, NOVEDAD, FOTO, ID_CATEGORIA) VALUES
('NVIDIA GeForce RTX 3080', 'Tarjeta gráfica de alto rendimiento para gaming en 4K y aplicaciones de inteligencia artificial.', 699.00, 610.22, 'Arquitectura Ampere, 10 GB GDDR6X, soporte para Ray Tracing y DLSS.', TRUE, TRUE, 'https://img.pccomponentes.com/articles/51/514403/1873-gigabyte-geforce-rtx-3080-gaming-oc-v2-10gb-gddr6x.jpg', 8),
('AMD Radeon RX 6800 XT', 'Tarjeta gráfica de alto rendimiento para gaming en 4K, con soporte para Ray Tracing.', 649.00, NULL, 'Arquitectura RDNA 2, 16 GB GDDR6, soporte para FidelityFX y Ray Tracing.', TRUE, TRUE, 'https://thumb.pccomponentes.com/w-530-530/articles/34/346794/1191-gigabyte-amd-radeon-rx-6800-xt-gaming-oc-16gb-gddr6.jpg', 8),
('NVIDIA GeForce RTX 3070', 'Tarjeta gráfica de alto rendimiento para gaming en 1440p y 4K, con soporte para Ray Tracing.', 499.00, 430.99, 'Arquitectura Ampere, 8 GB GDDR6, soporte para Ray Tracing y DLSS.', TRUE, TRUE, 'https://m.media-amazon.com/images/I/61XC1vb1HFL._AC_UF894,1000_QL80_.jpg', 8),
('AMD Radeon RX 6700 XT', 'Tarjeta gráfica de rendimiento medio-alto para gaming en 1440p, con soporte para Ray Tracing.', 479.00, NULL, 'Arquitectura RDNA 2, 12 GB GDDR6, soporte para FidelityFX y Ray Tracing.', TRUE, TRUE, 'https://img.pccomponentes.com/articles/36/364293/1107-gigabyte-amd-radeon-rx-6700-xt-gaming-oc-12gb-gddr6.jpg', 8),
('NVIDIA GeForce GTX 1660 Super', 'Tarjeta gráfica de rendimiento medio para gaming en 1080p, sin soporte para Ray Tracing.', 229.00, 200.00, 'Arquitectura Turing, 6 GB GDDR5, rendimiento sólido en títulos modernos.', TRUE, FALSE, 'https://m.media-amazon.com/images/I/617rsivczxL.jpg', 8);

-- Portátiles
INSERT INTO PRODUCTOS (NOMBRE, DESCRIPCION, PRECIO, PRECIO_DESCUENTO, CARACTERISTICAS, DESTACADO, NOVEDAD, FOTO, ID_CATEGORIA) VALUES
('HP Pavilion x360 14-dh0004ns', 'Ordenador portátil convertible táctil de 14 pulgadas con procesador Intel Core i5 y 8 GB de RAM.', 699.00, 600.00, 'Pantalla táctil Full HD, diseño convertible 2 en 1, almacenamiento SSD de 512 GB.', TRUE, TRUE, 'https://thumb.pccomponentes.com/w-530-530/articles/23/235661/5.jpg', 11),
('MEDION E3221', 'Ordenador portátil convertible táctil de 13.3 pulgadas con procesador Intel y 4 GB de RAM.', 499.00, 459.99, 'Pantalla táctil Full HD, diseño convertible, almacenamiento SSD de 256 GB.', TRUE, TRUE, 'https://m.media-amazon.com/images/I/71N7iJbf1OL.jpg', 11),
('Lenovo IdeaPad Slim 3', 'Portátil de 15.6 pulgadas con procesador Intel Core i7, 16 GB de RAM y 512 GB SSD.', 799.00, 740.25, 'Pantalla Full HD, teclado ergonómico, diseño delgado y ligero.', TRUE, TRUE, 'https://cdn.grupoelcorteingles.es/SGFM/dctm/MEDIA03/202407/30/00115215599836____6__1200x1200.jpg', 11),
('Dell Inspiron 14 5000', 'Portátil de 14 pulgadas con procesador AMD Ryzen 5, 8 GB de RAM y 512 GB SSD.', 650.00, NULL, 'Pantalla Full HD, diseño compacto, múltiples puertos USB.', TRUE, FALSE, 'https://m.media-amazon.com/images/I/41kn9QdTGhL._AC_UF894,1000_QL80_.jpg', 11),
('Acer Swift 3', 'Portátil ultradelgado de 14 pulgadas con procesador Intel Core i5, 8 GB de RAM y 512 GB SSD.', 700.00, NULL, 'Pantalla Full HD, diseño metálico, larga duración de batería.', TRUE, FALSE, 'https://m.media-amazon.com/images/I/51CyZhzk0bL._AC_UF894,1000_QL80_.jpg', 11);

-- Sobremesa
INSERT INTO PRODUCTOS (NOMBRE, DESCRIPCION, PRECIO, PRECIO_DESCUENTO, CARACTERISTICAS, DESTACADO, NOVEDAD, FOTO, ID_CATEGORIA) VALUES
('Medion S06 MD35300', 'Mini PC con procesador Intel Core i5-1335U, 16 GB de RAM y 512 GB SSD.', 399.00, 333.33, 'Diseño compacto, múltiples puertos USB, ideal para espacios reducidos.', TRUE, TRUE, 'https://www.alternate.es/p/600x600/8/9/Medion_S06__MD35300___Mini_PC_@@100095798.jpg', 12),
('Medion T80 MD35423', 'Ordenador de sobremesa con procesador Intel Core i5, 16 GB de RAM y 512 GB SSD.', 499.00, 450.66, 'Diseño elegante, conectividad Wi-Fi 6E, Windows 11 Home preinstalado.', TRUE, TRUE, 'https://img.pccomponentes.com/articles/1085/10856853/1296-medion-akoya-t80-md35423-intel-core-i5-12450h-16gb-512gb-ssd.jpg', 12),
('HP Pavilion Desktop TP01-2000', 'Ordenador de sobremesa con procesador Intel Core i7, 16 GB de RAM y 1 TB HDD.', 800.00, NULL, 'Diseño compacto, múltiples puertos USB, Windows 10 preinstalado.', TRUE, FALSE, 'https://thumb.pccomponentes.com/w-530-530/articles/51/513467/1836-hp-pavilion-desktop-tp01-2000ns-intel-core-i5-11400-16gb-1tb-ssd.jpg', 12),
('Dell OptiPlex 3080', 'PC de sobremesa empresarial con procesador Intel Core i5, 8 GB de RAM y 256 GB SSD.', 600.00, 555.55, 'Diseño compacto, eficiencia energética, ideal para entornos corporativos.', TRUE, FALSE, 'https://m.media-amazon.com/images/I/712xIBmcM8L.jpg', 12);

-- Estaciones de Trabajo
INSERT INTO PRODUCTOS (NOMBRE, DESCRIPCION, PRECIO, PRECIO_DESCUENTO, CARACTERISTICAS, DESTACADO, NOVEDAD, FOTO, ID_CATEGORIA) VALUES
('Dell Precision 5550', 'Estación de trabajo móvil con pantalla de 15.6 pulgadas, procesador Intel Xeon y 32 GB de RAM.', 1800.00, 1752.99, 'Gráficos profesionales NVIDIA Quadro, almacenamiento SSD de 1 TB.', TRUE, TRUE, 'https://m.media-amazon.com/images/I/71+1-0cMx+S.jpg', 13),
('HP ZBook Fury 15 G7', 'Estación de trabajo móvil con pantalla de 15.6 pulgadas, procesador AMD Ryzen 7 y 16 GB de RAM.', 1600.00, 1500.33, 'Gráficos AMD Radeon Pro, almacenamiento SSD de 512 GB.', TRUE, TRUE, 'https://img.pccomponentes.com/articles/51/514769/1291-hp-zbook-fury-15-g7-intel-core-i7-10750h-16gb-512gb-ssd-quadro-rtx-3000-156.jpg', 13),
('Lenovo ThinkPad P15', 'Estación de trabajo móvil con pantalla de 15.6 pulgadas, procesador Intel Core i9 y 32 GB de RAM.', 2000.00, NULL, 'Gráficos NVIDIA Quadro RTX, almacenamiento SSD de 1 TB.', TRUE, TRUE, 'https://thumb.pccomponentes.com/w-530-530/articles/1055/10555554/1209-lenovo-thinkpad-p15-g2-intel-core-i7-11800h-16gb-512gb-ssd-156.jpg', 13),
('Dell Precision 5820', 'Estación de trabajo de sobremesa con procesador Intel Xeon, 64 GB de RAM y 1 TB SSD.', 2500.00, 2250.50, 'Gráficos profesionales AMD Radeon Pro, múltiples puertos de expansión.', TRUE, TRUE, 'https://m.media-amazon.com/images/I/61GikivRz0L.jpg', 13);

-- All-in-One
INSERT INTO PRODUCTOS (NOMBRE, DESCRIPCION, PRECIO, PRECIO_DESCUENTO, CARACTERISTICAS, DESTACADO, NOVEDAD, FOTO, ID_CATEGORIA) VALUES
('Lenovo IdeaCentre AIO 3', 'Ordenador todo en uno con pantalla de 23.8 pulgadas, procesador AMD Ryzen 5, 8 GB de RAM y 512 GB SSD.', 650.00, NULL, 'Diseño compacto, almacenamiento SSD rápido, ideal para espacios reducidos.', TRUE, TRUE, 'https://m.media-amazon.com/images/I/61zvt8mdIvL.jpg', 14),
('Dell Inspiron 7700 AIO', 'Ordenador todo en uno con pantalla táctil de 27 pulgadas, procesador Intel Core i7-1165G7, 32 GB de RAM y 2 TB SSD.', 1800.00, 1666.99, 'Diseño elegante, alto rendimiento, ideal para entretenimiento y productividad.', TRUE, TRUE, 'https://m.media-amazon.com/images/I/7114FkorW6L.jpg', 14),
('HP OmniStudio X AIO', 'Ordenador todo en uno con pantalla de 31.5 pulgadas, procesador Intel Core Ultra 200V, 16 GB de RAM y 1 TB SSD.', 2000.00, 1999.99, 'Pantalla 4K con HDR, múltiples puertos, soporte para Wi-Fi 7.', TRUE, TRUE, 'https://www.hp.com/es-es/shop/Html/Merch/Images/c09011679_1750x1285.jpg', 14),
('Slimbook Curve AIO', 'Ordenador todo en uno con pantalla curva de 24 pulgadas, procesador AMD Ryzen 5, 8 GB de RAM y 512 GB SSD.', 700.00, 666.33, 'Diseño moderno, rendimiento eficiente, compatible con sistemas GNU/Linux.', TRUE, TRUE, 'https://slimbook.com/web/image/4095/01-2.jpg', 14),
('Apple iMac 24"', 'Ordenador todo en uno con pantalla Retina 4.5K de 24 pulgadas, procesador M1, 8 GB de RAM y 256 GB SSD.', 1300.00, 1253.22, 'Diseño delgado, colores vibrantes, ideal para tareas creativas.', TRUE, TRUE, 'https://m.media-amazon.com/images/I/51ESPOx75AL.jpg', 14);

-- Mini PCs
INSERT INTO PRODUCTOS (NOMBRE, DESCRIPCION, PRECIO, PRECIO_DESCUENTO, CARACTERISTICAS, DESTACADO, NOVEDAD, FOTO, ID_CATEGORIA) VALUES
('GMKtec Mini PC', 'Mini PC con procesador AMD Ryzen 7 7735HS, 16 GB de RAM y 512 GB SSD.', 900.00, NULL, 'Diseño compacto, múltiples puertos, ideal para entretenimiento y productividad.', TRUE, TRUE, 'https://m.media-amazon.com/images/I/71pPJTIqYEL.jpg', 15),
('Slimbook One', 'Mini PC con procesador Intel Core i5, 8 GB de RAM y 256 GB SSD.', 500.00, 489.99, 'Compatible con sistemas GNU/Linux, diseño silencioso, bajo consumo energético.', TRUE, TRUE, 'https://i.blogs.es/66409f/slimbook-one-4/1366_2000.jpeg', 15),
('Apple Mac Studio', 'Mini PC con chip M4 Max, 36 GB de RAM y 512 GB SSD.', 2500.00, NULL, 'Alto rendimiento, múltiples puertos, ideal para profesionales creativos.', TRUE, TRUE, 'https://thumb.pccomponentes.com/w-530-530/articles/1085/10857148/3559-apple-mac-studio-apple-m2-max-32gb-30-core-gpu-2tb-ssd-opiniones.jpg', 15),
('HP Z2 Mini G1a', 'Mini PC con procesador AMD Ryzen AI Max Plus Pro, 16 GB de RAM y 512 GB SSD.', 800.00, 780.25, 'Diseño compacto, soporta hasta cuatro monitores 4K, múltiples puertos.', TRUE, TRUE, 'https://cdn.mos.cms.futurecdn.net/RRcShsQyqtSqsTWmnACsYn.jpg', 15),
('Intel NUC 11', 'Mini PC con procesador Intel Core i7, 8 GB de RAM y 256 GB SSD.', 600.00, 543.21, 'Diseño pequeño, fácil de montar, ideal para espacios reducidos.', TRUE, TRUE, 'https://m.media-amazon.com/images/I/61MpHpS2LKL.jpg', 15);

-- Altavoces
INSERT INTO PRODUCTOS (NOMBRE,DESCRIPCION,PRECIO,PRECIO_DESCUENTO,CARACTERISTICAS,DESTACADO,NOVEDAD,FOTO,ID_CATEGORIA) VALUES
('Altavoz Bluetooth 5.3 RIENOK','Altavoz inalámbrico portátil con Bluetooth 5.3, impermeable IPX7, sonido estéreo, compatible con Micro SD y AUX.',38.99,33.99,'Bluetooth 5.3, Impermeable IPX7, Sonido Estéreo, Compatible con Micro SD y AUX',TRUE,TRUE,'https://m.media-amazon.com/images/I/818PH+QIfdL._AC_UF1000,1000_QL80_.jpg',16),
('Altavoz Bluetooth Sony SRS-XB100','Altavoz inalámbrico portátil resistente al agua y al polvo IP67, hasta 16 horas de batería, con correa adaptable.',64.99,39.90,'Resistente al agua y polvo IP67, Hasta 16 horas de batería, Correa adaptable',TRUE,TRUE,'https://m.media-amazon.com/images/I/71r5EgruzPL.jpg',16),
('Altavoz Bluetooth Tronsmart Mirtune C2','Altavoz portátil con Bluetooth 5.3, luces LED de colores, 24 horas de reproducción, impermeable IPX7, sonido estéreo 360°.',39.99,26.99,'Bluetooth 5.3, Luces LED de colores, 24 horas de reproducción, Impermeable IPX7, Sonido estéreo 360°',TRUE,TRUE,'https://m.media-amazon.com/images/I/81XXiWWAwrL.jpg',16),
('Altavoz Bluetooth TPBEAT 80W Party','Altavoz inalámbrico portátil de 80W, con luces, supergraves, estéreo TWS de alto volumen de 100 dB, ideal para fiestas y camping.',67.99,67.99,'80W de potencia, Luces integradas, Supergraves, Estéreo TWS, Alto volumen de 100 dB',TRUE,TRUE,'https://m.media-amazon.com/images/I/71iXrvgQazL.jpg',16),
('Altavoz Bluetooth Vieta Pro Thunder','Altavoz portátil con Bluetooth y radio FM, diseño robusto y sonido potente, ideal para exteriores.',79.99,69.99,'Bluetooth, Radio FM, Diseño robusto, Sonido potente, Ideal para exteriores',TRUE,TRUE,'https://m.media-amazon.com/images/I/81uvZLCPIAL._AC_UF894,1000_QL80_.jpg',16);

-- Micrófonos
INSERT INTO PRODUCTOS (NOMBRE, DESCRIPCION, PRECIO, PRECIO_DESCUENTO, CARACTERISTICAS, DESTACADO, NOVEDAD, FOTO, ID_CATEGORIA) VALUES
('Behringer XM 1800S', 'Pack de tres micrófonos dinámicos ideales para presentaciones y grabaciones.', 69.00, NULL, 'Respuesta de frecuencia amplia, incluye soportes y estuches.', TRUE, TRUE, 'https://r2.gear4music.com/media/20/203921/600/preview.jpg', 17),
('Micrófono de condensador USB Samson Meteor', 'Micrófono compacto con conexión USB, ideal para grabaciones en casa y podcasts.', 99.00, NULL, 'Patrón polar cardioide, incluye trípode y funda.', TRUE, TRUE, 'https://m.media-amazon.com/images/I/613HqwOQvrL._AC_UF894,1000_QL80_.jpg', 17),
('Micrófono Lavalier Boya BY-M1', 'Micrófono de solapa con conexión TRRS, compatible con smartphones y cámaras.', 20.00, NULL, 'Cable de 6 metros, incluye clip y batería.', TRUE, TRUE, 'https://m.media-amazon.com/images/I/81W-jJSn+RL.jpg', 17),
('Micrófono de mano Shure SM58', 'Micrófono dinámico legendario, ideal para voz en vivo y grabaciones.', 110.00, NULL, 'Construcción robusta, incluye soporte.', TRUE, TRUE, 'https://www.avisualpro.es/wp-content/uploads/2019/12/microfono-inalambrico-de-mano-shure-blx24sm58.jpg', 17),
('Micrófono de estudio Audio-Technica AT2020', 'Micrófono de condensador de diafragma grande, perfecto para grabaciones profesionales.', 150.00, NULL, 'Respuesta en frecuencia amplia, incluye soporte de choque.', TRUE, TRUE, 'https://m.media-amazon.com/images/I/8141LnNft+L.jpg', 17);

-- Auriculares
INSERT INTO PRODUCTOS (NOMBRE, DESCRIPCION, PRECIO, PRECIO_DESCUENTO, CARACTERISTICAS, DESTACADO, NOVEDAD, FOTO, ID_CATEGORIA) VALUES
('JBL Tour Pro 3', 'Auriculares inalámbricos con pantalla táctil en el estuche, calidad de sonido HiRes y cancelación activa de ruido.', 249.00, NULL, 'Hasta 44 horas de autonomía, personalización a través de la aplicación JBL Headphones.', TRUE, TRUE, 'https://m.media-amazon.com/images/I/714sFhPUErL.jpg', 18),
('LG Xboom Buds', 'Auriculares diseñados en colaboración con Will.I.Am, ofreciendo sonido rico y envolvente con cancelación activa de ruido.', 99.00, NULL, 'Drivers de grafeno, resistencia al agua IPX4, hasta 30 horas de autonomía.', TRUE, TRUE, 'https://www.lg.com/content/dam/channel/wcms/es/productos/he/2024/xboom-buds/xboom-buds-black/lgcom/gallery/09_lg_BUDS.AEUSLBK_gallery_main_2010x1334.jpg/_jcr_content/renditions/thum-1600x1062.jpeg', 18),
('Auriculares Bluetooth Bose QuietComfort 35 II', 'Auriculares inalámbricos con cancelación activa de ruido, ideales para viajes y uso diario.', 299.00, NULL, 'Hasta 20 horas de autonomía, integración con asistentes virtuales.', TRUE, TRUE, 'https://m.media-amazon.com/images/I/61vLkmni80L.jpg', 18),
('Auriculares Gaming HyperX Cloud II', 'Auriculares diseñados para gamers, con sonido envolvente 7.1 y micrófono con cancelación de ruido.', 80.00, 75.33, 'Diseño cómodo, compatible con PC, PS4 y Xbox.', TRUE, TRUE, 'https://m.media-amazon.com/images/I/71ltsViEA8L._AC_UF894,1000_QL80_.jpg', 18),
('Auriculares Deportivos Sony WF-SP800N', 'Auriculares inalámbricos con resistencia al agua IP55 y cancelación de ruido, ideales para entrenamientos.', 130.00, 111.36, 'Hasta 9 horas de autonomía, modos de sonido personalizables.', TRUE, TRUE, 'https://m.media-amazon.com/images/I/51PKoQkiCPS.jpg', 18);

-- Amplificadores
INSERT INTO PRODUCTOS (NOMBRE, DESCRIPCION, PRECIO, PRECIO_DESCUENTO, CARACTERISTICAS, DESTACADO, NOVEDAD, FOTO, ID_CATEGORIA) VALUES
('AMPLIFICADOR ST 1000W AMERICAN S BT-USB-SD-FM', 'Amplificador de 1000W con conectividad Bluetooth, USB, SD y radio FM.', 150.00, 145.99, 'Diseño compacto, múltiples entradas, ideal para eventos y fiestas.', TRUE, TRUE, 'https://electronicasannicolas.com.co/wp-content/uploads/2022/02/AMPLIFICADOR-ST-1000W-AMERICAN-S-BT-USB-SD-FM-8821-1.png', 19),
('Fender Mustang GTX100', 'Amplificador de guitarra de 100W con modelado digital y pantalla táctil.', 500.00, 499.99, 'Diversos efectos integrados, conectividad Wi-Fi, diseño moderno.', TRUE, TRUE, 'https://www.malaga8.com/684-large_default/fender-mustang-gtx100-p-34012.jpg', 19),
('Denon AVR-X3700H', 'Receptor AV de 9.2 canales con soporte para 8K, Dolby Atmos y DTS:X.', 1000.00, NULL, 'Amplia conectividad, compatibilidad con sistemas de cine en casa avanzados.', TRUE, TRUE, 'https://multiaudiopro.com/wp-content/uploads/2020/11/DENON-AVR-X3700H-5.jpg', 19),
('Yamaha RX-V6A', 'Receptor AV de 7.2 canales con soporte para 8K, Dolby Atmos y MusicCast.', 800.00, 725.33, 'Diseño compacto, múltiples opciones de streaming, fácil configuración.', TRUE, TRUE, 'https://www.studio-22.com/media/catalog/product/cache/12fa7689a1bdacbd245579173709854d/0/1/01-rx-v6a-bl-ic_e58058c46a22e068fe2658fbc9b61bb7_1_.jpg', 19),
('Sony STR-DN1080', 'Receptor AV de 7.2 canales con soporte para Dolby Atmos, DTS:X y 4K HDR.', 700.00, 690.05, 'Tecnología de calibración automática, múltiples entradas HDMI.', TRUE, TRUE, 'https://www.sonimagen.es/5158-medium_default/sony-str-dh590-receptor-av-de-cine-en-casa-de-52-canales.jpg', 19);

-- Sistemas de Home Theater
INSERT INTO PRODUCTOS (NOMBRE, DESCRIPCION, PRECIO, PRECIO_DESCUENTO, CARACTERISTICAS, DESTACADO, NOVEDAD, FOTO, ID_CATEGORIA) VALUES
('Bose Lifestyle 650', 'Sistema de cine en casa de 5.1 canales con altavoces OmniJewel y consola de control.', 4000.00, 3896.47, 'Sonido envolvente premium, diseño elegante, fácil instalación.', TRUE, TRUE, 'https://m.media-amazon.com/images/I/71O+t-iPbDL._AC_UF894,1000_QL80_.jpg', 20),
('Sony HT-A7000', 'Barra de sonido de 7.1.2 canales con Dolby Atmos, DTS:X y tecnología 360 Reality Audio.', 1500.00, NULL, 'Subwoofer inalámbrico incluido, múltiples opciones de conectividad.', TRUE, TRUE, 'https://m.media-amazon.com/images/I/71faWVdX3GL.jpg', 20),
('Samsung HW-Q950T', 'Sistema de sonido 9.1.4 con barra de sonido y altavoces traseros inalámbricos.', 1300.00, 1259.36, 'Sonido envolvente con Dolby Atmos, integración con QLED TVs.', TRUE, TRUE, 'https://m.media-amazon.com/images/I/51fSPP+HstL._AC_UF894,1000_QL80_.jpg', 20),
('LG SN11RG', 'Barra de sonido de 7.1.4 canales con altavoces traseros, Dolby Atmos y DTS:X.', 1200.00, NULL, 'Sonido de alta fidelidad, compatibilidad con AI Sound Pro.', TRUE, TRUE, 'https://media.us.lg.com/transform/ecomm-PDPGallery-1100x730/1edfcc50-393a-4312-b237-b7986fbc1b29/md08001482-DZ01-jpg', 20),
('Sonos Arc', 'Barra de sonido de 5.1.2 canales con soporte para Dolby Atmos y control por voz.', 800.00, 789.14, 'Diseño minimalista, integración con sistemas Sonos existentes.', TRUE, TRUE, 'https://www.radiocolon.com/es/large/Sonos-Sistema-de-sonido-envolvente-ARC-Ultra-i49611.jpg', 20);

-- Interfaces de Audio
INSERT INTO PRODUCTOS (NOMBRE, DESCRIPCION, PRECIO, PRECIO_DESCUENTO, CARACTERISTICAS, DESTACADO, NOVEDAD, FOTO, ID_CATEGORIA) VALUES
('Focusrite Scarlett 2i2', 'Interfaz de audio USB con dos entradas y salidas, ideal para grabación en casa.', 160.00, 145.36, 'Conversión de alta calidad, incluye software de grabación.', TRUE, TRUE, 'https://m.media-amazon.com/images/I/61d27qcYtvL.jpg', 21),
('PreSonus AudioBox USB 96', 'Interfaz de audio compacta con dos entradas, perfecta para proyectos de grabación portátiles.', 100.00, 99.99, 'Compatible con múltiples DAWs, incluye software Studio One Artist.', TRUE, TRUE, 'https://m.media-amazon.com/images/I/51kdt6+MnEL.jpg', 21),
('Behringer UMC22', 'Interfaz de audio USB con preamplificador MIDAS, ideal para grabaciones de alta calidad.', 50.00, NULL, 'Diseño robusto, alimentación phantom para micrófonos de condensador.', TRUE, TRUE, 'https://m.media-amazon.com/images/I/513a-ChwMML._AC_UF894,1000_QL80_.jpg', 21),
('M-Audio M-Track Duo', 'Interfaz de audio USB con dos entradas combo XLR/TRS, perfecta para músicos y podcasters.', 80.00, NULL, 'Alimentación phantom, incluye software Pro Tools First.', TRUE, TRUE, 'https://thumbs.static-thomann.de/thumb/padthumb600x600/pics/bdb/_50/506082/15659975_800.jpg', 21),
('Native Instruments Komplete Audio 6', 'Interfaz de audio USB con seis entradas y salidas, diseñada para profesionales.', 200.00, 174.26, 'Conversión de alta fidelidad, construcción sólida, incluye software Komplete Elements.', TRUE, TRUE, 'https://m.media-amazon.com/images/I/81c0Z2Ubv+L.jpg', 21);

 
-- Teclados
INSERT INTO PRODUCTOS (NOMBRE, DESCRIPCION, PRECIO, PRECIO_DESCUENTO, CARACTERISTICAS, DESTACADO, NOVEDAD, FOTO, ID_CATEGORIA) VALUES
('Logitech G213 Prodigy', 'Teclado de membrana con retroiluminación RGB personalizable y teclas resistentes al agua.', 60.00, NULL, 'Diseño ergonómico, teclas de bajo perfil, ideal para gaming y uso diario.', TRUE, FALSE, 'https://m.media-amazon.com/images/I/61fG2Zep+CL._AC_UF894,1000_QL80_.jpg', 22),
('Razer BlackWidow V4 X - Minecraft Edition', 'Teclado mecánico con iluminación RGB temática de Minecraft y teclas de alto rendimiento.', 120.00, 113.33, 'Interruptores mecánicos Razer, teclas multimedia dedicadas, diseño robusto.', TRUE, TRUE, 'https://s3.us-east-1.amazonaws.com/product-image-bucket-prod-us/796898-Product-2-I-638767291803240548.jpg', 22),
('Corsair K70 RGB MK.2', 'Teclado mecánico con interruptores Cherry MX, retroiluminación RGB y teclas multimedia dedicadas.', 150.00, 129.60, 'Construcción de aluminio cepillado, reposamuñecas desmontable, perfiles de usuario.', TRUE, TRUE, 'https://thumb.pccomponentes.com/w-530-530/articles/1086/10860673/1504-corsair-k70-pro-tkl-teclado-mecanico-gaming-rgb-switch-mlx-negro-67192481-7f06-49f5-b3d1-de6081aab719.jpg', 22),
('HyperX Alloy FPS Pro', 'Teclado mecánico compacto sin teclado numérico, ideal para juegos FPS y portabilidad.', 80.00, 77.60, 'Interruptores mecánicos HyperX, iluminación LED roja, diseño compacto.', FALSE, FALSE, 'https://m.media-amazon.com/images/I/71em-P-XA1L.jpg', 22),
('Razer Huntsman Mini', 'Teclado mecánico de 60% con interruptores ópticos Razer y diseño compacto.', 130.00, NULL, 'Interruptores ópticos de acción rápida, iluminación Razer Chroma, construcción sólida.', TRUE, TRUE, 'https://m.media-amazon.com/images/I/61DP8L9ooYL.jpg', 22);

-- Ratones
INSERT INTO PRODUCTOS (NOMBRE, DESCRIPCION, PRECIO, PRECIO_DESCUENTO, CARACTERISTICAS, DESTACADO, NOVEDAD, FOTO, ID_CATEGORIA) VALUES
('Logitech MX518', 'Ratón ergonómico con sensor óptico de alta precisión y diseño clásico.', 40.00, 38.21, 'Diseño icónico, 8 botones programables, rueda de desplazamiento de alta velocidad.', TRUE, FALSE, 'https://m.media-amazon.com/images/I/81bAirZH-6L.jpg', 23),
('Razer DeathAdder Elite', 'Ratón ergonómico con sensor óptico de 16,000 DPI y iluminación Chroma RGB.', 60.00, NULL, 'Diseño ergonómico, 7 botones programables, iluminación Razer Chroma.', TRUE, FALSE, 'https://m.media-amazon.com/images/I/41PU9Ztce0L._AC_UF1000,1000_QL80_.jpg', 23),
('Logitech G502 Hero', 'Ratón para juegos con sensor HERO de 16,000 DPI y múltiples botones programables.', 80.00, 75.36, 'Diseño ergonómico, 11 botones programables, iluminación RGB.', TRUE, TRUE, 'https://m.media-amazon.com/images/I/61mpMH5TzkL.jpg', 23),
('Razer Naga X', 'Ratón ergonómico con 16 botones programables, ideal para juegos MMO.', 70.00, NULL, 'Diseño ergonómico, 16 botones programables, iluminación Razer Chroma.', TRUE, FALSE, 'https://thumb.pccomponentes.com/w-530-530/articles/35/351467/2442-razer-naga-x-raton-gaming-optico-rgb-18000dpi-negro-comprar.jpg', 23),
('SteelSeries Rival 600', 'Ratón con sensor TrueMove3+ de 12,000 DPI y sistema de peso ajustable.', 90.00, 81.25, 'Diseño ergonómico, 7 botones programables, iluminación RGB.', TRUE, TRUE, 'https://m.media-amazon.com/images/I/41eeDbs9eNL._AC_UF1000,1000_QL80_.jpg', 23);

-- Mouses Gaming
INSERT INTO PRODUCTOS (NOMBRE, DESCRIPCION, PRECIO, PRECIO_DESCUENTO, CARACTERISTICAS, DESTACADO, NOVEDAD, FOTO, ID_CATEGORIA) VALUES
('Redragon M686 Vampire Elite', 'Ratón gaming inalámbrico con sensor de 16,000 DPI y diseño ergonómico.', 50.00, NULL, 'Conexión inalámbrica de 2.4GHz, 7 botones programables, iluminación LED.', TRUE, FALSE, 'https://m.media-amazon.com/images/I/613rHH3mFWL.jpg', 24),
('Logitech G Pro X Superlight', 'Ratón ultraligero con sensor HERO de 25,600 DPI, diseñado para eSports.', 150.00, 147.36, 'Peso ultraligero, diseño ergonómico, 5 botones programables.', TRUE, TRUE, 'https://m.media-amazon.com/images/I/61ykKLbddNL.jpg', 24),
('Razer Basilisk Ultimate', 'Ratón gaming inalámbrico con sensor Focus+ de 20,000 DPI y 11 botones programables.', 130.00, 99.99, 'Conexión inalámbrica HyperSpeed, iluminación Razer Chroma, diseño ergonómico.', TRUE, FALSE, 'https://m.media-amazon.com/images/I/61tQGw6x6lL.jpg', 24),
('Corsair Dark Core RGB/SE', 'Ratón gaming con sensor óptico de 16,000 DPI, diseño ergonómico y opciones de agarre intercambiables.', 110.00, NULL, 'Conexión inalámbrica y por cable, 9 botones programables, iluminación RGB.', TRUE, FALSE, 'https://m.media-amazon.com/images/I/61olRm7DV8L.jpg', 24),
('SteelSeries Rival 650 Wireless', 'Ratón gaming inalámbrico con carga rápida y sensor TrueMove3+ de 12,000 DPI.', 120.00, 111.99, 'Carga inalámbrica, 7 botones programables, iluminación RGB.', TRUE, TRUE, 'https://m.media-amazon.com/images/I/61X8IH1KRmL.jpg', 24);
 
-- Usuarios

INSERT INTO USUARIOS (NOMBRE, APELLIDOS, TELEFONO, CORREO_ELECTRONICO, FECHA_NACIMIENTO, ADMIN, PASSWORD, DIRECCION) VALUES
('Juan', 'Pérez Gómez', 612345678, 'juan.perez@example.com', '1990-05-14', TRUE, '$2y$10$3joVf2iA5UXfcM4crnATqu5U7V9KGYPm9xABu2ty7fgmuUAUTfwc2', 'Calle Falsa 123, Madrid'),
('María', 'López Fernández', 698765432, 'maria.lopez@example.com', '1985-08-21', FALSE, '$2y$10$3joVf2iA5UXfcM4crnATqu5U7V9KGYPm9xABu2ty7fgmuUAUTfwc2', 'Av. Libertad 45, Barcelona'),
('Carlos', 'García Ruiz', 677889900, 'carlos.garcia@example.com', '1992-11-30', FALSE, '$2y$10$3joVf2iA5UXfcM4crnATqu5U7V9KGYPm9xABu2ty7fgmuUAUTfwc2', 'Paseo del Prado 7, Valencia'),
('Laura', 'Martínez Sánchez', 634567891, 'laura.martinez@example.com', '1988-02-15', TRUE, '$2y$10$3joVf2iA5UXfcM4crnATqu5U7V9KGYPm9xABu2ty7fgmuUAUTfwc2', 'Gran Vía 28, Sevilla'),
('David', 'Hernández Pérez', 645678912, 'david.hernandez@example.com', '1995-07-10', FALSE, '$2y$10$3joVf2iA5UXfcM4crnATqu5U7V9KGYPm9xABu2ty7fgmuUAUTfwc2', 'Calle Mayor 50, Bilbao'),
('Ana', 'Díaz López', 678901234, 'ana.diaz@example.com', '1987-12-05', TRUE, '$2y$10$3joVf2iA5UXfcM4crnATqu5U7V9KGYPm9xABu2ty7fgmuUAUTfwc2', 'Av. Andalucía 12, Málaga'),
('Sergio', 'Torres Muñoz', 611223344, 'sergio.torres@example.com', '1993-09-25', FALSE, '$2y$10$3joVf2iA5UXfcM4crnATqu5U7V9KGYPm9xABu2ty7fgmuUAUTfwc2', 'Calle Sol 99, Zaragoza'),
('Elena', 'Gómez Romero', 655443322, 'elena.gomez@example.com', '1989-04-18', TRUE, '$2y$10$3joVf2iA5UXfcM4crnATqu5U7V9KGYPm9xABu2ty7fgmuUAUTfwc2', 'Paseo de la Castellana 23, Madrid'),
('Alejandro', 'Fernández Díaz', 633221144, 'alejandro.fernandez@example.com', '1991-06-12', FALSE, '$2y$10$3joVf2iA5UXfcM4crnATqu5U7V9KGYPm9xABu2ty7fgmuUAUTfwc2', 'Calle Sevilla 8, Murcia'),
('Patricia', 'Ruiz Ortega', 644556677, 'patricia.ruiz@example.com', '1994-03-08', FALSE, '$2y$10$3joVf2iA5UXfcM4crnATqu5U7V9KGYPm9xABu2ty7fgmuUAUTfwc2', 'Av. Juan Carlos I 15, Granada');


INSERT INTO OPINIONES (VALORACION, FECHA_HORA, COMENTARIO, ID_CLIENTE, ID_PRODUCTO) VALUES
-- Opiniones para Gigabyte B550 AORUS Elite (ID_PRODUCTO: 1)
(9, '2025-03-09 14:23:45', 'Muy buena placa base, perfecta para gaming y overclocking.', 1, 1),
(8, '2025-03-08 18:45:30', 'Buen rendimiento, aunque el BIOS podría ser más intuitivo.', 3, 1),

-- Opiniones para MSI MAG B550 TOMAHAWK (ID_PRODUCTO: 2)
(10, '2025-03-07 20:10:05', 'Excelente placa, materiales de calidad y muchas opciones de conectividad.', 2, 2),
(7, '2025-03-06 16:50:12', 'Buena, pero tuve problemas con la compatibilidad de la RAM.', 5, 2),

-- Opiniones para Intel Core i9-11900K (ID_PRODUCTO: 9)
(9, '2025-03-05 10:30:20', 'Rinde muy bien en juegos y edición de video, pero calienta bastante.', 4, 9),
(6, '2025-03-04 22:15:40', 'Esperaba más rendimiento por el precio, consume mucha energía.', 7, 9),

-- Opiniones para AMD Ryzen 9 7900X (ID_PRODUCTO: 10)
(10, '2025-03-03 19:05:15', 'Brutal en multitarea, sin duda la mejor opción para creadores de contenido.', 6, 10),
(9, '2025-03-02 11:20:50', 'Increíble procesador, pero necesita una buena refrigeración.', 8, 10),

-- Opiniones para Corsair Vengeance LPX 16GB DDR4 3200MHz (ID_PRODUCTO: 11)
(9, '2025-03-01 14:45:35', 'RAM rápida y estable, sin problemas de compatibilidad.', 9, 11),
(8, '2025-02-28 17:10:25', 'Buena memoria, aunque el precio podría ser más bajo.', 10, 11);


INSERT INTO OPINIONES (VALORACION, FECHA_HORA, COMENTARIO, ID_CLIENTE, ID_PRODUCTO) VALUES
-- Opiniones para Crucial Ballistix 16GB (ID_PRODUCTO: 14)
(9, '2025-03-09 15:30:20', 'Excelente RAM, buen rendimiento y estabilidad en overclocking.', 2, 14),
(8, '2025-03-08 12:45:10', 'Buena calidad, aunque los disipadores podrían ser más eficientes.', 5, 14),

-- Opiniones para Corsair RM750x (ID_PRODUCTO: 15)
(10, '2025-03-07 18:10:05', 'Fuente silenciosa y confiable, perfecta para sistemas de alto rendimiento.', 3, 15),
(9, '2025-03-06 20:50:30', 'Muy buena eficiencia energética y cables de excelente calidad.', 7, 15),

-- Opiniones para EVGA SuperNOVA 650 G5 (ID_PRODUCTO: 16)
(9, '2025-03-05 16:20:15', 'Gran fuente, cumple perfectamente con lo prometido y es muy estable.', 4, 16),
(7, '2025-03-04 19:35:45', 'Buen rendimiento, aunque los cables podrían ser más flexibles.', 8, 16);


INSERT INTO OPINIONES (VALORACION, FECHA_HORA, COMENTARIO, ID_CLIENTE, ID_PRODUCTO) VALUES
-- Opiniones para Redragon M686 Vampire Elite (ID_PRODUCTO: 93)
(8, '2025-03-09 17:10:45', 'Buen ratón por el precio, la batería dura bastante.', 2, 93),
(7, '2025-03-08 14:35:20', 'Cómodo y preciso, aunque los materiales podrían ser mejores.', 5, 93),

-- Opiniones para Logitech G Pro X Superlight (ID_PRODUCTO: 94)
(10, '2025-03-07 12:50:10', 'Ligero y preciso, lo mejor para juegos competitivos.', 3, 94),
(9, '2025-03-06 16:20:30', 'Excelente sensor y ergonomía, aunque algo caro.', 7, 94),

-- Opiniones para Razer Basilisk Ultimate (ID_PRODUCTO: 95)
(9, '2025-03-05 20:10:15', 'Muy buen ratón, la conexión inalámbrica es excelente.', 4, 95),
(8, '2025-03-04 18:45:45', 'El diseño es genial, pero el software de Razer puede mejorar.', 8, 95);


INSERT INTO OPINIONES (VALORACION, FECHA_HORA, COMENTARIO, ID_CLIENTE, ID_PRODUCTO) VALUES
-- Opiniones para Micrófono de mano Shure SM58 (ID_PRODUCTO: 61)
(10, '2025-03-09 20:15:30', 'El mejor micrófono para voces en vivo, sonido limpio y resistente.', 2, 61),
(9, '2025-03-08 18:45:10', 'Construcción sólida, ideal para conciertos y eventos.', 5, 61),

-- Opiniones para Micrófono de estudio Audio-Technica AT2020 (ID_PRODUCTO: 62)
(9, '2025-03-07 14:30:20', 'Excelente calidad de audio, ideal para grabaciones profesionales.', 3, 62),
(8, '2025-03-06 16:10:50', 'Muy buen micrófono, aunque capta bastante ruido de fondo.', 7, 62),

-- Opiniones para JBL Tour Pro 3 (ID_PRODUCTO: 63)
(9, '2025-03-05 19:05:15', 'Sonido espectacular y batería duradera, muy recomendados.', 4, 63),
(8, '2025-03-04 21:40:45', 'Buena cancelación de ruido, pero la app podría mejorar.', 8, 63),

-- Opiniones para LG Xboom Buds (ID_PRODUCTO: 64)
(8, '2025-03-03 17:20:10', 'Cómodos y buen sonido, aunque la conectividad a veces falla.', 6, 64),
(7, '2025-03-02 15:35:30', 'Diseño innovador, pero esperaba mejor calidad en los graves.', 9, 64);
