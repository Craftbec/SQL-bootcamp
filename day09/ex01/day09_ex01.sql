CREATE FUNCTION fnc_trg_person_update_audit() RETURNS trigger AS $fnc_trg_person_update_audit$
BEGIN
INSERT INTO person_audit(type_event, row_id, name, age, gender, address) values ('U', OLD.*);
RETURN OLD;
END;
$fnc_trg_person_update_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_update_audit
AFTER UPDATE ON person
FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_update_audit();