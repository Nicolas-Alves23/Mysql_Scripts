-- Criação do banco
CREATE DATABASE exemplo_joins;
-- drop database exemplo_joins;
USE exemplo_joins;

-- Tabela de clientes
CREATE TABLE clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    cidade VARCHAR(50)
);

-- Tabela de pedidos
CREATE TABLE pedidos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    produto VARCHAR(50),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Tabela de fornecedores
CREATE TABLE fornecedores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    cidade VARCHAR(50)
);

-- Tabela de produtos
CREATE TABLE produtos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    categoria VARCHAR(50)
);

-- INSERINDO CLIENTES
INSERT INTO clientes (nome, cidade) VALUES
('Alice', 'Campinas'),
('Bruno', 'Sumaré'),
('Carla', 'Hortolândia'),
('Diego', 'Americana'),
('Eduarda', 'Campinas');

-- INSERINDO PEDIDOS
INSERT INTO pedidos (cliente_id, produto) VALUES
(1, 'Notebook'),
(1, 'Mouse'),
(2, 'Teclado'),
(4, 'Monitor');
-- Carla (id 3) e Eduarda (id 5) não fizeram pedidos

-- INSERINDO FORNECEDORES
INSERT INTO fornecedores (nome, cidade) VALUES
('TecMaster', 'Sumaré'),
('InfoVale', 'Valinhos'),
('CampEletrônicos', 'Campinas');

-- INSERINDO PRODUTOS
INSERT INTO produtos (nome, categoria) VALUES
('Notebook', 'Informática'),
('Mouse', 'Periféricos'),
('Teclado', 'Periféricos'),
('Monitor', 'Imagem'),
('Impressora', 'Periféricos');

SELECT c.nome, p.produto
FROM clientes c
INNER JOIN pedidos p ON c.id = p.cliente_id;

SELECT c.nome, p.produto
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.cliente_id;

SELECT p.produto, c.nome
FROM pedidos p
RIGHT JOIN clientes c ON p.cliente_id = c.id;

SELECT c.nome, p.produto
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.cliente_id
UNION ALL
SELECT c.nome, p.produto
FROM clientes c
RIGHT JOIN pedidos p ON c.id = p.cliente_id;

SELECT c.nome from clientes c
UNION
SELECT p.produto from pedidos p;

SELECT c.nome, p.nome
FROM clientes c
CROSS JOIN produtos p;