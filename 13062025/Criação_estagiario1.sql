CREATE USER 'estagiario1'@'localhost' IDENTIFIED BY 'teste123';

GRANT SELECT ON exemplo_joins.produtos TO 'estagiario1'@'localhost';

SHOW GRANTS FOR 'estagiario1'@'localhost';