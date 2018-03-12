# Question 1
```sql
CREATE TABLE `R` (
  `A` INT NOT NULL,
  `B` INT NOT NULL,
  `C` INT NOT NULL,
  
  PRIMARY KEY (`A`),
  UNIQUE (`C`)
);

CREATE TABLE `T` (
  `D` INT NOT NULL,
  `E` INT NOT NULL,
  
  PRIMARY KEY (`D`)
);

CREATE TABLE `S` (
  `C` INT NOT NULL,
  `D` INT NOT NULL,
  
  PRIMARY KEY (`C`,`D`),
  FOREIGN KEY (`C`) REFERENCES `R`(`C`),
  FOREIGN KEY (`D`) REFERENCES `T`(`D`)
);


INSERT INTO `R` (`A`, `B`, `C`) VALUES
  (2, 5, 17),
  (3, 2, 19),
  (6, 4, 12),
  (7, 9, 9)
;

INSERT INTO `T` (`D`, `E`) VALUES
  (18, 304),
  (25, 725),
  (27, 256)
;

INSERT INTO `S` (`C`, `D`) VALUES
  (12, 18),
  (19, 27)
;

-- INSERT INTO `T` VALUES(25, 214); -- 1.1 FAIL (GOT: Duplicate entry '25' for key 'PRIMARY')
-- INSERT INTO `R` VALUES(5, 5, 17) -- 1.2 FAIL, C MUST BE UNIQUE (GOT: Duplicate entry '17' for key 'C')
-- INSERT INTO `R` VALUES(5, 9, 25); -- 1.3 OK
-- INSERT INTO `S` VALUES(9, 27); -- 1.4 OK
-- DELETE FROM `R` WHERE `A` = 2; -- 1.5 OK
-- DELETE FROM `S` WHERE `C` = 19; -- 1.6 OK
-- UPDATE `T` SET `D` = 23 WHERE `E` = 256; -- 1.7 FAIL, F.K. CONSTRAINT (GOT: Cannot delete or update a parent row: a foreign key constraint fails (`db_9_5e78c0`.`s`, CONSTRAINT `s_ibfk_2` FOREIGN KEY (`D`) REFERENCES `t` (`D`)))
-- UPDATE `R` SET `C` = 0 WHERE `A` = 7; -- 1.8 OK
-- UPDATE `S` SET `C` = `C` - 2 WHERE D = 27; -- 1.9 OK
-- DROP TABLE S; -- OK
```
