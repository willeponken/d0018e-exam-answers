# Question 2

## a)
```sql
-- Below follows a Schema that fullfills 1NF, 2NF and 3NF for Question 2.

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
```

## b)
 - **Book**: `(ID)`
 - **BookGenre**: `(Book, Genre)`
 - **Class**: `(Name)`
 - **Genre**: `(Name)`
 
## c)
### First normal form (1NF)
 1. It should only have single(atomic) valued attributes/columns.
 2. Values stored in a column should be of the same domain
 3. All the columns in a table should have unique names.
 4. And the order in which data is stored, does not matter.

The schema fullfills 1NF because:
 1. [x] No column contain two types of values, i.e. one column with both `<Genre>;<Class>` (example: `"Horror";"Fiction"`) - it's seperated in their own columns.
 2. [x] No column contain different types of values not related to each other.
 3. [x] No column have the same name (not even possible with SQL).
 4. [x] The row order does not matter (data is not related inter-row).

### Second normal form (2NF)
 1. It should be in the First Normal form.
 2. And, it should not have Partial Dependency.

The schema fullfills 2NF because:
 1. [x] See 1NF above.
 2. [x] No attribute is partially dependent on the composite key. An example that would contain partial dependencies is if `(Class)` would be a column in `BookGenre`, `(Class)` would then depend on a subset of the composite key `(Book, Genre)` (with the subset being `(Genre)`).

### Third normal form (3NF)
 1. It is in the Second Normal form.
 2. And, it doesn't have Transitive Dependency.

The schema fullfills 3NF because:
 1. [x] See 2NF above.
 2. [x] No attribute indirectly depends on another attribute (a book can have several genres). 
 
 
