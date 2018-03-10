CREATE TABLE IF NOT EXISTS `S` (
  `C` INT NOT NULL,
  `D` INT NOT NULL,
  PRIMARY KEY (`C`)
);

CREATE TABLE IF NOT EXISTS `R` (
  `A` INT NOT NULL,
  `B` INT NOT NULL,
  `C` INT NOT NULL,
  PRIMARY KEY (`A`),
  FOREIGN KEY (`C`) REFERENCES S(`C`)
);

INSERT INTO S(C, D) VALUES
  (12, 1),
  (19, 2),
  (17, 3)
;

INSERT INTO R(A, B, C) VALUES
  (2, 5, 17),
  (3, 2, 19),
  (6, 4, 12),
  (7, 9, 19)
;

-- a)
-- INSERT INTO R values(5, 4, 12); -- OK

-- b)
-- INSERT INTO R VALUES(3, 8, 17); -- FAIL, CONFLICTS WITH P.K. A (GOT: Duplicate entry '3' for key 'PRIMARY')

-- c)
-- INSERT INTO R VALUES(5, 9, 13); -- FAIL, F.K. CONSTRAINT FAILS, NO C KEY WITH ID 13 IN D (GOT: Cannot add or update a child row: a foreign key constraint fails (`db_9_495f2`.`r`, CONSTRAINT `r_ibfk_1` FOREIGN KEY (`C`) REFERENCES `s` (`C`)))

-- d)
-- INSERT INTO S VALUES(14, 4); -- OK

-- e)
-- DELETE FROM R WHERE A = 2; -- OK

-- f)
-- DELETE FROM S WHERE D = 2; -- FAIL, P.K. C IS BEING REFERENCES IN R TABLE (GOT: Cannot delete or update a parent row: a foreign key constraint fails (`db_9_5de2f4`.`r`, CONSTRAINT `r_ibfk_1` FOREIGN KEY (`C`) REFERENCES `s` (`C`)))

-- g)
-- UPDATE R SET A = 2 WHERE B = 2; -- FAIL, P.K. A ALREADY HAS ROW WITH 2 (GOT: Duplicate entry '2' for key 'PRIMARY')

-- h)
-- UPDATE R SET B = 0 WHERE A = 6; -- OK

-- i)
-- UPDATE S SET C = C + 1 WHERE D = 1; -- FAIL, C (W/ VALUE 13) IS BEING REFERENCES IN R TABLE (GOT: Cannot delete or update a parent row: a foreign key constraint fails (`db_9_7e2687`.`r`, CONSTRAINT `r_ibfk_1` FOREIGN KEY (`C`) REFERENCES `s` (`C`)))

-- j)
-- CREATE TABLE R(C INT, D INT) -- TABLE R ALREADY EXISTS (GOT: Table 'r' already exists)
