
CREATE USER IF NOT EXISTS 'domicilios_reportes'@'localhost' IDENTIFIED BY 'Reportes#2026';


GRANT SELECT ON `Domicilios`.* TO 'domicilios_reportes'@'localhost';


CREATE USER IF NOT EXISTS 'domicilios_operador'@'localhost' IDENTIFIED BY 'Operador#2026';


GRANT SELECT, INSERT, UPDATE ON `Domicilios`.* TO 'domicilios_operador'@'localhost';


REVOKE DELETE ON `Domicilios`.* FROM 'domicilios_operador'@'localhost';


FLUSH PRIVILEGES;

SHOW GRANTS FOR 'domicilios_reportes'@'localhost';
SHOW GRANTS FOR 'domicilios_operador'@'localhost';