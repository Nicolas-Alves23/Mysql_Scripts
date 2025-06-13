
SELECT * FROM biblioteca_joins.autores;

UPDATE biblioteca_joins.autores
SET nome_autor = 'Machado de Assis'
WHERE id_autor = 201;

SELECT * FROM biblioteca_joins.autores;