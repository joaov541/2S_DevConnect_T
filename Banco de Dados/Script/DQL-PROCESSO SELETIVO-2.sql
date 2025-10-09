--DQL
USE db_devconnect;

SELECT * FROM tb_usuario;

SELECT * FROM tb_publicacao;

SELECT * FROM tb_seguidor;

SELECT * FROM tb_curtida;

SELECT * FROM tb_comentario;


--Exiba todos os nomes dos seguidores (de quem está seguindo e de quem será seguido).

SELECT 
    TBU1.nome_completo AS Nome_Seguidor,
    TBU2.nome_completo AS Nome_Seguido
FROM tb_seguidor TBS

    INNER JOIN tb_usuario TBU1 ON TBS.id_usuario_seguir = TBU1.id_usuario
    INNER JOIN tb_usuario TBU2 ON TBS.id_usuario_seguida = TBU2.id_usuario;



--Exiba quantos seguidores possui um respectivo usuário.

SELECT 
    U.nome_completo AS tb_usuario,
    COUNT(TBS.id_usuario_seguir) AS Quantidade_Seguidores
FROM tb_usuario U

    LEFT JOIN tb_seguidor TBS ON U.id_usuario = TBS.id_usuario_seguida

GROUP BY U.nome_completo
ORDER BY Quantidade_Seguidores DESC;


--Exiba todas as Publicações contendo a descrição, o caminho da imagem, o nome de usuário.

SELECT 
    P.textos AS Descricao,
    P.imagens_url AS Caminho_Imagem,
    U.nome_usuario AS Nome_Usuario
FROM tb_publicacao P
    INNER JOIN tb_usuario U ON P.id_usuario = U.id_usuario;
   
--Exiba todos os comentários com o nome e o texto de uma respectiva publicação.
SELECT 
    U.nome_usuario  AS Nome_Usuario,
    C.textos_coment AS Comentario,
    P.textos        AS Publicacao
FROM tb_comentario C

    INNER JOIN tb_usuario U      ON C.id_comentario =      U.id_usuario
    INNER JOIN tb_publicacao P   ON C.id_comentario =      P.id_publicacao
 

--Exiba a quantidade de curtidas de uma respectiva publicação.

SELECT 
    P.id_publicacao AS id_publicacao,
    P.textos,
    COUNT(C.id_usuario) AS qtd_curtidas
FROM tb_publicacao P
LEFT JOIN tb_curtida C ON P.id_publicacao = C.id_publicacao
GROUP BY P.id_publicacao, P.textos;


--Exiba todos os usuários que não chegaram a fazer publicações.

SELECT 
    U.id_usuario,
    U.nome_completo,
    U.nome_usuario
FROM tb_usuario U
LEFT JOIN tb_publicacao P ON U.id_usuario = P.id_usuario
WHERE P.id_publicacao IS NULL;


--Exiba todos os usuários que não chegaram a fazer Reações.




--Descurtir: remova uma curtida de um usuário há uma publicação.




--Tornar a coluna id_usuario da tabela comentário unica(UNIQUE).

