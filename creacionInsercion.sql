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
    FECHA_HORA DATETIME NOT NULL,
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
('Gigabyte B550 AORUS Elite', 'Placa base ATX con chipset B550, compatible con procesadores AMD Ryzen, ofrece múltiples puertos USB y ranuras PCIe.', 120.00, NULL, 'Chipset B550, soporte para PCIe 4.0, diseño de alimentación robusto.', TRUE, FALSE, 'https://www.pccomponentes.com/gigabyte-b550-aorus-elite.jpg', 4),
('MSI MAG B550 TOMAHAWK', 'Placa base ATX con chipset B550, diseñada para gaming, soporte para overclocking y audio de alta definición.', 110.00, NULL, 'Diseño térmico avanzado, soporte para Wi-Fi 6, múltiples puertos USB 3.2.', TRUE, FALSE, 'https://www.pccomponentes.com/msi-mag-b550-tomahawk.jpg', 4),
('ASUS ROG Strix B550-F Gaming', 'Placa base ATX con chipset B550, enfocada en gamers, con iluminación RGB y conectividad Wi-Fi 6.', 130.00, NULL, 'Iluminación Aura Sync RGB, soporte para PCIe 4.0, diseño de alimentación de 12+2 fases.', TRUE, FALSE, 'https://www.pccomponentes.com/asus-rog-strix-b550-f-gaming.jpg', 4),
('ASRock B550M Pro4', 'Placa base micro-ATX con chipset B550, ofrece una buena relación calidad-precio para sistemas de gama media.', 90.00, NULL, 'Soporte para RAM de alta frecuencia, múltiples salidas de video, diseño compacto.', TRUE, FALSE, 'https://www.pccomponentes.com/asrock-b550m-pro4.jpg', 4),
('MSI MAG Z890 TOMAHAWK WIFI', 'Placa base ATX con chipset Intel Z890, preparada para inteligencia artificial, soporte para DDR5 y múltiples opciones de almacenamiento.', 150.00, NULL, 'Chipset Z890, soporte para DDR5 hasta 256 GB, conectividad Wi-Fi 7.', TRUE, TRUE, 'https://www.pccomponentes.com/msi-mag-z890-tomahawk-wifi.jpg', 4);

-- Procesadores
INSERT INTO PRODUCTOS (NOMBRE, DESCRIPCION, PRECIO, PRECIO_DESCUENTO, CARACTERISTICAS, DESTACADO, NOVEDAD, FOTO, ID_CATEGORIA) VALUES
('AMD Ryzen 5 5600X', 'Procesador de 6 núcleos y 12 hilos, ideal para gaming y tareas multitarea.', 200.00, NULL, 'Arquitectura Zen 3, frecuencia base de 3.7 GHz, desbloqueado para overclocking.', TRUE, FALSE, 'https://www.pccomponentes.com/amd-ryzen-5-5600x.jpg', 6),
('Intel Core i7-11700K', 'Procesador de 8 núcleos y 16 hilos, ofrece un rendimiento sólido en aplicaciones y juegos.', 300.00, NULL, 'Arquitectura Rocket Lake, frecuencia base de 3.6 GHz, soporte para PCIe 4.0.', TRUE, FALSE, 'https://www.pccomponentes.com/intel-core-i7-11700k.jpg', 6),
('AMD Ryzen 7 5800X', 'Procesador de 8 núcleos y 16 hilos, excelente para tareas intensivas y gaming.', 400.00, NULL, 'Arquitectura Zen 3, frecuencia base de 3.8 GHz, desbloqueado para overclocking.', TRUE, FALSE, 'https://www.pccomponentes.com/amd-ryzen-7-5800x.jpg', 6),
('Intel Core i9-11900K', 'Procesador de 8 núcleos y 16 hilos, ofrece un rendimiento superior en todas las aplicaciones.', 500.00, NULL, 'Arquitectura Rocket Lake, frecuencia base de 3.5 GHz, soporte para PCIe 4.0.', TRUE, FALSE, 'https://www.pccomponentes.com/intel-core-i9-11900k.jpg', 6),
('AMD Ryzen 9 7900X', 'Procesador de 12 núcleos y 24 hilos, diseñado para entusiastas y profesionales.', 700.00, NULL, 'Arquitectura Zen 4, frecuencia base de 3.8 GHz, soporte para PCIe 5.0.', TRUE, TRUE, 'https://www.pccomponentes.com/amd-ryzen-9-7900x.jpg', 6);

-- Memoria RAM
INSERT INTO PRODUCTOS (NOMBRE, DESCRIPCION, PRECIO, PRECIO_DESCUENTO, CARACTERISTICAS, DESTACADO, NOVEDAD, FOTO, ID_CATEGORIA) VALUES
('Corsair Vengeance LPX 16GB (2x8GB) DDR4 3200MHz', 'Kit de memoria RAM de alto rendimiento, ideal para gaming y multitarea.', 80.00, NULL, 'Perfil bajo, disipadores de calor de aluminio, XMP 2.0.', TRUE, FALSE, 'https://www.pccomponentes.com/corsair-vengeance-lpx-16gb-ddr4-3200mhz.jpg', 7),
('G.Skill Ripjaws V 16GB (2x8GB) DDR4 3600MHz', 'Memoria RAM rápida y confiable, perfecta para sistemas de alto rendimiento.', 90.00, NULL, 'Diseño compacto, soporte para XMP 2.0, voltaje de 1.35V.', TRUE, FALSE, 'https://www.pccomponentes.com/g-skill-ripjaws-v-16gb-ddr4-3600mhz.jpg', 7),
('Kingston HyperX Fury 16GB (2x8GB) DDR4 2666MHz', 'Memoria RAM de calidad, ofrece estabilidad y velocidad en aplicaciones exigentes.', 70.00, NULL, 'Diseño de perfil bajo, plug and play, soporte para XMP.', TRUE, FALSE, 'https://www.pccomponentes.com/kingston-hyperx-fury-16gb-ddr4-2666mhz.jpg', 7),
('Crucial Ballistix 16GB (2x8GB) DDR4 3200MHz', 'Memoria RAM de alto rendimiento, diseñada para entusiastas y gamers.', 85.00, NULL, 'Disipadores de calor integrados, soporte para XMP 2.0, voltaje de 1.35V.', TRUE, FALSE, 'https://www.pccomponentes.com/crucial-ballistix-16gb-ddr4-320',7);

