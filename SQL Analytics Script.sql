-- Medal Count by Country
SELECT Top 10 TeamCountry, 
       SUM(Gold) AS Gold,
       SUM(Silver) AS Silver,
       SUM(Bronze) AS Bronze
FROM medals
GROUP BY TeamCountry
ORDER BY Gold DESC


-- Top Athletes by Number of Medals
SELECT PersonName AS Athlete_Name, Country, 
       COUNT(*) AS Total_Medals
FROM athletes
GROUP BY PersonName, Country
ORDER BY Total_Medals DESC;

-- Top Disciplines by Medal Wins
SELECT t.Discipline, 
       SUM(m.Gold + m.Silver + m.Bronze) AS Total_Medals
FROM medals m
JOIN teams t
  ON m.TeamCountry = t.Country
GROUP BY t.Discipline
ORDER BY Total_Medals DESC;

-- Average Number of Athletes by Gender for Each Discipline
SELECT Discipline, 
       AVG(Female) AS Avg_Female_Athletes,
       AVG(Male) AS Avg_Male_Athletes
FROM entries_gender
GROUP BY Discipline;

-- Gender Distribution by Sport
SELECT Discipline, 
       SUM(Female) AS Female_Athletes,
       SUM(Male) AS Male_Athletes
FROM entries_gender
GROUP BY Discipline;

-- Medal Count by Country in Specific Discipline (Swimming in this case!)
SELECT t.Discipline, 
       m.TeamCountry AS Country, 
       SUM(m.Gold + m.Silver + m.Bronze) AS Total_Medals
FROM medals m
JOIN teams t
  ON m.TeamCountry = t.Country
WHERE t.Discipline = 'Swimming'
GROUP BY t.Discipline, m.TeamCountry
ORDER BY Total_Medals DESC;
