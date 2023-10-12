-- Find the app with an ID of 1880 --
SELECT * FROM analytics WHERE id = 1880;

-- Find the ID and app name for all apps that were last updated on August 01, 2018.--
SELECT id, app_name FROM analytics WHERE last_updated = '2018-08-01';

-- Count the number of apps in each category, e.g. “Family | 1972”.
SELECT category, COUNT(*) AS num_apps
FROM analytics
GROUP BY category
ORDER BY num_apps DESC;

-- Find the top 5 most reviewed apps and the number of reviews for each
SELECT app_name, reviews FROM analytics ORDER BY reviews DESC LIMIT 5;

-- Find the app that has the most reviews with a rating greater than equal to 4.8
SELECT app_name, reviews FROM analytics WHERE rating >= 4.8 ORDER BY reviews DESC LIMIT 1;

-- Find the average rating for each category in descending order
SELECT category, AVG(rating) AS average_rating
FROM analytics
GROUP BY category
ORDER BY average_rating DESC;

-- Find name, price, and rating of the most expensive app that has a rating < 3
SELECT app_name, price, rating
FROM analytics
WHERE rating < 3
ORDER BY price DESC
LIMIT 1;

-- Find all apps with a min install not exceeding 50, that have a rating. Order your results by highest rating first
SELECT app_name, min_installs, rating
FROM analytics
WHERE min_installs <= 50 AND rating IS NOT NULL
ORDER BY rating DESC;

-- Find all names of apps that are rated less than 3 with at least 10000 reviews
SELECT app_name, rating, reviews
FROM analytics
WHERE rating < 3 AND reviews >= 10000;

-- FInd the top 10 most reviewed apps that cost between 10 cents and a dollar
SELECT app_name, reviews, price
FROM analytics
WHERE price BETWEEN 0.10 AND 1.00
ORDER BY reviews DESC
LIMIT 10;

-- Find the most out of date app.
SELECT app_name, last_updated
FROM analytics
WHERE last_updated = (SELECT MIN(last_updated) FROM analytics);

-- Find the most expensive app
SELECT app_name, price
FROM analytics
WHERE price = (SELECT MAX(price) FROM analytics);

-- Count all the reviews in the Google Play Store
SELECT SUM(reviews) FROM analytics;

-- Find all categories that have more than 300 apps
SELECT category, COUNT(*) AS num_apps
FROM analytics
GROUP BY category
HAVING COUNT(*) > 300;

-- Find the app that has the highest proportion of min_installs to reviews, among apps that have been installed at least 100,000 times. Display the name of the app along with the number of reviews, the min_installs, and the proportion.
SELECT app_name, reviews, min_installs, (min_installs::float / reviews:: float) AS install_to_review_ratio
FROM analytics
WHERE min_installs >= 100000 AND reviews > 0
ORDER BY install_to_review_ratio DESC
LIMIT 1;