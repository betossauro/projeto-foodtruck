DROP DATABASE IF EXISTS DBFOODTRUCK;
CREATE DATABASE DBFOODTRUCK;

USE DBFOODTRUCK;


CREATE TABLE TIPOUSUARIO (
IDTIPOUSUARIO INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
DESCRICAO VARCHAR(255)
);

CREATE TABLE USUARIO (
IDUSUARIO INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
IDTIPOUSUARIO INT, FOREIGN KEY (IDTIPOUSUARIO) REFERENCES TIPOUSUARIO (IDTIPOUSUARIO),
NOME VARCHAR(255),
CPF VARCHAR(11) UNIQUE,
EMAIL VARCHAR(255),
TELEFONE VARCHAR(14),
DATACADASTRO DATETIME,
DATAEXPIRACAO DATETIME,
LOGIN VARCHAR(255),
SENHA VARCHAR(255)
);



CREATE TABLE TIPOPRODUTO (
IDTIPOPRODUTO INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
DESCRICAO VARCHAR(255)
);
 
CREATE TABLE PRODUTO (
IDPRODUTO INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
IDTIPOPRODUTO INT, FOREIGN KEY (IDTIPOPRODUTO) REFERENCES TIPOPRODUTO (IDTIPOPRODUTO),
NOME VARCHAR(255) UNIQUE,
PRECO NUMERIC(10,2),
DATACADASTRO DATETIME,
DATAEXCLUSAO DATETIME
);



CREATE TABLE VENDA (
IDVENDA INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
IDUSUARIO INT, FOREIGN KEY (IDUSUARIO) REFERENCES USUARIO (IDUSUARIO),
NUMEROPEDIDO INT,
DATAVENDA DATETIME,
DATACANCELAMENTO DATETIME,
FLAGENTREGA BIT,
TAXAENTREGA NUMERIC(10,2)
);

CREATE TABLE ITEMVENDA (
IDITEMVENDA INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
IDVENDA INT, FOREIGN KEY (IDVENDA) REFERENCES VENDA (IDVENDA),
IDPRODUTO INT, FOREIGN KEY (IDPRODUTO) REFERENCES PRODUTO (IDPRODUTO),
QUANTIDADE INT 
);



CREATE TABLE SITUACAOENTREGA (
IDSITUACAOENTREGA INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
DESCRICAO VARCHAR(255)
);

CREATE TABLE ENTREGA (
IDENTREGA INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
IDVENDA INT, FOREIGN KEY (IDVENDA) REFERENCES VENDA (IDVENDA),
IDENTREGADOR INT, FOREIGN KEY (IDENTREGADOR) REFERENCES USUARIO (IDUSUARIO),
IDSITUACAOENTREGA INT, FOREIGN KEY (IDSITUACAOENTREGA) REFERENCES SITUACAOENTREGA (IDSITUACAOENTREGA),
DATAENTREGA DATETIME
);


INSERT INTO TIPOUSUARIO (descricao) VALUES ('ADMINISTRADOR');
INSERT INTO TIPOUSUARIO (descricao) VALUES ('CLIENTE');
INSERT INTO TIPOUSUARIO (descricao) VALUES ('FUNCIONARIO');
INSERT INTO TIPOUSUARIO (descricao) VALUES ('ENTREGADOR');


INSERT INTO TIPOPRODUTO (descricao) VALUES ('COMIDA');
INSERT INTO TIPOPRODUTO (descricao) VALUES ('BEBIDA'); 
INSERT INTO TIPOPRODUTO (descricao) VALUES ('SOBREMESA');


INSERT INTO SITUACAOENTREGA (descricao) VALUES ('ENTREGA_CANCELADA');
INSERT INTO SITUACAOENTREGA (descricao) VALUES ('PREPARANDO_PEDIDO');
INSERT INTO SITUACAOENTREGA (descricao) VALUES ('EM_ROTA_DE_ENTREGA');
INSERT INTO SITUACAOENTREGA (descricao) VALUES ('PEDIDO_ENTREGUE');




INSERT INTO USUARIO (idtipousuario, nome, cpf, email, telefone, datacadastro, dataexpiracao, login, senha) 
VALUES (1, 'Adriano de Melo', '01234567890', 'adriano@gmail.com', '91111-6666', '2022-10-01', null, 'adriano', 'adriano');
INSERT INTO USUARIO (idtipousuario, nome, cpf, email, telefone, datacadastro, dataexpiracao, login, senha) 
VALUES (2, 'Jessica Melo', '09876543210', 'jessica@gmail.com', '91111-7777', '2022-10-01', null, 'cliente', 'cliente');
INSERT INTO USUARIO (idtipousuario, nome, cpf, email, telefone, datacadastro, dataexpiracao, login, senha) 
VALUES (3, 'Bruna Melo', '09876453210', 'bruna@gmail.com', '91111-8888', '2022-10-01', null, 'func', 'func');
INSERT INTO USUARIO (idtipousuario, nome, cpf, email, telefone, datacadastro, dataexpiracao, login, senha) 
VALUES (4, 'Roberto Melo', '09873456210', 'roberto@gmail.com', '91111-9999', '2022-10-01', null, 'entregador', 'entregador');
INSERT INTO USUARIO (idtipousuario, nome, cpf, email, telefone, datacadastro, dataexpiracao, login, senha) 
VALUES (4, 'Fernanda Melo', '09875634210', 'fernanda@gmail.com', '92222-9999', '2022-10-01', null, 'entregador', 'entregador');

INSERT INTO PRODUTO (idtipoproduto, nome, preco, datacadastro, dataexclusao) VALUES (1, 'Pizza', 50.00, '2022-10-01', null);
INSERT INTO PRODUTO (idtipoproduto, nome, preco, datacadastro, dataexclusao) VALUES (2, 'Coca-Cola', 7.00, '2022-10-01', null);
INSERT INTO PRODUTO (idtipoproduto, nome, preco, datacadastro, dataexclusao) VALUES (3, 'Sorvete', 15.00, '2022-10-01', null);

INSERT INTO VENDA (idusuario, numeropedido, datavenda, datacancelamento, flagentrega, taxaentrega) VALUES (2, 1, '2022-11-03', null, 0, null);
INSERT INTO VENDA (idusuario, numeropedido, datavenda, datacancelamento, flagentrega, taxaentrega) VALUES (2, 1, '2022-11-04', null, 1, 10.00);

INSERT INTO ITEMVENDA (idvenda, idproduto, quantidade) VALUES (1, 1, 2);
INSERT INTO ITEMVENDA (idvenda, idproduto, quantidade) VALUES (1, 2, 2);

INSERT INTO ITEMVENDA (idvenda, idproduto, quantidade) VALUES (2, 1, 1);
INSERT INTO ITEMVENDA (idvenda, idproduto, quantidade) VALUES (2, 2, 2);
INSERT INTO ITEMVENDA (idvenda, idproduto, quantidade) VALUES (2, 3, 2);

INSERT INTO ENTREGA (idvenda, identregador, idsituacaoentrega, dataentrega) VALUES (2, 4, 3, '2022-11-04 21:00:00'); 



SELECT * FROM TIPOUSUARIO;

SELECT * FROM USUARIO;

SELECT * FROM TIPOPRODUTO;

SELECT * FROM PRODUTO;

SELECT * FROM VENDA;

SELECT * FROM ITEMVENDA;

SELECT * FROM ENTREGA;

SELECT * FROM SITUACAOENTREGA;

