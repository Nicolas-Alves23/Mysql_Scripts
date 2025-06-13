DROP DATABASE IF EXISTS AtvGianalu;
CREATE DATABASE AtvGianalu;
USE AtvGianalu;

CREATE TABLE Cadastros(
	id_cadastro INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(50),
    val_produto DOUBLE,
    desconto_produto FLOAT
);

CREATE TABLE Usuarios(
	id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome_usuario VARCHAR(80),
    idade INT,
    email VARCHAR(100)
);

CREATE TABLE Pedidos(
	id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_cadastro INT,
    data_pedido datetime,
    quantidade_pediu INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_cadastro) REFERENCES Cadastros(id_cadastro)
);

INSERT INTO Usuarios (nome_usuario, idade, email) VALUES
('Luana Cristina Dias', 28, 'lucrisdias@email.com'),
('Giovana Clara Mota', 35, 'giclaramota@email.com');

INSERT INTO Cadastros (nome_produto, val_produto, desconto_produto) VALUES
('Bolsa', 79.90, 10.0),
('Mochila', 35.50, 5.0);

INSERT INTO Pedidos(id_usuario, id_cadastro, data_pedido, quantidade_pediu )
VALUES
(1,2,now(),2),
(2,1,now(),3);


SELECT 
	Pedidos.id_pedido,
    CONCAT(Upper(Usuarios.nome_usuario), ' COMPROU'),
    Cadastros.nome_produto,
    Pedidos.quantidade_pediu,
    Cadastros.val_produto,
    Pedidos.data_pedido
FROM Pedidos
	INNER JOIN Cadastros ON Pedidos.id_cadastro = Cadastros.id_cadastro
    INNER JOIN Usuarios ON Pedidos.id_usuario = Usuarios.id_usuario;