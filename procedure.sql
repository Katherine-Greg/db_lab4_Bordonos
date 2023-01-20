--Процедура insert_rating додає в таблицю cellphones_rating введений користувачем рейтинг
DROP PROCEDURE IF EXISTS insert_rating(INT, INT, INT);

CREATE OR REPLACE PROCEDURE insert_rating(us_id INT, phone_id INT, rate INT) 
LANGUAGE 'plpgsql'
AS
$$
BEGIN
    INSERT INTO cellphones_rating(user_id, cellphone_id,rating) VALUES (us_id, phone_id, rate);
END;
$$;

CALL insert_rating(6, 11, 10);

SELECT * FROM cellphones_rating;