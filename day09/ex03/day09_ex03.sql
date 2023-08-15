DELETE FROM person_audit;
DROP TRIGGER trg_person_insert_audit ON person;
DROP TRIGGER trg_person_update_audit ON person;
DROP TRIGGER trg_person_delete_audit ON person;
DROP FUNCTION fnc_trg_person_insert_audit();
DROP FUNCTION fnc_trg_person_update_audit();
DROP FUNCTION fnc_trg_person_delete_audit();



CREATE FUNCTION fnc_trg_person_audit() RETURNS trigger AS $fnc_trg_person_audit$
BEGIN
IF (TG_OP = 'DELETE') THEN 
INSERT INTO person_audit(type_event, row_id, name, age, gender, address) values ('D', OLD.*);
RETURN OLD;
ELSIF (TG_OP = 'UPDATE') THEN
INSERT INTO person_audit(type_event, row_id, name, age, gender, address) values ('U', OLD.*);
RETURN OLD;
ELSIF (TG_OP = 'INSERT') THEN
INSERT INTO person_audit(type_event, row_id, name, age, gender, address) values ('I', NEW.*);
RETURN NEW;
END IF;
END;
$fnc_trg_person_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_audit
AFTER INSERT OR UPDATE OR DELETE ON person
FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_audit();