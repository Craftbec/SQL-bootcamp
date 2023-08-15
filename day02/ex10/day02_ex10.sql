SELECT person.name AS person_name1, tmp.name AS person_name2, person.address AS common_address
FROM person
JOIN (SELECT id, name, address 
	 FROM person ) AS tmp
ON person.id>tmp.id
WHERE person.address=tmp.address
ORDER BY 1,2,3;