-- Fuentes de Alimentación
INSERT INTO PRODUCTOS (NOMBRE, DESCRIPCION, PRECIO, PRECIO_DESCUENTO, CARACTERISTICAS, DESTACADO, NOVEDAD, FOTO, ID_CATEGORIA) VALUES
('Corsair RM750x', 'Fuente de alimentación de 750W con certificación 80 Plus Gold, modular y silenciosa.', 120.00, NULL, 'Certificación 80 Plus Gold, cables modulares, ventilador de 135mm con modo de bajo ruido.', TRUE, FALSE, 'https://www.pccomponentes.com/corsair-rm750x.jpg', 9),
('EVGA SuperNOVA 650 G5', 'Fuente de 650W con certificación 80 Plus Gold, compacta y eficiente.', 100.00, NULL, 'Certificación 80 Plus Gold, diseño compacto, cables modulares.', TRUE, FALSE, 'https://www.pccomponentes.com/evga-supernova-650-g5.jpg', 9),
('Seasonic Focus GX-850', 'Fuente de 850W con certificación 80 Plus Gold, compacta y eficiente.', 130.00, NULL, 'Certificación 80 Plus Gold, diseño compacto, cables modulares.', TRUE, FALSE, 'https://www.pccomponentes.com/seasonic-focus-gx-850.jpg', 9),
('MSI MAG A650BN', 'Fuente de alimentación de 650W con certificación 80 Plus Bronze, confiable y económica.', 80.00, NULL, 'Certificación 80 Plus Bronze, diseño compacto, cables no modulares.', TRUE, FALSE, 'https://www.pccomponentes.com/msi-mag-a650bn.jpg', 9),
('Gigabyte P850GM', 'Fuente de 850W con certificación 80 Plus Gold, confiable y eficiente.', 110.00, NULL, 'Certificación 80 Plus Gold, diseño compacto, cables modulares.', TRUE, FALSE, 'https://www.pccomponentes.com/gigabyte-p850gm.jpg', 9);

-- Refrigeración
INSERT INTO PRODUCTOS (NOMBRE, DESCRIPCION, PRECIO, PRECIO_DESCUENTO, CARACTERISTICAS, DESTACADO, NOVEDAD, FOTO, ID_CATEGORIA) VALUES
('Noctua NH-D15', 'Sistema de refrigeración por aire de alto rendimiento, con dos ventiladores NF-A15.', 90.00, NULL, 'Diseño de doble torre, compatibilidad con múltiples sockets, ventiladores silenciosos.', TRUE, FALSE, 'https://www.pccomponentes.com/noctua-nh-d15.jpg', 10),
('Corsair iCUE H100i Elite Capellix', 'Sistema de refrigeración líquida AIO de 240mm, con iluminación RGB.', 150.00, NULL, 'Radiador de 240mm, bombas de alta eficiencia, iluminación RGB dinámica.', TRUE, FALSE, 'https://www.pccomponentes.com/corsair-icue-h100i-elite-capellix.jpg', 10),
('Cooler Master Hyper 212 EVO', 'Refrigerador por aire de 4 tubos de calor, conocido por su rendimiento y precio accesible.', 50.00, NULL, 'Diseño de 4 heatpipes, ventilador de 120mm, compatible con múltiples sockets.', TRUE, FALSE, 'https://www.pccomponentes.com/cooler-master-hyper-212-evo.jpg', 10),
('NZXT Kraken Z73', 'Refrigeración líquida AIO de 360mm, con pantalla LCD personalizada.', 200.00, NULL, 'Radiador de 360mm, pantalla LCD de 2.77", iluminación RGB.', TRUE, FALSE, 'https://www.pccomponentes.com/nzxt-kraken-z73.jpg', 1),
('be quiet! Dark Rock Pro 4', 'Sistema de refrigeración por aire de alto rendimiento, con diseño silencioso.', 110.00, NULL, 'Diseño de doble torre, ventiladores silenciosos, alta capacidad de enfriamiento.', TRUE, FALSE, 'https://www.pccomponentes.com/be-quiet-dark-rock-pro-4.jpg', 10);


