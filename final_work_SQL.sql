/*
Создайте процедуру,
которая принимает кол-во сек и формат их в кол-во дней часов. 
Пример: 123456 -> '1 days 10 hours 17 minutes 36 seconds'
*/

DELIMITER //
DROP PROCEDURE IF EXISTS format_seconds;
CREATE PROCEDURE IF NOT EXISTS format_seconds
(IN seconds INT)
BEGIN
	DECLARE days INT;
	DECLARE hours INT;
	DECLARE minutes INT;
	DECLARE remainder INT;
	SET days = FLOOR (seconds / 86400);
	SET remainder = seconds % 86400;
    SET hours = FLOOR (remainder / 3600);
    SET remainder = remainder % 3600;
	SET minutes = FLOOR (remainder / 60);
    SET remainder = remainder % 60;
    SELECT CONCAT (days, ' days ', hours, ' hours ', minutes, ' minutes ', remainder, ' seconds')
    AS result;
END //
DELIMITER ;

CALL format_seconds (123456);


-- Создайте функцию, которая выводит только четные числа от 1 до 10. Пример: 2,4,6,8,10 

DELIMITER //
DROP FUNCTION IF EXISTS even_numbers;
CREATE FUNCTION even_numbers()
RETURNS VARCHAR(25)
DETERMINISTIC
BEGIN
	DECLARE result VARCHAR(25);
    DECLARE i INT;
    SET result = ' ';
    SET i = 2;
    WHILE i <= 10 DO
		SET result = CONCAT (result, i, ',');
        SET i = i + 2;
	END WHILE;
    SET result = substring(result, 1, length(result) - 1); -- удаляем последнюю запятую
    RETURN result;
END //
DELIMITER ;

SELECT even_numbers();

