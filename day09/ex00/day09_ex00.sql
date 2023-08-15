create table person_audit
( created timestamp with time zone not null default NOW(),
  type_event char(1) not null default 'I',	
  row_id bigint,
  name varchar,
  age integer,
  gender varchar,
  address varchar
  );
alter table person_audit add constraint ch_type_event check (type_event in ('D', 'U', 'I'));

CREATE FUNCTION fnc_trg_person_insert_audit() RETURNS trigger AS $fnc_trg_person_insert_audit$
BEGIN
INSERT INTO person_audit(type_event, row_id, name, age, gender, address) values ('I', NEW.*);
RETURN NEW;
END;
$fnc_trg_person_insert_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
AFTER INSERT ON person
FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_insert_audit();
