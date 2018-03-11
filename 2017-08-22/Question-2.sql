-- Below follows a Schema that fullfills 1NF, 2NF and 3NFp for Question 2.

-- Class represents a class.
-- Class is only used to minimize data duplication.
-- Class uses the column Name as a primary key, an ID and UNIQUE for Name could also have been used for easier renaming.
CREATE TABLE Class(
    Name VARCHAR(255) NOT NULL,
    
    PRIMARY KEY (Name)
);

-- Genre represents a genre, with a class.
-- Genre must only contain unique names, which is protected with
-- a primary key for the Name column (could also have used an ID and UNIQUE for Name instead for easier Genre renaming).
-- Genre references a Class, so it wont have data duplication.
CREATE TABLE Genre(
    Name VARCHAR(255) NOT NULL,
    Class VARCHAR(255) NOT NULL,
    
    PRIMARY KEY (Name),
    FOREIGN KEY (Class) REFERENCES Class(Name)
);

-- Book represents a book, with an ID, Title and Info text.
-- Book is identified with ID.
-- Book can have several genres, which are defined in BookGenre.
CREATE TABLE Book(
  ID INT(11) NOT NULL AUTO_INCREMENT,
  Title VARCHAR(255), -- Title is not using UNIQUE because maybe some books have the same title?
  Info VARCHAR(255),
  
  PRIMARY KEY (ID)
);

-- BookGenre holds all genres for each book.
-- BookGenre is identified with (Book, Genre).
-- BookGenre can only identify a genre once for each book because the composite key (Book, Genre) must be unique (primay key).
CREATE TABLE BookGenre(
    Book INT(11) NOT NULL,
    Genre VARCHAR(255) NOT NULL,

    PRIMARY KEY (Book, Genre),
    FOREIGN KEY (Book) REFERENCES Book(ID),
    FOREIGN KEY (Genre) REFERENCES Genre(Name)
);
