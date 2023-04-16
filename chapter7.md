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