-- Tarjetas Gráficas
INSERT INTO PRODUCTOS (NOMBRE, DESCRIPCION, PRECIO, PRECIO_DESCUENTO, CARACTERISTICAS, DESTACADO, NOVEDAD, FOTO, ID_CATEGORIA) VALUES
('NVIDIA GeForce RTX 3080', 'Tarjeta gráfica de alto rendimiento para gaming en 4K y aplicaciones de inteligencia artificial.', 699.00, NULL, 'Arquitectura Ampere, 10 GB GDDR6X, soporte para Ray Tracing y DLSS.', TRUE, TRUE, 'https://www.nvidia.com/content/dam/en-zz/Solutions/geforce/rtx-3080/geforce-rtx-3080-hero.png', 8),
('AMD Radeon RX 6800 XT', 'Tarjeta gráfica de alto rendimiento para gaming en 4K, con soporte para Ray Tracing.', 649.00, NULL, 'Arquitectura RDNA 2, 16 GB GDDR6, soporte para FidelityFX y Ray Tracing.', TRUE, TRUE, 'https://www.amd.com/system/files/2020-10/amd-radeon-rx-6800-xt-graphics-card.png', 8),
('NVIDIA GeForce RTX 3070', 'Tarjeta gráfica de alto rendimiento para gaming en 1440p y 4K, con soporte para Ray Tracing.', 499.00, NULL, 'Arquitectura Ampere, 8 GB GDDR6, soporte para Ray Tracing y DLSS.', TRUE, TRUE, 'https://www.nvidia.com/content/dam/en-zz/Solutions/geforce/rtx-3070/geforce-rtx-3070-hero.png', 8),
('AMD Radeon RX 6700 XT', 'Tarjeta gráfica de rendimiento medio-alto para gaming en 1440p, con soporte para Ray Tracing.', 479.00, NULL, 'Arquitectura RDNA 2, 12 GB GDDR6, soporte para FidelityFX y Ray Tracing.', TRUE, TRUE, 'https://www.amd.com/system/files/2021-03/amd-radeon-rx-6700-xt-graphics-card.png', 8),
('NVIDIA GeForce GTX 1660 Super', 'Tarjeta gráfica de rendimiento medio para gaming en 1080p, sin soporte para Ray Tracing.', 229.00, NULL, 'Arquitectura Turing, 6 GB GDDR5, rendimiento sólido en títulos modernos.', TRUE, FALSE, 'https://www.nvidia.com/content/dam/en-zz/Solutions/geforce/gtx-1660-super/geforce-gtx-1660-super-hero.png', 8);

-- Portátiles
INSERT INTO PRODUCTOS (NOMBRE, DESCRIPCION, PRECIO, PRECIO_DESCUENTO, CARACTERISTICAS, DESTACADO, NOVEDAD, FOTO, ID_CATEGORIA) VALUES
('HP Pavilion x360 14-dh0004ns', 'Ordenador portátil convertible táctil de 14 pulgadas con procesador Intel Core i5 y 8 GB de RAM.', 699.00, NULL, 'Pantalla táctil Full HD, diseño convertible 2 en 1, almacenamiento SSD de 512 GB.', TRUE, TRUE, 'https://www.amazon.es/HP-Pavilion-x360-14-dh0004ns-convertible/dp/B07PW35PKD', 11),
('MEDION E3221', 'Ordenador portátil convertible táctil de 13.3 pulgadas con procesador Intel y 4 GB de RAM.', 499.00, NULL, 'Pantalla táctil Full HD, diseño convertible, almacenamiento SSD de 256 GB.', TRUE, TRUE, 'https://www.amazon.es/MEDION-E3221-Ordenador-port%C3%A1til-Convertible/dp/B07TL4C3CJ', 11),
('Lenovo IdeaPad Slim 3', 'Portátil de 15.6 pulgadas con procesador Intel Core i7, 16 GB de RAM y 512 GB SSD.', 799.00, NULL, 'Pantalla Full HD, teclado ergonómico, diseño delgado y ligero.', TRUE, TRUE, 'https://www.pccomponentes.com/lenovo-ideapad-slim-3', 11),
('Dell Inspiron 14 5000', 'Portátil de 14 pulgadas con procesador AMD Ryzen 5, 8 GB de RAM y 512 GB SSD.', 650.00, NULL, 'Pantalla Full HD, diseño compacto, múltiples puertos USB.', TRUE, FALSE, 'https://www.dell.com/es-es/shop/dell-inspiron-14-5000-laptop/spd/inspiron-14-5406-2-in-1-laptop', 11),
('Acer Swift 3', 'Portátil ultradelgado de 14 pulgadas con procesador Intel Core i5, 8 GB de RAM y 512 GB SSD.', 700.00, NULL, 'Pantalla Full HD, diseño metálico, larga duración de batería.', TRUE, FALSE, 'https://www.acer.com/ac/es/ES/content/model/NX.HG9EB.001', 11);

-- Sobremesa
INSERT INTO PRODUCTOS (NOMBRE, DESCRIPCION, PRECIO, PRECIO_DESCUENTO, CARACTERISTICAS, DESTACADO, NOVEDAD, FOTO, ID_CATEGORIA) VALUES
('Medion S06 MD35300', 'Mini PC con procesador Intel Core i5-1335U, 16 GB de RAM y 512 GB SSD.', 399.00, NULL, 'Diseño compacto, múltiples puertos USB, ideal para espacios reducidos.', TRUE, TRUE, 'https://www.medion.com/es/electronics/md35300', 12),
('Medion T80 MD35423', 'Ordenador de sobremesa con procesador Intel Core i5, 16 GB de RAM y 512 GB SSD.', 499.00, NULL, 'Diseño elegante, conectividad Wi-Fi 6E, Windows 11 Home preinstalado.', TRUE, TRUE, 'https://www.medion.com/es/electronics/md35423', 12),
('Lenovo IdeaCentre AIO 3', 'Ordenador todo en uno con pantalla de 23.8 pulgadas, procesador AMD Ryzen 5 y 8 GB de RAM.', 650.00, NULL, 'Diseño todo en uno, almacenamiento SSD de 512 GB, webcam integrada.', TRUE, FALSE, 'https://www.lenovo.com/es/es/desktops/ideacentre/ideacentre-aio/Lenovo-IdeaCentre-AIO-3-24ALC6/p/82DA0002US', 12),
('HP Pavilion Desktop TP01-2000', 'Ordenador de sobremesa con procesador Intel Core i7, 16 GB de RAM y 1 TB HDD.', 800.00, NULL, 'Diseño compacto, múltiples puertos USB, Windows 10 preinstalado.', TRUE, FALSE, 'https://www.hp.com/es-es/shop/product.aspx?id=TP01-2000&opt=ABE&sel=PC', 12),
('Dell OptiPlex 3080', 'PC de sobremesa empresarial con procesador Intel Core i5, 8 GB de RAM y 256 GB SSD.', 600.00, NULL, 'Diseño compacto, eficiencia energética, ideal para entornos corporativos.', TRUE, FALSE, 'https://www.dell.com/es-es/shop/dell-optiplex-3080-desktop/spd/optiplex-3080-desktop', 12);

