/*
Challenge 1 :
    We want to reward our users who have been around the longest.
    Find the 5 oldest users
    */
SELECT *
FROM users
ORDER by created_at ASC
LIMIT 5;

/*
Challenge 2
    What day of the week do most users register on?
    We need to figure out when to schedule an ad campgain
*/
SELECT DAYNAME(created_at) AS Day_of_week,
       count(*) AS total_count
FROM users
GROUP BY Day_of_week
ORDER BY total_count Desc;

-- Version 2

SELECT date_format(created_at, '%W') AS 'day of the week',
       COUNT(*) AS 'total registration'
FROM users
GROUP BY 1
ORDER BY 2 DESC;

/*
Challenge 3
    We want to target our inactive users with an email campaign.
    Find the users who have never posted a photo
*/
SELECT u.username
FROM users as u
left join photos as p on u.id = p.user_id
where p.user_id IS NULL;

/*
Challenge 4
    We are running a new contest to see who can get the most likes on a single photo.
    Find out who won the contest? 🙌
 */
SELECT users.id,
       users.username,
       photos.id,
       photos.image_url,
       count(*) as Total_likes_count
from photos
INNER join likes on likes.photo_id = photos.id
inner JOIN users on users.id = photos.user_id
GROUP BY photos.id
ORDER BY Total_likes_count DESC
LIMIT 1;

/*
Challenge 5
    Our Investors want to know...
    How many times does the average user post?
total number of photos/total number of users
*/
SELECT ROUND(
                 (SELECT COUNT(*)
                  FROM photos)/
                 (SELECT count(*)
                  FROM users), 2) AS Avg_user_post;

/*
Challenge 6
    A Brand wants to know which hashtags to use in a Post.
    What are the Top 5 most commonly used hashtags?
*/
SELECT tags.id,
       tags.tag_name,
       COUNT(*) AS total_tags
from tags
INNER JOIN photo_tags on tags.id = photo_tags.tag_id
GROUP by tags.tag_name
ORDER BY total_tags DESC
LIMIT 5;

/*
Challenge 7
    We have a small problem with bots on our site...
    Find number of users who have liked every single photo on the site?
 */
SELECT users.id,
       username,
       count(users.id) AS total_user_likes
from users
join likes on users.id = likes.user_id
GROUP by users.id
HAVING total_user_likes =
    (SELECT COUNT(*)
     FROM photos);

/*
Challenge 8
    We also have a problem with celebrities
    Find users who have never commented on a photo
*/
SELECT users.username,
       comments.comment_text
FROM users
LEFT JOIN comments on users.id = comments.user_id
where comments.comment_text is null;

/*
Challenge 9
    Find users who have ever commented on a photo
*/
SELECT users.id,
       users.username,
       comments.comment_text
from users
LEFT JOIN comments ON users.id = comments.user_id
WHERE comments.user_id IS NOT NULL;
GROUP BY comments.user_id;



