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
