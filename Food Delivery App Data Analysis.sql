Task1: For a high-level overview of the hotels, provide us the top 5 most voted hotels in the delivery category.
SELECT name,votes,rating FROM `zomato` 
WHERE type in ('Delivery')
ORDER BY votes DESC
LIMIT 5;

Task2:The rating of a hotel is a key identifier in determining a restaurant’s performance. Hence for a particular location called Banashankari find out the top 5 highly rated hotels in the delivery category.
SELECT name,location,rating,type FROM `zomato` 
WHERE type in ('Delivery') and location in ('Banashankari')
ORDER BY rating DESC
LIMIT 5;

Task3:compare the ratings of the cheapest and most expensive hotels in Indiranagar.
SELECT 
  (SELECT rating FROM zomato WHERE location = 'Indiranagar' ORDER BY approx_cost ASC LIMIT 1) AS rating1,
  (SELECT rating FROM zomato WHERE location = 'Indiranagar' ORDER BY approx_cost DESC LIMIT 1) AS rating2
FROM zomato
WHERE location = 'Indiranagar'
LIMIT 1;

Task4:Online ordering of food has exponentially increased over time. Compare the total votes of restaurants that provide online ordering services and those who don’t provide online ordering service.
SELECT online_order, SUM(votes) as total_votes
FROM zomato
GROUP BY online_order;

Task5:Number of votes defines how much the customers are involved with the service provided by the restaurants For each Restaurant type, find out the number of restaurants, total votes, and average rating. Display the data with the highest votes on the top( if the first row of output is NA display the remaining rows).
SELECT type,count(name) as number_of_restaurants,sum(votes) as total_votes, avg(rating) as avg_rating
FROM zomato
WHERE type<>'NA'
GROUP BY type
order by number_of_restaurants DESC

Task6:What is the most liked dish of the most-voted restaurant on Zomato(as the restaurant has a tie-up with Zomato, the restaurant compulsorily provides online ordering and delivery facilities.
SELECT name, dish_liked, rating, votes
FROM zomato
ORDER BY votes DESC
LIMIT 1;

Task7:To increase the maximum profit, Zomato is in need to expand its business. For doing so Zomato wants the list of the top 15 restaurants which have min 150 votes, have a rating greater than 3, and is currently not providing online ordering. Display the restaurants with highest votes on the top.
SELECT name, rating, votes, online_order 
FROM zomato
WHERE votes >= 150 AND rating >3
AND online_order = 'NO'
ORDER BY votes DESC
LIMIT 15;