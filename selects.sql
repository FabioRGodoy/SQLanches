-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)

SELECT
     *
  FROM
      pedidos AS p
 JOIN 
     produtos ON p.cliente_id = p.id
 INNER 
      JOIN produtos_pedidos
  ON 
      produtos_pedidos.produto_id = produtos.id;

-- 2)

SELECT
    p.pedido_id
FROM
    produtos_pedidos p
    JOIN produtos ON p.produto_id = produtos.id
WHERE
    produtos.id = 6;

-- 3)
SELECT
    clientes.nome gostam_de_fritas 
FROM
    clientes
   INNER JOIN
        pedidos
        ON clientes.id = pedidos.cliente_id
    INNER JOIN
        produtos_pedidos 
        ON pedidos.id = produtos_pedidos.pedido_id
    INNER JOIN
        produtos
        ON produtos_pedidos.produto_id = produtos.id
WHERE
    produtos.id = 6;

-- 4)

SELECT
    SUM(preco)
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
    clientes.id = 5;

-- 5)

SELECT
    nome, COUNT(*)
FROM 
    produtos
INNER JOIN
    produtos_pedidos
    ON produtos.id = produtos_pedidos.produto_id
INNER JOIN
    pedidos
    ON pedidos.id = produtos_pedidos.pedido_id
GROUP BY
    nome;