--DDl
CREATE DATABASE db_devconnect;

USE db_devconnect;

---------------------------------------------------------


CREATE TABLE tb_publicacao(
id				INT IDENTITY(1,1)	PRIMARY KEY,
nome_usuario	NVARCHAR (255)		NOT NULL,
textos			NVARCHAR (255)		NULL,
imagens_url		NVARCHAR(255)		NULL,
data_publi		DATE				NOT NULL,

id_usuario INT FOREIGN KEY REFERENCES tb_usuario(id)

);

SELECT * FROM tb_publicacao;

DELETE FROM tb_publicacao
WHERE id = 1;

DELETE FROM tb_publicacao
WHERE id = 3;
---------------------------------------------------------


CREATE TABLE Usuario(	
id				INT				IDENTITY(1,1) PRIMARY KEY,
nome_completo	NVARCHAR(255)				  NOT NULL,
nome_usuario	NVARCHAR(50)	UNIQUE		  NOT NULL,
email			NVARCHAR(255)	UNIQUE		  NOT NULL,
numero_senha	NVARCHAR(50)	UNIQUE		  NOT NULL,
foto_perfil		NVARCHAR(255)				  NOT NULL,
);

SELECT * FROM Usuario;
---------------------------------------------------------

CREATE TABLE tb_seguidor(
id_usuario_seguir		INT NOT NULL,
id_usuario_seguida		INT NOT NULL,
PRIMARY KEY				(id_usuario_seguir, id_usuario_seguida)
);

SELECT * FROM tb_seguidor;

---------------------------------------------------------
CREATE TABLE tb_curtida(
id					INT				IDENTITY (1,1)  PRIMARY KEY,
nome_usuario		NVARCHAR (255)  UNIQUE			NOT NULL,
data_publi			DATE							NOT NULL,
horario_curtida		TIME							NOT NULL,

id_publicacao		INT FOREIGN KEY REFERENCES tb_publicacao(id)
id_usuario INT FOREIGN KEY REFERENCES tb_usuario(id)
);

SELECT * FROM tb_curtida;

---------------------------------------------------------

CREATE TABLE tb_comentario(
id					INT IDENTITY(1,1)	PRIMARY KEY,
nome_usuario		NVARCHAR (255)		UNIQUE NOT NULL,
textos_coment		NVARCHAR (255)			   NOT NULL,
horario_coment		TIME					   NOT NULL,
imagem_coment		NVARCHAR (255)				   NOT NULL,

id_publicacao INT FOREIGN KEY REFERENCES tb_publicacao(id)
);

SELECT * FROM tb_comentario;
---------------------------------------------------------