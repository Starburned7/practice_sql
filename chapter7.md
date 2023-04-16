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