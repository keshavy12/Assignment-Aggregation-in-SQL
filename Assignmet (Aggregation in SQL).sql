use World;

# Question 1 : Count how many cities are there in each country?

select countrycode, COUNT(*) as city_count
from city
Group by countrycode
Order by city_count DESC;

# Question 2 : Display all continents having more than 30 countries.

select continent, COUNT(*) as country_count
from country
Group by continent
Having  COUNT(*) > 30;

# Question 3 : List regions whose total population exceeds 200 million

select region, SUM(Country_Pop) as total_population
from country
Group by region
Having SUM(Country_Pop) > 200000000;

# Question 4 : Find the top 5 continents by average GNP per country

select continent, Avg(GNP) as avg_gnp
from country
Group by continent
Order by avg_gnp desc
Limit 5;

# Question 5 : Find the total number of official languages spoken in each continent

select
c.Continent,
Count(Distinct cl.Language) as total_official_languages
from Country as c
Join CountryLanguage as cl
on c.Country_Code = cl.CountryCode
Where cl.IsOfficial = 'T'
Group by c.Continent
Order by total_official_languages desc;

# Question 6 : Find the maximum and minimum GNP for each continent

select continent, MAX(GNP) as max_gnp, MIN(GNP) as min_gnp
from country
Group by continent;

# Question 7 : Find the country with the highest average city population

select
c.Country_Name,
Avg(ci.City_Pop) as avg_city_population
from country c
Join city ci
on c.Country_Code = ci.CountryCode
Group by c.Country_Name
Order by avg_city_population desc
Limit 1;

# Question 8 : List continents where the average city population is greater than 200,000

select
c.Continent,
Avg(ci.City_Pop) as avg_city_population
from country c
Join city ci
on c.Country_Code = ci.CountryCode
Group by c.Continent
Having Avg(ci.City_Pop) > 200000
Order by avg_city_population desc;

# Question 9 : Find the total population and average life expectancy for each continent, ordered by average life expectancy descending

select 
Continent,
SUM(Country_Pop) as total_population,
Avg(LifeExpectancy) as avg_life_expectancy
from country
Group by Continent
Order by avg_life_expectancy desc;

# Question 10 : Find the top 3 continents with the highest average life expectancy, but only include those where the total population is over 200 million

select
Continent,
SUM(Country_Pop) as total_population,
Avg(LifeExpectancy) as avg_life_expectancy
from country
Group by Continent
Having SUM(Country_Pop) > 200000000
Order by avg_life_expectancy desc
Limit 3;