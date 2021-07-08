/*
My Solutions to Intermediate Level SELECT Queries at https://www.hackerrank.com/domains/sql
*/

/*
THE PADS
Generate the following two result sets:

Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:

There are a total of [occupation_count] [occupation]s.
*/
SELECT 
  T3.COL1 
FROM 
  (
    (
      SELECT 
        CONCAT(Name, "(", UPPER(SUBSTR(Occupation, 1, 1)), ")") AS COL1 
      FROM 
        OCCUPATIONS 
      ORDER BY 
        Name ASC
    ) 
    UNION 
      (
        SELECT 
          CONCAT("There are a total of ", (COUNT(Occupation)), " ", LOWER(Occupation), "s.") AS COL1 
        FROM 
          OCCUPATIONS 
        GROUP BY 
          Occupation
      )
  ) AS T3 
ORDER BY 
  T3.COL1


/*
OCCUPATIONS
Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

Note: Print NULL when there are no more names corresponding to an occupation.
*/
 
SELECT 
  MAX(CASE WHEN Occupation = 'Doctor' THEN Name END) 'Doctor', 
  MAX(CASE WHEN Occupation = 'Professor' THEN Name END) 'Professor', 
  MAX(CASE WHEN Occupation = 'Singer' THEN Name END) 'Singer', 
  MAX(CASE WHEN Occupation = 'Actor' THEN Name END) 'Actor' 
FROM 
  (
    select 
      *, 
      ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) AS rn FROM OCCUPATIONS
  ) t 
group by 
  rn