-- Estaciones de Trabajo
INSERT INTO PRODUCTOS (NOMBRE, DESCRIPCION, PRECIO, PRECIO_DESCUENTO, CARACTERISTICAS, DESTACADO, NOVEDAD, FOTO, ID_CATEGORIA) VALUES
('Dell Precision 5550', 'Estación de trabajo móvil con pantalla de 15.6 pulgadas, procesador Intel Xeon y 32 GB de RAM.', 1800.00, NULL, 'Gráficos profesionales NVIDIA Quadro, almacenamiento SSD de 1 TB.', TRUE, TRUE, 'https://www.dell.com/es-es/shop/dell-precision-5550-laptop/spd/precision-15-5500-laptop', 13),
('HP ZBook Fury 15 G7', 'Estación de trabajo móvil con pantalla de 15.6 pulgadas, procesador AMD Ryzen 7 y 16 GB de RAM.', 1600.00, NULL, 'Gráficos AMD Radeon Pro, almacenamiento SSD de 512 GB.', TRUE, TRUE, 'https://www.hp.com/es-es/shop/product.aspx?id=ZBook-Fury-15-G7&opt=ABE&sel=PC', 13),
('Lenovo ThinkPad P15', 'Estación de trabajo móvil con pantalla de 15.6 pulgadas, procesador Intel Core i9 y 32 GB de RAM.', 2000.00, NULL, 'Gráficos NVIDIA Quadro RTX, almacenamiento SSD de 1 TB.', TRUE, TRUE, 'https://www.lenovo.com/es/es/laptops/thinkpad/thinkpad-p/ThinkPad-P15-Intel-Gen-1-Intel-Core-i9-processor-16GB-RAM-512GB-SSD-15-6-inch-Windows-10-Pro-64-bit/p/20U3001CUS', 13),
('Dell Precision 5820', 'Estación de trabajo de sobremesa con procesador Intel Xeon, 64 GB de RAM y 1 TB SSD.', 2500.00, NULL, 'Gráficos profesionales AMD Radeon Pro, múltiples puertos de expansión.', TRUE, TRUE, 'https://www.dell.com/es-es/work/shop/workstations-isv-certified/dell-precision-5820-tower-workstation/spd/precision-5820-workstation', 13);

-- Estaciones de Trabajo
INSERT INTO PRODUCTOS (NOMBRE, DESCRIPCION, PRECIO, PRECIO_DESCUENTO, CARACTERISTICAS, DESTACADO, NOVEDAD, FOTO, ID_CATEGORIA) VALUES
('Lenovo ThinkStation P310', 'Estación de trabajo de nivel de entrada con procesador Intel Xeon E3-1200v5, 8 GB de RAM y 1 TB HDD.', 1200.00, NULL, 'Hasta 64 GB de RAM, gráficos NVIDIA, ideal para tareas profesionales.', TRUE, TRUE, 'https://www.lenovo.com/medias/lenovo-thinkstation-p310.jpg', 3),
('HP Z2 Mini G1a', 'Mini PC de alto rendimiento con procesador AMD Ryzen AI Max Plus Pro, 16 GB de RAM y 512 GB SSD.', 800.00, NULL, 'Soporta hasta cuatro monitores 4K, múltiples puertos, diseño compacto.', TRUE, TRUE, 'https://www.hp.com/medias/z2-mini-g1a.jpg', 3),
('Dell Precision 5820', 'Estación de trabajo de sobremesa con procesador Intel Xeon, 64 GB de RAM y 1 TB SSD.', 2500.00, NULL, 'Gráficos AMD Radeon Pro, múltiples puertos de expansión, rendimiento excepcional.', TRUE, TRUE, 'https://www.dell.com/medias/precision-5820.jpg', 3),
('Lenovo ThinkStation P710', 'Estación de trabajo de doble zócalo con procesadores Intel E5-2600 v4, 32 GB de RAM y 1 TB HDD.', 2000.00, NULL, 'Hasta 384 GB de RAM, soporte para tres GPUs, ideal para aplicaciones intensivas.', TRUE, TRUE, 'https://www.lenovo.com/medias/thinkstation-p710.jpg', 3),
('HP ZBook Fury 15 G7', 'Estación de trabajo móvil con pantalla de 15.6 pulgadas, procesador AMD Ryzen 7, 16 GB de RAM y 512 GB SSD.', 1600.00, NULL, 'Gráficos AMD Radeon Pro, diseño robusto, ideal para profesionales en movimiento.', TRUE, TRUE, 'https://www.hp.com/medias/zbook-fury-15-g7.jpg', 3);

