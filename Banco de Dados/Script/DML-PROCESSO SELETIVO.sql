--DML
USE db_devconnect;

--TABELA PUBLICAÇÃO
INSERT INTO tb_publicacao(nome_usuario, textos ,imagens_url, data_publi, id_usuario)
VALUES ('jvzinn2803' ,'opa opa', 'www.image_zago.br', '2025-10-02', 10);

INSERT INTO tb_publicacao(nome_usuario, textos ,imagens_url, data_publi, id_usuario)
VALUES('rosa-Flores' ,'Vendendo Tulipas', 'www.tulipas.br', '2022-8-08', 15);

SELECT * FROM tb_publicacao;

------------------------------------------------------------------------------------

--TABELA USUÁRIO
INSERT INTO Usuario(nome_completo, nome_usuario, email, numero_senha, foto_perfil)
VALUES ('João Vitor', 'jvzinn2803', 'jvlindo@gmail.com', '28jv03amy', 'www.image_zago.br');


INSERT INTO Usuario(nome_completo, nome_usuario, email, numero_senha, foto_perfil)
VALUES('Rosa', 'rosa-Flores', 'rosaF@gmail', 'flores-da-rosa', 'www.flores.br');

INSERT INTO Usuario(nome_completo, nome_usuario, email, numero_senha, foto_perfil)
  VALUES  ('Mario', 'Mario-games123', 'mariogamms155@email', 'games-life155', 'http//image-playstation.com');
	  

SELECT * FROM Usuario;
------------------------------------------------------------------------------------
--TABELA SEGUIDOR
INSERT INTO tb_seguidor(id_usuario_seguir, id_usuario_seguida)
VALUES (1, 2);

SELECT * FROM tb_seguidor;

------------------------------------------------------------------------------------
--TABELA CURTIDA
INSERT INTO tb_curtida(nome_usuario, data_publi, horario_curtida, id_publicacao)
VALUES ('jvzinn2803', '2024-06-04', '14:30:20', 1);

INSERT INTO tb_curtida(nome_usuario, data_publi, horario_curtida, id_publicacao)
VALUES ('rosa-Flores', '2023-08-22', '22:10:20');

INSERT INTO tb_curtida(nome_usuario, data_publi, horario_curtida, id_publicacao)
VALUES ('Mario-games123', '2025-10-09', '00:35:56');

SELECT * FROM tb_curtida;
------------------------------------------------------------------------------------
--TABELA COMENTÁRIO
INSERT INTO tb_comentario(nome_usuario, textos_coment, horario_coment,image_coment_url, id_publicacao)
VALUES ('rosa-Santos', 'amo flores', '11:20:00','http//image',  2);


INSERT INTO tb_comentario(nome_usuario, textos_coment, horario_coment,image_coment_url, id_publicacao)
VALUES ('jvzinn2803', 'amo basquete', '13:45:12', 'http//image-lebromjames', 2);

INSERT INTO tb_comentario(nome_usuario, textos_coment, horario_coment,image_coment_url)
VALUES ('mario-games123', 'Hj vai ter live em', '11:55:02', '');


SELECT * FROM tb_comentario;
