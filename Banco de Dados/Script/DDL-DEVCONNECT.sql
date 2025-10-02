CREATE DATABASE DevConnect
GO

CREATE TABLE tb_Usuario(
	id				INT IDENTITY	(1,1) PRIMARY KEY,
	nomeCompleto	NVARCHAR		(255) NOT NULL,
	nomeDeUsuario	NVARCHAR		(20) UNIQUE NOT NULL,
	email			NVARCHAR		(255) UNIQUE NOT NULL,
	senha			NVARCHAR		(50) NOT NULL,
	fotoPerfilUrl	NVARCHAR		(255)
);

SELECT * FROM tb_Usuario;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ --

CREATE TABLE tb_Publicacao(
	id				INT IDENTITY	(1,1) PRIMARY KEY,
	descricao		NVARCHAR		(500),
	imagemUrl		NVARCHAR		(255) NOT NULL,
	data_Publicacao DATE NOT NULL,
	id_Usuario		INT NOT NULL FOREIGN KEY REFERENCES tb_Usuario(id)
);
SELECT * FROM tb_Publicacao;

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ --

CREATE TABLE tb_Curtida(
	id				INT IDENTITY	(1,1) PRIMARY KEY,
	id_Usuario		INT NOT NULL FOREIGN KEY REFERENCES tb_Usuario(id),
	id_Publicacao	INT NOT NULL FOREIGN KEY REFERENCES tb_Publicacao(id)
);
SELECT * FROM tb_Curtida;

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ --

CREATE TABLE tb_Comentario(
	id				INT IDENTITY	(1,1) PRIMARY KEY,
	texto			NVARCHAR		(300) NOT NULL,
	dataComentario	DATE NOT NULL,
	id_Publicacao	INT NOT NULL FOREIGN KEY REFERENCES tb_Publicacao(id),
	id_Usuario		INT NOT NULL FOREIGN KEY REFERENCES tb_Usuario(id)
);
SELECT * FROM tb_Comentario;

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ --



CREATE TABLE tb_Seguidor(                                   --tabela intermediaria
	id_Usuario_Seguir INT NOT NULL,  --usuario que quer seguir
	id_Usuario_Seguido INT NOT NULL,  --usuario que será seguido
	PRIMARY KEY (id_Usuario_Seguir, id_Usuario_Seguido)
);
SELECT * FROM tb_Seguidor;
