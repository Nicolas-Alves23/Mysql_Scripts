DROP DATABASE IF EXISTS biblioteca_joins;
CREATE DATABASE biblioteca_joins;
USE biblioteca_joins;

-- Tabela de autores (ID a partir de 200)
CREATE TABLE autores (
id_autor INT PRIMARY KEY,
 nome_autor VARCHAR(50)
);

-- Tabela de editoras (ID a partir de 300)
CREATE TABLE editoras (
 id_editora INT PRIMARY KEY,
 nome_editora VARCHAR(50)
);

-- Tabela de livros (ID a partir de 100)
CREATE TABLE livros (
 id_livro INT PRIMARY KEY,
 titulo VARCHAR(100),
 id_autor INT,
 id_editora INT,
 FOREIGN KEY (id_autor) REFERENCES autores(id_autor),
 FOREIGN KEY (id_editora) REFERENCES editoras(id_editora)
);

-- Tabela de leitores (ID a partir de 500)
CREATE TABLE leitores (
 id_leitor INT PRIMARY KEY,
 nome_leitor VARCHAR(50)
);

-- Tabela de empréstimos (ID a partir de 400)
CREATE TABLE emprestimos (
 id_emprestimo INT PRIMARY KEY,
 id_livro INT,
 data DATE
 -- sem FOREIGN KEY para simular dados inválidos
);

-- Associação entre empréstimos e leitores
CREATE TABLE emprestimos_leitores (
 id_emprestimo INT,
 id_leitor INT
 -- sem FOREIGN KEY para simular leitor inexistente
);

START TRANSACTION;
-- Autores
INSERT INTO autores VALUES
(200, 'Machado de Assis'),
(201, 'George Orwell'),
(202, 'Jorge Amado'),
(203, 'Autor Fantasma'); -- não tem livro

SAVEPOINT depois_autores;
-- Editoras
INSERT INTO editoras VALUES
(300, 'Editora Brasil'),
(301, 'Companhia das Letras'),
(302, 'Saraiva'),
(303, 'Editora Fantasma'); -- não tem livro

ROLLBACK TO depois_autores;
COMMIT;



