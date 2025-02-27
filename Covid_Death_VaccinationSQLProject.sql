USE [Portfolio Project]


SELECT * FROM [dbo].[CovidDeaths] 
ORDER BY 3,4

SELECT * FROM [dbo].[CovidVaccinations] 
ORDER BY 3,4


--Updating 'location column' to 'Country':
EXEC sp_rename '[dbo].[CovidDeaths].location', 'country', 'COLUMN';


--FOR COVID DEATHS:

--I will use this dataset to access Covid Deaths:
SELECT continent, country, date, new_cases, total_deaths, population
FROM [dbo].[CovidDeaths]


--FInding Total cases, total deaths 'continent' wise and arranging them from highest to lowest:
SELECT continent, SUM(CAST(total_cases AS BIGINT)) AS Total_Cases_Per_Continent, SUM(CAST(total_deaths AS BIGINT)) AS Total_Deaths_Per_Continent
FROM [dbo].[CovidDeaths]
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY Total_Cases_Per_Continent DESC, Total_Deaths_Per_Continent DESC;


--FInding Total cases, total deaths 'country' wise and arranging them from highest to lowest:
SELECT country, SUM(CAST(total_cases AS BIGINT)) AS Total_Cases_Per_Country, SUM(CAST(total_deaths AS BIGINT)) AS Total_Deaths_Per_Country
FROM [dbo].[CovidDeaths]
WHERE country IS NOT NULL AND country NOT IN ('World')
GROUP BY country
ORDER BY Total_Cases_Per_Continent DESC, Total_Deaths_Per_Continent DESC;


--Total Deaths vs. Total cases , Death %age :
SELECT country, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS Death_Percentage
FROM [dbo].[CovidDeaths]


--Total Deaths vs. Total cases , Death %age each Country:
SELECT country, SUM(CAST(total_deaths AS BIGINT)) AS Total_Deaths_Per_Country, SUM(CAST(total_cases AS BIGINT)) AS Total_Cases_Per_Country, (SUM(CAST(total_deaths AS FLOAT))/SUM(CAST(total_cases AS FLOAT)))*100 AS Death_Percentage
FROM [dbo].[CovidDeaths]
GROUP BY country
ORDER BY Death_Percentage DESC 


--Total Deaths vs. Total cases , Death %age for a specific Continent/Country/Location:
SELECT country, SUM(CAST(total_deaths AS BIGINT)) AS Total_Deaths_Per_Country, SUM(CAST(total_cases AS BIGINT)) AS Total_Cases_Per_Country, (SUM(CAST(total_deaths AS FLOAT))/SUM(CAST(total_cases AS FLOAT)))*100 AS Death_Percentage
FROM [dbo].[CovidDeaths]
WHERE country LIKE 'I%' AND continent = 'ASIA'
GROUP BY country
ORDER BY Death_Percentage DESC 


--Calculating Highest Infection Rate per Country acc. to Population:
SELECT country, SUM(population) AS Total_Population_per_Country, SUM(CAST(total_cases AS BIGINT)) AS Total_Cases_Per_Country, (SUM(CAST(total_cases AS FLOAT))/SUM(CAST(population AS FLOAT)))*100 AS Infection_Rate
FROM [dbo].[CovidDeaths]
WHERE country NOT IN ('World', 'Asia', 'Europe', 'North America', 'South America', 'Africa', 'Australia',  'Antarctica')
GROUP BY country
ORDER BY Infection_Rate DESC


--Top 10 Countries with  Highest Infection Rate:
SELECT TOP(10) country, SUM(population) AS Total_Population_per_Country, SUM(CAST(total_cases AS BIGINT)) AS Total_Cases_Per_Country, (SUM(CAST(total_cases AS FLOAT))/SUM(CAST(population AS FLOAT)))*100 AS Infection_Rate
FROM [dbo].[CovidDeaths]
WHERE country NOT IN ('World', 'Asia', 'Europe', 'North America', 'South America', 'Africa', 'Australia',  'Antarctica')
GROUP BY country
ORDER BY Total_Population_per_Country DESC 


--Infection Rate per Continent acc. to Population:
SELECT Continent, SUM(population) AS Total_Population_per_Continent, SUM(CAST(total_cases AS BIGINT)) AS Total_Cases_Per_Continent, (SUM(CAST(total_cases AS FLOAT))/SUM(CAST(population AS FLOAT)))*100 AS Infection_Rate
FROM [dbo].[CovidDeaths]
WHERE continent IS NOT NULL
GROUP BY Continent
ORDER BY Total_Population_per_Continent DESC 


