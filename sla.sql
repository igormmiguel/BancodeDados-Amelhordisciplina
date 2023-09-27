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