-- All-in-One
INSERT INTO PRODUCTOS (NOMBRE, DESCRIPCION, PRECIO, PRECIO_DESCUENTO, CARACTERISTICAS, DESTACADO, NOVEDAD, FOTO, ID_CATEGORIA) VALUES
('Lenovo IdeaCentre AIO 3', 'Ordenador todo en uno con pantalla de 23.8 pulgadas, procesador AMD Ryzen 5, 8 GB de RAM y 512 GB SSD.', 650.00, NULL, 'Diseño compacto, almacenamiento SSD rápido, ideal para espacios reducidos.', TRUE, TRUE, 'https://www.lenovo.com/medias/ideacentre-aio-3.jpg', 14),
('Dell Inspiron 7700 AIO', 'Ordenador todo en uno con pantalla táctil de 27 pulgadas, procesador Intel Core i7-1165G7, 32 GB de RAM y 2 TB SSD.', 1800.00, NULL, 'Diseño elegante, alto rendimiento, ideal para entretenimiento y productividad.', TRUE, TRUE, 'https://www.dell.com/medias/inspiron-7700-aio.jpg', 14),
('HP OmniStudio X AIO', 'Ordenador todo en uno con pantalla de 31.5 pulgadas, procesador Intel Core Ultra 200V, 16 GB de RAM y 1 TB SSD.', 2000.00, NULL, 'Pantalla 4K con HDR, múltiples puertos, soporte para Wi-Fi 7.', TRUE, TRUE, 'https://www.hp.com/medias/omnistudio-x-aio.jpg', 14),
('Slimbook Curve AIO', 'Ordenador todo en uno con pantalla curva de 24 pulgadas, procesador AMD Ryzen 5, 8 GB de RAM y 512 GB SSD.', 700.00, NULL, 'Diseño moderno, rendimiento eficiente, compatible con sistemas GNU/Linux.', TRUE, TRUE, 'https://www.slimbook.es/medias/curve-aio.jpg', 14),
('Apple iMac 24"', 'Ordenador todo en uno con pantalla Retina 4.5K de 24 pulgadas, procesador M1, 8 GB de RAM y 256 GB SSD.', 1300.00, NULL, 'Diseño delgado, colores vibrantes, ideal para tareas creativas.', TRUE, TRUE, 'https://www.apple.com/medias/imac-24.jpg', 14);

-- Mini PCs
INSERT INTO PRODUCTOS (NOMBRE, DESCRIPCION, PRECIO, PRECIO_DESCUENTO, CARACTERISTICAS, DESTACADO, NOVEDAD, FOTO, ID_CATEGORIA) VALUES
('GMKtec Mini PC', 'Mini PC con procesador AMD Ryzen 7 7735HS, 16 GB de RAM y 512 GB SSD.', 900.00, NULL, 'Diseño compacto, múltiples puertos, ideal para entretenimiento y productividad.', TRUE, TRUE, 'https://www.gmktec.com/medias/mini-pc.jpg', 15),
('Slimbook One', 'Mini PC con procesador Intel Core i5, 8 GB de RAM y 256 GB SSD.', 500.00, NULL, 'Compatible con sistemas GNU/Linux, diseño silencioso, bajo consumo energético.', TRUE, TRUE, 'https://www.slimbook.es/medias/one-mini-pc.jpg', 15),
('Apple Mac Studio', 'Mini PC con chip M4 Max, 36 GB de RAM y 512 GB SSD.', 2500.00, NULL, 'Alto rendimiento, múltiples puertos, ideal para profesionales creativos.', TRUE, TRUE, 'https://www.apple.com/medias/mac-studio.jpg', 15),
('HP Z2 Mini G1a', 'Mini PC con procesador AMD Ryzen AI Max Plus Pro, 16 GB de RAM y 512 GB SSD.', 800.00, NULL, 'Diseño compacto, soporta hasta cuatro monitores 4K, múltiples puertos.', TRUE, TRUE, 'https://www.hp.com/medias/z2-mini-g1a.jpg', 15),
('Intel NUC 11', 'Mini PC con procesador Intel Core i7, 8 GB de RAM y 256 GB SSD.', 600.00, NULL, 'Diseño pequeño, fácil de montar, ideal para espacios reducidos.', TRUE, TRUE, 'https://www.intel.com/medias/nuc-11.jpg', 15);

-- Altavoces
INSERT INTO PRODUCTOS (NOMBRE, DESCRIPCION, PRECIO, PRECIO_DESCUENTO, CARACTERISTICAS, DESTACADO, NOVEDAD, FOTO, ID_CATEGORIA) VALUES
('Bose Soundbar 700', 'Barra de sonido de alta gama con diseño elegante, control por voz y compatibilidad con sistemas de cine en casa.', 799.00, NULL, 'Tecnología de cancelación de ruido, integración con asistentes virtuales.', TRUE, TRUE, 'https://www.bose.com/medias/bose-soundbar-700.jpg', 16),
('JBL Tour Pro 3', 'Auriculares inalámbricos con pantalla táctil en el estuche, calidad de sonido HiRes y cancelación activa de ruido.', 249.00, NULL, 'Hasta 44 horas de autonomía, personalización a través de la aplicación JBL Headphones.', TRUE, TRUE, 'https://www.jbl.com/medias/jbl-tour-pro-3.jpg', 16),
('LG Xboom Buds', 'Auriculares diseñados en colaboración con Will.I.Am, ofreciendo sonido rico y envolvente con cancelación activa de ruido.', 99.00, NULL, 'Drivers de grafeno, resistencia al agua IPX4, hasta 30 horas de autonomía.', TRUE, TRUE, 'https://www.lg.com/medias/xboom-buds.jpg', 16),
('Behringer XM 1800S', 'Pack de tres micrófonos dinámicos ideales para presentaciones y grabaciones.', 69.00, NULL, 'Respuesta de frecuencia amplia, incluye soportes y estuches.', TRUE, TRUE, 'https://www.behringer.com/medias/xm-1800s.jpg', 16),
('Altavoces Genius para ordenador', 'Sistema de altavoces compactos con sonido claro y potente, ideal para espacios reducidos.', 29.00, NULL, 'Fáciles de instalar, diseño moderno, control de volumen integrado.', TRUE, TRUE, 'https://www.genius.com/medias/altavoces-genius.jpg', 16);

