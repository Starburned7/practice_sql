## DISTINCT
<p>To understand the range of values in a column, we can use the DISTINCT keyword as part of a query that eliminates duplicates and shows only unique values.</p>

SELECT DISTINCT school
FROM teachers;

This is a helpful first step toward assessing data quality. For example, if a school name is spelled more than one way, those spelling variations will be easy to spot and correct. When you’re working with dates or numbers, DISTINCT will help highlight inconsistent or broken formatting. For example, you might inherit a data set in which dates were entered in a column formatted with a text data type. That practice (which you should avoid) allows malformed dates to exist.

The DISTINCT keyword also works on more than one column at a time. If we add a column, the query returns each unique pair of values.


This technique gives us the ability to ask, “For each x in the table, what are all the y values?” For each factory, what are all the chemicals it produces? For each election district, who are all the candidates running for office? For each concert hall, who are the artists playing this month?

