# Data types
## Characters

<b>char(n)<b>
A fixed-length column where the character length is specified by n. A column set at char(20) stores 20 characters per row regardless of how many characters you insert. If you insert fewer than 20 characters in any row, PostgreSQL pads the rest of that column with spaces.

<b>varchar(n)<b>
A variable-length column where the maximum length is specified by n. If you insert fewer characters than the maximum, PostgreSQL will not store extra spaces. For example, the string blue will take four spaces, whereas the string 123 will take three. In large databases, it saves considerable space.

<b>text<b>
A variable-length column of unlimited length. (According to the PostgreSQL documentation, the longest possible character string you can store is about 1 gigabyte.) The text type is not part of the SQL standard, but you’ll find similar implementations in other database systems, including Microsoft SQL Server and MySQL.

## Numbers
### Integers
The SQL standard provides three integer types: smallint, integer, and bigint. The difference between the three types is the maximum size of the numbers they can hold.


* smallint - storage size: 2 bytes range: −32768 to +32767 
* integer - storage size: 4 bytes−2147483648 to +2147483647
* bigint - storage size: 8 bytes −9223372036854775808 to +9223372036854775807

Even though it eats up the most storage, bigint will cover just about any requirement you’ll ever have with a number column. Its use is a must if you’re working with numbers larger than about 2.1 billion, but you can easily make it your go-to default and never worry. On the other hand, if you’re confident numbers will remain within the integer limit, that type is a good choice because it doesn’t consume as much space as bigint (a concern when dealing with millions of data rows).
When the data values will remain constrained, smallint makes sense: days of the month or years are good examples. The smallint type will use half the storage as integer, so it’s a smart database design decision if the column values will always fit within its range.
If you try to insert a number into any of these columns that is outside its range, the database will stop the operation and return an out of range error.

### Auto-Incrementing Integers

Bigserial, smallserial and serial are not so much true data types as a special implementation of the corresponding smallint, integer, and bigint types. 
When you add a column with a serial type, PostgreSQL will auto-increment the value in the column each time you insert a row, starting with 1, up to the maximum of each integer type.
The serial types are implementations of the ANSI SQL standard for auto-numbered identity columns.

* smallserial - storage size:2 bytes range: 1 to 32767
* serial - storage size:4 bytes range: 1 to 2147483647
* bigserial - storage size:8 bytes range: 1 to 9223372036854775807

## Decimal Numbers
As opposed to integers, decimals represent a whole number plus a fraction of a whole number; the fraction is represented by digits following a decimal point. 
In a SQL database, they’re handled by fixed-point and floating-point data types. For example, the distance from my house to the nearest grocery store is 6.7 miles; I could insert 6.7 into either a fixed- point or floating-point column with no complaint from PostgreSQL. 
The only difference is how the computer stores the data. In a moment, you’ll see that has important implications.

### Fixed-Point Numbers
The fixed-point type, also called the arbitrary precision type, is numeric(precision,scale). 
`You give the argument precision as the maximum number of digits to the left and right of the decimal point, and the argument scale as the number of digits allowable on the right of the decimal point.`

 Alternately, you can specify this type using decimal(precision,scale). Both are part of the ANSI SQL standard. If you omit specifying a scale value, the scale will be set to zero; in effect, that creates an integer. If you omit specifying the precision and the scale, the database will store values of any precision and scale up to the maximum allowed. (That’s up to 131,072 digits before the decimal point and 16,383 digits after the decimal point, according to the PostgreSQL documentation).

To record rainfall in the database using five digits total (the precision) and two digits maximum to the right of the decimal (the scale), you’d specify it as numeric(5,2). The database will always return two digits to the right of the decimal point, even if you don’t enter a number that contains two digits. For example, 1.47, 1.00, and 121.50.

### Floating-Point Types
The two floating-point types are real and double precision. The difference between the two is how much data they store. The real type allows precision to six decimal digits, and double precision to 15 decimal points of precision, both of which include the number of digits on both sides of the point. These floating-point types are also called variable-precision types. The database stores the number in parts representing the digits and an exponent—the location where the decimal point belongs. So, unlike numeric, where we specify fixed precision and scale, the decimal point in a given column can “float” depending on the number.


## Dates and Time
PostgreSQL’s date and time support includes the four major data types
* timestamp - storage size: 8 bytes  - description: Date and time - range: 4713 BC to 294276 AD
* date - storage size: 4 bytes -description: Date (no time) -range 4713 BC to 5874897 AD
* time - storage size:8 bytes -description: Time (no date) Range: 00:00:00 to 24:00:00
* interval - storage size: 16bytes Range: Timeinterval +/−178,000,000years

`timestamp` Records date and time, which are useful for a range of situations you might track: departures and arrivals of passenger flights, a schedule of Major League Baseball games, or incidents along a timeline. Typically, you’ll want to add the keywords with time zone to ensure that the time recorded for an event includes the time zone where it occurred. Otherwise, times recorded in various places around the globe become impossible to compare. The format timestamp with time zone is part of the SQL standard; with PostgreSQL you can specify the same data type using timestamptz.
`date` Records just the date.
`time` Records just the time. Again, you’ll want to add the with time zone keywords.
`interval` Holds a value representing a unit of time expressed in the format quantity unit. It doesn’t record the start or end of a time period, only its length. Examples include 12 days or 8 hours. 