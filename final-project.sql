
--test lookup table for full gender 
CREATE TABLE lookup (
    original TEXT PRIMARY KEY,
    replacement TEXT NOT NULL
);

INSERT INTO lookup (original, replacement) VALUES
('M', 'MALE'),
('F', 'FEMALE');

SELECT
    cn.year,cn.Name, l.replacement AS gender,cn.Count 
FROM combined_names cn
JOIN lookup l
    ON cn.Gender = l.original;



--what is the most popular name of all time
SELECT Name, SUM(Count) AS occurances
FROM combined_names 
GROUP BY Name 
ORDER BY occurances DESC

--what is the most popular female name of all time
SELECT Name, SUM(Count) AS occurances
FROM combined_names
WHERE Gender = 'F'
GROUP BY Name 
ORDER BY occurances DESC

--what is the most popular male name of all time

SELECT Name, SUM(count) AS occurances
FROM combined_names
WHERE Gender = 'M'
GROUP BY Name 
ORDER BY occurances DESC

-- what year has the most births
SELECT year, SUM(count) AS births
FROM combined_names 
GROUP BY "Year" 
ORDER BY births DESC

-- are female or male births more common
SELECT gender, sum(count) as births
FROM combined_names
GROUP BY Gender 
ORDER BY births DESC

--what was the most popular name across decades


WITH decades AS (
    SELECT 
        CAST(SUBSTR(CAST(year AS TEXT), 1, 3) || '0' AS INT) AS decade, 
        name, 
        SUM(count) AS occurances
    FROM combined_names 
    GROUP BY decade, name
),
ranked_decades AS (
    SELECT 
        RANK() OVER (PARTITION BY decade ORDER BY occurances DESC) AS ranking,
        decade, 
        name, 
        occurances 
    FROM decades
)
SELECT decade, name, occurances
FROM ranked_decades
WHERE ranking = 1
ORDER BY decade ASC;



