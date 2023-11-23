DELIMITER //

DROP PROCEDURE IF EXISTS display_even_numbers;

CREATE PROCEDURE display_even_numbers()
BEGIN
    DECLARE i INT DEFAULT 1;
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_even_numbers (even_number INT);
    WHILE i <= 10 DO
        IF i % 2 = 0 THEN
            INSERT INTO temp_even_numbers (even_number) VALUES (i);
        END IF;
        SET i = i + 1;
    END WHILE;
    SELECT * FROM temp_even_numbers;
    DROP TEMPORARY TABLE IF EXISTS temp_even_numbers;
END //

DELIMITER ;

CALL display_even_numbers();


