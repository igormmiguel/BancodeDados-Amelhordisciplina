-- 1

DELIMITER //
CREATE PROCEDURE listando_autoures()
BEGIN
    SELECT nome, sobrenome FROM Autor;
END
//
DELIMITER ;

CALL listando_autoures();