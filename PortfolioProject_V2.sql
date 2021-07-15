--Tableau Viz Querries
--Table 1

SELECT sum(new_cases) as total_cases, SUM(cast(new_deaths as int))as total_deaths, sum(cast(new_deaths as int))/sum(new_cases)*100 AS Death_percentage
FROM portfolio_project..covidDeaths
WHERE continent is not null
--Group by date
order by 1,2;



--Table 2

-- We take these out as they are not inluded in the above queries and want to stay consistent
-- European Union is part of Europe

Select location, SUM(cast(new_deaths as int)) as TotalDeathCount
FROM portfolio_project..covidDeaths
--Where location like '%states%'
Where continent is null 
and location not in ('World', 'European Union', 'International')
Group by location
order by TotalDeathCount desc



--Table 3

SELECT location, population, MAX(total_cases) AS higest_infection_count, MAX((total_cases/population)) * 100 AS Perc_of_pop_infected
FROM portfolio_project..covidDeaths
Group by location, population
order by Perc_of_pop_infected desc 



--Table 4
SELECT location, population, date, MAX(total_cases) AS higest_infection_count, MAX((total_cases/population)) * 100 AS Perc_of_pop_infected
FROM portfolio_project..covidDeaths
Group by location, population, date
order by Perc_of_pop_infected desc 



--END of Tableau Queries




SELECT * FROM portfolio_project..covidDeaths
WHERE continent is not null
order by 3, 4


SELECT * FROM portfolio_project..covidVaccinations
order by 3, 4;



SELECT location, date, total_cases,new_cases, total_deaths, population
FROM portfolio_project..covidDeaths
order by 1,2 

--Percentage of deaths
SELECT location, date, total_cases,total_deaths, (total_deaths/total_cases) * 100 AS Perc_of_deaths
FROM portfolio_project..covidDeaths
WHERE location like '%india%'
order by 1,2 


--Percentage of population
SELECT location, date, total_cases,population, (total_cases/population) * 100 AS Perc_of_population
FROM portfolio_project..covidDeaths
WHERE location like '%india%'
order by 1,2 

--Check for highest case
SELECT location, population, date, MAX(total_cases) AS higest_infection_count, MAX((total_cases/population)) * 100 AS Perc_of_pop_infected
FROM portfolio_project..covidDeaths
Group by location, population, date
order by Perc_of_pop_infected desc 


--Showing country with highest death count per population
SELECT location, MAX(cast(total_deaths as int)) AS total_death_count 
FROM portfolio_project..covidDeaths
WHERE continent is not null
Group by location
order by total_death_count desc 



--Let's view by location

SELECT location, MAX(cast(total_deaths as int)) AS total_death_count 
FROM portfolio_project..covidDeaths
WHERE continent is not null
Group by location
order by total_death_count desc 


--Global Numbers

SELECT sum(new_cases) as total_cases, SUM(cast(new_deaths as int))as total_deaths, sum(cast(new_deaths as int))/sum(new_cases)*100 AS Death_percentage
FROM portfolio_project..covidDeaths
WHERE continent is not null
--Group by date
order by 1,2;



-- looking at total population vs vaccinations
SELECT dea.continent, dea.location, dea.date, dea.population, vacc.new_vaccinations, 
sum(cast(vacc.new_vaccinations as int)) OVER (partition by dea.location order by dea.location, dea.date) AS RollingPeopleVaccinated
FROM portfolio_project..covidDeaths dea
join portfolio_project..covidVaccinations vacc
ON dea.location = vacc.location
and dea.date = vacc.date 
WHERE dea.continent is not null
order by 2, 3



--USE CITY

WITH PopvsVAc (continet, location, date, population, new_vaccinations, RollingPeopleVaccinated)
AS 
(
SELECT dea.continent, dea.location, dea.date, dea.population, vacc.new_vaccinations, 
sum(cast(vacc.new_vaccinations as int)) OVER (partition by dea.location order by dea.location, dea.date) AS RollingPeopleVaccinated
FROM portfolio_project..covidDeaths dea
join portfolio_project..covidVaccinations vacc
ON dea.location = vacc.location
and dea.date = vacc.date 
WHERE dea.continent is not null
--order by 2, 3
)
SELECT *, (RollingPeopleVaccinated/population)*100 AS Perc_Of_people_vaccinated
 FROM PopvsVAc


 --Temp Table
 drop table #PercPopulationVaccinated

 CREATE TABLE #PercPopulationVaccinated
 (
 continent nvarchar(255),
 location nvarchar(255),
 date datetime,
 population numeric,
 new_vaccinations numeric,
 RollingPeopleVaccinated numeric
 )

 insert into #PercPopulationVaccinated
 SELECT dea.continent, dea.location, dea.date, dea.population, vacc.new_vaccinations, 
sum(cast(vacc.new_vaccinations as int)) OVER (partition by dea.location order by dea.location, dea.date) AS RollingPeopleVaccinated
FROM portfolio_project..covidDeaths dea
join portfolio_project..covidVaccinations vacc
ON dea.location = vacc.location
and dea.date = vacc.date 
WHERE dea.continent is not null
SELECT *, (RollingPeopleVaccinated/population)*100 AS Perc_Of_people_vaccinated
 FROM #PercPopulationVaccinated


 --Create views for viz

 CREATE View PercPopulationVaccinated AS
  SELECT dea.continent, dea.location, dea.date, dea.population, vacc.new_vaccinations, 
sum(cast(vacc.new_vaccinations as int)) OVER (partition by dea.location order by dea.location, dea.date) AS RollingPeopleVaccinated
FROM portfolio_project..covidDeaths dea
join portfolio_project..covidVaccinations vacc
ON dea.location = vacc.location
and dea.date = vacc.date 
WHERE dea.continent is not null



SELECT * FROM PercPopulationVaccinated
