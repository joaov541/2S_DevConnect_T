--DDl
CREATE DATABASE db_devconnect;

USE db_devconnect;



---------------------------------------------------------


CREATE TABLE tb_usuario(	
id_usuario			INT				IDENTITY(1,1) PRIMARY KEY,
nome_completo	NVARCHAR(255)				  NOT NULL,
nome_usuario	NVARCHAR(50)	UNIQUE		  NOT NULL,
email			NVARCHAR(255)	UNIQUE		  NOT NULL,
numero_senha	NVARCHAR(50)	UNIQUE		  NOT NULL,
foto_perfil		NVARCHAR(255)				  NOT NULL,
);

SELECT * FROM tb_usuario;

      EXEC sp_rename 'tb_usuario.id', 'id_usuario', 'COLUMN';

     
---------------------------------------------------------
---------------------------------------------------------


CREATE TABLE tb_publicacao(
id_publicacao				INT IDENTITY(1,1)	PRIMARY KEY,
nome_usuario	NVARCHAR (255)		NOT NULL,
textos			NVARCHAR (255)		NULL,
imagens_url		NVARCHAR(255)		NULL,
data_publi		DATE				NOT NULL,

id_usuario INT FOREIGN KEY REFERENCES tb_usuario(id_usuario)

);

SELECT * FROM tb_publicacao;

      EXEC sp_rename 'tb_publicacao.id', 'id_publicacao', 'COLUMN';


DELETE FROM tb_publicacao
WHERE id = 1;

ALTER TABLE tb_publicacao
DROP COLUMN nome_usuario;


----------------------------------------------------------------
CREATE TABLE tb_seguidor(
id_usuario_seguir		INT NOT NULL,
id_usuario_seguida		INT NOT NULL,
PRIMARY KEY				(id_usuario_seguir, id_usuario_seguida)
);

SELECT * FROM tb_seguidor;

---------------------------------------------------------
CREATE TABLE tb_curtida(
id_curtida					INT				IDENTITY (1,1)  PRIMARY KEY,
data_curtida		DATE							NOT NULL,
horario_curtida		TIME							NOT NULL,

id_publicacao		INT FOREIGN KEY REFERENCES tb_publicacao(id_publicacao),
id_usuario          INT FOREIGN KEY REFERENCES tb_usuario(id_usuario)
);

SELECT * FROM tb_curtida;
 
       EXEC sp_rename 'tb_curtida.id', 'id_curtida', 'COLUMN';

     ALTER TABLE tb_curtida
     ADD PRIMARY KEY (id_usuario, id_publicacao);

---------------------------------------------------------

CREATE TABLE tb_comentario(
id_comentario		INT IDENTITY(1,1)	PRIMARY KEY,
nome_usuario		NVARCHAR (255)		UNIQUE NOT NULL,
textos_coment		NVARCHAR (255)			   NOT NULL,
horario_coment		TIME					   NOT NULL,
imagem_coment		NVARCHAR (255)				   NOT NULL,

id_publicacao INT FOREIGN KEY REFERENCES tb_publicacao(id_publicacao)
);

       EXEC sp_rename 'tb_comentario.id', 'id_comentario', 'COLUMN';

SELECT * FROM tb_comentario;

 ALTER TABLE tb_comentario
 ADD PRIMARY KEY (id_usuario);

---------------------------------------------------------

