--1) Create a videos table. This table should include a unique ID, the title of the video, the length in minutes, and the URL. Populate the table with at least three related videos from YouTube or other publicly available resources.
CREATE TABLE Videos(
video_ID SERIAL PRIMARY KEY,
title VARCHAR (255),
length_in_minute TIME(0),
url VARCHAR(355));

INSERT INTO videos(video_id,title, length_in_minute,url)
VALUES
('1','Godzilla vs. Kong – Official Trailer','2:24','https://www.youtube.com/watch?v=odM92ap8_c0'),
('2', 'Enjoy The Journey - T.D. Jakes','0:37','https://www.youtube.com/watch?v=ADk4Or1RKC8'),
('3','Transporter-1 Mission','1:49:50','https://www.youtube.com/watch?v=ScHI1cbkUv4');
 

--2)Create and populate Reviewers table. 
-----Create a second table that provides at least two user reviews for each of at least two of the videos. 
--------These should be imaginary reviews that include columns for the user’s name (“Asher”, “John”, etc.), the rating (which could be NULL, or a number between 0 and 5), and a short text review (“Loved it!”).  There should be a column that links back to the ID column in the table of videos.
CREATE TABLE Reviewers(
user_ID SERIAL PRIMARY KEY,
user_name VARCHAR (255),
video_ID SERIAL,
rating VARCHAR (50),
review VARCHAR(355));

INSERT INTO reviewers(user_name,video_id,rating,review)
VALUES
('Allen','1','5','This little moment of my life is called happiness'),
('Larry','1','4','If this comes out while we are in lockdown and the cinemas are closed.......'),
('Jenny','1','5','Skullcrawlers: "Looks like lockdown is over boys!"'),
 ('Allen','2','5','I am excited and inspired!!!'),
 ('Larry','2','5','Terrific!!!'),
 ('Jenny','2','5','cannot follow it! sad!'),
 ('Allen','3','5','Amazing!'),
 ('Larry','3','5','Love it!!!'),
 ('Jenny','3','5','congraduation!!!');
 
 --3)Report on Video Reviews.  
--------Write a JOIN statement that shows information from both tables.
SELECT * FROM videos;
SELECT * FROM reviewers;

SELECT * FROM videos
INNER JOIN reviewers
ON videos.video_id = reviewers.video_id
ORDER BY videos.video_id;

SELECT title, count(rating) FROM (
SELECT * FROM videos
INNER JOIN reviewers
ON videos.video_id = reviewers.video_id
ORDER BY videos.video_id) as reviewers
group by title
order by count(rating);







 