-- Micrófonos
INSERT INTO PRODUCTOS (NOMBRE, DESCRIPCION, PRECIO, PRECIO_DESCUENTO, CARACTERISTICAS, DESTACADO, NOVEDAD, FOTO, ID_CATEGORIA) VALUES
('Behringer XM 1800S', 'Pack de tres micrófonos dinámicos ideales para presentaciones y grabaciones.', 69.00, NULL, 'Respuesta de frecuencia amplia, incluye soportes y estuches.', TRUE, TRUE, 'https://www.behringer.com/medias/xm-1800s.jpg', 17),
('Micrófono de condensador USB Samson Meteor', 'Micrófono compacto con conexión USB, ideal para grabaciones en casa y podcasts.', 99.00, NULL, 'Patrón polar cardioide, incluye trípode y funda.', TRUE, TRUE, 'https://www.samsontech.com/medias/meteor-mic.jpg', 17),
('Micrófono Lavalier Boya BY-M1', 'Micrófono de solapa con conexión TRRS, compatible con smartphones y cámaras.', 20.00, NULL, 'Cable de 6 metros, incluye clip y batería.', TRUE, TRUE, 'https://www.boya-mic.com/medias/by-m1.jpg', 17),
('Micrófono de mano Shure SM58', 'Micrófono dinámico legendario, ideal para voz en vivo y grabaciones.', 110.00, NULL, 'Construcción robusta, incluye soporte.', TRUE, TRUE, 'https://www.shure.com/medias/sm58.jpg', 17),
('Micrófono de estudio Audio-Technica AT2020', 'Micrófono de condensador de diafragma grande, perfecto para grabaciones profesionales.', 150.00, NULL, 'Respuesta en frecuencia amplia, incluye soporte de choque.', TRUE, TRUE, 'https://www.audio-technica.com/medias/at2020.jpg', 17);

-- Auriculares
INSERT INTO PRODUCTOS (NOMBRE, DESCRIPCION, PRECIO, PRECIO_DESCUENTO, CARACTERISTICAS, DESTACADO, NOVEDAD, FOTO, ID_CATEGORIA) VALUES
('JBL Tour Pro 3', 'Auriculares inalámbricos con pantalla táctil en el estuche, calidad de sonido HiRes y cancelación activa de ruido.', 249.00, NULL, 'Hasta 44 horas de autonomía, personalización a través de la aplicación JBL Headphones.', TRUE, TRUE, 'https://www.jbl.com/medias/jbl-tour-pro-3.jpg', 18),
('LG Xboom Buds', 'Auriculares diseñados en colaboración con Will.I.Am, ofreciendo sonido rico y envolvente con cancelación activa de ruido.', 99.00, NULL, 'Drivers de grafeno, resistencia al agua IPX4, hasta 30 horas de autonomía.', TRUE, TRUE, 'https://www.lg.com/medias/xboom-buds.jpg', 18),
('Auriculares Bluetooth Bose QuietComfort 35 II', 'Auriculares inalámbricos con cancelación activa de ruido, ideales para viajes y uso diario.', 299.00, NULL, 'Hasta 20 horas de autonomía, integración con asistentes virtuales.', TRUE, TRUE, 'https://www.bose.com/medias/quietcomfort-35-ii.jpg', 18),
('Auriculares Gaming HyperX Cloud II', 'Auriculares diseñados para gamers, con sonido envolvente 7.1 y micrófono con cancelación de ruido.', 80.00, NULL, 'Diseño cómodo, compatible con PC, PS4 y Xbox.', TRUE, TRUE, 'https://www.hyperxgaming.com/medias/cloud-ii.jpg', 18),
('Auriculares Deportivos Sony WF-SP800N', 'Auriculares inalámbricos con resistencia al agua IP55 y cancelación de ruido, ideales para entrenamientos.', 130.00, NULL, 'Hasta 9 horas de autonomía, modos de sonido personalizables.', TRUE, TRUE, 'https://www.sony.com/medias/wf-sp800n.jpg', 18);

-- Amplificadores
INSERT INTO PRODUCTOS (NOMBRE, DESCRIPCION, PRECIO, PRECIO_DESCUENTO, CARACTERISTICAS, DESTACADO, NOVEDAD, FOTO, ID_CATEGORIA) VALUES
('AMPLIFICADOR ST 1000W AMERICAN S BT-USB-SD-FM', 'Amplificador de 1000W con conectividad Bluetooth, USB, SD y radio FM.', 150.00, NULL, 'Diseño compacto, múltiples entradas, ideal para eventos y fiestas.', TRUE, TRUE, 'https://www.electronicasannicolas.com.co/medias/amplificador-st-1000w.jpg', 19),
('Fender Mustang GTX100', 'Amplificador de guitarra de 100W con modelado digital y pantalla táctil.', 500.00, NULL, 'Diversos efectos integrados, conectividad Wi-Fi, diseño moderno.', TRUE, TRUE, 'https://www.fender.com/medias/mustang-gtx100.jpg', 19),
('Denon AVR-X3700H', 'Receptor AV de 9.2 canales con soporte para 8K, Dolby Atmos y DTS:X.', 1000.00, NULL, 'Amplia conectividad, compatibilidad con sistemas de cine en casa avanzados.', TRUE, TRUE, 'https://www.denon.com/medias/avr-x3700h.jpg', 19),
('Yamaha RX-V6A', 'Receptor AV de 7.2 canales con soporte para 8K, Dolby Atmos y MusicCast.', 800.00, NULL, 'Diseño compacto, múltiples opciones de streaming, fácil configuración.', TRUE, TRUE, 'https://www.yamaha.com/medias/rx-v6a.jpg', 19),
('Sony STR-DN1080', 'Receptor AV de 7.2 canales con soporte para Dolby Atmos, DTS:X y 4K HDR.', 700.00, NULL, 'Tecnología de calibración automática, múltiples entradas HDMI.', TRUE, TRUE, 'https://www.sony.com/medias/str-dn1080.jpg', 19);

