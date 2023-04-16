SELECT 11 / 6;
SELECT 11 % 6;
SELECT 11.0 / 6;
SELECT CAST (11 AS numeric(3,1)) / 6


CREATE TABLE percent_change ( department varchar(20),
      spend_2014 numeric(10,2),
      spend_2017 numeric(10,2)
  );

INSERT INTO percent_change VALUES
      ('Building', 250000, 289000),
      ('Assessor', 178556, 179500),
      ('Library', 87777, 90001),
      ('Clerk', 451980, 650000),
      ('Police', 250000, 223000),
      ('Recreation', 199000, 195000);
  SELECT department,
         spend_2014,
         spend_2017,
         round( (spend_2017 - spend_2014) /
spend_2014 * 100, 1) AS "pct_change"
FROM percent_change;


CREATE TABLE percentile_test (
    numbers integer
);
INSERT INTO percentile_test (numbers) VALUES
    (1), (2), (3), (4), (5), (6);
SELECT
percentile_cont(.5)
WITHIN GROUP (ORDER BY numbers),
percentile_disc(.5)
WITHIN GROUP (ORDER BY numbers)
FROM percentile_test;



SELECT percentile_cont(➊array[.25,.5,.75])
WITHIN GROUP (ORDER BY p0010001) AS "quartiles"
FROM us_counties_2010;


SELECT unnest(
            percentile_cont(array[.25,.5,.75])
            WITHIN GROUP (ORDER BY p0010001)
            ) AS "quartiles"
FROM us_counties_2010;


SELECT mode() WITHIN GROUP (ORDER BY p0010001)
FROM us_counties_2010;