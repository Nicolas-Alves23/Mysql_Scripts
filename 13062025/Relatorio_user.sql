-- User relatorio permitido somente dar select's
-- Exercicio 1
CREATE USER 'relatorio_user'@'localhost' IDENTIFIED BY '1234rel';

GRANT SELECT ON biblioteca_joins.* TO 'relatorio_user'@'localhost';

SHOW GRANTS FOR 'relatorio_user'@'localhost';

-- Exercicio 2
CREATE USER 'editor_produto'@'localhost' IDENTIFIED BY '1234rel';

GRANT SELECT, UPDATE ON biblioteca_joins.livros TO 'editor_produto'@'localhost';

SHOW GRANTS FOR 'editor_produto'@'localhost';

-- Exercio 3
CREATE USER 'gestorRH'@'localhost' IDENTIFIED BY '1234rel';

GRANT SELECT,UPDATE ON biblioteca_joins.autores TO 'gestorRH'@'localhost';

SHOW GRANTS FOR 'gestorRH'@'localhost';

-- Exercicio 4
CREATE USER 'dev_backup'@'localhost' IDENTIFIED BY '1234rel';

GRANT ALL PRIVILEGES ON biblioteca_joins.* TO 'dev_backup'@'localhost';

SHOW GRANTS FOR 'dev_backup'@'localhost';

-- Exercicio 5
REVOKE UPDATE ON biblioteca_joins.livros FROM 'editor_produto'@'localhost';

-- Exercicio 6 
DROP USER 'relatorio_user'@'localhost';

-- Exercicio 7
SHOW GRANTS FOR 'gestorRH'@'localhost';

-- Exercicio 8
CREATE USER 'analista_fiscal'@'localhost' IDENTIFIED BY '1234rel';

GRANT SELECT ON biblioteca_joins.editoras TO 'analista_fiscal'@'localhost';

SHOW GRANTS FOR 'analista_fiscal'@'localhost';

-- Exercicio 9
CREATE USER 'mobile_app'@'%' IDENTIFIED BY '1234rel';

GRANT SELECT ON biblioteca_joins.emprestimos TO 'mobile_app'@'%';

SHOW GRANTS FOR 'mobile_app'@'%';

-- Exercicio 10

REVOKE ALL PRIVILEGES ON biblioteca_joins.emprestimos FROM 'mobile_app'@'%';