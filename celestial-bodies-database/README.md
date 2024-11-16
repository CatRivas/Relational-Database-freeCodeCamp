# Build a Celestial Bodies Database

* This is the [first project](https://www.freecodecamp.org/learn/relational-database/build-a-celestial-bodies-database-project/build-a-celestial-bodies-database) for the Relational Database certification from freeCodeCamp.
* In this project, I practiced essential skills for working with relational databases using the command-line tool `psql`. 
* The tasks included using basic SQL commands, internal psql commands (meta-commands), and learning how to dump a database.

I created a database with 5 tables:
- `galaxy`
- `star`
- `planet`
- `moon`
- `greek_gods` 

The first four tables were predefined by the project requirements, and I added the `greek_gods` table as an extra one.


--- 
## Entity Relationship Diagram
### Relationships Between Tables

- **Galaxy and Star**: A galaxy contains many stars. This relationship is established by the `galaxy` table containing a reference to a `star_id`, indicating the stars that belong to each galaxy.
  
- **Star and Planet**: A star has many planets orbiting around it. The `star` table references the `planet_id` to track the planets associated with each star.

- **Planet and Moon**: A planet can have multiple moons. In the `planet` table, there is a reference to `moon_id`, which identifies all moons orbiting that particular planet.

- **Planet and Greek Gods**: A planet can be associated with one or more Greek gods. The `greek_gods` table links a planet to the gods, allowing the assignment of one or more deities to each planet.

Each table is connected through a foreign key relationship, helping to maintain referential integrity and ensuring that the data remains consistent across the database.

![Celestial Bodies Relational Diagram](relational-diagram.png)

I used [dbdiagram.io](https://dbdiagram.io/home) to create an Entity Relationship Diagram for the database structure. 
You can find the `plaintext` code for the ERD diagram in the files attached.