-- Sistemas de Home Theater
INSERT INTO PRODUCTOS (NOMBRE, DESCRIPCION, PRECIO, PRECIO_DESCUENTO, CARACTERISTICAS, DESTACADO, NOVEDAD, FOTO, ID_CATEGORIA) VALUES
('Bose Lifestyle 650', 'Sistema de cine en casa de 5.1 canales con altavoces OmniJewel y consola de control.', 4000.00, NULL, 'Sonido envolvente premium, diseño elegante, fácil instalación.', TRUE, TRUE, 'https://www.bose.com/medias/lifestyle-650.jpg', 20),
('Sony HT-A7000', 'Barra de sonido de 7.1.2 canales con Dolby Atmos, DTS:X y tecnología 360 Reality Audio.', 1500.00, NULL, 'Subwoofer inalámbrico incluido, múltiples opciones de conectividad.', TRUE, TRUE, 'https://www.sony.com/medias/ht-a7000.jpg', 20),
('Samsung HW-Q950T', 'Sistema de sonido 9.1.4 con barra de sonido y altavoces traseros inalámbricos.', 1300.00, NULL, 'Sonido envolvente con Dolby Atmos, integración con QLED TVs.', TRUE, TRUE, 'https://www.samsung.com/medias/hw-q950t.jpg', 20),
('LG SN11RG', 'Barra de sonido de 7.1.4 canales con altavoces traseros, Dolby Atmos y DTS:X.', 1200.00, NULL, 'Sonido de alta fidelidad, compatibilidad con AI Sound Pro.', TRUE, TRUE, 'https://www.lg.com/medias/sn11rg.jpg', 20),
('Sonos Arc', 'Barra de sonido de 5.1.2 canales con soporte para Dolby Atmos y control por voz.', 800.00, NULL, 'Diseño minimalista, integración con sistemas Sonos existentes.', TRUE, TRUE, 'https://www.sonos.com/medias/arc.jpg', 20);

-- Interfaces de Audio
INSERT INTO PRODUCTOS (NOMBRE, DESCRIPCION, PRECIO, PRECIO_DESCUENTO, CARACTERISTICAS, DESTACADO, NOVEDAD, FOTO, ID_CATEGORIA) VALUES
('Focusrite Scarlett 2i2', 'Interfaz de audio USB con dos entradas y salidas, ideal para grabación en casa.', 160.00, NULL, 'Conversión de alta calidad, incluye software de grabación.', TRUE, TRUE, 'https://www.focusrite.com/medias/scarlett-2i2.jpg', 21),
('PreSonus AudioBox USB 96', 'Interfaz de audio compacta con dos entradas, perfecta para proyectos de grabación portátiles.', 100.00, NULL, 'Compatible con múltiples DAWs, incluye software Studio One Artist.', TRUE, TRUE, 'https://www.presonus.com/medias/audiobox-usb-96.jpg', 21),
('Behringer UMC22', 'Interfaz de audio USB con preamplificador MIDAS, ideal para grabaciones de alta calidad.', 50.00, NULL, 'Diseño robusto, alimentación phantom para micrófonos de condensador.', TRUE, TRUE, 'https://www.behringer.com/medias/umc22.jpg', 21),
('M-Audio M-Track Duo', 'Interfaz de audio USB con dos entradas combo XLR/TRS, perfecta para músicos y podcasters.', 80.00, NULL, 'Alimentación phantom, incluye software Pro Tools First.', TRUE, TRUE, 'https://www.m-audio.com/medias/m-track-duo.jpg', 21),
('Native Instruments Komplete Audio 6', 'Interfaz de audio USB con seis entradas y salidas, diseñada para profesionales.', 200.00, NULL, 'Conversión de alta fidelidad, construcción sólida, incluye software Komplete Elements.', TRUE, TRUE, 'https://www.native-instruments.com/medias/komplete-audio-6.jpg', 21);

 
-- Teclados
INSERT INTO PRODUCTOS (NOMBRE, DESCRIPCION, PRECIO, PRECIO_DESCUENTO, CARACTERISTICAS, DESTACADO, NOVEDAD, FOTO, ID_CATEGORIA) VALUES
('Logitech G213 Prodigy', 'Teclado de membrana con retroiluminación RGB personalizable y teclas resistentes al agua.', 60.00, NULL, 'Diseño ergonómico, teclas de bajo perfil, ideal para gaming y uso diario.', TRUE, FALSE, 'https://www.logitech.com/assets/65537/2/g213-prodigy-gaming-keyboard-gallery-1.jpg', 22),
('Razer BlackWidow V4 X - Minecraft Edition', 'Teclado mecánico con iluminación RGB temática de Minecraft y teclas de alto rendimiento.', 120.00, NULL, 'Interruptores mecánicos Razer, teclas multimedia dedicadas, diseño robusto.', TRUE, TRUE, 'https://assets.razerzone.com/eeimages/products/30673/razer-blackwidow-v4-x-minecraft-edition-gallery-1.jpg', 22),
('Corsair K70 RGB MK.2', 'Teclado mecánico con interruptores Cherry MX, retroiluminación RGB y teclas multimedia dedicadas.', 150.00, NULL, 'Construcción de aluminio cepillado, reposamuñecas desmontable, perfiles de usuario.', TRUE, TRUE, 'https://www.corsair.com/corsairmedia/sys_master/productcontent/CH-9109010-NA_Gallery_01.jpg', 22),
('HyperX Alloy FPS Pro', 'Teclado mecánico compacto sin teclado numérico, ideal para juegos FPS y portabilidad.', 80.00, NULL, 'Interruptores mecánicos HyperX, iluminación LED roja, diseño compacto.', FALSE, FALSE, 'https://www.hyperxgaming.com/media/1684/hyperx-alloy-fps-pro-gallery-1.jpg', 22),
('Razer Huntsman Mini', 'Teclado mecánico de 60% con interruptores ópticos Razer y diseño compacto.', 130.00, NULL, 'Interruptores ópticos de acción rápida, iluminación Razer Chroma, construcción sólida.', TRUE, TRUE, 'https://assets.razerzone.com/eeimages/products/30660/razer-huntsman-mini-gallery-1.jpg', 22);

