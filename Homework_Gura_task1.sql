DELIMITER //
DROP FUNCTION IF EXISTS format_seconds;
CREATE FUNCTION format_seconds(seconds INT)
RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE remaining_seconds INT;

    SET days = FLOOR(seconds / (24 * 60 * 60));
    SET remaining_seconds = seconds % (24 * 60 * 60);
    
    SET hours = FLOOR(remaining_seconds / 3600);
    SET remaining_seconds = remaining_seconds % 3600;

    SET minutes = FLOOR(remaining_seconds / 60);
    SET remaining_seconds = remaining_seconds % 60;

    RETURN CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', remaining_seconds, ' seconds');
END //

DELIMITER ;
SELECT format_seconds(123456789);

