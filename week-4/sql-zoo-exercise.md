# SQL Zoo Tutorial

This was suggested by Katerina as an exercise to help learn SQL. The tutorial is [here](https://sqlzoo.net/). It's on Diode [here](https://diode.makersacademy.com/students/EdwardAndress/projects/448).

## 0: SELECT basics

*Table: 'world'*
| name        | continent | area    | population | gdp          |
|-------------|-----------|---------|------------|--------------|
| Afghanistan | Asia      | 652230  | 25500100   | 20343000000  |
| Albania     | Europe    | 28748   | 2831741    | 12960000000  |
| Algeria     | Africa    | 2381741 | 37100000   | 188681000000 |
| Andorra     | Europe    | 468     | 78115      | 3712000000   |
| Angola      | Africa    | 1246700 | 20609294   | 100990000000 |
| ...         |           |         |            |              |

#### Examples

Use `WHERE` to filter rows that meet specified criteria:
```sql
SELECT population FROM world WHERE name = 'Germany';
```

Use `IN` to check if item is in a list:
```sql
SELECT name, population FROM world
 WHERE name IN ('Sweden', 'Norway', 'Denmark');
```

Use `BETWEEN` to get results in range:
```sql
SELECT name, area FROM world
 WHERE area BETWEEN 200000 AND 250000;
```

## 1: SELECT with wildcards

Use `LIKE` with the wild-card `%` to search for a pattern:
```sql
SELECT name FROM world WHERE name LIKE '%y%';
```
This will filter for rows where `name` has a 'y' in it.

There's also the wild-card `_` which matches for any single character. So this will return the names of countries where 't' is the second letter:

```sql
SELECT name FROM world WHERE name LIKE '_t%'
```

You can use `concat` to make more complex matchers, e.g. matching one column with data from another. So this will return the name of countries where the `capital` column starts with the `name`, and has some other string tagged on the end **(which could be the empty string)**.


```sql
SELECT capital, name
  FROM world
 WHERE capital LIKE concat(name, '%');
```

`REPLACE` performs substring substitution. `REPLACE(f, s1, s2)` will return the string `f` with all occurances of `s1` replaced with `s2`. Hence this will select all countries where the `capital` starts with the `name` but is extended by a least one character, and return the `name` and the extension (think about it...):

```sql
SELECT name, REPLACE(capital, name, '')
 FROM world
WHERE capital LIKE concat(name, '_%')
```

