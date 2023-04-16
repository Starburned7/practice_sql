## Constraints

A column’s data type already broadly defines the kind of data it will accept: integers versus characters, for example. But SQL provides several additional constraints that let us further specify acceptable values for a column based on rules and logical tests. With constraints, we can avoid the “garbage in, garbage out” phenomenon, which is what happens when poor-quality data result in inaccurate or incomplete analysis. Constraints help maintain the quality of the data and ensure the integrity of the relationships among tables.

### Most commonly used constraints:

`CHECK` Evaluates whether the data falls within values we specify
`UNIQUE` Ensures that values in a column or group of columns are unique in each row in the table
`NOT NULL` Prevents NULL values in a column

### Pros and Cons of Key Types
As with most SQL debates, there are arguments for using either type of primary key. Reasons cited for using natural keys often include the following:
* The data already exists in the table, and you don’t need to add a column to create a key.
* Because the natural key data has meaning, it can reduce the need to join tables when searching.

Alternatively, advocates of surrogate keys highlight these points in favor:
* Because a surrogate key doesn’t have any meaning in itself and its values are independent of the data in the table, if your data changes later, you’re not limited by the key structure.
* Natural keys tend to consume more storage than the integers typically used for surrogate keys.

## Foreign Keys
With the foreign key constraint, SQL very helpfully provides a way to ensure data in related tables doesn’t end up unrelated, or orphaned. A foreign key is one or more columns in a table that match the primary key of another table. But a foreign key also imposes a constraint: values entered must already exist in the primary key or other unique key of the table it references. If not, the value is rejected. This constraint ensures that we don’t end up with rows in one table that have no relation to rows in the other tables we can join them to.

## The CHECK Constraint
A CHECK constraint evaluates whether data added to a column meets the expected criteria, which we specify with a logical test. If the criteria aren’t met, the database returns an error. The CHECK constraint is extremely valuable because it can prevent columns from getting loaded with nonsensical data. For example, a new employee’s birthdate probably shouldn’t be more than 120 years in the past, so you can set a cap on birthdates. Or, in most schools I know, Z isn’t a valid letter grade for a course (although my barely passing algebra grade felt like it), so we might insert constraints that only accept the values A–F.

If we use the table constraint syntax, we also can combine more than one test in a single CHECK statement. Say we have a table related to student achievement. We could add the following:

CONSTRAINT grad_check CHECK (credits >= 120 AND tuition = 'Paid')

You can also test values across columns, as in the following example where we want to make sure an item’s sale price is a discount on the original, assuming we have columns for both values:
CONSTRAINT sale_check CHECK (sale_price < retail_price)


## The UNIQUE Constraint
We can also ensure that a column has a unique value in each row by using the UNIQUE constraint. If ensuring unique values sounds similar to the purpose of a primary key, it is. But UNIQUE has one important difference. In a primary key, no values can be NULL, but a UNIQUE constraint permits multiple NULL values in a column.

## Speeding Up Queries with Indexes
In the same way that a book’s index helps you find information more quickly, you can speed up queries by adding an index to one or more columns. The database uses the index as a shortcut rather than scanning each row to find data.

While following along in this book, you’ve already created several indexes, perhaps without knowing. Each time you add a primary key or UNIQUE constraint to a table, PostgreSQL (as well as most database systems) places an index on the column. Indexes are stored separately from the table data, but they’re accessed automatically when you run a query and are updated every time a row is added or removed from the table.

In PostgreSQL, the default index type is the B-Tree index. It’s created automatically on the columns designated for the primary key or a UNIQUE constraint, and it’s also the type created by default when you execute a CREATE INDEX statement. B-Tree, short for balanced tree, is so named because the structure organizes the data in a way that when you search for a value, it looks from the top of the tree down through branches until it locates the data you want. (Of course, the process is a lot more complicated than that. A good start on understanding more about the B-Tree is the B-Tree Wikipedia entry.) A B-Tree index is useful for data that can be ordered and searched using equality and range operators, such as <, <=, =, >=, >, and BETWEEN.

https://www.youtube.com/watch?v=C_q5ccN84C8


## Considerations When Using Indexes
You’ve seen that indexes have significant performance benefits, so does that mean you should add an index to every column in a table? Not so fast! Indexes are valuable, but they’re not always needed. In addition, they do enlarge the database and impose a maintenance cost on writing data. Here are a few tips for judging when to uses indexes:
* Consult the documentation for the database manager you’re using to learn about the kinds of indexes available and which to use on particular data types. PostgreSQL, for example, has five more index types in addition to B-Tree. One, called GiST, is particularly suited to the geometry data types. Full text searc also benefits from indexing.
* Consider adding indexes to any columns you’ll use in table joins. Primary keys are indexed by default in PostgreSQL, but foreign key columns in related tables are not and are a good target for indexes.
* Add indexes to columns that will frequently end up in a query WHERE clause. As you’ve seen, search performance is significantly improved via indexes.
* Use EXPLAIN ANALYZE to test performance under a variety of configurations if you’re unsure. Optimization is a process!
