DROP TABLE IF EXISTS campaign_user

CREATE TABLE campaign_user(
	campaign_id INT NOT NULL,
	user_id INT NOT NULL,
	date_sent DATE NOT NULL,
	opened_email INT,
	clicked_on_link INT, 
	visited_landing_page INT,
	converted INT,
);

INSERT INTO campaign_user
VALUES (183946, 68324, '2018-07-05', 1, 1, 0, 0),
       (183946, 65715, '2018-07-12', 1, 0, 0, 0),
	   (421564, 46546, '2018-07-02', 1, 1, 1, 1),
	   (654654, 86451, '2018-08-01', 0, 0, 0, 0),
       (421564, 65158, '2018-08-07', 1, 0, 0, 0);