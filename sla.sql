-- 1

DELIMITER //
CREATE PROCEDURE listando_autoures()
BEGIN
    SELECT nome, sobrenome FROM Autor;
END
//
DELIMITER ;

CALL listando_autoures();

-- 2 
DELIMITER //
CREATE PROCEDURE categoria_dos_livros (IN p_categoria varchar(100))
BEGIN
    SELECT titulo FROM Livro 
    WHERE Categoria_ID = (SELECT Categoria_ID FROM Categoria 
    WHERE Nome = p_categoria);
END
//
DELIMITER ;
CALL categoria_dos_livros("Romance");
CALL categoria_dos_livros("Autoajuda");
CALL categoria_dos_livros("Ficção Científica");

-- 3

DELIMITER //
CREATE PROCEDURE sp_LivrosPorCategoria(IN p_categoria varchar(100))
BEGIN
    SELECT Categoria_ID AS ID_DA_CATEGÓRIA , COUNT(*) AS QUANTIDADE_DE_LIVROS FROM Livro 
    WHERE Categoria_ID = (SELECT Categoria_ID FROM Categoria 
    WHERE Nome = p_categoria) GROUP BY Categoria_ID ORDER BY COUNT(Categoria_ID);
END
//

DELIMITER ;
CALL sp_LivrosPorCategoria("Autoajuda");