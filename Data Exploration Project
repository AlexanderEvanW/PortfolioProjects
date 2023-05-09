/*

Covid-19 Data Exploration

*/

SELECT *
FROM coviddeaths

SELECT *
FROM covidvaccinations

-- Select data that we are going to be using

SELECT Location, date, total_cases, new_cases, total_deaths, population
FROM coviddeaths
ORDER BY 1

-- Total Cases vs Total Deaths
-- Shows possibility of dying if you infected by Covid in your country

SELECT Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS DeathPercentage
FROM coviddeaths
WHERE Location like '%indo%'
ORDER BY 1

-- Total Cases vs Total Population
-- Shows what percentage of population got Covid in your country

SELECT Location, date, total_cases, population, (total_cases/population)*100 AS CovidPercentage
FROM coviddeaths
WHERE Location like '%indo%'
ORDER BY 1

-- Countries with highest infection rate compared to population

SELECT Location, MAX(total_cases) AS HighestInfectionCount, population, MAX((total_cases/population))*100 AS CovidPercentage
FROM coviddeaths
GROUP BY Location, population
ORDER BY CovidPercentage DESC

-- Countries with highest death count per population

SELECT Location, MAX(total_deaths) AS TotalDeathCount
FROM coviddeaths
WHERE Location != 'World'
  AND Location != 'Europe'
  AND Location != 'North America'
  AND Location != 'European Union'
  AND Location != 'South America'
  AND Location != 'Asia'
  AND Location != 'Africa'
  AND Location != 'Oceania'
GROUP BY Location
ORDER BY TotalDeathCount DESC

-- Continent with highest death count per population

SELECT Continent, MAX(total_deaths) AS TotalDeathCount
FROM coviddeaths
GROUP BY Continent
ORDER BY TotalDeathCount DESC
LIMIT 1,6

-- Global Numbers

SELECT SUM(new_cases) AS TotalCases, SUM(new_deaths)
FROM coviddeaths
WHERE Continent != ''

-- Total Population vs Vaccinations

WITH PopvsVac (Continent, Location, Population, New_Vaccinations, TotalVaccinations)
as
(
SELECT dea.Continent, dea.location, dea.population, vac.new_vaccinations, SUM(vac.new_vaccinations) OVER (Partition BY dea.location ORDER BY dea.location) as TotalVaccinations
FROM covidvaccinations AS vac
JOIN coviddeaths AS dea
  ON dea.Location = vac.Location
  AND dea.date = vac.date
WHERE dea.Continent != ''
ORDER BY 2,3
)
SELECT *, (TotalVaccinations/Population)*100 AS PercentPopulationVaccinated
FROM PopvsVac

-- Creating View to store data for later visualizations

Create View PercentPopulationVaccinated2 AS
SELECT dea.Continent, dea.location, dea.population, vac.new_vaccinations, SUM(vac.new_vaccinations) OVER (Partition BY dea.location ORDER BY dea.location) as TotalVaccinations
FROM covidvaccinations AS vac
JOIN coviddeaths AS dea
  ON dea.Location = vac.Location
  AND dea.date = vac.date
WHERE dea.Continent != ''
ORDER BY 2,3

SELECT *
FROM PercentPopulationVaccinated




