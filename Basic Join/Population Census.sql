SELECT SUM(city.population)
FROM city
INNER JOIN country ON  city.countryCode = country.Code
WHERE country.continent = "asia"