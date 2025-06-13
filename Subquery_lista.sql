-- Banco:
DROP DATABASE bibliotecaonline;
CREATE DATABASE bibliotecaonline;
USE bibliotecaonline;

-- Tabela: Autores (IDs de 100+)
CREATE TABLE Autores (
 id INT PRIMARY KEY,
 nome VARCHAR(100)
);

INSERT INTO Autores (id, nome) VALUES
(101, 'Machado de Assis'),
(102, 'Monteiro Lobato'),
(103, 'Clarice Lispector'),
(104, 'Paulo Coelho');

-- Tabela: Editoras (IDs de 200+)
CREATE TABLE Editoras (
 id INT PRIMARY KEY,
 nome VARCHAR(100)
);

INSERT INTO Editoras (id, nome) VALUES
(201, 'Companhia das Letras'),
(202, 'Editora Globo'),
(203, 'Rocco'),
(204, 'Saraiva');

-- Tabela: Livros (IDs de 300+)
CREATE TABLE Livros (
 id INT PRIMARY KEY,
 titulo VARCHAR(100),
 id_autor INT,
 id_editora INT,
 ano_publicacao INT,
 FOREIGN KEY (id_autor) REFERENCES Autores(id),
 FOREIGN KEY (id_editora) REFERENCES Editoras(id)
);

INSERT INTO Livros (id, titulo, id_autor, id_editora, ano_publicacao) VALUES
(301, 'Dom Casmurro', 101, 201, 1899),
(302, 'O Alienista', 101, 201, 1882),
(303, 'Reinações de Narizinho', 102, 204, 1931),
(304, 'A Hora da Estrela', 103, 203, 1977),
(305, 'O Alquimista', 104, 202, 1988);

-- Tabela: Leitores (IDs de 400+)
CREATE TABLE Leitores (
 id INT PRIMARY KEY,
 nome VARCHAR(100)
);

INSERT INTO Leitores (id, nome) VALUES
(401, 'Ana Clara'),
(402, 'Bruno Martins'),
(403, 'Carlos Souza');

-- Tabela: Emprestimos (IDs de 500+)
CREATE TABLE Emprestimos (
 id INT PRIMARY KEY,
 id_livro INT,
 id_leitor INT,
 data_emprestimo DATE,
 data_devolucao DATE,
 FOREIGN KEY (id_livro) REFERENCES Livros(id),
 FOREIGN KEY (id_leitor) REFERENCES Leitores(id)
);

INSERT INTO Emprestimos (id, id_livro, id_leitor, data_emprestimo, data_devolucao) VALUES
(501, 301, 401, '2025-05-01', '2025-05-10'),
(502, 304, 401, '2025-05-05', NULL),
(503, 303, 402, '2025-05-02', '2025-05-09');

-- 1
SELECT 
	titulo,
    ano_publicacao
FROM Livros
WHERE id_editora = (
    SELECT id FROM Editoras
    WHERE nome = 'Companhia das Letras'
);

-- 2
SELECT
	nome
FROM Autores
WHERE id IN (
    SELECT id_autor FROM Livros
    WHERE id_editora = (
        SELECT id FROM Editoras
        WHERE nome = 'Rocco'
    )
);

-- 3
SELECT 
	titulo
FROM Livros
WHERE id IN (
    SELECT id_livro FROM Emprestimos
    WHERE id_leitor = (
        SELECT id FROM Leitores
        WHERE nome = 'Ana Clara'
    )
);

-- 4
SELECT 
	titulo
FROM Livros
WHERE id IN (
    SELECT id_livro FROM Emprestimos
    WHERE data_devolucao IS NULL
);

-- 5
SELECT 
	nome
FROM Autores
WHERE id IN (
    SELECT id_autor FROM Livros
    WHERE id IN (
        SELECT id_livro FROM Emprestimos
        WHERE data_devolucao IS NULL
    )
);

-- 6
SELECT 
	nome
FROM Leitores
WHERE id IN (
    SELECT id_leitor
    FROM Emprestimos
    WHERE data_devolucao IS NULL
);

-- 7
	

-- 8
SELECT 
	titulo,
  (SELECT 
	nome 
	FROM Editoras 
    WHERE id = Livros.id_editora) 
    AS nome_editora
FROM Livros;

-- 9
SELECT 
	sub.nome_leitor, 
	sub.titulo_livro
FROM (
    SELECT L.nome AS nome_leitor, 
    LV.titulo AS titulo_livro
    FROM Emprestimos E
    JOIN Leitores L ON E.id_leitor = L.id
    JOIN Livros LV ON E.id_livro = LV.id
    WHERE E.data_devolucao IS NULL
) AS sub;

-- 10
SELECT 
	nome
FROM (
    SELECT Editora.nome
    FROM Emprestimos E
    JOIN Livros L ON E.id_livro = L.id
    JOIN Editoras Editora ON L.id_editora = Editora.id
) AS subconsulta;
