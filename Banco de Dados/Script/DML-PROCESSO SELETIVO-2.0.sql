--DML
USE db_devconnect;

--TABELA USUÁRIO
INSERT INTO tb_usuario(nome_completo, nome_usuario, email, numero_senha, foto_perfil)
VALUES ('João Vitor', 'jvzinn2803', 'jvlindo@gmail.com', '28jv03amy', 'www.image_zago.br');


INSERT INTO tb_usuario(nome_completo, nome_usuario, email, numero_senha, foto_perfil)
VALUES('Rosa', 'rosa-Flores', 'rosaF@gmail', 'flores-da-rosa', 'www.flores.br');

INSERT INTO tb_usuario(nome_completo, nome_usuario, email, numero_senha, foto_perfil)
VALUES('Mario', 'Mario-games123', 'mariogamms155@email', 'games-life155', 'http//image-playstation.com');
	  

INSERT INTO tb_usuario(nome_completo, nome_usuario, email, numero_senha, foto_perfil)
VALUES('Adão', 'dãozinho', 'Adao-ss@gmail', '1435AA', 'www.foto.br');


INSERT INTO tb_usuario(nome_completo, nome_usuario, email, numero_senha, foto_perfil)
VALUES('Jurema', 'Juju-beuty', 'Jurema@gmail', '123JUJU', 'www.Roupas.br');

INSERT INTO tb_usuario(nome_completo, nome_usuario, email, numero_senha, foto_perfil)
VALUES('Marcos', 'Marquinhos-125', 'Marcos@gmail', '6633MR', 'www.perfil.br');

SELECT * FROM tb_usuario;

------------------------------------------------------------------------------------

--TABELA PUBLICAÇÃO
INSERT INTO tb_publicacao(nome_usuario, textos ,imagens_url, data_publi, id_usuario)
VALUES ('jvzinn2803' ,'opa opa', 'www.image_zago.br', '2025-10-02', 1);

INSERT INTO tb_publicacao(nome_usuario, textos ,imagens_url, data_publi, id_usuario)
VALUES('rosa-Flores' ,'Vendendo Tulipas', 'www.tulipas.br', '2022-8-08', 2);

INSERT INTO tb_publicacao(nome_usuario, textos ,imagens_url, data_publi, id_usuario)
VALUES ('Mario-Games123', 'Amo o jogo do Spider-Man', 'www.image-spiderman.br', '2025-06-22', 3);

SELECT * FROM tb_publicacao;

------------------------------------------------------------------------------------
--TABELA SEGUIDOR
INSERT INTO tb_seguidor(id_usuario_seguir, id_usuario_seguida)
VALUES (1, 2);

INSERT INTO tb_seguidor(id_usuario_seguir, id_usuario_seguida)
VALUES (6, 1);

INSERT INTO tb_seguidor(id_usuario_seguir, id_usuario_seguida)
VALUES (8, 7);

INSERT INTO tb_seguidor(id_usuario_seguir, id_usuario_seguida)
VALUES (2, 1);

INSERT INTO tb_seguidor(id_usuario_seguir, id_usuario_seguida)
VALUES (6, 1);

INSERT INTO tb_seguidor(id_usuario_seguir, id_usuario_seguida)
VALUES (3, 2);

INSERT INTO tb_seguidor(id_usuario_seguir, id_usuario_seguida)
VALUES (6, 3);


SELECT * FROM tb_seguidor;

------------------------------------------------------------------------------------
--TABELA CURTIDA
INSERT INTO tb_curtida( data_curtida, horario_curtida, id_publicacao, id_usuario)
VALUES ( '2024-06-04', '14:30:20', 3, 1);

INSERT INTO tb_curtida( data_curtida, horario_curtida, id_publicacao, id_usuario)
VALUES ( '2023-08-22', '22:10:20', 1, 2);

INSERT INTO tb_curtida(data_curtida, horario_curtida, id_publicacao, id_usuario)
VALUES ('2025-10-09', '00:35:56', 2, 3);

SELECT * FROM tb_curtida;
------------------------------------------------------------------------------------
--TABELA COMENTÁRIO
INSERT INTO tb_comentario(nome_usuario, textos_coment, horario_coment,imagem_coment, id_publicacao)
VALUES ('rosa-Santos', 'amo flores', '11:20:00','http//image',  2);


INSERT INTO tb_comentario(nome_usuario, textos_coment, horario_coment,imagem_coment, id_publicacao)
VALUES ('jvzinn2803', 'amo basquete', '13:45:12', 'http//image-lebromjames', 1);

INSERT INTO tb_comentario(nome_usuario, textos_coment, horario_coment,imagem_coment, id_publicacao)
VALUES ('mario-games123', 'Hj vai ter live em', '11:55:02', 'http//image-playstation', 3);


SELECT * FROM tb_comentario;

------------------------------
DELETE FROM tb_curtida
WHERE id =2;

DELETE FROM tb_curtida
WHERE id =3;

DELETE FROM tb_curtida
WHERE id =4;