-- Функція підрахунку користувачів смартфонів за гендером
CREATE OR REPLACE FUNCTION count_gender_of_users(us_gender CHAR(20)) RETURNS INT AS 
$$
DECLARE amount INT;
BEGIN
		SELECT COUNT(cellphones_users.gender) INTO amount 
		FROM cellphones_users
		WHERE cellphones_users.gender = us_gender;
		RETURN amount;
END; 
$$ 
LANGUAGE 'plpgsql';

-- Порахуємо скільки чоловіків серед користувачів смартфонів
SELECT count_gender_of_users('Male'); --4