--Countries with  Highest Death Rate acc. to Population:
SELECT country, population AS Total_Population_per_Country, SUM(CAST(total_deaths AS BIGINT)) AS Total_Deaths_Per_Country, (SUM(CAST(total_deaths AS FLOAT))/CAST(population AS FLOAT))*100 AS Death_Rate
FROM [dbo].[CovidDeaths]
WHERE country NOT IN ('World', 'Asia', 'Europe', 'North America', 'South America', 'Africa', 'Australia',  'Antarctica')
GROUP BY country, population
ORDER BY Total_Population_per_Country DESC 


-- Death Rate - Continent wise acc. to Population:
SELECT Continent, population AS Total_Population_per_Continent, SUM(CAST(total_deaths AS BIGINT)) AS Total_Deaths_Per_Country, (SUM(CAST(total_deaths AS FLOAT))/CAST(population AS FLOAT))*100 AS Death_Rate
FROM [dbo].[CovidDeaths]
WHERE Continent IS NOT NULL
GROUP BY Continent, population
ORDER BY Total_Population_per_Continent DESC 


SELECT * FROM [dbo].[CovidDeaths] 
ORDER BY 3,4

SELECT * FROM [dbo].[CovidVaccinations] 
ORDER BY 3,4


--COVID Deaths & Vaccinations Dataset:
SELECT CD.continent, CD.country, CD.date, CD.population, CD.total_deaths, CD.total_cases, CV.total_vaccinations, CV.people_fully_vaccinated
FROM [dbo].[CovidDeaths] CD
INNER JOIN [dbo].[CovidVaccinations] CV
ON CD.country=CV.location AND CD.date=CV.date
--WHERE CD.continent IS NOT NULL AND CD.total_deaths IS NOT NULL AND CD.total_cases IS NOT NULL AND CV.total_vaccinations IS NOT NULL AND CV.new_vaccinations IS NOT NULL AND  CV.people_fully_vaccinated IS NOT NULL
ORDER BY 2,3 DESC



--People fully vaccinated RATE acc. to Population for each Country/Region:
SELECT V.location, SUM(D.population) AS Total_Population_per_Country, SUM(V.people_fully_vaccinated) AS People_fully_vaccinated_per_Country, (SUM(V.people_fully_vaccinated)/SUM(D.population))*100 AS People_fully_vaccinated_RATE
FROM [dbo].[CovidVaccinations] V
JOIN [dbo].[CovidDeaths] D
ON V.location=D.country AND V.date=D.date
WHERE country NOT IN ('World', 'Asia', 'Europe', 'North America', 'South America', 'Africa', 'Australia',  'Antarctica')
GROUP BY  V.location
ORDER BY 3 DESC,2 DESC



--People fully vaccinated RATE acc. to Population for each Continent:
SELECT V.Continent, SUM(D.population) AS Total_Population_per_Continent, SUM(V.people_fully_vaccinated) AS People_fully_vaccinated_per_Country, (SUM(V.people_fully_vaccinated)/SUM(D.population))*100 AS People_fully_vaccinated_RATE
FROM [dbo].[CovidVaccinations] V
JOIN [dbo].[CovidDeaths] D
ON V.location=D.country AND V.date=D.date
WHERE V.Continent IS NOT NULL
GROUP BY  V.Continent
ORDER BY 4 DESC



--Highest Number of Cases, Deaths, Vaccinations for Year - 2020 for each Continent every Month:
SELECT d.Continent, DATEPART(MONTH, d.date) AS MONTH, MAX(d.total_cases) AS Highest_Total_Case, MAX(d.total_deaths) AS Highest_Deaths, MAX(v.total_vaccinations) AS Highest_Vaccinations
FROM [dbo].[CovidDeaths] d
JOIN [dbo].[CovidVaccinations] v
ON V.location=D.country AND V.date=D.date
WHERE d.Continent IS NOT NULL AND YEAR(d.date) = 2020
GROUP BY d.continent, DATEPART(MONTH, d.date)
ORDER BY 1,2



--Using ROW_NUM(), CTE, Showing the Country details with 2nd Highest, 3rd Highest number of Death cases.
WITH CTE AS
(
SELECT country, SUM(CAST(total_deaths AS BIGINT)) AS Total_Deaths, population, ROW_NUMBER() OVER (ORDER BY SUM(total_deaths) DESC) AS RN
FROM [dbo].[CovidDeaths] 
WHERE country NOT IN ('World', 'Asia', 'Europe', 'North America', 'South America', 'Africa', 'Australia',  'Antarctica') AND total_deaths IS NOT NULL AND population IS NOT NULL
GROUP BY country, population
)
SELECT country, SUM(total_deaths) AS Total_Deaths, (SUM(CAST(total_deaths AS FLOAT))/SUM(CAST(population AS FLOAT)))*100 AS Death_Rate
FROM CTE
WHERE RN = 2 OR RN = 3 
GROUP BY country
ORDER BY Total_Deaths DESC




