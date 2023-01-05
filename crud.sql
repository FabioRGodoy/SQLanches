-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)

INSERT INTO
	clientes (nome, lealdade)
	VALUES
	('Georgia', 0)



-- 2)

INSERT INTO
	pedidos (status, cliente_id)
	VALUES
	('Recebido', 6)
	



-- 3)

INSERT INTO produtos_pedidos
  (pedido_id, produto_id)
VALUES
  (6, 1),
  (6, 2),
  (6, 6),
  (6, 8),
  (6, 8);



-- Leitura

-- 1)

SELECT
    *
FROM 
    clientes c
INNER JOIN
    pedidos p
    ON c.id = p.cliente_id
INNER JOIN
    produtos_pedidos
    ON p.id = produtos_pedidos.pedido_id
INNER JOIN
    produtos prod
    ON produtos_pedidos.produto_id = prod.id
WHERE
    c.id = (
      SELECT
          id
      FROM
          clientes
      WHERE
          clientes.nome = 'Georgia'
      );



-- Atualização

-- 1)

UPDATE 
   clientes 
SET	lealdade =
   (
   	SELECT 
 		SUM(pts_de_lealdade)
 	FROM
 		produtos
 	INNER JOIN
 		produtos_pedidos
 	ON produtos.id = produtos_pedidos.produto_id 
 	INNER JOIN 
 		pedidos
 	ON produtos_pedidos.pedido_id = pedidos.id 
 	INNER JOIN 
 		clientes
 	ON pedidos.cliente_id = clientes.id 
 	WHERE 
 	clientes.id = (
      SELECT
          id
      FROM
          clientes
      WHERE
          clientes.nome = 'Georgia'
      )
   )
 WHERE 
 	clientes.nome = 'Georgia'
 RETURNING *;



-- Deleção

-- 1)

DELETE FROM 
	clientes 
WHERE 
	id = 4
RETURNING *;


