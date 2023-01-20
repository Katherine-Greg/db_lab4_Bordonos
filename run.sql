-- Функція що підраховує кількість користувачів за гендером
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

SELECT count_gender_of_users('Male'); --4

SELECT * FROM cellphones_users;

-- Процедура що записує в таблицю cellphones_rating нові рядки
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

-- Функція тригер оновлення рейтингу таблиці cellphones_users
DROP TRIGGER IF EXISTS updaten_users ON cellphones_users;

CREATE OR REPLACE FUNCTION update_users() RETURNS trigger 
LANGUAGE plpgsql
AS
$$
     BEGIN
          UPDATE cellphones_users
		  SET age = age + 20
 		  WHERE cellphones_users.age = NEW.age;
		  RETURN NULL;
     END;
$$;

CREATE TRIGGER updaten_users
AFTER INSERT ON cellphones_users
FOR EACH ROW EXECUTE FUNCTION update_users();

INSERT INTO cellphones_users(user_id, age, gender, occupation) VALUES('666', 65, 'Female', 'Data Science');

SELECT * FROM cellphones_users