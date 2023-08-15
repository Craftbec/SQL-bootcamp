CREATE FUNCTION fnc_trg_person_delete_audit() RETURNS trigger AS $fnc_trg_person_delete_audit$
BEGIN
INSERT INTO person_audit(type_event, row_id, name, age, gender, address) values ('D', OLD.*);
RETURN OLD;
END;
$fnc_trg_person_delete_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_delete_audit
AFTER DELETE ON person
FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_delete_audit();