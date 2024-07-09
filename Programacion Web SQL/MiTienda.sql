-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2024-07-09 05:04:33 CLT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE compra (
    fecha_c               DATE NOT NULL,
    total_c               NUMBER NOT NULL,
    usuario_username      VARCHAR2(50) NOT NULL,
    usuarioadmin_username VARCHAR2(100) NOT NULL,
    compra_id             NUMBER NOT NULL
);

ALTER TABLE compra ADD CONSTRAINT compra_pk PRIMARY KEY ( compra_id );

CREATE TABLE detalle_compra (
    cantidad_c        NUMBER NOT NULL,
    detalle_compra_id NUMBER NOT NULL,
    compra_id         NUMBER NOT NULL,
    producto_id       NUMBER NOT NULL
);

ALTER TABLE detalle_compra ADD CONSTRAINT detalle_compra_pk PRIMARY KEY ( detalle_compra_id );

CREATE TABLE producto (
    nombre_pr      VARCHAR2(60) NOT NULL,
    descripcion_pr VARCHAR2(500) NOT NULL,
    precio_pr      NUMBER NOT NULL,
    stock_pr       NUMBER NOT NULL,
    imagen         BLOB NOT NULL,
    producto_id    NUMBER NOT NULL
);

ALTER TABLE producto ADD CONSTRAINT producto_pk PRIMARY KEY ( producto_id );

CREATE TABLE usuario (
    username VARCHAR2(50) NOT NULL,
    email    VARCHAR2(100) NOT NULL,
    password VARCHAR2(40) NOT NULL
);

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( username );

CREATE TABLE usuarioadmin (
    username VARCHAR2(100) NOT NULL,
    email    VARCHAR2(200) NOT NULL,
    password VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL
);

ALTER TABLE usuarioadmin ADD CONSTRAINT usuarioadmin_pk PRIMARY KEY ( username );

ALTER TABLE compra
    ADD CONSTRAINT compra_usuario_fk FOREIGN KEY ( usuario_username )
        REFERENCES usuario ( username );

ALTER TABLE compra
    ADD CONSTRAINT compra_usuarioadmin_fk FOREIGN KEY ( usuarioadmin_username )
        REFERENCES usuarioadmin ( username );

ALTER TABLE detalle_compra
    ADD CONSTRAINT detalle_compra_compra_fk FOREIGN KEY ( compra_id )
        REFERENCES compra ( compra_id );

ALTER TABLE detalle_compra
    ADD CONSTRAINT detalle_compra_producto_fk FOREIGN KEY ( producto_id )
        REFERENCES producto ( producto_id );

CREATE SEQUENCE compra_compra_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER compra_compra_id_trg BEFORE
    INSERT ON compra
    FOR EACH ROW
    WHEN ( new.compra_id IS NULL )
BEGIN
    :new.compra_id := compra_compra_id_seq.nextval;
END;
/

CREATE SEQUENCE detalle_compra_detalle_compra_ START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER detalle_compra_detalle_compra_ BEFORE
    INSERT ON detalle_compra
    FOR EACH ROW
    WHEN ( new.detalle_compra_id IS NULL )
BEGIN
    :new.detalle_compra_id := detalle_compra_detalle_compra_.nextval;
END;
/

CREATE SEQUENCE producto_producto_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER producto_producto_id_trg BEFORE
    INSERT ON producto
    FOR EACH ROW
    WHEN ( new.producto_id IS NULL )
BEGIN
    :new.producto_id := producto_producto_id_seq.nextval;
END;
/



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             0
-- ALTER TABLE                              9
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           3
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          3
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
