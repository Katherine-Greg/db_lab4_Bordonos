DROP TRIGGER IF EXISTS updaten_users ON cellphones_users;

CREATE FUNCTION update_users() RETURNS trigger 
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