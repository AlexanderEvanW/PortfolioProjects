# 🔍 Data Exploration

## COVID death percentage in Indonesia

```sql
SELECT Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS DeathPercentage
FROM coviddeaths
WHERE Location like '%indo%'
ORDER BY 3
```

During the early stages of COVID, the death percentage started at a high rate of 8% but gradually decreased to 2.7% in the following year.

![image](https://github.com/AlexanderEvanW/PortfolioProjects/assets/124351667/1074cfed-f16c-4854-83d9-443afcf9d66f)

![image](https://github.com/AlexanderEvanW/PortfolioProjects/assets/124351667/6cd851ab-c379-4e84-8dc2-d179260f8a15)

## COVID infection percentage in Indonesia

```sql
SELECT Location, date, total_cases, population, (total_cases/population)*100 AS CovidPercentage
FROM coviddeaths
WHERE Location like '%indo%'
ORDER BY 1
```

Until the end of April 2021, the COVID infection rate in Indonesia was 0.6%.

![image](https://github.com/AlexanderEvanW/PortfolioProjects/assets/124351667/4ed1a2e8-3ce6-4ec9-b2b4-db8b9fc2211a)

## Countries with the highest infection rates compared to their populations

```sql
SELECT Location, MAX(total_cases) AS HighestInfectionCount, population, MAX((total_cases/population))*100 AS CovidPercentage
FROM coviddeaths
GROUP BY Location, population
ORDER BY CovidPercentage DESC
```

![image](https://github.com/AlexanderEvanW/PortfolioProjects/assets/124351667/6ab5a479-8186-4512-beed-d3dbd845f6bc)

## Countries with the highest death counts compared to their populations

```sql
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
```

![image](https://github.com/AlexanderEvanW/PortfolioProjects/assets/124351667/6c777b8e-e09a-4a71-af41-e97cf0575e2a)

## Continent with the highest death counts compared to their populations

```sql
SELECT Continent, MAX(total_deaths) AS TotalDeathCount
FROM coviddeaths
GROUP BY Continent
ORDER BY TotalDeathCount DESC
LIMIT 1,6
```

![image](https://github.com/AlexanderEvanW/PortfolioProjects/assets/124351667/d7c5b3c6-ec3c-423b-9f1e-c17fbc7e64a5)

## World's total cases, total deaths, and death percentage

```sql
SELECT SUM(new_cases) AS TotalCases, SUM(new_deaths) AS TotalDeaths, SUM(new_deaths)/SUM(new_cases)*100 AS DeathPercentage
FROM coviddeaths
WHERE Continent != ''
```

![image](https://github.com/AlexanderEvanW/PortfolioProjects/assets/124351667/4a47985b-40e7-4586-85ff-499cbdb03d0e)

## Total vaccinations and the percentage of the population vaccinated

```sql
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
```

Example in Indonesia:

![image](https://github.com/AlexanderEvanW/PortfolioProjects/assets/124351667/e66c10ac-723f-4ef9-85ae-37b9ae2fd028)