-- Ratones
INSERT INTO PRODUCTOS (NOMBRE, DESCRIPCION, PRECIO, PRECIO_DESCUENTO, CARACTERISTICAS, DESTACADO, NOVEDAD, FOTO, ID_CATEGORIA) VALUES
('Logitech MX518', 'Ratón ergonómico con sensor óptico de alta precisión y diseño clásico.', 40.00, NULL, 'Diseño icónico, 8 botones programables, rueda de desplazamiento de alta velocidad.', TRUE, FALSE, 'https://www.logitech.com/assets/65537/2/mx518-hero-gaming-mouse-gallery-1.jpg', 23),
('Razer DeathAdder Elite', 'Ratón ergonómico con sensor óptico de 16,000 DPI y iluminación Chroma RGB.', 60.00, NULL, 'Diseño ergonómico, 7 botones programables, iluminación Razer Chroma.', TRUE, FALSE, 'https://assets.razerzone.com/eeimages/products/15006/razer-deathadder-elite-gallery-1.jpg', 23),
('Logitech G502 Hero', 'Ratón para juegos con sensor HERO de 16,000 DPI y múltiples botones programables.', 80.00, NULL, 'Diseño ergonómico, 11 botones programables, iluminación RGB.', TRUE, TRUE, 'https://www.logitech.com/assets/65537/2/g502-hero-gaming-mouse-gallery-1.jpg', 23),
('Razer Naga X', 'Ratón ergonómico con 16 botones programables, ideal para juegos MMO.', 70.00, NULL, 'Diseño ergonómico, 16 botones programables, iluminación Razer Chroma.', TRUE, FALSE, 'https://assets.razerzone.com/eeimages/products/30656/razer-naga-x-gallery-1.jpg', 23),
('SteelSeries Rival 600', 'Ratón con sensor TrueMove3+ de 12,000 DPI y sistema de peso ajustable.', 90.00, NULL, 'Diseño ergonómico, 7 botones programables, iluminación RGB.', TRUE, TRUE, 'https://steelseries.com/media/1683/steelseries-rival-600-gallery-1.jpg', 23);

-- Mouses Gaming
INSERT INTO PRODUCTOS (NOMBRE, DESCRIPCION, PRECIO, PRECIO_DESCUENTO, CARACTERISTICAS, DESTACADO, NOVEDAD, FOTO, ID_CATEGORIA) VALUES
('Redragon M686 Vampire Elite', 'Ratón gaming inalámbrico con sensor de 16,000 DPI y diseño ergonómico.', 50.00, NULL, 'Conexión inalámbrica de 2.4GHz, 7 botones programables, iluminación LED.', TRUE, FALSE, 'https://www.redragonzone.com/medias/M686-Vampire-Elite.jpg', 24),
('Logitech G Pro X Superlight', 'Ratón ultraligero con sensor HERO de 25,600 DPI, diseñado para eSports.', 150.00, NULL, 'Peso ultraligero, diseño ergonómico, 5 botones programables.', TRUE, TRUE, 'https://www.logitech.com/assets/65537/2/g-pro-x-superlight-wireless-gaming-mouse-gallery-1.jpg', 24),
('Razer Basilisk Ultimate', 'Ratón gaming inalámbrico con sensor Focus+ de 20,000 DPI y 11 botones programables.', 130.00, NULL, 'Conexión inalámbrica HyperSpeed, iluminación Razer Chroma, diseño ergonómico.', TRUE, FALSE, 'https://assets.razerzone.com/eeimages/products/30637/razer-basilisk-ultimate-gallery-1.jpg', 24),
('Corsair Dark Core RGB/SE', 'Ratón gaming con sensor óptico de 16,000 DPI, diseño ergonómico y opciones de agarre intercambiables.', 110.00, NULL, 'Conexión inalámbrica y por cable, 9 botones programables, iluminación RGB.', TRUE, FALSE, 'https://www.corsair.com/corsairmedia/sys_master/productcontent/CH-9311011-NA_Gallery_01.jpg', 24),
('SteelSeries Rival 650 Wireless', 'Ratón gaming inalámbrico con carga rápida y sensor TrueMove3+ de 12,000 DPI.', 120.00, NULL, 'Carga inalámbrica, 7 botones programables, iluminación RGB.', TRUE, TRUE, 'https://steelseries.com/media/1682/steelseries-rival-650-gallery-1.jpg', 24);
 


