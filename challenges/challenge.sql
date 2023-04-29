/*
Challenge 1 : 
    We want to reward our users who have been around the longest.  
    Find the 5 oldest users
    */
SELECT * FROM users
ORDER by created_at ASC LIMIT 5;


/*
Challenge 2
    What day of the week do most users register on?
    We need to figure out when to schedule an ad campgain
*/
SELECT  DAYNAME(created_at) AS Day_of_week,count(*)  AS total_count
FROM users
GROUP BY Day_of_week
ORDER BY total_count Desc;
-- Version 2
SELECT date_format(created_at,'%W') AS 'day of the week', COUNT(*) AS 'total registration'
FROM users
GROUP BY 1
ORDER BY 2 DESC;

/*
Challenge 3
    We want to target our inactive users with an email campaign.
    Find the users who have never posted a photo
*/
